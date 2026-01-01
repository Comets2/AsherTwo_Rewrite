
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

// Escape/Enter handling (skip for title menu, options, arcade selection, and rogue menus)
if((global.con_p_escape||global.conp_p_enter) && pause != 20 && pause != 21 && pause != 22 && pause != 23 && pause != 24){
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

if(keyboard_check_pressed(ord("L"))||(global.conp_p_w&&pause!=0)){
	if(pause!=10){
		pause=10
		arcade=1
		arcadetype=2

	}else{
		with(Arcade){
			instance_destroy()
		}
		pause=pauselast
	}
}

if(pause==10){

	arcade_scr()

}

#region Title Menu (pause == 20)
if(pause == 20){
	// Update animation timer
	title_anim = (title_anim + 1) mod 120

	// Keyboard/Controller navigation
	if(global.con_p_up || global.conp_p_up){
		title_selection -= 1
		if(title_selection < 0) title_selection = 3
		cursor_mode = 1
	}
	if(global.con_p_down || global.conp_p_down){
		title_selection += 1
		if(title_selection > 3) title_selection = 0
		cursor_mode = 1
	}

	// Mouse hover detection
	xps = camx - camxtwo
	yps = camy - camytwo
	var menu_start_y = yps + 55
	var menu_spacing = 20

	// Detect mouse movement to switch to mouse mode
	if(mouse_x != mouse_x_previous || mouse_y != mouse_y_previous){
		cursor_mode = 0
	}

	// Mouse selection
	if(cursor_mode == 0){
		for(var i = 0; i < 4; i++){
			var item_y = menu_start_y + (i * menu_spacing)
			if(mouse_x >= xps + 80 && mouse_x <= xps + 175 &&
			   mouse_y >= item_y - 5 && mouse_y <= item_y + 12){
				title_selection = i
			}
		}
	}

	// Selection confirmation
	if(global.con_p_space || global.conp_p_space || global.con_p_enter ||
	   mouse_check_button_pressed(mb_left)){
		// Check if mouse is over a menu item (for mouse clicks)
		var valid_click = true
		if(mouse_check_button_pressed(mb_left) && cursor_mode == 0){
			valid_click = false
			for(var i = 0; i < 4; i++){
				var item_y = menu_start_y + (i * menu_spacing)
				if(mouse_x >= xps + 80 && mouse_x <= xps + 175 &&
				   mouse_y >= item_y - 5 && mouse_y <= item_y + 12){
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
					options_selection = 0
					break
			}
		}
	}
}
#endregion

#region Options Menu (pause == 21)
if(pause == 21){
	xps = camx - camxtwo
	yps = camy - camytwo

	// Tab switching with Tab key or shoulder buttons
	if(keyboard_check_pressed(vk_tab) || global.conp_p_shl || global.conp_p_shr){
		options_tab = 1 - options_tab
		options_selection = 0
	}

	// Navigation within tab
	if(global.con_p_up || global.conp_p_up){
		options_selection -= 1
		if(options_tab == 0){ // Sound tab
			if(options_selection < 0) options_selection = 2
		}else{ // Controls tab
			if(options_selection < 0) options_selection = 6
		}
	}
	if(global.con_p_down || global.conp_p_down){
		options_selection += 1
		if(options_tab == 0){ // Sound tab
			if(options_selection > 2) options_selection = 0
		}else{ // Controls tab
			if(options_selection > 6) options_selection = 0
		}
	}

	// Sound tab: volume adjustment with left/right
	if(options_tab == 0){
		var volume_step = 0.1
		if(global.con_p_left || global.conp_p_left || global.con_h_left || global.conp_h_left){
			switch(options_selection){
				case 0: global.master_volume = max(0, global.master_volume - volume_step); break
				case 1: global.music_volume = max(0, global.music_volume - volume_step); break
				case 2: global.sfx_volume = max(0, global.sfx_volume - volume_step); break
			}
		}
		if(global.con_p_right || global.conp_p_right || global.con_h_right || global.conp_h_right){
			switch(options_selection){
				case 0: global.master_volume = min(1, global.master_volume + volume_step); break
				case 1: global.music_volume = min(1, global.music_volume + volume_step); break
				case 2: global.sfx_volume = min(1, global.sfx_volume + volume_step); break
			}
		}
	}

	// Controls tab: key remapping
	if(options_tab == 1){
		if(remap_active){
			// Listen for any key press
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
			// Cancel remapping with escape
			if(keyboard_check_pressed(vk_escape)){
				remap_active = false
				remap_target = -1
			}
		}else{
			// Start remapping on space/enter
			if(global.con_p_space || global.conp_p_space || global.con_p_enter){
				remap_active = true
				remap_target = options_selection
				keyboard_lastkey = vk_nokey
			}
		}
	}

	// Back to title menu with escape (only if not remapping)
	if(!remap_active && global.con_p_escape){
		pause = 20
	}
}
#endregion

#region Arcade Selection (pause == 22)
if(pause == 22){
	xps = camx - camxtwo
	yps = camy - camytwo

	// Decrement input delay
	if(menu_input_delay > 0){
		menu_input_delay -= 1
	}else{
		// Navigation
		if(global.con_p_up || global.conp_p_up){
			arcade_selection -= 1
			if(arcade_selection < 0) arcade_selection = 4  // 5 arcade games (0-4)
		}
		if(global.con_p_down || global.conp_p_down){
			arcade_selection += 1
			if(arcade_selection > 4) arcade_selection = 0
		}

		// Selection
		if(global.con_p_space || global.conp_p_space || global.con_p_enter ||
		   mouse_check_button_pressed(mb_left)){
			arcadetype = arcade_selection + 1
			arcade = 1
			// Fish Marble goes to character selection first
			if(arcade_selection == 0){
				pause = 25
				fish_char_selection = 0
				menu_input_delay = 5
			}else{
				pause = 10
			}
		}

		// Back to title menu (ESC only)
		if(global.con_p_escape){
			pause = 20
		}
	}
}
#endregion

#region Fish Marble Character Selection (pause == 25)
if(pause == 25){
	xps = camx - camxtwo
	yps = camy - camytwo

	// Decrement input delay
	if(menu_input_delay > 0){
		menu_input_delay -= 1
	}else{
		// Character hitbox positions (matching Draw_0.gml)
		var crab_x = xps + 70
		var squid_x = xps + 180
		var char_y = yps + 75
		var hitbox_size = 30

		// Mouse hover selection
		if(mouse_x >= crab_x - hitbox_size && mouse_x <= crab_x + hitbox_size &&
		   mouse_y >= char_y - hitbox_size && mouse_y <= char_y + hitbox_size){
			fish_char_selection = 0
		}
		if(mouse_x >= squid_x - hitbox_size && mouse_x <= squid_x + hitbox_size &&
		   mouse_y >= char_y - hitbox_size && mouse_y <= char_y + hitbox_size){
			fish_char_selection = 1
		}

		// Navigation - Left/Right to switch between Crab and Squid
		if(global.con_p_left || global.conp_p_left){
			fish_char_selection = 0
		}
		if(global.con_p_right || global.conp_p_right){
			fish_char_selection = 1
		}

		// Confirm selection (keyboard/controller)
		if(global.con_p_space || global.conp_p_space || global.con_p_enter){
			crabtype = fish_char_selection
			pause = 10
		}

		// Mouse click to confirm (only if clicking on a character)
		if(mouse_check_button_pressed(mb_left)){
			if((mouse_x >= crab_x - hitbox_size && mouse_x <= crab_x + hitbox_size &&
			    mouse_y >= char_y - hitbox_size && mouse_y <= char_y + hitbox_size) ||
			   (mouse_x >= squid_x - hitbox_size && mouse_x <= squid_x + hitbox_size &&
			    mouse_y >= char_y - hitbox_size && mouse_y <= char_y + hitbox_size)){
				crabtype = fish_char_selection
				pause = 10
			}
		}

		// Back to arcade menu
		if(global.con_p_escape){
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

	// Decrement input delay
	if(menu_input_delay > 0){
		menu_input_delay -= 1
	}else{
		// Navigation (only Forest for now, index 0)
		if(global.con_p_up || global.conp_p_up){
			rogue_selection -= 1
			if(rogue_selection < 0) rogue_selection = 0
		}
		if(global.con_p_down || global.conp_p_down){
			rogue_selection += 1
			if(rogue_selection > 0) rogue_selection = 0  // Only 1 level for now
		}

		// Selection - Start Rogue mode
		if(global.con_p_space || global.conp_p_space || global.con_p_enter ||
		   mouse_check_button_pressed(mb_left)){
			// Initialize rogue mode
			rogue_mode = true
			rogue_wave = 0
			rogue_xp = 0
			rogue_level = 1
			rogue_xp_needed = 10
			rogue_pause = 0
			rogue_wave_timer = 180  // 3 second start delay
			rogue_wave_active = false

			// Initialize game if not already
			if(!game_initialized){
				game_start_scr()
			}

			// Generate the rogue arena
			rogue_worldgen_scr()

			pause = 0  // Start gameplay
			pauselast = 0
		}

		// Back to title menu (ESC only)
		if(global.con_p_escape){
			pause = 20
		}
	}
}
#endregion

#region Rogue Game Over (pause == 24)
if(pause == 24){
	// Handle input to return to title
	if(global.con_p_space || global.conp_p_space || global.con_p_enter ||
	   mouse_check_button_pressed(mb_left)){
		// Return to title menu
		rogue_mode = false
		pause = 20

		// Clean up
		with(Enemy){ instance_destroy() }
		with(Abil){ if(pin != 23) instance_destroy() }
		with(Part){ instance_destroy() }
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
if(pause!=0){
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
																			for(i=0;i<3;i+=1){
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
ii=0
invenArray[24,3]=0
invenArray[25,3]=0
invenArray[26,3]=0
invenArray[24,4]=0
for(i=0;i<3;i+=1){
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
						for(i=talentmapArray[chance+1,1];i>0;i-=1){
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

if(pause==0){
#region Passive Item CDS
for(i=0;i<3;i+=1){
	if(invenArray[24+i,8]>0){
		invenArray[24+i,8]-=1
	}
	if(invenArray[24+i,9]>0){
		invenArray[24+i,9]-=1
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
if(global.con_p_d){
		created=instance_create_depth(Me.x,Me.y-32,10,Enemy)
		with(created){
			pin=1
			enopt=2
		}	
	/*
	if(dif==0){
	dif=1
	}else{
	dif=0
	}
	*/
}


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

	if(timertime<999){
		timertime+=1
	}else{
		timertime=0
	}

	//Level up
	if(classArray[Me.class,2]>=classArray[Me.class,3]){
		classArray[Me.class,1]+=1
		levelup=leveluptotal
		audio_play_sound_at(choose(snd_ac_chime_1,snd_ac_chime_2,snd_ac_chime_3),Me.x,Me.y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)

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