
if(keyboard_check(vk_alt)&&keyboard_check(vk_f4)){
	game_end()
}

if(vibratetick==1){
	vibratetick=0
	gamepad_set_vibration(0,vibrateamountl,vibrateamountr)
}

// Number key mask switching
if(pause == 0 && instance_exists(Me)){
	if(global.con_p_1) { Me.class = 0; Me.classcheck = 1; }
	if(global.con_p_2) { Me.class = 1; Me.classcheck = 1; }
	if(global.con_p_3) { Me.class = 2; Me.classcheck = 1; }
	if(global.con_p_4) { Me.class = 3; Me.classcheck = 1; }
	if(global.con_p_5) { Me.class = 4; Me.classcheck = 1; }
	if(global.con_p_6) { Me.class = 5; Me.classcheck = 1; }
	if(global.con_p_7) { Me.class = 6; Me.classcheck = 1; }
	if(global.con_p_8) { Me.class = 7; Me.classcheck = 1; }
	if(global.con_p_9) { Me.class = 8; Me.classcheck = 1; }
	if(global.con_p_0) { Me.class = 9; Me.classcheck = 1; }
}

if(vibrate>0){
	vibrate-=1
	
	if(vibrate==0){
		gamepad_set_vibration(0,0,0)
	}
}

// Escape/Enter handling (skip for title menu, options, arcade selection, arcade mode, and rogue menus)
if((global.con_p_escape||global.conp_p_enter || (pause == 2 && global.con_p_w)) && pause != 10 && pause != 20 && pause != 21 && pause != 22 && pause != 23 && pause != 24 && pause != 27 && pause != 29){
	if(pause==2){
		pause=pauselast
		pausetwo=0
		selectx=selectxtwo
		selecty=selectytwo
		talentmapuiArray[0,101]=100
		talentmapuiArray[0,102]=100
		pauseopt=0
	}else{
		if(pause==0){
			pause=2
			pauselast=0
			selectxtwo=selectx
			selectytwo=selecty
		}else{
			if(pause==1){
				pause=2
				pauselast=1
				selectxtwo=selectx
				selectytwo=selecty
			}
		}
	}
}

// L key toggles arcade mode on/off (gamepad Y only enters, not exits - Y is used for tokens in fish game)
if(keyboard_check_pressed(ord("L"))){
	if(pause!=10){
		pauselast=pause  // Remember where to return when exiting arcade
		if(pauselast == 0 || pauselast == 1) pauselast = 20  // Default to title menu if coming from gameplay/overworld
		pause=10
		arcade=1
		arcadetype=2
	}else{
		leaderboard_add(totalTickets)
		with(Arcade){
			instance_destroy()
		}
		pause=pauselast
	}
}

if(pause==10){

	arcade_scr()

	// Exit arcade mode with Escape/Back button
	if(global.con_p_escape || global.conp_p_escape || global.con_p_w){
		leaderboard_add(totalTickets)
		with(Arcade){
			instance_destroy()
		}
		pause=pauselast
	}

}

#region Quit Confirmation
if(quit_confirm){
	// Decrement input delay
	if(menu_input_delay > 0){
		menu_input_delay -= 1
	}else{
		// Detect mouse movement
		if(mouse_x != mouse_x_previous || mouse_y != mouse_y_previous){
			cursor_mode = 0
		}

		// Left/Right navigation
		if(global.con_p_left || global.conp_p_left){
			quit_selection = 0
			cursor_mode = 1
		}
		if(global.con_p_right || global.conp_p_right){
			quit_selection = 1
			cursor_mode = 1
		}

		// Mouse hover on buttons
		xps = camx - camxtwo
		yps = camy - camytwo
		var qpop_x = xps + 127 - 50
		var qpop_y = yps + 50
		var qpop_w = 100
		var qbtn_w = 40
		var qbtn_gap = 8
		var qbtn_y = qpop_y + 26
		var qbtn_h = 14
		var qbtn_x1 = qpop_x + qpop_w/2 - qbtn_w - qbtn_gap/2
		var qbtn_x2 = qpop_x + qpop_w/2 + qbtn_gap/2

		if(cursor_mode == 0){
			if(mouse_x >= qbtn_x1 && mouse_x <= qbtn_x1 + qbtn_w &&
			   mouse_y >= qbtn_y && mouse_y <= qbtn_y + qbtn_h){
				quit_selection = 0
			}
			if(mouse_x >= qbtn_x2 && mouse_x <= qbtn_x2 + qbtn_w &&
			   mouse_y >= qbtn_y && mouse_y <= qbtn_y + qbtn_h){
				quit_selection = 1
			}
		}

		// Confirm
		if(global.con_p_space || global.conp_p_space || global.con_p_enter || global.con_p_e ||
		   mouse_check_button_pressed(mb_left)){
			var valid_click = true
			if(mouse_check_button_pressed(mb_left) && cursor_mode == 0){
				valid_click = false
				if((mouse_x >= qbtn_x1 && mouse_x <= qbtn_x1 + qbtn_w &&
				    mouse_y >= qbtn_y && mouse_y <= qbtn_y + qbtn_h) ||
				   (mouse_x >= qbtn_x2 && mouse_x <= qbtn_x2 + qbtn_w &&
				    mouse_y >= qbtn_y && mouse_y <= qbtn_y + qbtn_h)){
					valid_click = true
				}
			}
			if(valid_click){
				if(quit_selection == 1){
					game_end()
				}else{
					quit_confirm = false
					menu_input_delay = 5
				}
			}
		}

		// Escape cancels
		if(global.con_p_escape || global.conp_p_escape || global.con_p_w){
			quit_confirm = false
			menu_input_delay = 5
		}
	}
}
#endregion

#region Title Menu (pause == 20)
if(pause == 20 && !quit_confirm){
	// Update animation timer
	title_anim = (title_anim + 1) mod 120

	// Decrement input delay
	if(menu_input_delay > 0){
		menu_input_delay -= 1
	}else{

	// Keyboard/Controller navigation
	if(global.con_p_up || global.conp_p_up){
		title_selection -= 1
		if(title_selection < 0) title_selection = 4
		cursor_mode = 1
	}
	if(global.con_p_down || global.conp_p_down){
		title_selection += 1
		if(title_selection > 4) title_selection = 0
		cursor_mode = 1
	}

	// Mouse hover detection
	xps = camx - camxtwo
	yps = camy - camytwo
	var panel_x = xps + 127 - 50
	var panel_y = yps + 12
	var panel_w = 100
	var item_pad = 6
	var menu_start_y = panel_y + 28
	var menu_spacing = 17
	var item_h = 14

	// Detect mouse movement to switch to mouse mode
	if(mouse_x != mouse_x_previous || mouse_y != mouse_y_previous){
		cursor_mode = 0
	}

	// Mouse selection
	if(cursor_mode == 0){
		for(var i = 0; i < 5; i++){
			var item_y = menu_start_y + (i * menu_spacing)
			if(mouse_x >= panel_x + item_pad && mouse_x <= panel_x + panel_w - item_pad &&
			   mouse_y >= item_y && mouse_y <= item_y + item_h){
				title_selection = i
			}
		}
	}

	// Selection confirmation
	if(global.con_p_space || global.conp_p_space || global.con_p_enter || global.con_p_e ||
	   mouse_check_button_pressed(mb_left)){
		// Check if mouse is over a menu item (for mouse clicks)
		var valid_click = true
		if(mouse_check_button_pressed(mb_left) && cursor_mode == 0){
			valid_click = false
			for(var i = 0; i < 5; i++){
				var item_y = menu_start_y + (i * menu_spacing)
				if(mouse_x >= panel_x + item_pad && mouse_x <= panel_x + panel_w - item_pad &&
				   mouse_y >= item_y && mouse_y <= item_y + item_h){
					valid_click = true
					break
				}
			}
		}

		if(valid_click){
			switch(title_selection){
				case 0: // Adventure
					if(!game_initialized){
						game_start_scr()
					}
					pause = 1  // Go to overworld map
					pauselast = 1
					break
				case 1: // Arcade
					pause = 22  // Arcade selection screen
					arcade_selection = 0
					menu_input_delay = 5  // Prevent immediate selection in submenu
					break
				case 2: // Rogue
					pause = 23  // Rogue level selection screen
					rogue_selection = 0
					menu_input_delay = 5
					break
				case 3: // Options
					pause = 21  // Options menu
					options_tab = 0
					options_selection = -1
					break
				case 4: // Exit
					quit_confirm = true
					quit_selection = 0
					menu_input_delay = 5
					break
			}
		}
	}

	} // end menu_input_delay else

	// Escape opens quit confirmation (always active, outside delay)
	if(menu_input_delay <= 0 && (global.con_p_escape || global.conp_p_escape || global.con_p_w)){
		if(!quit_confirm){
			quit_confirm = true
			quit_selection = 0
			menu_input_delay = 5
		}
	}
}
#endregion

