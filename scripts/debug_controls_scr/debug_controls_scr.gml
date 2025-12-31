// Debug script to check controller mappings
function debug_controls_scr() {
	// Only run in debug mode
	if (Control.debug != 1) return;
	
	var gamep1 = 0;
	var debug_text = "CONTROLLER DEBUG:\n";
	
	// Check all face buttons
	if (gamepad_button_check(gamep1, gp_face1)) debug_text += "A (face1) pressed\n";
	if (gamepad_button_check(gamep1, gp_face2)) debug_text += "B (face2) pressed\n";
	if (gamepad_button_check(gamep1, gp_face3)) debug_text += "X (face3) pressed\n";
	if (gamepad_button_check(gamep1, gp_face4)) debug_text += "Y (face4) pressed\n";
	
	// Check shoulder buttons
	if (gamepad_button_check(gamep1, gp_shoulderlb)) debug_text += "LB pressed\n";
	if (gamepad_button_check(gamep1, gp_shoulderrb)) debug_text += "RB pressed\n";
	if (gamepad_button_check(gamep1, gp_shoulderl)) debug_text += "LT pressed\n";
	if (gamepad_button_check(gamep1, gp_shoulderr)) debug_text += "RT pressed\n";
	
	// Check what our E button is mapped to
	if (global.conp_h_e) debug_text += "E BUTTON (RB) ACTIVE\n";
	if (global.conp_h_shift) debug_text += "SHIFT (RT) ACTIVE\n";
	if (global.conp_h_space) debug_text += "SPACE (A) ACTIVE\n";
	
	// Draw debug info
	draw_set_color(c_yellow);
	draw_text(10, 10, debug_text);
	draw_set_color(c_white);
}