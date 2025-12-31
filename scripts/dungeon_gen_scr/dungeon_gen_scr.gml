// Helper function to create blocks with proper visibility
function create_dungeon_block(xx, yy, img_index) {
    var block = instance_create_depth(xx, yy, 0, Block);
    block.image_index = img_index;
    block.visible = Control.debug; // Blocks are only visible in debug mode
    block.type = 0;
    block.pin = 0;
    return block;
}

function dungeon_gen_scr(){
    // Dungeon generation system for platformer gameplay
    
    // Initialize dungeon variables if not exists
    if (!variable_global_exists("dungeon_floor")) {
        global.dungeon_floor = 1;
        global.dungeon_room_x = 0;
        global.dungeon_room_y = 0;
        global.dungeon_map = array_create(5*5, -1); // 5x5 grid of rooms
        global.dungeon_cleared = array_create(5*5, 0);
    }
    
    // Room dimensions in blocks (16x16 pixels each)
    var dungeon_width = 30;
    var dungeon_height = 20;
    var block_size = 16;
    
    // Clear existing blocks and enemies
    with (Block) instance_destroy();
    with (Enemy) instance_destroy();
    
    // Get current room index
    var room_index = global.dungeon_room_y * 5 + global.dungeon_room_x;
    
    // Generate room layout if not already generated
    if (global.dungeon_map[room_index] == -1) {
        // Assign room type based on position
        if (room_index == 0) {
            global.dungeon_map[room_index] = 0; // Start room
        } else if (room_index == 24) {
            global.dungeon_map[room_index] = 5; // Boss room
        } else {
            // Random room type: 1=combat, 2=platform challenge, 3=treasure, 4=vertical
            global.dungeon_map[room_index] = choose(1, 1, 1, 2, 2, 3, 4);
        }
    }
    
    var room_type = global.dungeon_map[room_index];
    
    // Generate room based on type
    switch(room_type) {
        case 0: // Start room
            dungeon_create_start_room(dungeon_width, dungeon_height, block_size);
            break;
        case 1: // Combat room
            dungeon_create_combat_room(dungeon_width, dungeon_height, block_size);
            break;
        case 2: // Platform challenge
            dungeon_create_platform_room(dungeon_width, dungeon_height, block_size);
            break;
        case 3: // Treasure room
            dungeon_create_treasure_room(dungeon_width, dungeon_height, block_size);
            break;
        case 4: // Vertical room
            dungeon_create_vertical_room(dungeon_width, dungeon_height, block_size);
            break;
        case 5: // Boss room
            dungeon_create_boss_room(dungeon_width, dungeon_height, block_size);
            break;
    }
    
    // Add room connections (doors)
    dungeon_add_connections(dungeon_width, dungeon_height, block_size);
    
    // Position player
    if (instance_exists(Me)) {
        // Place player at appropriate entrance
        if (global.dungeon_entrance_dir == "left") {
            Me.x = 2 * block_size;
            Me.y = dungeon_height * block_size / 2;
        } else if (global.dungeon_entrance_dir == "right") {
            Me.x = (dungeon_width - 2) * block_size;
            Me.y = dungeon_height * block_size / 2;
        } else if (global.dungeon_entrance_dir == "top") {
            Me.x = dungeon_width * block_size / 2;
            Me.y = 2 * block_size;
        } else if (global.dungeon_entrance_dir == "bottom") {
            Me.x = dungeon_width * block_size / 2;
            Me.y = (dungeon_height - 4) * block_size;
        } else {
            // Default start position
            Me.x = 4 * block_size;
            Me.y = (dungeon_height - 4) * block_size;
        }
        
        // Reset player physics
        Me.hsp = 0;
        Me.vsp = 0;
    } else {
        // Create Me if it doesn't exist
        var player = instance_create_depth(4 * block_size, (dungeon_height - 4) * block_size, 5, Me);
        with(player){
            image_index = 1;
            controls = 0;
        }
        Control.camtarget = player;
    }
}

function dungeon_create_start_room(dungeon_width, dungeon_height, block_size) {
    // Safe starting room with basic platforms
    
    // Create floor and walls
    for (var xx = 0; xx < dungeon_width; xx++) {
        for (var yy = 0; yy < dungeon_height; yy++) {
            // Walls
            if (xx == 0 || xx == dungeon_width-1 || yy == 0 || yy == dungeon_height-1) {
                create_dungeon_block(xx * block_size, yy * block_size, 0); // Wall sprite
            }
            // Floor
            else if (yy == dungeon_height-2) {
                create_dungeon_block(xx * block_size, yy * block_size, 1); // Floor sprite
            }
        }
    }
    
    // Add some simple platforms
    for (var i = 0; i < 3; i++) {
        var plat_x = 5 + i * 8;
        var plat_y = dungeon_height - 6 - i * 3;
        for (var j = 0; j < 4; j++) {
            create_dungeon_block((plat_x + j) * block_size, plat_y * block_size, 1);
        }
    }
}