#endregion

#region Options Menu (pause == 21)
if(pause == 21){
	xps = camx - camxtwo
	yps = camy - camytwo

	// Detect mouse movement
	if(mouse_x != mouse_x_previous || mouse_y != mouse_y_previous){
		cursor_mode = 0
	}

	// Tab switching with Tab key or shoulder buttons
	if(keyboard_check_pressed(vk_tab) || global.conp_p_shl || global.conp_p_shr){
		options_tab = (options_tab + 1) mod 4
		options_selection = -1
		cursor_mode = 1
	}

	// Keyboard/controller navigation within tab
	// options_selection == -1 means tabs are focused; left/right switches tabs
	if(global.con_p_up || global.conp_p_up){
		options_selection -= 1
		if(options_selection < -1) options_selection = -1
		cursor_mode = 1
	}
	if(global.con_p_down || global.conp_p_down){
		options_selection += 1
		if(options_tab == 0){
			if(options_selection > 2) options_selection = -1
		}else if(options_tab == 1){
			if(options_selection > 6) options_selection = -1
		}else{
			if(options_selection > 0) options_selection = -1
		}
		cursor_mode = 1
	}
	// Left/Right to switch tabs when tabs are focused
	if(options_selection == -1){
		if(global.con_p_left || global.conp_p_left){
			options_tab -= 1
			if(options_tab < 0) options_tab = 3
			cursor_mode = 1
		}
		if(global.con_p_right || global.conp_p_right){
			options_tab = (options_tab + 1) mod 4
			cursor_mode = 1
		}
	}

	// Mouse click on tabs
	var tab_btn_y = yps + 4 + 21
	var tab_btn_h = 12
	var tab_gap = 2
	var tab_total_w = 235 - 12
	var tab_btn_w = (tab_total_w - tab_gap * 3) / 4
	if(mouse_check_button_pressed(mb_left)){
		for(var t = 0; t < 4; t++){
			var tx1 = xps + 10 + 6 + t * (tab_btn_w + tab_gap)
			if(mouse_x >= tx1 && mouse_x <= tx1 + tab_btn_w &&
			   mouse_y >= tab_btn_y && mouse_y <= tab_btn_y + tab_btn_h){
				options_tab = t
				options_selection = 0
			}
		}
	}

	// Mouse hover on content rows
	var content_y = tab_btn_y + tab_btn_h + 4
	var content_x = xps + 10 + 6
	var content_w = 235 - 12
	if(cursor_mode == 0){
		if(options_tab == 0){
			for(var s = 0; s < 3; s++){
				var ry = content_y + 6 + (s * 22)
				if(mouse_x >= content_x + 8 && mouse_x <= content_x + content_w - 4 &&
				   mouse_y >= ry && mouse_y <= ry + 18){
					options_selection = s
				}
			}
		}else if(options_tab == 1){
			for(var c = 0; c < 7; c++){
				var ry = content_y + 4 + (c * 12)
				if(mouse_x >= content_x + 8 && mouse_x <= content_x + content_w - 4 &&
				   mouse_y >= ry && mouse_y <= ry + 10){
					options_selection = c
				}
			}
		}else{
			var ry = content_y + 10
			if(mouse_x >= content_x + 8 && mouse_x <= content_x + content_w - 4 &&
			   mouse_y >= ry && mouse_y <= ry + 18){
				options_selection = 0
			}
		}
	}

	// Sound tab: volume adjustment with left/right (pressed only) and mouse click
	if(options_tab == 0){
		var volume_step = 0.1
		if(global.con_p_left || global.conp_p_left){
			switch(options_selection){
				case 0: global.master_volume = max(0, global.master_volume - volume_step); break
				case 1: global.music_volume = max(0, global.music_volume - volume_step); break
				case 2: global.sfx_volume = max(0, global.sfx_volume - volume_step); break
			}
		}
		if(global.con_p_right || global.conp_p_right){
			switch(options_selection){
				case 0: global.master_volume = min(1, global.master_volume + volume_step); break
				case 1: global.music_volume = min(1, global.music_volume + volume_step); break
				case 2: global.sfx_volume = min(1, global.sfx_volume + volume_step); break
			}
		}

		// Mouse click on volume bar to set value directly
		if(mouse_check_button_pressed(mb_left) || mouse_check_button(mb_left)){
			var snd_content_x = xps + 10 + 6
			var snd_content_y = tab_btn_y + tab_btn_h + 4
			for(var s = 0; s < 3; s++){
				var ry = snd_content_y + 6 + (s * 22)
				var bar_x = snd_content_x + 8 + 95
				var bar_w = 50
				if(mouse_x >= bar_x && mouse_x <= bar_x + bar_w &&
				   mouse_y >= ry && mouse_y <= ry + 18){
					var new_vol = clamp((mouse_x - bar_x) / bar_w, 0, 1)
					new_vol = round(new_vol * 10) / 10
					switch(s){
						case 0: global.master_volume = new_vol; break
						case 1: global.music_volume = new_vol; break
						case 2: global.sfx_volume = new_vol; break
					}
					options_selection = s
				}
			}
		}
	}

	// Controls tab: key remapping with popup
	if(options_tab == 1){
		if(remap_active){
			if(remap_type == 0){
				// Keyboard remap - listen for key press
				var new_key = keyboard_lastkey
				if(new_key != vk_nokey && new_key != vk_escape){
					switch(remap_target){
						case 0: global.consave_up = new_key; break
						case 1: global.consave_down = new_key; break
						case 2: global.consave_left = new_key; break
						case 3: global.consave_right = new_key; break
						case 4: global.consave_space = new_key; break
						case 5: global.consave_escape = new_key; break
						case 6: global.consave_enter = new_key; break
					}
					remap_active = false
					remap_target = -1
					keyboard_lastkey = vk_nokey
				}
			}else{
				// Gamepad remap - listen for button press (placeholder, gamepad buttons are hardcoded)
				// For now just close on any gamepad press
				if(global.conp_p_space || global.conp_p_enter){
					remap_active = false
					remap_target = -1
				}
			}
			// Cancel remapping with escape
			if(keyboard_check_pressed(vk_escape)){
				remap_active = false
				remap_target = -1
			}
		}else{
			// Mouse hover on control rows
			var ctrl_content_y = yps + 4 + 21 + 12 + 4
			var ctrl_content_x = xps + 10 + 6
			var ctrl_content_w = 235 - 12
			var ctrl_header_h = 8
			var ctrl_rows_y = ctrl_content_y + ctrl_header_h + 3
			var ctrl_row_h = 10
			var ctrl_row_gap = 1
			if(cursor_mode == 0){
				for(var c = 0; c < 7; c++){
					var ry = ctrl_rows_y + c * (ctrl_row_h + ctrl_row_gap)
					if(mouse_x >= ctrl_content_x + 3 && mouse_x <= ctrl_content_x + ctrl_content_w - 3 &&
					   mouse_y >= ry && mouse_y <= ry + ctrl_row_h){
						options_selection = c
					}
				}
			}

			// Click keyboard column to remap keyboard
			if(mouse_check_button_pressed(mb_left)){
				var col2_x = ctrl_content_x + 65
				var col3_x = ctrl_content_x + 145
				for(var c = 0; c < 7; c++){
					var ry = ctrl_rows_y + c * (ctrl_row_h + ctrl_row_gap)
					if(mouse_x >= col2_x - 2 && mouse_x < col3_x - 2 &&
					   mouse_y >= ry && mouse_y <= ry + ctrl_row_h){
						options_selection = c
						remap_active = true
						remap_target = c
						remap_type = 0
						keyboard_lastkey = vk_nokey
					}
				}
			}

			// Keyboard/controller confirm to remap keyboard binding
			if(global.con_p_space || global.conp_p_space || global.con_p_enter || global.con_p_e){
				remap_active = true
				remap_target = options_selection
				remap_type = 0
				keyboard_lastkey = vk_nokey
			}
		}
	}

	// Graphics tab: V-Sync toggle
	if(options_tab == 2){
		if(global.con_p_space || global.conp_p_space || global.con_p_enter || global.con_p_e ||
		   global.con_p_left || global.conp_p_left || global.con_p_right || global.conp_p_right ||
		   mouse_check_button_pressed(mb_left)){
			if(options_selection == 0){
				global.vsync_enabled = !global.vsync_enabled
				display_reset(0, global.vsync_enabled)
			}
		}
	}

	// Back to title menu (only if not remapping)
	if(!remap_active && (global.con_p_escape || global.conp_p_escape || global.con_p_w)){
		pause = 20
	}
}
#endregion

