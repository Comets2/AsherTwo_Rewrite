function dungeon_transition_scr(){
    // Handle transitions between dungeon rooms
    
    if (!instance_exists(Me)) return;
    
    var dungeon_width = 30;
    var dungeon_height = 20;
    var block_size = 16;
    var transition_triggered = false;
    var new_entrance_dir = "";
    
    // Check if player is at room edge
    // Right edge
    if (Me.x > (dungeon_width - 1) * block_size) {
        if (global.dungeon_room_x < 4) {
            global.dungeon_room_x++;
            new_entrance_dir = "left";
            transition_triggered = true;
        }
    }
    // Left edge
    else if (Me.x < block_size) {
        if (global.dungeon_room_x > 0) {
            global.dungeon_room_x--;
            new_entrance_dir = "right";
            transition_triggered = true;
        }
    }
    // Top edge (for vertical rooms)
    else if (Me.y < block_size && global.dungeon_map[global.dungeon_room_y * 5 + global.dungeon_room_x] == 4) {
        if (global.dungeon_room_y > 0) {
            global.dungeon_room_y--;
            new_entrance_dir = "bottom";
            transition_triggered = true;
        }
    }
    // Bottom edge (check if falling through bottom door)
    else if (Me.y > (dungeon_height - 1) * block_size) {
        if (global.dungeon_room_y < 4 && global.dungeon_map[(global.dungeon_room_y + 1) * 5 + global.dungeon_room_x] == 4) {
            global.dungeon_room_y++;
            new_entrance_dir = "top";
            transition_triggered = true;
        }
    }
    
    // Trigger room transition
    if (transition_triggered) {
        global.dungeon_entrance_dir = new_entrance_dir;
        
        // Optional: Add transition effect
        with (Control) {
            transalpha = 1; // Use existing transition system
        }
        
        // Generate new room
        dungeon_gen_scr();
    }
}

function dungeon_check_room_clear(){
    // Check if current room is cleared of enemies
    
    var room_index = global.dungeon_room_y * 5 + global.dungeon_room_x;
    
    // Don't check start room or already cleared rooms
    if (global.dungeon_map[room_index] == 0 || global.dungeon_cleared[room_index]) {
        return true;
    }
    
    // Check if any enemies remain
    if (!instance_exists(Enemy)) {
        global.dungeon_cleared[room_index] = 1;
        
        // Room clear effects
        with (Control) {
            // Play clear sound if available
            if (variable_instance_exists(id, "snd_victory") && audio_exists(snd_victory)) {
                audio_play_sound(snd_victory, 1, false);
            }
        }
        
        // TODO: Spawn rewards/pickups for cleared room
        
        return true;
    }
    
    return false;
}

function dungeon_init(){
    // Initialize dungeon mode - simplified version
    
    // Set to normal gameplay mode but with dungeon level
    Control.pause = 0;
    Control.lvlselect = 99; // Special dungeon level type
    
    global.dungeon_floor = 1;
    
    // Create background if it doesn't exist
    if (!instance_exists(Background)) {
        var bg = instance_create_depth(Control.midx, Control.midy, 0, Background);
        with(bg){
            image_index = 0;
            sprite_index = background_spr;
        }
    }
    
    // Generate simple dungeon room
    dungeon_simple_scr();
}

function dungeon_next_floor(){
    // Progress to next dungeon floor
    
    global.dungeon_floor++;
    global.dungeon_room_x = 0;
    global.dungeon_room_y = 0;
    
    // Reset room data
    for (var i = 0; i < 25; i++) {
        global.dungeon_map[i] = -1;
        global.dungeon_cleared[i] = 0;
    }
    
    global.dungeon_entrance_dir = "start";
    
    // Generate new floor
    dungeon_gen_scr();
}

function dungeon_exit(){
    // Exit dungeon mode and return to overworld
    
    with (Control) {
        pause = 1; // Return to map mode
        
        // Reset player position on map
        if (instance_exists(Me)) {
            Me.x = mapx * 38 + 112;
            Me.y = mapy * 38 + 21;
        }
    }
    
    // Clear dungeon blocks
    with (Block) instance_destroy();
    with (Enemy) instance_destroy();
}