function dungeon_create_combat_room(dungeon_width, dungeon_height, block_size) {
    // Room with platforms and enemy spawn points
    
    // Create floor and walls
    for (var xx = 0; xx < dungeon_width; xx++) {
        for (var yy = 0; yy < dungeon_height; yy++) {
            // Walls
            if (xx == 0 || xx == dungeon_width-1 || yy == 0 || yy == dungeon_height-1) {
                var wall = instance_create_depth(xx * block_size, yy * block_size, 0, Block);
                wall.image_index = 0;
            }
            // Floor
            else if (yy == dungeon_height-2) {
                var floor_block = instance_create_depth(xx * block_size, yy * block_size, 0, Block);
                floor_block.image_index = 1;
            }
        }
    }
    
    // Create platforms at different heights
    var platform_count = 3 + irandom(2);
    for (var i = 0; i < platform_count; i++) {
        var plat_x = 4 + irandom(dungeon_width - 12);
        var plat_y = dungeon_height - 5 - irandom(8);
        var plat_width = 3 + irandom(4);
        
        for (var j = 0; j < plat_width; j++) {
            if (plat_x + j < dungeon_width - 1) {
                var platform = instance_create_depth((plat_x + j) * block_size, plat_y * block_size, 0, Block);
                platform.image_index = 1;
                
                // Spawn enemy on platform (30% chance)
                if (j == floor(plat_width/2) && random(1) < 0.3 && !global.dungeon_cleared[global.dungeon_room_y * 5 + global.dungeon_room_x]) {
                    var enemy = instance_create_depth((plat_x + j) * block_size, (plat_y - 1) * block_size, -1, Enemy);
                    enemy.pin = choose(1, 2, 3); // Random enemy type
                    enemy.enopt = global.dungeon_floor; // Difficulty based on floor
                }
            }
        }
    }
    
    // Spawn ground enemies
    if (!global.dungeon_cleared[global.dungeon_room_y * 5 + global.dungeon_room_x]) {
        var enemy_count = 2 + global.dungeon_floor;
        for (var i = 0; i < enemy_count; i++) {
            var ex = 4 + irandom(dungeon_width - 8);
            var enemy = instance_create_depth(ex * block_size, (dungeon_height - 3) * block_size, -1, Enemy);
            enemy.pin = choose(1, 2, 3, 4);
            enemy.enopt = global.dungeon_floor;
        }
    }
}

function dungeon_create_platform_room(dungeon_width, dungeon_height, block_size) {
    // Challenging platforming room with gaps and moving platforms
    
    // Create floor and walls with gaps
    for (var xx = 0; xx < dungeon_width; xx++) {
        for (var yy = 0; yy < dungeon_height; yy++) {
            // Walls
            if (xx == 0 || xx == dungeon_width-1 || yy == 0 || yy == dungeon_height-1) {
                var wall = instance_create_depth(xx * block_size, yy * block_size, 0, Block);
                wall.image_index = 0;
            }
            // Floor with gaps
            else if (yy == dungeon_height-2) {
                // Create gaps in floor
                if (xx < 8 || xx > 10 && xx < 18 || xx > 20) {
                    var floor_block = instance_create_depth(xx * block_size, yy * block_size, 0, Block);
                    floor_block.image_index = 1;
                }
            }
        }
    }
    
    // Create jumping puzzle platforms
    var platforms = [
        {x: 5, y: dungeon_height-6, w: 3},
        {x: 10, y: dungeon_height-9, w: 2},
        {x: 15, y: dungeon_height-7, w: 3},
        {x: 20, y: dungeon_height-10, w: 2},
        {x: 25, y: dungeon_height-6, w: 3}
    ];
    
    for (var i = 0; i < array_length(platforms); i++) {
        var plat = platforms[i];
        for (var j = 0; j < plat.w; j++) {
            if (plat.x + j < dungeon_width - 1) {
                var platform = instance_create_depth((plat.x + j) * block_size, plat.y * block_size, 0, Block);
                platform.image_index = 1;
            }
        }
    }
}

function dungeon_create_treasure_room(dungeon_width, dungeon_height, block_size) {
    // Hidden treasure room with rewards
    
    // Create floor and walls
    for (var xx = 0; xx < dungeon_width; xx++) {
        for (var yy = 0; yy < dungeon_height; yy++) {
            // Walls
            if (xx == 0 || xx == dungeon_width-1 || yy == 0 || yy == dungeon_height-1) {
                var wall = instance_create_depth(xx * block_size, yy * block_size, 0, Block);
                wall.image_index = 0;
            }
            // Floor
            else if (yy == dungeon_height-2) {
                var floor_block = instance_create_depth(xx * block_size, yy * block_size, 0, Block);
                floor_block.image_index = 1;
            }
        }
    }
    
    // Create treasure platform
    var treasure_x = dungeon_width / 2 - 2;
    var treasure_y = dungeon_height - 8;
    for (var i = 0; i < 5; i++) {
        var platform = instance_create_depth((treasure_x + i) * block_size, treasure_y * block_size, 0, Block);
        platform.image_index = 1;
    }
    
    // TODO: Add treasure/pickup spawning when pickup system is identified
}