#region Arcade Selection (pause == 22)
if(pause == 22){
	xps = camx - camxtwo
	yps = camy - camytwo

	// Detect mouse movement
	if(mouse_x != mouse_x_previous || mouse_y != mouse_y_previous){
		cursor_mode = 0
	}

	// Decrement input delay
	if(menu_input_delay > 0){
		menu_input_delay -= 1
	}else{
		// Keyboard/controller navigation
		if(global.con_p_up || global.conp_p_up){
			arcade_selection -= 1
			if(arcade_selection < 0) arcade_selection = 5
			cursor_mode = 1
		}
		if(global.con_p_down || global.conp_p_down){
			arcade_selection += 1
			if(arcade_selection > 5) arcade_selection = 0
			cursor_mode = 1
		}

		// Mouse hover on items
		var panel_x = xps + 127 - 50
		var panel_y = yps + 12
		var panel_w = 100
		var item_pad = 6
		var item_start_y = panel_y + 28
		var item_spacing = 15
		var item_h = 14
		if(cursor_mode == 0){
			for(var a = 0; a < 6; a++){
				var item_y = item_start_y + (a * item_spacing)
				if(mouse_x >= panel_x + item_pad && mouse_x <= panel_x + panel_w - item_pad &&
				   mouse_y >= item_y && mouse_y <= item_y + item_h){
					arcade_selection = a
				}
			}
		}

		// Selection confirmation
		if(global.con_p_space || global.conp_p_space || global.con_p_enter || global.con_p_e ||
		   mouse_check_button_pressed(mb_left)){
			var valid_click = true
			if(mouse_check_button_pressed(mb_left) && cursor_mode == 0){
				valid_click = false
				for(var a = 0; a < 6; a++){
					var item_y = item_start_y + (a * item_spacing)
					if(mouse_x >= panel_x + item_pad && mouse_x <= panel_x + panel_w - item_pad &&
					   mouse_y >= item_y && mouse_y <= item_y + item_h){
						valid_click = true
						break
					}
				}
			}
			if(valid_click){
				if(arcade_selection == 5){
					// Scores
					pause = 29
					lb_selection = 0
					lb_scroll = 0
					menu_input_delay = 5
				}else{
					arcadetype = arcade_selection + 1
					arcade = 1
					pauselast = 22
					if(arcade_selection == 0){
						pause = 25
						fish_char_selection = 0
						menu_input_delay = 5
					}else{
						pause = 10
					}
				}
			}
		}

		// Back to title menu (ESC or gamepad Back)
		if(global.con_p_escape || global.conp_p_escape || global.con_p_w){
			pause = 20
		}
	}
}
#endregion

#region Fish Marble Character Selection (pause == 25)
if(pause == 25){
	xps = camx - camxtwo
	yps = camy - camytwo

	// Detect mouse movement
	if(mouse_x != mouse_x_previous || mouse_y != mouse_y_previous){
		cursor_mode = 0
	}

	// Decrement input delay
	if(menu_input_delay > 0){
		menu_input_delay -= 1
	}else{
		// Card positions matching Draw_0.gml
		var panel_x = xps + 127 - 70
		var panel_y = yps + 12
		var panel_w = 140
		var card_pad = 8
		var card_gap = 4
		var card_w = (panel_w - card_pad * 2 - card_gap) / 2
		var card_h = 60
		var card_y = panel_y + 28

		// Keyboard/controller navigation
		if(global.con_p_left || global.conp_p_left){
			fish_char_selection = 0
			cursor_mode = 1
		}
		if(global.con_p_right || global.conp_p_right){
			fish_char_selection = 1
			cursor_mode = 1
		}

		// Mouse hover selection
		if(cursor_mode == 0){
			for(var c = 0; c < 2; c++){
				var cx1 = panel_x + card_pad + c * (card_w + card_gap)
				var cy1 = card_y
				if(mouse_x >= cx1 && mouse_x <= cx1 + card_w &&
				   mouse_y >= cy1 && mouse_y <= cy1 + card_h){
					fish_char_selection = c
				}
			}
		}

		// Selection confirmation
		if(global.con_p_space || global.conp_p_space || global.con_p_enter || global.con_p_e ||
		   mouse_check_button_pressed(mb_left)){
			var valid_click = true
			if(mouse_check_button_pressed(mb_left) && cursor_mode == 0){
				valid_click = false
				for(var c = 0; c < 2; c++){
					var cx1 = panel_x + card_pad + c * (card_w + card_gap)
					var cy1 = card_y
					if(mouse_x >= cx1 && mouse_x <= cx1 + card_w &&
					   mouse_y >= cy1 && mouse_y <= cy1 + card_h){
						valid_click = true
						break
					}
				}
			}
			if(valid_click){
				crabtype = fish_char_selection
				pause = 10
			}
		}

		// Back to arcade menu (ESC or gamepad Back)
		if(global.con_p_escape || global.conp_p_escape || global.con_p_w){
			pause = 22
			menu_input_delay = 5
		}
	}
}
#endregion

#region Rogue Level Selection (pause == 23)
if(pause == 23){
	xps = camx - camxtwo
	yps = camy - camytwo

	// Detect mouse movement
	if(mouse_x != mouse_x_previous || mouse_y != mouse_y_previous){
		cursor_mode = 0
	}

	// Decrement input delay
	if(menu_input_delay > 0){
		menu_input_delay -= 1
	}else{
		// Keyboard/controller navigation
		if(global.con_p_up || global.conp_p_up){
			rogue_selection -= 1
			if(rogue_selection < 0) rogue_selection = 0
			cursor_mode = 1
		}
		if(global.con_p_down || global.conp_p_down){
			rogue_selection += 1
			if(rogue_selection > 0) rogue_selection = 0
			cursor_mode = 1
		}

		// Mouse hover on items
		var panel_x = xps + 127 - 50
		var panel_y = yps + 12
		var panel_w = 100
		var item_pad = 6
		var item_start_y = panel_y + 28
		var item_spacing = 17
		var item_h = 14
		if(cursor_mode == 0){
			for(var r = 0; r < 1; r++){
				var item_y = item_start_y + (r * item_spacing)
				if(mouse_x >= panel_x + item_pad && mouse_x <= panel_x + panel_w - item_pad &&
				   mouse_y >= item_y && mouse_y <= item_y + item_h){
					rogue_selection = r
				}
			}
		}

		// Selection confirmation
		if(global.con_p_space || global.conp_p_space || global.con_p_enter || global.con_p_e ||
		   mouse_check_button_pressed(mb_left)){
			var valid_click = true
			if(mouse_check_button_pressed(mb_left) && cursor_mode == 0){
				valid_click = false
				for(var r = 0; r < 1; r++){
					var item_y = item_start_y + (r * item_spacing)
					if(mouse_x >= panel_x + item_pad && mouse_x <= panel_x + panel_w - item_pad &&
					   mouse_y >= item_y && mouse_y <= item_y + item_h){
						valid_click = true
						break
					}
				}
			}
			if(valid_click){
				pause = 27
				rogue_char_selection = 0
				rogue_char_grid_x = 0
				rogue_char_grid_y = 0
				rogue_selected_class = 1
				menu_input_delay = 5
			}
		}

		// Back to title menu (ESC or gamepad Back)
		if(global.con_p_escape || global.conp_p_escape || global.con_p_w){
			pause = 20
		}
	}
}
#endregion

