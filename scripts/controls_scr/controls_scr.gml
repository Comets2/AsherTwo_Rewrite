function controls_scr(){
	// Capture mouse input FIRST - before anything else can consume it
	var _rawLeftPressed = mouse_check_button_pressed(mb_left)
	var _rawRightPressed = mouse_check_button_pressed(mb_right)
	global.mouse_left_held = mouse_check_button(mb_left)
	global.mouse_right_held = mouse_check_button(mb_right)

	// Click buffer system - if button is newly held (wasn't held last frame), treat as pressed
	// This catches clicks that mouse_check_button_pressed() might miss
	if(!variable_global_exists("_mouse_left_was_held")) global._mouse_left_was_held = false
	if(!variable_global_exists("_mouse_right_was_held")) global._mouse_right_was_held = false

	var _leftNewlyHeld = global.mouse_left_held && !global._mouse_left_was_held
	var _rightNewlyHeld = global.mouse_right_held && !global._mouse_right_was_held

	// Use either raw pressed OR newly held (backup detection)
	global.mouse_left_pressed = _rawLeftPressed || _leftNewlyHeld
	global.mouse_right_pressed = _rawRightPressed || _rightNewlyHeld

	// Update "was held" for next frame
	global._mouse_left_was_held = global.mouse_left_held
	global._mouse_right_was_held = global.mouse_right_held

	// Console logging for mouse input debugging
	if(global.mouse_left_pressed){
		var _src = _rawLeftPressed ? "pressed()" : "newly_held"
		show_debug_message(">>> MOUSE LEFT PRESSED at t=" + string(current_time) + " focus=" + string(window_has_focus()) + " src=" + _src)
	}
	if(global.mouse_right_pressed){
		var _src = _rawRightPressed ? "pressed()" : "newly_held"
		show_debug_message(">>> MOUSE RIGHT PRESSED at t=" + string(current_time) + " focus=" + string(window_has_focus()) + " src=" + _src)
	}
	// Log held-but-not-pressed (indicates click on previous frame, still holding)
	if(global.mouse_left_held && !global.mouse_left_pressed){
		// Only log once per hold, not every frame - use a static flag
		if(!variable_global_exists("_debug_left_hold_logged") || !global._debug_left_hold_logged){
			show_debug_message("    LEFT HELD (not pressed) at t=" + string(current_time))
			global._debug_left_hold_logged = true
		}
	}else{
		global._debug_left_hold_logged = false
	}
	if(global.mouse_right_held && !global.mouse_right_pressed){
		if(!variable_global_exists("_debug_right_hold_logged") || !global._debug_right_hold_logged){
			show_debug_message("    RIGHT HELD (not pressed) at t=" + string(current_time))
			global._debug_right_hold_logged = true
		}
	}else{
		global._debug_right_hold_logged = false
	}

	global.con_h_up=keyboard_check(global.consave_up)

	global.con_p_up=keyboard_check_pressed(global.consave_up)

	global.con_h_down=keyboard_check(global.consave_down)

	global.con_p_down=keyboard_check_pressed(global.consave_down)

	global.con_h_right=keyboard_check(global.consave_right)
	
	global.con_p_right=keyboard_check_pressed(global.consave_right)

	global.con_h_left=keyboard_check(global.consave_left)
	
	global.con_p_left=keyboard_check_pressed(global.consave_left)

	global.con_p_space=keyboard_check_pressed(global.consave_space)

	global.con_h_space=keyboard_check(global.consave_space)


	global.con_r_space=keyboard_check_released(global.consave_space)
	//enter
	global.con_p_enter=keyboard_check_pressed(global.consave_enter)
	//shift
	global.con_h_shift=keyboard_check(global.consave_shift)
	//control
	global.con_h_control=keyboard_check(global.consave_control)
	//escape
	global.con_p_escape=keyboard_check_pressed(global.consave_escape)
	//E
	global.con_p_e=keyboard_check_pressed(global.consave_e)
	global.con_h_e=keyboard_check(global.consave_e)
	global.con_r_e=keyboard_check_released(global.consave_e)
	//W
	global.con_p_w=keyboard_check_pressed(global.consave_w)
	global.con_h_w=keyboard_check(global.consave_w)
	global.con_r_w=keyboard_check_released(global.consave_w)
	//Q
	global.con_p_q=keyboard_check_pressed(global.consave_q)
	global.con_h_q=keyboard_check(global.consave_q)
	global.con_r_q=keyboard_check_released(global.consave_q)
	//M
	global.con_p_m=keyboard_check_pressed(global.consave_m)
	global.con_r_m=keyboard_check_released(global.consave_m)
	global.con_h_m=keyboard_check(global.consave_m)
	//A
	global.con_p_r=keyboard_check_pressed(global.consave_r)
	global.con_h_r=keyboard_check(global.consave_r)
	//S
	global.con_p_s=keyboard_check_pressed(global.consave_s)
	global.con_h_s=keyboard_check(global.consave_s)
	global.con_r_s=keyboard_check_released(global.consave_s)
	//D
	global.con_p_d=keyboard_check_pressed(global.consave_d)
	global.con_h_d=keyboard_check(global.consave_d)
	//i
	global.con_p_i=keyboard_check_pressed(global.consave_i)
	//Numbers
	global.con_p_1=keyboard_check_pressed(ord("1"))
	global.con_p_2=keyboard_check_pressed(ord("2"))
	global.con_p_3=keyboard_check_pressed(ord("3"))
	global.con_p_4=keyboard_check_pressed(ord("4"))
	global.con_p_5=keyboard_check_pressed(ord("5"))
	global.con_p_6=keyboard_check_pressed(ord("6"))
	global.con_p_7=keyboard_check_pressed(ord("7"))
	global.con_p_8=keyboard_check_pressed(ord("8"))
	global.con_p_9=keyboard_check_pressed(ord("9"))
	global.con_p_0=keyboard_check_pressed(ord("0"))


	    gamep1=0 // Use the first gamepad slot
	//up
	if(gamepad_button_check_pressed(gamep1,gp_padu)){
	global.conp_p_up=gamepad_button_check_pressed(gamep1,gp_padu)
	}else{
	if(global.conp_h_up==0){
	if(round(gamepad_axis_value(gamep1, gp_axislv))==-1){
	global.conp_p_up=1
	}}else{
	global.conp_p_up=0
	}}

	if(gamepad_button_check(gamep1,gp_padu)){
	global.conp_h_up=gamepad_button_check(gamep1,gp_padu)
	}else{
	if(round(gamepad_axis_value(gamep1, gp_axislv))==-1){
	global.conp_h_up=1
	}else{
	global.conp_h_up=0
	}}


	//down
	if(gamepad_button_check_pressed(gamep1,gp_padd)){
	global.conp_p_down=gamepad_button_check_pressed(gamep1,gp_padd)
	}else{
	if(global.conp_h_down==0){
	if(round(gamepad_axis_value(gamep1, gp_axislv))==1){
	global.conp_p_down=1
	}}else{
	global.conp_p_down=0
	}}

	if(gamepad_button_check(gamep1,gp_padd)){
	global.conp_h_down=gamepad_button_check(gamep1,gp_padd)
	}else{
	if(round(gamepad_axis_value(gamep1, gp_axislv))==1){
	global.conp_h_down=1
	}else{
	global.conp_h_down=0
	}}

	//right
	if(gamepad_button_check_pressed(gamep1,gp_padr)){
	global.conp_p_right=gamepad_button_check_pressed(gamep1,gp_padr)
	}else{
	if(global.conp_h_right==0){
	if(round(gamepad_axis_value(gamep1, gp_axislh))==1){
	global.conp_p_right=1
	}}else{
	global.conp_p_right=0
	}}

	if(gamepad_button_check(gamep1,gp_padr)){
	global.conp_h_right=gamepad_button_check(gamep1,gp_padr)
	}else{
	if(round(gamepad_axis_value(gamep1, gp_axislh))==1){
	global.conp_h_right=1
	}else{
	global.conp_h_right=0
	}}

	//left
	if(gamepad_button_check_pressed(gamep1,gp_padl)){
	global.conp_p_left=gamepad_button_check_pressed(gamep1,gp_padl)
	}else{
	if(global.conp_h_left==0){
	if(round(gamepad_axis_value(gamep1, gp_axislh))==-1){
	global.conp_p_left=1
	}}else{
	global.conp_p_left=0
	}}

	if(gamepad_button_check(gamep1,gp_padl)){
	global.conp_h_left=gamepad_button_check(gamep1,gp_padl)
	}else{
	if(round(gamepad_axis_value(gamep1, gp_axislh))==-1){
	global.conp_h_left=1
	}else{
	global.conp_h_left=0
	}}

	//space
	global.conp_p_space=gamepad_button_check_pressed(gamep1,gp_face1)
	global.conp_h_space=gamepad_button_check(gamep1,gp_face1)
	global.conp_r_space=gamepad_button_check_released(gamep1,gp_face1)
	//R
	global.conp_p_e=gamepad_button_check_pressed(gamep1,gp_shoulderrb)
	global.conp_h_e=gamepad_button_check(gamep1,gp_shoulderrb)
	global.conp_r_e=gamepad_button_check_released(gamep1,gp_shoulderrb)
	//L
	global.conp_p_l=gamepad_button_check_pressed(gamep1,gp_shoulderlb)
	global.conp_h_l=gamepad_button_check(gamep1,gp_shoulderlb)
	global.conp_r_l=gamepad_button_check_released(gamep1,gp_shoulderlb)	
	
	//enter
	global.conp_p_enter=gamepad_button_check_pressed(gamep1,gp_start)
	//shift
	global.conp_h_shift=gamepad_button_check(gamep1,gp_shoulderr)
	//escape
	global.conp_p_escape=gamepad_button_check_pressed(gamep1,gp_select)
	//E
	global.conp_p_r=gamepad_button_check_pressed(gamep1,gp_face3)
	global.conp_h_r=gamepad_button_check(gamep1,gp_face3)
	//W
	global.conp_p_w=gamepad_button_check_pressed(gamep1,gp_face4)
	global.conp_h_w=gamepad_button_check(gamep1,gp_face4)
	global.conp_r_w=gamepad_button_check_released(gamep1,gp_face4)
	//Q
	global.conp_p_q=gamepad_button_check_pressed(gamep1,gp_face2)
	global.conp_h_q=gamepad_button_check(gamep1,gp_face2)
	global.conp_r_q=gamepad_button_check_released(gamep1,gp_face2)
	//Triggers
	global.conp_p_shr=gamepad_button_check_pressed(gamep1,gp_shoulderr)
	global.conp_p_shl=gamepad_button_check_pressed(gamep1,gp_shoulderl)
	global.conp_h_shr=gamepad_button_check(gamep1,gp_shoulderr)
	global.conp_h_shl=gamepad_button_check(gamep1,gp_shoulderl)

	// Analog stick raw axis values for direct movement
	global.conp_axis_lh = gamepad_axis_value(gamep1, gp_axislh)
	global.conp_axis_lv = gamepad_axis_value(gamep1, gp_axislv)

	// Deadzone handling
	if(abs(global.conp_axis_lh) < 0.2) global.conp_axis_lh = 0
	if(abs(global.conp_axis_lv) < 0.2) global.conp_axis_lv = 0

	// Touch input handling
	// Initialize touch variables if they don't exist
	if (!variable_global_exists("touch_x")) {
		global.touch_x = 0;
		global.touch_y = 0;
		global.touch_pressed = false;
		global.touch_held = false;
		global.touch_released = false;
		global.touch_right_pressed = false;
		global.touch_hold_timer = 0;
	}
	
	// Update touch positions
	global.touch_x = mouse_x;
	global.touch_y = mouse_y;
	global.touch_pressed = false;
	global.touch_held = false;
	global.touch_released = false;
	
	// Check for touch input (device_mouse functions work on mobile)
	if (os_type == os_android || os_type == os_ios) {
		if (device_mouse_check_button_pressed(0, mb_left)) {
			global.touch_pressed = true;
			global.touch_x = device_mouse_x(0);
			global.touch_y = device_mouse_y(0);
		}
		
		if (device_mouse_check_button(0, mb_left)) {
			global.touch_held = true;
			global.touch_x = device_mouse_x(0);
			global.touch_y = device_mouse_y(0);
		}
		
		if (device_mouse_check_button_released(0, mb_left)) {
			global.touch_released = true;
			global.touch_x = device_mouse_x(0);
			global.touch_y = device_mouse_y(0);
		}
	}
	
	// Long press detection for right click
	global.touch_right_pressed = false;
	if (global.touch_held) {
		global.touch_hold_timer++;
		// After 30 frames (0.5 seconds), simulate right click
		if (global.touch_hold_timer == 30) {
			global.touch_right_pressed = true;
		}
	} else {
		global.touch_hold_timer = 0;
	}

}