function dungeon_create_vertical_room(dungeon_width, dungeon_height, block_size) {
    // Vertical climbing/descending room
    
    // Create floor and walls
    for (var xx = 0; xx < dungeon_width; xx++) {
        for (var yy = 0; yy < dungeon_height; yy++) {
            // Walls
            if (xx == 0 || xx == dungeon_width-1 || yy == 0 || yy == dungeon_height-1) {
                var wall = instance_create_depth(xx * block_size, yy * block_size, 0, Block);
                wall.image_index = 0;
            }
        }
    }
    
    // Create ascending platforms
    var platform_side = 0; // 0 = left, 1 = right
    for (var i = 0; i < 6; i++) {
        var plat_x = platform_side ? dungeon_width - 8 : 3;
        var plat_y = dungeon_height - 3 - i * 3;
        
        for (var j = 0; j < 5; j++) {
            var platform = instance_create_depth((plat_x + j) * block_size, plat_y * block_size, 0, Block);
            platform.image_index = 1;
        }
        
        platform_side = !platform_side; // Alternate sides
    }
}

function dungeon_create_boss_room(dungeon_width, dungeon_height, block_size) {
    // Large boss arena
    
    // Create floor and walls
    for (var xx = 0; xx < dungeon_width; xx++) {
        for (var yy = 0; yy < dungeon_height; yy++) {
            // Walls
            if (xx == 0 || xx == dungeon_width-1 || yy == 0 || yy == dungeon_height-1) {
                var wall = instance_create_depth(xx * block_size, yy * block_size, 0, Block);
                wall.image_index = 0;
            }
            // Floor
            else if (yy == dungeon_height-2) {
                var floor_block = instance_create_depth(xx * block_size, yy * block_size, 0, Block);
                floor_block.image_index = 1;
            }
        }
    }
    
    // Add boss platforms
    var boss_platforms = [
        {x: 5, y: dungeon_height-6, w: 4},
        {x: dungeon_width-9, y: dungeon_height-6, w: 4},
        {x: dungeon_width/2-2, y: dungeon_height-10, w: 4}
    ];
    
    for (var i = 0; i < array_length(boss_platforms); i++) {
        var plat = boss_platforms[i];
        for (var j = 0; j < plat.w; j++) {
            var platform = instance_create_depth((plat.x + j) * block_size, plat.y * block_size, 0, Block);
            platform.image_index = 1;
        }
    }
    
    // Spawn boss enemy if room not cleared
    if (!global.dungeon_cleared[global.dungeon_room_y * 5 + global.dungeon_room_x]) {
        var boss = instance_create_depth(dungeon_width/2 * block_size, (dungeon_height - 4) * block_size, -1, Enemy);
        boss.pin = 10; // Boss enemy type
        boss.enopt = global.dungeon_floor * 2; // Higher difficulty
        boss.hpmax = 100 + global.dungeon_floor * 50;
        boss.hp = boss.hpmax;
    }
}

function dungeon_add_connections(dungeon_width, dungeon_height, block_size) {
    // Add doorways to connect rooms
    
    var room_x = global.dungeon_room_x;
    var room_y = global.dungeon_room_y;
    
    // Check for adjacent rooms and create doorways
    // Left door
    if (room_x > 0) {
        for (var i = -2; i < 3; i++) {
            with (instance_position(0, (dungeon_height/2 + i) * block_size, Block)) {
                instance_destroy();
            }
        }
    }
    
    // Right door
    if (room_x < 4) {
        for (var i = -2; i < 3; i++) {
            with (instance_position((dungeon_width-1) * block_size, (dungeon_height/2 + i) * block_size, Block)) {
                instance_destroy();
            }
        }
    }
    
    // Top door (for vertical rooms)
    if (room_y > 0 && global.dungeon_map[room_y * 5 + room_x] == 4) {
        for (var i = -2; i < 3; i++) {
            with (instance_position((dungeon_width/2 + i) * block_size, 0, Block)) {
                instance_destroy();
            }
        }
    }
    
    // Bottom door (for vertical rooms)
    if (room_y < 4 && global.dungeon_map[room_y * 5 + room_x] == 4) {
        for (var i = -2; i < 3; i++) {
            with (instance_position((dungeon_width/2 + i) * block_size, (dungeon_height-1) * block_size, Block)) {
                instance_destroy();
            }
        }
    }
}