#region Rogue Character Selection (pause == 27)
if(pause == 27){
	xps = camx - camxtwo
	yps = camy - camytwo

	// Detect mouse movement
	if(mouse_x != mouse_x_previous || mouse_y != mouse_y_previous){
		cursor_mode = 0
	}

	// Decrement input delay
	if(menu_input_delay > 0){
		menu_input_delay -= 1
	}else{
		// Grid navigation with wrapping
		if(global.con_p_up || global.conp_p_up){
			rogue_char_grid_y -= 1
			if(rogue_char_grid_y < 0) rogue_char_grid_y = 2
			cursor_mode = 1
		}
		if(global.con_p_down || global.conp_p_down){
			rogue_char_grid_y += 1
			if(rogue_char_grid_y > 2) rogue_char_grid_y = 0
			cursor_mode = 1
		}
		if(global.con_p_left || global.conp_p_left){
			rogue_char_grid_x -= 1
			if(rogue_char_grid_x < 0) rogue_char_grid_x = 2
			cursor_mode = 1
		}
		if(global.con_p_right || global.conp_p_right){
			rogue_char_grid_x += 1
			if(rogue_char_grid_x > 2) rogue_char_grid_x = 0
			cursor_mode = 1
		}

		// Update selection from grid position
		var char_classes = [1, 2, 3, 4, 5, 6, 7, 8, 9]
		rogue_char_selection = rogue_char_grid_y * 3 + rogue_char_grid_x
		rogue_selected_class = char_classes[rogue_char_selection]

		// Mouse hover detection on grid cells
		var panel_x = xps + 10
		var panel_y = yps + 4
		var grid_pad = 6
		var grid_start_x = panel_x + grid_pad
		var grid_start_y = panel_y + 22
		var cell_w = 73
		var cell_h = 33
		var cell_gap = 2

		if(cursor_mode == 0){
			for(var row = 0; row < 3; row++){
				for(var col = 0; col < 3; col++){
					var cell_x = grid_start_x + col * (cell_w + cell_gap)
					var cell_y = grid_start_y + row * (cell_h + cell_gap)

					if(mouse_x >= cell_x && mouse_x < cell_x + cell_w &&
					   mouse_y >= cell_y && mouse_y < cell_y + cell_h){
						rogue_char_grid_x = col
						rogue_char_grid_y = row
						rogue_char_selection = row * 3 + col
						rogue_selected_class = char_classes[rogue_char_selection]
					}
				}
			}
		}

		// Confirm selection - Start Rogue mode
		if(global.con_p_space || global.conp_p_space || global.con_p_enter || global.con_p_e ||
		   mouse_check_button_pressed(mb_left)){
			// Check if click was inside the grid
			var valid_click = true
			if(mouse_check_button_pressed(mb_left)){
				valid_click = false
				for(var row = 0; row < 3; row++){
					for(var col = 0; col < 3; col++){
						var cell_x = grid_start_x + col * (cell_w + cell_gap)
						var cell_y = grid_start_y + row * (cell_h + cell_gap)
						if(mouse_x >= cell_x && mouse_x < cell_x + cell_w &&
						   mouse_y >= cell_y && mouse_y < cell_y + cell_h){
							valid_click = true
							break
						}
					}
					if(valid_click) break
				}
			}

			if(valid_click){
				// Initialize rogue mode
				rogue_mode = true
				rogue_wave = 0
				rogue_xp = 0
				rogue_xp_display = 0
				rogue_level = 1
				rogue_xp_needed = 3
				rogue_pause = 0
				rogue_wave_timer = 180
				rogue_wave_active = false

				// Initialize game if not already
				if(!game_initialized){
					game_start_scr()
				}

				// Set the selected class on Me before transitioning
				Me.class = rogue_selected_class
				Me.classcheck = 1

				// Transition to rogue room
				room_goto(room_rogue)

				pause = 0
				pauselast = 0
			}
		}

		// Back to level selection (ESC or gamepad Back)
		if(global.con_p_escape || global.conp_p_escape || global.con_p_w){
			pause = 23
			menu_input_delay = 5
		}
	}
}
#endregion

#region Rogue Game Over (pause == 24)
if(pause == 24){
	// Handle input to return to title
	if(global.con_p_space || global.conp_p_space || global.con_p_enter || global.con_p_e ||
	   mouse_check_button_pressed(mb_left)){
		// Return to title menu
		rogue_mode = false
		pause = 20
		room_goto(room0)

		// Clean up
		with(Enemy){ instance_destroy() }
		with(Abil){ if(pin != 23) instance_destroy() }
		with(Part){ instance_destroy() }
	}
}
#endregion

#region Leaderboard (pause == 29)
if(pause == 29){
	// Detect mouse movement
	if(mouse_x != mouse_x_previous || mouse_y != mouse_y_previous){
		cursor_mode = 0
	}

	if(menu_input_delay > 0){
		menu_input_delay -= 1
	}else{
		// Up/Down navigation
		if(global.con_p_up || global.conp_p_up){
			lb_selection -= 1
			if(lb_selection < 0){
				lb_selection = 0
				if(lb_scroll > 0) lb_scroll -= 1
			}
			cursor_mode = 1
		}
		if(global.con_p_down || global.conp_p_down){
			lb_selection += 1
			var vis_count = min(global.lb_count, lb_visible_rows)
			if(lb_selection >= vis_count){
				lb_selection = max(0, vis_count - 1)
				if(lb_scroll + lb_visible_rows < global.lb_count) lb_scroll += 1
			}
			cursor_mode = 1
		}

		// Mouse hover on rows
		xps = camx - camxtwo
		yps = camy - camytwo
		var row_start_y = yps + 4 + 21 + 10 + 12
		var row_h = 11
		var vis_count = min(global.lb_count, lb_visible_rows)
		if(cursor_mode == 0){
			for(var i = 0; i < vis_count; i++){
				var ry = row_start_y + i * row_h
				if(mouse_x >= xps + 15 && mouse_x <= xps + 239 &&
				   mouse_y >= ry && mouse_y <= ry + row_h){
					lb_selection = i
				}
			}
		}

		// Back to arcade selection
		if(global.con_p_escape || global.conp_p_escape || global.con_p_w){
			pause = 22
			menu_input_delay = 5
		}
	}
}
#endregion

