// Room Start event - setup when entering rooms

// Always re-assign camera to this room's view
view_camera[0] = camera

if (room == room_rogue && rogue_mode) {
    // Create parallax background
    instance_create_depth(midx, midy, 80, Background)

    // Generate the rogue arena
    rogue_worldgen_scr()
}
