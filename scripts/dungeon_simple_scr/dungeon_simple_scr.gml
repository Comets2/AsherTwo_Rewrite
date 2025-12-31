function dungeon_simple_scr(){
    // Simple dungeon generation that works like worldgen_scr but with blocks
    
    Control.stagetimer = 0;
    
    // Set up dungeon variables
    if (!variable_global_exists("dungeon_floor")) {
        global.dungeon_floor = 1;
    }
    
    // Clear room array
    for(var i = 0; i < 200; i++) {
        for(var j = 0; j < 200; j++) {
            Control.roomArray[i,j] = 0;
        }
    }
    
    // Clear existing level
    with (Block) instance_destroy();
    with (Enemy) instance_destroy();
    
    // Position player at start
    if (instance_exists(Me)) {
        Me.x = Control.midx;
        Me.y = Control.midy + 64;
        Me.hsp = 0;
        Me.vsp = 0;
    }
    
    // Simple room layout - create a box room
    var room_left = Control.midx - 200;
    var room_right = Control.midx + 200;
    var room_top = Control.midy - 100;
    var room_bottom = Control.midy + 100;
    
    // Fill roomArray with terrain for visual drawing
    var start_grid_x = floor((room_left - Control.mapx) / 16) - 1;
    var start_grid_y = floor((room_top - Control.mapy) / 16) - 1;
    var end_grid_x = floor((room_right - Control.mapx) / 16) + 1;
    var end_grid_y = floor((room_bottom - Control.mapy) / 16) + 1;
    
    // Fill entire room area with floor tiles
    for (var gx = start_grid_x; gx <= end_grid_x; gx++) {
        for (var gy = start_grid_y; gy <= end_grid_y; gy++) {
            if (gx >= 0 && gx < 200 && gy >= 0 && gy < 200) {
                Control.roomArray[gx, gy] = 1; // Basic terrain tile
            }
        }
    }
    
    // Create floor
    for (var xx = room_left; xx <= room_right; xx += 16) {
        var floor_block = instance_create_depth(xx, room_bottom, 0, Block);
        floor_block.sprite_index = block_spr;
        floor_block.image_index = 0;
        floor_block.image_speed = 0;
        floor_block.visible = Control.debug;
    }
    
    // Create walls
    for (var yy = room_top; yy <= room_bottom; yy += 16) {
        // Left wall
        var wall_left = instance_create_depth(room_left - 16, yy, 0, Block);
        wall_left.sprite_index = block_spr;
        wall_left.image_index = 0;
        wall_left.image_speed = 0;
        wall_left.visible = Control.debug;
        
        // Right wall
        var wall_right = instance_create_depth(room_right + 16, yy, 0, Block);
        wall_right.sprite_index = block_spr;
        wall_right.image_index = 0;
        wall_right.image_speed = 0;
        wall_right.visible = Control.debug;
    }
    
    // Create ceiling
    for (var xx = room_left; xx <= room_right; xx += 16) {
        var ceiling_block = instance_create_depth(xx, room_top - 16, 0, Block);
        ceiling_block.sprite_index = block_spr;
        ceiling_block.image_index = 0;
        ceiling_block.image_speed = 0;
        ceiling_block.visible = Control.debug;
    }
    
    // Add some platforms
    var plat_y = Control.midy + 20;
    for (var i = 0; i < 3; i++) {
        var plat_x = room_left + 50 + i * 100;
        for (var j = 0; j < 5; j++) {
            var platform = instance_create_depth(plat_x + j * 16, plat_y - i * 40, 0, Block);
            platform.sprite_index = block_spr;
            platform.image_index = 0;
            platform.image_speed = 0;
            platform.visible = Control.debug;
        }
    }
    
    // Spawn a few enemies
    for (var i = 0; i < 3; i++) {
        var enemy_x = room_left + 60 + i * 120;
        var enemy = instance_create_depth(enemy_x, room_bottom - 32, -1, Enemy);
        enemy.pin = choose(1, 2, 3);
        enemy.enopt = global.dungeon_floor;
    }
    
    // Set level type for dungeon
    Control.lvlArray[1000,0] = 99; // Custom dungeon type
    Control.lvlArray[1010,24] = "Dungeon Floor " + string(global.dungeon_floor);
    
    // Set room dimensions for camera/drawing
    Control.rmw = 30;
    Control.rmh = 20;
    Control.blockwidth = 16;
    Control.border = 5;
    Control.bordertwo = 0;
    
    // Set map position (align to grid)
    Control.mapx = floor(Control.midx / 16) * 16 - 15 * 16;
    Control.mapy = floor(Control.midy / 16) * 16 - 10 * 16;
    
    // Exit portal (temporary - press M to return to map)
}

function dungeon_exit_simple(){
    // Return to overworld map
    Control.pause = 1;
    
    // Clear dungeon
    with (Block) instance_destroy();
    with (Enemy) instance_destroy();
    
    // Reset player position on map
    if (instance_exists(Me)) {
        Me.x = Control.mapx * 38 + 112;
        Me.y = Control.mapy * 38 + 21;
    }
}