#region Overworld Map
#region Inventory
#region Money All pauses
// Only run when game is initialized (after Adventure is selected)
if(game_initialized){
	if(mapdataArray[1000,4]<100000){
		mapdataArray[1000,4]+=1
	}else{
		mapdataArray[1000,4]=0
	}
	if(mapdataArray[1000,6]<90){
		mapdataArray[1000,6]+=1
	}else{
		if(mapdataArray[1000,4] mod 10==0){
			if(mapdataArray[1000,5]!=0){
				mapdataArray[1010,0] += 1*(sign(mapdataArray[1000,5]))
				mapdataArray[1000,5] -= 1*(sign(mapdataArray[1000,5]))

			}
		}
	}
}
#endregion
if(pause!=0 && pause!=26){
//pause=0
	if(pause==1){
		// Debug: Teleport to dungeon entrance (T key)
		if(keyboard_check_pressed(ord("T"))){
			// Set player position to dungeon entrance at 4,4
			mapdataArray[1001,0] = 4;  // Me x position
			mapdataArray[1001,1] = 4;  // Me y position
			mapdataArray[1001,2] = 0;  // Me not moving
			mapdataArray[1001,3] = 4;  // Me MOVE x position
			mapdataArray[1001,4] = 4;  // Me MOVE y position
			mapdataArray[1001,7] = 4;  // Me CURRENT x position  
			mapdataArray[1001,8] = 4;  // Me CURRENT y position
			
			// Update visual position
			mapx = 4;
			mapy = 4;
			selectx = 4;
			selecty = 4;
			
			// Update Me object position if it exists
			if(instance_exists(Me)){
				Me.x = mapx * 38 + 112;
				Me.y = mapy * 38 + 21;
			}
			
			// Set phasetick to allow immediate entry
			phasetick = 3;
		}
		overworld_map_scr()
			}else{
				if(pause==2){
#region Always
#region Change Menu
						xps=camx-camxtwo
						yps=camy-camytwo
			if(mouse_x>=xps+1&&mouse_x<=xps+56&&mouse_y>=yps+73&&mouse_y<=yps+84){
				if(pauseopt!=0){
					if(mouse_check_button_pressed(mb_left) || touch_pressed_in_rect(xps+1, yps+73, xps+56, yps+84)){
						pauseopt=0
					}
				}
			}
			if(mouse_x>=xps+1&&mouse_x<=xps+56&&mouse_y>=yps+73+19&&mouse_y<=yps+84+19){
				if(pauseopt!=1){
					if(mouse_check_button_pressed(mb_left) || touch_pressed_in_rect(xps+1, yps+73+19, xps+56, yps+84+19)){
						pauseopt=1
					}
				}							
			}
			if(mouse_x>=xps+1&&mouse_x<=xps+56&&mouse_y>=yps+73+38&&mouse_y<=yps+84+38){
				if(pauseopt!=2){
					if(mouse_check_button_pressed(mb_left) || touch_pressed_in_rect(xps+1, yps+73+38, xps+56, yps+84+38)){
						pauseopt=2
							selected=999
									if(mouse_check_button_pressed(mb_left) || global.touch_pressed || (cursor_mode == 1 && (global.con_p_space || global.conp_p_space))){
										invenArray[invenArray[30,0],1]=0	
										invenArray[30,0]=999
									}	
					}
				}							
			}
			
			// Keyboard/Controller tab switching
			if(cursor_mode == 1) {
				// Tab/L1-R1 to switch tabs
				if(keyboard_check_pressed(vk_tab) || global.conp_p_shl || global.conp_p_shr) {
					if(keyboard_check_pressed(vk_tab) || global.conp_p_shr) {
						// Next tab
						pauseopt = (pauseopt + 1) % 3
					} else if(global.conp_p_shl) {
						// Previous tab
						pauseopt = pauseopt - 1
						if(pauseopt < 0) pauseopt = 2
					}
					// Reset cursor position when switching tabs
					cursor_x = 0
					cursor_y = 0
					cursor_area = (pauseopt == 1) ? 2 : 0 // Shop mode starts in shop area
					selected = 999
				}
			}
#endregion
if(pauseopt!=2){
#region Character
	if(invenArray[39,0]+0.3<110){
		invenArray[39,0]+=0.3
	}else{
		invenArray[39,0]=0
	}
#endregion
#endregion
					if(targettick==0){
						if(targetpos<0.6){
							targetpos+=0.02
						}else{
							targettick=1
						}
					}else{
						if(targetpos>-0.6){
							targetpos-=0.02
						}else{
							targettick=0
						}	
					}			
						xps=camx-camxtwo
						yps=camy-camytwo
						chance=xps+61+0.5
						chancetwo=yps+71+0.5

						// Keyboard/Controller navigation
						if(global.con_p_up || global.con_p_down || global.con_p_left || global.con_p_right || 
						   global.conp_p_up || global.conp_p_down || global.conp_p_left || global.conp_p_right) {
							// Switch to cursor mode when directional input detected
							cursor_mode = 1
							
							// Handle input with repeat delay
							if(cursor_timer <= 0) {
								var moved = false
								
								// Vertical movement
								if(global.con_p_up || global.conp_p_up) {
									cursor_y--
									moved = true
								} else if(global.con_p_down || global.conp_p_down) {
									cursor_y++
									moved = true
								}
								
								// Horizontal movement
								if(global.con_p_left || global.conp_p_left) {
									cursor_x--
									moved = true
								} else if(global.con_p_right || global.conp_p_right) {
									cursor_x++
									moved = true
								}
								
								// Apply movement constraints based on current area
								if(pauseopt == 0) { // Inventory mode
									if(cursor_area == 0) { // Main inventory grid
										cursor_x = clamp(cursor_x, 0, 6)
										cursor_y = clamp(cursor_y, 0, 2)
										
										// Check for area transitions
										if(cursor_y < 0) {
											cursor_area = 1 // Move to equipment
											cursor_y = 1
											cursor_x = clamp(cursor_x, 0, 2)
										}
									} else if(cursor_area == 1) { // Equipment slots
										cursor_x = clamp(cursor_x, 0, 2)
										cursor_y = clamp(cursor_y, 0, 1)
										
										// Check for area transitions
										if(cursor_y > 1) {
											cursor_area = 0 // Move to main inventory
											cursor_y = 0
											cursor_x = min(cursor_x, 6)
										} else if(cursor_y < 0) {
											cursor_area = 4 // Move to mask
											cursor_x = 0
											cursor_y = 0
										}
									} else if(cursor_area == 4) { // Mask selection
										cursor_x = 0
										cursor_y = 0
										
										// Check for area transitions
										if(cursor_y > 0 || (global.con_p_down || global.conp_p_down)) {
											cursor_area = 1 // Move to equipment
											cursor_y = 0
											cursor_x = 1 // Center on middle equipment slot
										}
									}
								} else if(pauseopt == 1) { // Shop mode
									if(cursor_area == 2) { // Shop items
										cursor_x = clamp(cursor_x, 0, 4)
										cursor_y = 0
										
										// Transition to sell slot
										if(cursor_x > 4) {
											cursor_x = 0
											cursor_area = 3 // Sell slot
										}
									} else if(cursor_area == 3) { // Sell slot
										cursor_x = 0
										cursor_y = 0
										
										// Transition back to shop
										if(global.con_p_left || global.conp_p_left) {
											cursor_x = 4
											cursor_area = 2
										}
									}
									
									// Allow transition to main inventory
									if((global.con_p_down || global.conp_p_down) && cursor_area < 3) {
										cursor_area = 0
										cursor_y = 0
										cursor_x = min(cursor_x, 6)
									} else if((global.con_p_up || global.conp_p_up) && cursor_area == 0) {
										cursor_area = 2
										cursor_y = 0
										cursor_x = min(cursor_x, 4)
									}
								}
								
								// Set repeat delay
								if(moved) {
									cursor_timer = 8 // Initial delay
								}
							} else {
								cursor_timer--
								if(cursor_timer == 0) {
									cursor_timer = 3 // Repeat delay
								}
							}
						} else {
							cursor_timer = 0
						}
						
						// Detect mouse movement to switch back to mouse mode
						if(mouse_x != mouse_x_previous || mouse_y != mouse_y_previous) {
							cursor_mode = 0
						}
						
						// Calculate selected slot based on cursor position when in cursor mode
						if(cursor_mode == 1) {
							if(pauseopt == 0) { // Inventory mode
								if(cursor_area == 0) { // Main inventory
									selectx = cursor_x
									selecty = cursor_y
									selected = selecty * 7 + selectx
									if(selected > 20) selected = 20
								} else if(cursor_area == 1) { // Equipment slots
									selectx = cursor_x
									selecty = cursor_y
									selected = (selecty * 3 + selectx) + 21
									if(selected > 26) selected = 26
								} else if(cursor_area == 4) { // Mask
									selected = 998 // Special value for mask
								}
							} else if(pauseopt == 1) { // Shop mode
								if(cursor_area == 2) { // Shop items
									selected = cursor_x + 40
									if(selected > 44) selected = 44
								} else if(cursor_area == 3) { // Sell slot
									selected = 45
								} else if(cursor_area == 0) { // Main inventory in shop mode
									selectx = cursor_x
									selecty = cursor_y
									selected = selecty * 7 + selectx
									if(selected > 20) selected = 20
								}
							}
						} else { // Mouse mode - original mouse handling code follows
							// Right-click handling (works in both modes)
						}
						
						// Right-click to cancel held item (works in both cursor and mouse modes)
						if(mouse_check_button_pressed(mb_right) || global.touch_right_pressed){
							invenArray[invenArray[30,0],1]=0	
							invenArray[30,0]=999
						}
						
						// Mouse selection (only in mouse mode)
						if(cursor_mode == 0) {
							if(mouse_x>=chance&&mouse_y>=chancetwo&&mouse_x<xps+191&&mouse_y<yps+126){
						selectx=floor((mouse_x-chance)/19)
						selecty=floor((mouse_y-chancetwo)/19)
						selected=selecty*7+selectx
						if(selected>20){
							selected=20
						}
					}else{
						if(pauseopt==0){
							if(mouse_x>=chance&&mouse_y>=chancetwo-43&&mouse_x<chance+19*3&&mouse_y<yps-43+chancetwo+19*2){
								selectx=floor((mouse_x-chance)/19)
								selecty=floor((mouse_y-(chancetwo-43))/19)
								selected=(selecty*3+selectx)+21		
								if(selected>26){
									selected=26
								}
							}else{
							selected=999
									if(mouse_check_button_pressed(mb_left) || (cursor_mode == 1 && (global.con_p_space || global.conp_p_space))){
										invenArray[invenArray[30,0],1]=0	
										invenArray[30,0]=999
									}	
							}
						}else{
							
							//STORE
							chance=xps+60
							chancetwo=yps+30
							if(mouse_x>=chance&&mouse_y>=chancetwo&&mouse_x<chance+19*5&&mouse_y<chancetwo+19){
								selectx=floor((mouse_x-chance)/19)
								selecty=floor((mouse_y-(chancetwo-43))/19)
								selected=(selectx)+40	
								selectedtwo=selected
								if(selected<40){
									selected=40
								}
								if(selected>44){
									selected=44
								}
							}else{
							chance=xps+175
							chancetwo=yps+31				
								if(mouse_x>=chance&&mouse_y>=chancetwo&&mouse_x<chance+19&&mouse_y<chancetwo+19){
									selectx=floor((mouse_x-chance)/19)
									selecty=floor((mouse_y-(chancetwo-43))/19)
									selected=45
								}else{
							selected=999
									if(mouse_check_button_pressed(mb_left) || (cursor_mode == 1 && (global.con_p_space || global.conp_p_space))){
										invenArray[invenArray[30,0],1]=0	
										invenArray[30,0]=999
									}	
								}
							}
						}
					}
					} // End cursor_mode == 0 (mouse mode)
					//selected=40
				
					// Handle mask selection
					if(selected == 998 && cursor_mode == 1){
						if(global.con_p_space || global.conp_p_space){
							// Cycle through classes when mask is selected
							Me.class = (Me.class + 1) % 10
						}
					}
					// Handle mouse click on mask
					if(pauseopt == 0 && mouse_x>=xps+80 && mouse_y>=yps+10 && mouse_x<xps+80+16 && mouse_y<yps+10+16){
						if(mouse_check_button_pressed(mb_left) || touch_pressed_in_rect(xps+80, yps+10, xps+80+16, yps+10+16)){
							Me.class = (Me.class + 1) % 10
							Me.classcheck = 1
						}
					}
					
					// Item interaction handling (works for both mouse and keyboard/controller)
					if(cursor_mode == 1 || (mouse_x>=chance&&mouse_y>=chancetwo&&mouse_x<xps+191&&mouse_y<yps+126||mouse_x>=chance&&mouse_y>=chancetwo-43&&mouse_x<chance+19*3&&mouse_y<yps-43+chancetwo+19*2&&pauseopt==0)){
						if(invenArray[30,0]==999){
							if(selected!=999){
								if(invenArray[selected,0]!=0){
									if(mouse_check_button_pressed(mb_left) || (cursor_mode == 1 && (global.con_p_space || global.conp_p_space))){
											chancethree=1
										if(invenArray[selected,0]==25){
											if(Me.hp>=Me.hptotal){
												chancethree=0
											}
										}
										if(chancethree==1){
											//Buy
											if(invenArray[selected,0]==23||invenArray[selected,0]==25){
													if(mapdataArray[1010,0]+mapdataArray[1000,5]<itemArray[invenArray[selected,0],4]+floor(invenArray[selected,2])){
														chancethree=0												
													}											
											}else{
												if(selected>=40&&selected<45){
													if(mapdataArray[1010,0]+mapdataArray[1000,5]<itemArray[invenArray[selected,0],4]+floor(invenArray[selected,2]*2)){
														chancethree=0												
													}
												}else{
													if(selected==45){
														if(mapdataArray[1010,0]+mapdataArray[1000,5]<itemArray[invenArray[selected,0],4]+floor(invenArray[selected,2]*2)){
															chancethree=0
														}
													}
												}	
											}
											if(chancethree==1){
												invenArray[selected,1]=1
												invenArray[30,0]=selected
												invenArray[30,1]=selectx
												invenArray[30,2]=selecty
											}
											if(keyboard_check(vk_shift) || global.conp_h_shift){
												if(pauseopt==1){
													if(selected>=40&&selected<45||selected==45){
														if(chancethree==1){
															chance=0
															chancethree=-1
															chancetwo=0
															while(chance==0){
																if(invenArray[chancetwo,0]==0){
																	chance=1
																	chancethree=chancetwo
																}
																chancetwo+=1
																if(chancetwo==21){
																	chance=1
																}
															}
															if(chancethree>=0){
																selected=chancethree
																inven_place_scr()
															}
														}
													}else{
														if(selected<21){
															selected=45
															chance=0
															chancetwo=0
															chancethree=0
															inven_place_scr()													
														}
													}
												}else{
													if(pauseopt==0){
														if(selected<21){
																if(itemArray[invenArray[invenArray[30,0],0],2]==1){
																	selected=21
																}else{
																	if(itemArray[invenArray[invenArray[30,0],0],2]==2){
																		selected=23
																	}else{
																		if(itemArray[invenArray[invenArray[30,0],0],2]==0){		
																			selected=0
																			for(var i=0;i<3;i+=1){
																				if(invenArray[24+i,0]==0){
																					selected=24+i
																					i=5
																				}
																				if(i==2){
																					selected=24
																				}
																			}
																		}
																	}
																}
															inven_place_scr()
														}else{
															//To General Inventory
															chance=0
															chancethree=-1
															chancetwo=0
															while(chance==0){
																if(invenArray[chancetwo,0]==0){
																	chance=1
																	chancethree=chancetwo
																}
																chancetwo+=1
																if(chancetwo==21){
																	chance=1
																}
															}
															if(chancethree>=0){
																selected=chancethree
																inven_place_scr()
															}														
														}
													}
												}
											}
										}
									}
								}
							}
						}else{
							if(mouse_check_button_pressed(mb_left) || (cursor_mode == 1 && (global.con_p_space || global.conp_p_space))){	
								chance=0
								chancetwo=0
								chancethree=0
								inven_place_scr()
							}else{
								if(mouse_check_button_pressed(mb_right) || global.touch_right_pressed){
									invenArray[invenArray[30,0],1]=0	
									invenArray[30,0]=999
								}	
							}
						}
					}
					

		#region Pet
		if(selected<999){
			if(invenArray[selected,0]>0){
				if(itemArray[invenArray[selected,0],2]==1){
							//imgcap
							invenArray[31,2]=(itemArray[invenArray[selected,0],12]+1)*10
							//imgsped
							invenArray[31,3]=1
							
					if(invenArray[31,0]!=invenArray[selected,0]){
						invenArray[31,0]=invenArray[selected,0]
							//image_index
							invenArray[31,4]=0

					}else{
						if(invenArray[31,4]+invenArray[31,3]<invenArray[31,2]){
							invenArray[31,4]+=invenArray[31,3]
						}else{
							invenArray[31,4]=0
						}
					}
				}
			}
		}
		if(invenArray[21,0]!=0){
							//imgcap
							invenArray[31,11]=(itemArray[invenArray[21,0],12]+1)*10
							//imgsped
							invenArray[31,12]=1
							
					if(invenArray[31,10]!=invenArray[21,0]){
						invenArray[31,10]=invenArray[21,0]
							//image_index
							invenArray[31,13]=0

					}else{
						if(invenArray[31,13]+invenArray[31,12]<invenArray[31,11]){
							invenArray[31,13]+=invenArray[31,12]
						}else{
							invenArray[31,13]=0
						}
					}			
		}
		if(invenArray[23,0]!=0){
			invenArray[23,4]=itemArray[invenArray[23,0],9]-(itemArray[invenArray[23,0],9]*(invenArray[23,2]*0.05))
		}
#region

#endregion 

		if(invenArray[31,15]+1<299){
			invenArray[31,15]+=1
			if(invenArray[31,15]==10){
				invenArray[31,16]=1
			}else{
				if(invenArray[31,15]==20){
					invenArray[31,16]=0
				}else{
					if(invenArray[31,15]==40){
						invenArray[31,16]=2
					}else{
						if(invenArray[31,15]==50){
							invenArray[31,16]=0
						}else{
						
						}						
					}				
				}			
			}
		}else{
			invenArray[31,15]=0
		}
#region Passive Equipment
/*
for(i=0;i<2;i+=1){
	//Health Attack
	chance=0
	if(invenArray[24,0]!=0){
		if(itemArray[invenArray[24,0],1]==2+i){
			chance+=itemArray[invenArray[24,0],7]
			if(i==0){
				if(invenArray[24,2]>=3){
					chance+=1
				}
			}else{
				chance+=itemArray[invenArray[24,0],7]*(invenArray[24,2]*0.2)
			}
		}
	}
	if(invenArray[25,0]!=0){
		if(itemArray[invenArray[25,0],1]==2+i){
			chance+=itemArray[invenArray[25,0],7]
			if(i==0){
				if(invenArray[25,2]>=3){
					chance+=1
				}
			}else{
				chance+=itemArray[invenArray[25,0],7]*(invenArray[25,2]*0.2)
			}
		}
	}
	if(invenArray[26,0]!=0){
		if(itemArray[invenArray[26,0],1]==2+i){
			chance+=itemArray[invenArray[26,0],7]
			if(i==0){
				if(invenArray[26,2]>=3){
					chance+=1
				}
			}else{
				chance+=itemArray[invenArray[26,0],7]*(invenArray[26,2]*0.2)
			}
		}
	}
	invenArray[24+i,3]=chance
}
*/

//invenArray[24+i,3]
var ii=0
invenArray[24,3]=0
invenArray[25,3]=0
invenArray[26,3]=0
invenArray[24,4]=0
for(var i=0;i<3;i+=1){
	if(invenArray[24+i,0]!=0){
		if(itemstatsArray[invenArray[24+i,0],1]!=0){
		invenArray[24,3]+=itemstatsArray[invenArray[24+i,0],1]+invenArray[24+i,2]
		}
		if(itemstatsArray[invenArray[24+i,0],3]!=0){
		invenArray[25,3]+=itemstatsArray[invenArray[24+i,0],3]+itemstatsArray[invenArray[24+i,0],3]*(invenArray[24+i,2]*0.2)
		}
		if(itemstatsArray[invenArray[24+i,0],5]!=0){
		invenArray[26,3]+=itemstatsArray[invenArray[24+i,0],5]+itemstatsArray[invenArray[24+i,0],5]*(invenArray[24+i,2]*0.2)
		}
		if(itemstatsArray[invenArray[24+i,0],7]!=0){
		invenArray[24,4]+=itemstatsArray[invenArray[24+i,0],7]+itemstatsArray[invenArray[24+i,0],7]*(invenArray[24+i,2]*0.2)
		}
	}
}


	
#endregion
		#endregion
		
				}else{
			
#region Talent UI
	if(pause==2&&pauseopt==2){
		// Handle Switch Mask Button
		var button_x = xps + 62;
		var button_y = yps + 5;
		var button_width = 30;
		var button_height = 10;
		
		// Check for mouse click on button
		if(mouse_x >= button_x && mouse_x < button_x + button_width && 
		   mouse_y >= button_y && mouse_y < button_y + button_height){
			if(mouse_check_button_pressed(mb_left) || 
			   (global.touch_pressed && global.touch_x >= button_x && global.touch_x < button_x + button_width && 
			    global.touch_y >= button_y && global.touch_y < button_y + button_height)){
				Me.class = (Me.class + 1) % 10;
				Me.classcheck = 1;
			}
		}
		
		// Handle keyboard/gamepad selection of button
		if(cursor_mode == 1 && selected == 997){
			if(global.con_p_space || global.conp_p_space){
				Me.class = (Me.class + 1) % 10;
				Me.classcheck = 1;
			}
		}
		if(targettick==0){
			if(targetpos<0.6){
				targetpos+=0.02
			}else{
				targettick=1
			}
		}else{
			if(targetpos>-0.6){
				targetpos-=0.02
			}else{
				targettick=0
			}	
		}
		
		

		//Warning cooldown
		if(talentmapuiArray[0,103]>0){
			talentmapuiArray[0,103]-=1
			if(talentmapuiArray[0,103]==0){
				talentmapuiArray[0,104]=100
			}
		}

		//x
		// Check both mouse and touch positions
		var input_x = mouse_x;
		var input_y = mouse_y;
		if (global.touch_held || global.touch_pressed) {
			input_x = global.touch_x;
			input_y = global.touch_y;
		}
		
		if(input_x>xps+60&&input_x<xps+191-2&&input_y>yps+13&&input_y<yps+125-2){
			talentmapuiArray[0,101]=floor(((input_x-xps+385-3-67)/131)*7)-20
		//y
			talentmapuiArray[0,102]=floor(((input_y-yps+305-25-13)/112)*6)-15
			

			
		//Select click
			if(mouse_check_button_pressed(mb_left) || global.touch_pressed){
				//Talent point check
				if(classArray[Me.class,5]-classArray[Me.class,4]>=talentmapArray[chance,3]){
					//Map check
					if(talentmapuiArray[talentmapuiArray[0,101],talentmapuiArray[0,102]]!=0){
							chance=talentmapuiArray[talentmapuiArray[0,101],talentmapuiArray[0,102]]
						if(chance>=4&&chance<7&&talentmapArray[7,1]>0){
							talentmapuiArray[0,103]=20
							talentmapuiArray[0,104]=7
						}else{
						if(chance>=7&&chance<10&&talentmapArray[4,1]>0){
							talentmapuiArray[0,103]=20
							talentmapuiArray[0,104]=4							
						}else{
						if(chance>=10&&chance<13&&talentmapArray[13,1]>0){
							talentmapuiArray[0,103]=20
							talentmapuiArray[0,104]=13							
						}else{
						if(chance>=13&&chance<16&&talentmapArray[10,1]>0){
							talentmapuiArray[0,103]=20
							talentmapuiArray[0,104]=10							
						}else{
							//Level check
							if(classArray[Me.class,1]>=talentmapArray[chance,6]){
								//Specific talent point check
								if(talentmapArray[talentmapArray[chance,5],1]>=talentmapArray[talentmapArray[chance,5],2]||talentmapArray[chance,5]==0){
									if(talentmapArray[chance,1]<talentmapArray[chance,2]){
										talentmapArray[chance,1]+=talentmapArray[chance,3]
										classArray[Me.class,4]+=talentmapArray[chance,3]
									}
								}else{
									//Red warning for prerequisite not unlocked
									talentmapuiArray[0,103]=20
									talentmapuiArray[0,104]=talentmapArray[chance,5]
							
								}
							}
						}}}}
					}
				}else{
					//Red warning for not enough talent points
					talentmapuiArray[0,103]=20
					talentmapuiArray[0,104]=101			
				}
			}
			if(mouse_check_button_pressed(mb_right) || global.touch_right_pressed){
				//Map check
				if(talentmapuiArray[talentmapuiArray[0,101],talentmapuiArray[0,102]]!=0){
						chance=talentmapuiArray[talentmapuiArray[0,101],talentmapuiArray[0,102]]
					//Specific talent point check
					if(talentmapArray[chance,1]>=talentmapArray[chance,3]){
						talentmapArray[chance,1]-=talentmapArray[chance,3]
						classArray[Me.class,4]-=talentmapArray[chance,3]
						
					}
					if(chance==4||chance==7||chance==10||chance==13||chance==16||chance==19){
						for(var i=talentmapArray[chance+1,1];i>0;i-=1){
							if(talentmapArray[chance+1,1]>=talentmapArray[chance+1,3]){
								talentmapArray[chance+1,1]-=talentmapArray[chance+1,3]
								classArray[Me.class,4]-=talentmapArray[chance,3]
							}
						}
							if(talentmapArray[chance+2,1]>=talentmapArray[chance+2,3]){
								talentmapArray[chance+2,1]-=talentmapArray[chance+2,3]
								classArray[Me.class,4]-=talentmapArray[chance,3]
							}
					}else{
						if(chance==5||chance==8||chance==11||chance==14||chance==17||chance==20){
							if(talentmapArray[chance+1,1]>=talentmapArray[chance+1,3]){
								talentmapArray[chance+1,1]-=talentmapArray[chance+1,3]
								classArray[Me.class,4]-=talentmapArray[chance,3]
							}							
						}else{
							if(chance==2){
								if(talentmapArray[chance+1,1]>=talentmapArray[chance+1,3]){
									talentmapArray[chance+1,1]-=talentmapArray[chance+1,3]
									classArray[Me.class,4]-=talentmapArray[chance,3]
								}								
							}
						}					
					}
					
				}
				
			}
		}else{
			talentmapuiArray[0,101]=100
			talentmapuiArray[0,102]=100
		}
	}
#endregion
				}
			}
	}
#endregion
}else{
#endregion

if(pause==0 || pause==26){
#region Passive Item CDS
if(pause==0){
	for(var i=0;i<3;i+=1){
		if(invenArray[24+i,8]>0){
			invenArray[24+i,8]-=1
		}
		if(invenArray[24+i,9]>0){
			invenArray[24+i,9]-=1
		}
	}
}
#endregion
	level_run_scr()
}


if(miniArray[0,1]>0){
	miniArray[0,1]-=1
}
	if(animation<60){
		animation+=1
	}else{
		animation=0
		if(animationtick==0){
			animationtick=1
		}else{
			animationtick=0
		}
	}
	if(targettick==0){
		if(targetpos<0.6){
			targetpos+=0.04
		}else{
			targettick=1
		}
	}else{
		if(targetpos>-0.6){
			targetpos-=0.04
		}else{
			targettick=0
		}	
	}

if(global.con_p_m){
	/*
		created=instance_create_depth(Me.x,Me.y-32,10,Enemy)
		with(created){
			pin=4
			enopt=choose(0,1)
			enopt=1
		}	
			boss=1+created.enopt
	//*/
	pause=1
}
if(global.con_p_i){
		created=instance_create_depth(Me.x,Me.y-32,10,Enemy)
		with(created){
			pin=3
			enopt=7
		}		
}
//Difficulty
/*
if(global.con_p_d){
		created=instance_create_depth(Me.x,Me.y-32,10,Enemy)
		with(created){
			pin=1
			enopt=2
		}
	if(dif==0){
	dif=1
	}else{
	dif=0
	}
}
*/


if(global.con_p_i){
	if(debug==1){
	debug=0
		terrainspr=terrain_spr
		with(Block){
		visible=false
		}
	}else{
	debug=1
		terrainspr=dummy_spr
		with(Block){
		visible=true
		}
	}
}


if(Me.hp>0){
	abil_run_scr()
}


part_run_scr()
damage_scr()
}

// Only run camera and leveling when game is initialized
if(game_initialized){
	camera_scr()

	//Leveling Experience
	if(!rogue_mode){
		// Adventure mode leveling
		//Experience Total
		classArray[Me.class,3]=(classArray[Me.class,1]*10)+10
		//Experience Total
		classArray[Me.class,5]=classArray[Me.class,1]-1
		if(keyboard_check(ord("P"))){
			xpamount+=1
			xptimer=60
		}

		if(xptimer>0){
			xptimer-=1
		}else{
			if(levelup==0){
				levelupimg=0
				if(xpamount>0&&timertime mod 5==0){
					xpamount-=1
					classArray[Me.class,2]+=1
				}
			}
		}

		//Level up
		if(classArray[Me.class,2]>=classArray[Me.class,3]){
			classArray[Me.class,1]+=1
			levelup=leveluptotal
			audio_play_sound_at(choose(snd_ac_chime_1,snd_ac_chime_2,snd_ac_chime_3),Me.x,Me.y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
		}
	}

	if(timertime<999){
		timertime+=1
	}else{
		timertime=0
	}

	// Rogue XP fill (moved outside if/else to ensure it runs)
	if(rogue_mode){
		// Countdown delay timer
		if(rogue_xptimer>0){
			rogue_xptimer-=1
		}

		// After delay, transfer all pending XP to actual XP instantly
		if(rogue_xptimer<=0 && rogue_xpamount>0 && levelup==0){
			rogue_xp+=rogue_xpamount
			rogue_xpamount=0
		}

		// Smooth visual XP fill - lerp toward actual XP
		var target_xp = rogue_xp
		if(rogue_xp_display < target_xp){
			// Fill speed: percentage of the bar per frame (adjust 0.02 for speed)
			rogue_xp_display += (rogue_xp_needed * 0.02)
			if(rogue_xp_display > target_xp){
				rogue_xp_display = target_xp
			}
		}else if(rogue_xp_display > target_xp){
			// Reset display if actual XP dropped (level up spent XP)
			rogue_xp_display = target_xp
		}

		// Rogue level up check (wait for visual XP bar to finish filling)
		if(rogue_xp>=rogue_xp_needed && rogue_xp_display>=rogue_xp_needed){
			rogue_xp-=rogue_xp_needed
			rogue_xp_display=rogue_xp  // Reset display to match new XP
			rogue_level+=1
			rogue_xp_needed=3+(rogue_level*2)
			levelup=leveluptotal
			audio_play_sound_at(choose(snd_ac_chime_1,snd_ac_chime_2,snd_ac_chime_3),Me.x,Me.y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
			rogue_trigger_levelup_scr()
		}
	}

	if(levelup>0){
		levelup-=1

		if(pause==0){
			if(levelup mod 6==0){
				created=instance_create_depth(Me.x-5+random(10),Me.y-5+random(10),0,Part)
				with(created){
					//pin=1
					type=1
					pin=1
					depth=choose(Me.depth-1,Me.depth+2)
					spin=1
					img=choose(211,214)
					img=214
					imgcap=2
					imgsped=0.1
					image_speed=0
					image_index=irandom_range(img,img+imgcap)
					dur=15+irandom(15)
					durtotal=dur
					hsp=random(0.3)*choose(1,-1)
					vsp=random_range(0.03,0.06)
					grav=0.2
					image_angle=random(360)
				}
			}
		}
		if(levelup==0){
			//Reduce xp for level
			classArray[Me.class,2]=0
		}

		if(levelup mod 20==0){
			if(levelupimg==0){
				levelupimg=1
			}else{
				levelupimg=0
			}
		}
	}
}

// Update previous mouse position for next frame
mouse_x_previous = mouse_x
mouse_y_previous = mouse_y