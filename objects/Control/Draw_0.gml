
if(players<2){
chance=0
}else{
	if(playercamdif-camborder>0){
	chance=floor(((playercamdif-camborder)/16))
	}else{
	chance=0
	}
}

xps=camx+screenshakeamt-camxtwo
yps=camy+hurtdraw-camytwo

xpstwo=camx+screenshakeamt+camxtwo
ypstwo=camy+hurtdraw+camytwo

xpos=floor((xps-mapx)/blockwidth)
xpostwo=xpos+18+chance*2
ypos=floor((yps-mapy)/blockwidth)
ypostwo=ypos+12+chance*2

#region Title Menu (pause == 20)
if(pause == 20){
	// Draw background
	draw_sprite_ext(maptest_spr, 6, xps-0.5, yps-0.5, 1, 1, 0, c_white, 1)

	// Menu panel dimensions
	var panel_x = xps + 127 - 50
	var panel_y = yps + 12
	var panel_w = 100
	var panel_h = 118

	// Main panel with border, fill, and accent highlights
	ui_panel(panel_x, panel_y, panel_x + panel_w, panel_y + panel_h)

	// Title bar (border, darker tan border, tan fill)
	var title_panel_y = panel_y + 4
	var title_panel_h = 18
	draw_rectangle_color(panel_x + 3, title_panel_y, panel_x + panel_w - 3, title_panel_y + title_panel_h,
		ui_border, ui_border, ui_border, ui_border, false)
	draw_rectangle_color(panel_x + 4, title_panel_y + 1, panel_x + panel_w - 4, title_panel_y + title_panel_h - 1,
		ui_btn_outline, ui_btn_outline, ui_btn_outline, ui_btn_outline, false)
	draw_rectangle_color(panel_x + 5, title_panel_y + 2, panel_x + panel_w - 5, title_panel_y + title_panel_h - 2,
		colorgold, colorgold, colorgold, colorgold, false)

	// Draw game title centered in title panel
	draw_text_ext_transformed_color(panel_x + panel_w/2 - string_width("ASHER") * 0.35, title_panel_y + 4, "ASHER", 0, 1000, 0.7, 0.7, 0,
		colorbluelight, colorbluelight, colorbluelight, colorbluelight, 1)

	// Menu items
	var menu_items = ["Adventure", "Arcade", "Rogue", "Options", "Exit"]
	var menu_start_y = panel_y + 28
	var menu_spacing = 17
	var item_pad = 6

	for(var i = 0; i < 5; i++){
		var item_y = menu_start_y + (i * menu_spacing)
		var item_x = panel_x + item_pad
		var item_w = panel_w - item_pad * 2
		var item_h = 14

		// Draw button (handles normal vs selected state)
		ui_button(item_x, item_y, item_x + item_w, item_y + item_h, i == title_selection)

		if(i == title_selection){
			// Left triangle pointing right - outline then beveled gold fill
			// colorgoldlight = up + right edges, colorgold = down + left edges
			var tri_y = item_y + item_h/2
			var arrow_offset = sin(title_anim * 0.025) * 0.75
			var tri_x = item_x - 7 + arrow_offset
			// Outline (1px border around entire shape)
			draw_rectangle_color(tri_x - 1, tri_y - 4, tri_x - 1, tri_y + 4, ui_border, ui_border, ui_border, ui_border, false)
			draw_rectangle_color(tri_x, tri_y - 4, tri_x, tri_y + 4, ui_border, ui_border, ui_border, ui_border, false)
			draw_rectangle_color(tri_x + 1, tri_y - 3, tri_x + 1, tri_y + 3, ui_border, ui_border, ui_border, ui_border, false)
			draw_rectangle_color(tri_x + 2, tri_y - 2, tri_x + 2, tri_y + 2, ui_border, ui_border, ui_border, ui_border, false)
			draw_rectangle_color(tri_x + 3, tri_y - 1, tri_x + 3, tri_y + 1, ui_border, ui_border, ui_border, ui_border, false)
			draw_rectangle_color(tri_x + 4, tri_y, tri_x + 4, tri_y, ui_border, ui_border, ui_border, ui_border, false)
			// Gold fill - col 0 (left edge = dark, top pixel = light, bottom pixel = dark)
			draw_rectangle_color(tri_x, tri_y - 3, tri_x, tri_y - 3, colorgoldlight, colorgoldlight, colorgoldlight, colorgoldlight, false)
			draw_rectangle_color(tri_x, tri_y - 2, tri_x, tri_y + 2, colorgold, colorgold, colorgold, colorgold, false)
			draw_rectangle_color(tri_x, tri_y + 3, tri_x, tri_y + 3, colorgold, colorgold, colorgold, colorgold, false)
			// Gold fill - col 1 (top = light, middle = split, bottom = dark)
			draw_rectangle_color(tri_x + 1, tri_y - 2, tri_x + 1, tri_y - 2, colorgoldlight, colorgoldlight, colorgoldlight, colorgoldlight, false)
			draw_rectangle_color(tri_x + 1, tri_y - 1, tri_x + 1, tri_y + 1, colorgold, colorgold, colorgold, colorgold, false)
			draw_rectangle_color(tri_x + 1, tri_y + 2, tri_x + 1, tri_y + 2, colorgold, colorgold, colorgold, colorgold, false)
			// Gold fill - col 2 (top = light, bottom = dark)
			draw_rectangle_color(tri_x + 2, tri_y - 1, tri_x + 2, tri_y - 1, colorgoldlight, colorgoldlight, colorgoldlight, colorgoldlight, false)
			draw_rectangle_color(tri_x + 2, tri_y, tri_x + 2, tri_y, colorgold, colorgold, colorgold, colorgold, false)
			draw_rectangle_color(tri_x + 2, tri_y + 1, tri_x + 2, tri_y + 1, colorgold, colorgold, colorgold, colorgold, false)
			// Gold fill - col 3 (tip = right edge = light)
			draw_rectangle_color(tri_x + 3, tri_y, tri_x + 3, tri_y, colorgoldlight, colorgoldlight, colorgoldlight, colorgoldlight, false)

			// Right triangle pointing left - outline then beveled gold fill
			var tri_x2 = item_x + item_w + 7 - arrow_offset
			// Outline (1px border around entire shape)
			draw_rectangle_color(tri_x2 + 1, tri_y - 4, tri_x2 + 1, tri_y + 4, ui_border, ui_border, ui_border, ui_border, false)
			draw_rectangle_color(tri_x2, tri_y - 4, tri_x2, tri_y + 4, ui_border, ui_border, ui_border, ui_border, false)
			draw_rectangle_color(tri_x2 - 1, tri_y - 3, tri_x2 - 1, tri_y + 3, ui_border, ui_border, ui_border, ui_border, false)
			draw_rectangle_color(tri_x2 - 2, tri_y - 2, tri_x2 - 2, tri_y + 2, ui_border, ui_border, ui_border, ui_border, false)
			draw_rectangle_color(tri_x2 - 3, tri_y - 1, tri_x2 - 3, tri_y + 1, ui_border, ui_border, ui_border, ui_border, false)
			draw_rectangle_color(tri_x2 - 4, tri_y, tri_x2 - 4, tri_y, ui_border, ui_border, ui_border, ui_border, false)
			// Gold fill - col 0 (right edge = light, top = light, bottom = dark)
			draw_rectangle_color(tri_x2, tri_y - 3, tri_x2, tri_y - 3, colorgoldlight, colorgoldlight, colorgoldlight, colorgoldlight, false)
			draw_rectangle_color(tri_x2, tri_y - 2, tri_x2, tri_y + 2, colorgoldlight, colorgoldlight, colorgoldlight, colorgoldlight, false)
			draw_rectangle_color(tri_x2, tri_y + 3, tri_x2, tri_y + 3, colorgold, colorgold, colorgold, colorgold, false)
			// Gold fill - col 1
			draw_rectangle_color(tri_x2 - 1, tri_y - 2, tri_x2 - 1, tri_y - 2, colorgoldlight, colorgoldlight, colorgoldlight, colorgoldlight, false)
			draw_rectangle_color(tri_x2 - 1, tri_y - 1, tri_x2 - 1, tri_y + 1, colorgold, colorgold, colorgold, colorgold, false)
			draw_rectangle_color(tri_x2 - 1, tri_y + 2, tri_x2 - 1, tri_y + 2, colorgold, colorgold, colorgold, colorgold, false)
			// Gold fill - col 2
			draw_rectangle_color(tri_x2 - 2, tri_y - 1, tri_x2 - 2, tri_y - 1, colorgoldlight, colorgoldlight, colorgoldlight, colorgoldlight, false)
			draw_rectangle_color(tri_x2 - 2, tri_y, tri_x2 - 2, tri_y, colorgold, colorgold, colorgold, colorgold, false)
			draw_rectangle_color(tri_x2 - 2, tri_y + 1, tri_x2 - 2, tri_y + 1, colorgold, colorgold, colorgold, colorgold, false)
			// Gold fill - col 3 (tip = left edge = dark)
			draw_rectangle_color(tri_x2 - 3, tri_y, tri_x2 - 3, tri_y, colorgold, colorgold, colorgold, colorgold, false)

			// Highlighted text
			draw_text_ext_transformed_color(item_x + item_w/2 - string_width(menu_items[i]) * 0.2, item_y + 4, menu_items[i], 0, 1000, 0.45, 0.45, 0,
				colorbluelight, colorbluelight, colorbluelight, colorbluelight, 1)
		}else{
			// Normal text
			draw_text_ext_transformed_color(item_x + item_w/2 - string_width(menu_items[i]) * 0.2, item_y + 4, menu_items[i], 0, 1000, 0.45, 0.45, 0,
				colorgold, colorgold, colorgold, colorgold, 0.7)
		}
	}

	// Input hint at bottom
	var hint_text = "Press SPACE or ENTER to select"
	if(cursor_mode == 0){
		hint_text = "Click to select"
	}
	draw_text_ext_transformed_color(panel_x + 50 - 42, panel_y + panel_h + 4, hint_text, 0, 1000, 0.3, 0.3, 0,
		colorgold, colorgold, colorgold, colorgold, 0.5)
}
#endregion

#region Quit Confirmation Overlay
if(quit_confirm){
	// Darken background
	draw_set_alpha(0.5)
	draw_rectangle_color(xps - 1, yps - 1, xpstwo + 1, ypstwo + 1,
		c_black, c_black, c_black, c_black, false)
	draw_set_alpha(1)

	// Popup panel
	var qpop_x = xps + 127 - 50
	var qpop_y = yps + 50
	var qpop_w = 100
	var qpop_h = 45
	ui_panel(qpop_x, qpop_y, qpop_x + qpop_w, qpop_y + qpop_h)

	// Title
	draw_text_ext_transformed_color(qpop_x + qpop_w/2 - string_width("Quit Game?") * 0.225, qpop_y + 8, "Quit Game?", 0, 1000, 0.45, 0.45, 0,
		colorbluelight, colorbluelight, colorbluelight, colorbluelight, 1)

	// Buttons
	var btn_w = 40
	var btn_gap = 8
	var btn_y = qpop_y + 26
	var btn_h = 14
	var btn_no_x = qpop_x + qpop_w/2 - btn_w - btn_gap/2
	var btn_yes_x = qpop_x + qpop_w/2 + btn_gap/2

	// No button
	ui_button(btn_no_x, btn_y, btn_no_x + btn_w, btn_y + btn_h, quit_selection == 0)
	var no_color = (quit_selection == 0) ? colorbluelight : colorgold
	draw_text_ext_transformed_color(btn_no_x + btn_w/2 - string_width("No") * 0.2, btn_y + 4, "No", 0, 1000, 0.4, 0.4, 0,
		no_color, no_color, no_color, no_color, 1)

	// Yes button
	ui_button(btn_yes_x, btn_y, btn_yes_x + btn_w, btn_y + btn_h, quit_selection == 1)
	var yes_color = (quit_selection == 1) ? colorbluelight : colorgold
	draw_text_ext_transformed_color(btn_yes_x + btn_w/2 - string_width("Yes") * 0.2, btn_y + 4, "Yes", 0, 1000, 0.4, 0.4, 0,
		yes_color, yes_color, yes_color, yes_color, 1)
}
#endregion

#region Leaderboard (pause == 29)
if(pause == 29){
	// Background
	draw_sprite_ext(maptest_spr, 6, xps-0.5, yps-0.5, 1, 1, 0, c_white, 1)

	// Panel
	var panel_x = xps + 10
	var panel_y = yps + 4
	var panel_w = 235
	var panel_h = 130
	ui_panel(panel_x, panel_y, panel_x + panel_w, panel_y + panel_h)

	// Title bar
	var title_y = panel_y + 3
	var title_h = 14
	draw_rectangle_color(panel_x + 3, title_y, panel_x + panel_w - 3, title_y + title_h,
		ui_border, ui_border, ui_border, ui_border, false)
	draw_rectangle_color(panel_x + 4, title_y + 1, panel_x + panel_w - 4, title_y + title_h - 1,
		ui_btn_outline, ui_btn_outline, ui_btn_outline, ui_btn_outline, false)
	draw_rectangle_color(panel_x + 5, title_y + 2, panel_x + panel_w - 5, title_y + title_h - 2,
		colorgold, colorgold, colorgold, colorgold, false)
	draw_text_ext_transformed_color(panel_x + panel_w/2 - string_width("HIGH SCORES") * 0.25, title_y + 3, "HIGH SCORES", 0, 1000, 0.5, 0.5, 0,
		colorbluelight, colorbluelight, colorbluelight, colorbluelight, 1)

	// Stats summary
	var stats_y = panel_y + 21
	draw_text_ext_transformed_color(panel_x + 8, stats_y, "Total Tickets: " + string(global.lb_total_tickets), 0, 1000, 0.28, 0.28, 0,
		colorgoldlight, colorgoldlight, colorgoldlight, colorgoldlight, 1)
	draw_text_ext_transformed_color(panel_x + 120, stats_y, "Plays: " + string(global.lb_total_plays), 0, 1000, 0.28, 0.28, 0,
		colorgoldlight, colorgoldlight, colorgoldlight, colorgoldlight, 1)
	draw_text_ext_transformed_color(panel_x + 180, stats_y, "Player: " + global.lb_username, 0, 1000, 0.28, 0.28, 0,
		colorgold, colorgold, colorgold, colorgold, 0.7)

	// Column headers
	var header_y = stats_y + 10
	var col_rank_x = panel_x + 8
	var col_name_x = panel_x + 28
	var col_score_x = panel_x + 120
	var col_date_x = panel_x + 165

	draw_rectangle_color(panel_x + 6, header_y, panel_x + panel_w - 6, header_y + 8,
		colorbrown, colorbrown, colorbrown, colorbrown, false)
	draw_text_ext_transformed_color(col_rank_x, header_y + 1, "#", 0, 1000, 0.25, 0.25, 0,
		colorgoldlight, colorgoldlight, colorgoldlight, colorgoldlight, 1)
	draw_text_ext_transformed_color(col_name_x, header_y + 1, "Name", 0, 1000, 0.25, 0.25, 0,
		colorgoldlight, colorgoldlight, colorgoldlight, colorgoldlight, 1)
	draw_text_ext_transformed_color(col_score_x, header_y + 1, "Tickets", 0, 1000, 0.25, 0.25, 0,
		colorgoldlight, colorgoldlight, colorgoldlight, colorgoldlight, 1)
	draw_text_ext_transformed_color(col_date_x, header_y + 1, "Date", 0, 1000, 0.25, 0.25, 0,
		colorgoldlight, colorgoldlight, colorgoldlight, colorgoldlight, 1)

	// Separator line
	draw_rectangle_color(panel_x + 6, header_y + 9, panel_x + panel_w - 6, header_y + 9,
		ui_border, ui_border, ui_border, ui_border, false)

	// Entry rows
	var row_start_y = header_y + 12
	var row_h = 11
	var vis_count = min(global.lb_count, lb_visible_rows)

	if(global.lb_count == 0){
		draw_text_ext_transformed_color(panel_x + panel_w/2 - string_width("No scores yet!") * 0.2, panel_y + 70,
			"No scores yet!", 0, 1000, 0.4, 0.4, 0,
			colorgold, colorgold, colorgold, colorgold, 0.6)
	}else{
		for(var i = 0; i < vis_count; i++){
			var idx = i + lb_scroll
			var ry = row_start_y + i * row_h
			var is_sel = (i == lb_selection)

			if(is_sel){
				draw_rectangle_color(panel_x + 5, ry, panel_x + panel_w - 5, ry + row_h - 2,
					colorgoldmed, colorgoldmed, colorgoldmed, colorgoldmed, false)
			}

			var tc = is_sel ? colorbluelight : colorgold
			var ta = is_sel ? 1 : 0.85

			draw_text_ext_transformed_color(col_rank_x, ry + 2, string(idx + 1), 0, 1000, 0.28, 0.28, 0, tc, tc, tc, tc, ta)
			draw_text_ext_transformed_color(col_name_x, ry + 2, global.lb_entries[idx, 2], 0, 1000, 0.28, 0.28, 0, tc, tc, tc, tc, ta)
			draw_text_ext_transformed_color(col_score_x, ry + 2, string(global.lb_entries[idx, 0]), 0, 1000, 0.28, 0.28, 0, tc, tc, tc, tc, ta)
			draw_text_ext_transformed_color(col_date_x, ry + 2, global.lb_entries[idx, 1], 0, 1000, 0.22, 0.22, 0, tc, tc, tc, tc, ta)
		}
	}

	// Scroll indicators
	if(lb_scroll > 0){
		draw_text_ext_transformed_color(panel_x + panel_w - 12, header_y + 2, "^", 0, 1000, 0.3, 0.3, 0,
			colorgold, colorgold, colorgold, colorgold, 0.6)
	}
	if(lb_scroll + lb_visible_rows < global.lb_count){
		draw_text_ext_transformed_color(panel_x + panel_w - 12, panel_y + panel_h - 10, "v", 0, 1000, 0.3, 0.3, 0,
			colorgold, colorgold, colorgold, colorgold, 0.6)
	}

	// Hint
	draw_text_ext_transformed_color(panel_x + panel_w/2 - 30, panel_y + panel_h + 2, "Press ESC to go back", 0, 1000, 0.25, 0.25, 0,
		colorgold, colorgold, colorgold, colorgold, 0.5)
}
#endregion

#region Options Menu (pause == 21)
if(pause == 21){
	// Draw background
	draw_sprite_ext(maptest_spr, 6, xps-0.5, yps-0.5, 1, 1, 0, c_white, 1)

	// Panel
	var panel_x = xps + 10
	var panel_y = yps + 4
	var panel_w = 235
	var panel_h = 130
	ui_panel(panel_x, panel_y, panel_x + panel_w, panel_y + panel_h)

	// Title bar
	var title_y = panel_y + 3
	var title_h = 14
	draw_rectangle_color(panel_x + 3, title_y, panel_x + panel_w - 3, title_y + title_h,
		ui_border, ui_border, ui_border, ui_border, false)
	draw_rectangle_color(panel_x + 4, title_y + 1, panel_x + panel_w - 4, title_y + title_h - 1,
		ui_btn_outline, ui_btn_outline, ui_btn_outline, ui_btn_outline, false)
	draw_rectangle_color(panel_x + 5, title_y + 2, panel_x + panel_w - 5, title_y + title_h - 2,
		colorgold, colorgold, colorgold, colorgold, false)
	draw_text_ext_transformed_color(panel_x + panel_w/2 - string_width("OPTIONS") * 0.25, title_y + 3, "OPTIONS", 0, 1000, 0.5, 0.5, 0,
		colorbluelight, colorbluelight, colorbluelight, colorbluelight, 1)

	// Tab buttons
	var tab_names = ["Sound", "Controls", "Graphics", "Colors"]
	var tab_y = panel_y + 21
	var tab_h = 12
	var tab_gap = 2
	var tab_total_w = panel_w - 12
	var tab_w = (tab_total_w - tab_gap * 3) / 4

	for(var t = 0; t < 4; t++){
		var tx1 = panel_x + 6 + t * (tab_w + tab_gap)
		var tx2 = tx1 + tab_w
		var tab_focused = (t == options_tab && options_selection == -1 && cursor_mode == 1)
		ui_button(tx1, tab_y, tx2, tab_y + tab_h, t == options_tab)
		// Draw selection border when tab row is keyboard-focused
		if(tab_focused){
			draw_rectangle_color(tx1 - 1, tab_y - 1, tx2 + 1, tab_y + tab_h + 1,
				colorbluelight, colorbluelight, colorbluelight, colorbluelight, true)
		}

		var tab_text_color = (t == options_tab) ? colorbluelight : colorgold
		var tab_text_alpha = (t == options_tab) ? 1 : 0.7
		draw_text_ext_transformed_color(tx1 + tab_w/2 - string_width(tab_names[t]) * 0.175, tab_y + 3, tab_names[t], 0, 1000, 0.35, 0.35, 0,
			tab_text_color, tab_text_color, tab_text_color, tab_text_color, tab_text_alpha)
	}

	// Content area
	var content_x = panel_x + 6
	var content_y = tab_y + tab_h + 4
	var content_w = panel_w - 12
	var content_h = panel_h - (content_y - panel_y) - 4

	// Content background
	draw_rectangle_color(content_x, content_y, content_x + content_w, content_y + content_h,
		ui_border, ui_border, ui_border, ui_border, false)
	draw_rectangle_color(content_x + 1, content_y + 1, content_x + content_w - 1, content_y + content_h - 1,
		pathcolor, pathcolor, pathcolor, pathcolor, false)

	// Sound tab content
	if(options_tab == 0){
		var sound_options = ["Master Volume", "Music Volume", "SFX Volume"]
		var sound_values = [global.master_volume, global.music_volume, global.sfx_volume]

		for(var s = 0; s < 3; s++){
			var opt_y = content_y + 6 + (s * 22)
			var opt_x = content_x + 8

			// Row button
			var row_x2 = content_x + content_w - 4
			ui_button(opt_x, opt_y, row_x2, opt_y + 18, s == options_selection)

			// Label
			var label_color = (s == options_selection) ? colorbluelight : colorgold
			draw_text_ext_transformed_color(opt_x + 4, opt_y + 5, sound_options[s], 0, 1000, 0.35, 0.35, 0,
				label_color, label_color, label_color, label_color, 1)

			// Volume bar
			var bar_x = opt_x + 95
			var bar_y = opt_y + 5
			var bar_w = 50
			var bar_h = 8
			// Bar background (empty)
			draw_rectangle_color(bar_x, bar_y, bar_x + bar_w, bar_y + bar_h,
				ui_border, ui_border, ui_border, ui_border, false)
			draw_rectangle_color(bar_x + 1, bar_y + 1, bar_x + bar_w - 1, bar_y + bar_h - 1,
				pathcolor, pathcolor, pathcolor, pathcolor, false)
			// Filled portion
			var fill_x2 = min(bar_x + 1 + floor((bar_w - 2) * sound_values[s]), bar_x + bar_w - 1)
			if(sound_values[s] > 0){
				draw_rectangle_color(bar_x + 1, bar_y + 1, fill_x2, bar_y + bar_h - 1,
					colorgold, colorgold, colorgold, colorgold, false)
				// Highlight on top edge of fill
				draw_rectangle_color(bar_x + 1, bar_y + 1, fill_x2, bar_y + 1,
					colorgoldlight, colorgoldlight, colorgoldlight, colorgoldlight, false)
			}

			// Percentage display
			draw_text_ext_transformed_color(bar_x + bar_w + 4, opt_y + 5, string(floor(sound_values[s] * 100)) + "%",
				0, 1000, 0.35, 0.35, 0, colorgold, colorgold, colorgold, colorgold, 1)
		}
	}

	// Controls tab content
	if(options_tab == 1){
		var control_labels = ["Up", "Down", "Left", "Right", "Action", "Cancel", "Menu"]
		var control_keys = [global.consave_up, global.consave_down, global.consave_left,
		                    global.consave_right, global.consave_space, global.consave_escape,
		                    global.consave_enter]
		var gp_names = ["D-Up", "D-Down", "D-Left", "D-Right", "A", "B", "Start"]

		// Column positions
		var col1_x = content_x + 4        // Action
		var col2_x = content_x + 65       // Key
		var col3_x = content_x + 145      // Gamepad
		var row_h = 10
		var row_gap = 1
		var header_h = 8
		var rows_y = content_y + header_h + 3

		// Column header background
		draw_rectangle_color(content_x + 1, content_y + 1, content_x + content_w - 1, content_y + header_h,
			colorbrown, colorbrown, colorbrown, colorbrown, false)

		// Column headers
		draw_text_ext_transformed_color(col1_x + 2, content_y + 2, "Action", 0, 1000, 0.22, 0.22, 0,
			colorgoldlight, colorgoldlight, colorgoldlight, colorgoldlight, 1)
		draw_text_ext_transformed_color(col2_x + 2, content_y + 2, "Keyboard", 0, 1000, 0.22, 0.22, 0,
			colorgoldlight, colorgoldlight, colorgoldlight, colorgoldlight, 1)
		draw_text_ext_transformed_color(col3_x + 2, content_y + 2, "Gamepad", 0, 1000, 0.22, 0.22, 0,
			colorgoldlight, colorgoldlight, colorgoldlight, colorgoldlight, 1)

		// Column divider lines
		draw_rectangle_color(col2_x - 2, content_y + 1, col2_x - 2, content_y + content_h - 1,
			ui_border, ui_border, ui_border, ui_border, false)
		draw_rectangle_color(col3_x - 2, content_y + 1, col3_x - 2, content_y + content_h - 1,
			ui_border, ui_border, ui_border, ui_border, false)

		for(var c = 0; c < 7; c++){
			var ctrl_y = rows_y + c * (row_h + row_gap)
			var ctrl_x = content_x + 3
			var ctrl_x2 = content_x + content_w - 3

			// Row highlight
			ui_button(ctrl_x, ctrl_y, ctrl_x2, ctrl_y + row_h, c == options_selection)

			// Label
			var label_color = (c == options_selection) ? colorbluelight : colorgold
			draw_text_ext_transformed_color(col1_x + 3, ctrl_y + 3.5, control_labels[c], 0, 1000, 0.28, 0.28, 0,
				label_color, label_color, label_color, label_color, 1)

			// Keyboard binding
			var key_name = get_key_name_scr(control_keys[c])
			var key_color = (c == options_selection) ? colorbluelight : colorgold
			draw_text_ext_transformed_color(col2_x + 3, ctrl_y + 3.5, key_name, 0, 1000, 0.28, 0.28, 0,
				key_color, key_color, key_color, key_color, 1)

			// Gamepad binding
			draw_text_ext_transformed_color(col3_x + 3, ctrl_y + 3.5, gp_names[c], 0, 1000, 0.28, 0.28, 0,
				colorgold, colorgold, colorgold, colorgold, 0.7)
		}

		// Remap popup overlay
		if(remap_active){
			// Darken background
			draw_set_alpha(0.5)
			draw_rectangle_color(xps, yps, xps + 255, yps + 144,
				c_black, c_black, c_black, c_black, false)
			draw_set_alpha(1)

			// Popup panel
			var pop_x = xps + 127 - 55
			var pop_y = yps + 50
			var pop_w = 110
			var pop_h = 40
			ui_panel(pop_x, pop_y, pop_x + pop_w, pop_y + pop_h)

			// Popup title
			var remap_label = control_labels[remap_target]
			var type_label = (remap_type == 0) ? "Keyboard" : "Gamepad"
			draw_text_ext_transformed_color(pop_x + pop_w/2 - string_width("Remap " + remap_label) * 0.2, pop_y + 6, "Remap " + remap_label, 0, 1000, 0.4, 0.4, 0,
				colorbluelight, colorbluelight, colorbluelight, colorbluelight, 1)

			// Prompt
			var prompt_text = (remap_type == 0) ? "Press a key..." : "Press a button..."
			draw_text_ext_transformed_color(pop_x + pop_w/2 - string_width(prompt_text) * 0.175, pop_y + 20, prompt_text, 0, 1000, 0.35, 0.35, 0,
				hurtcolor, hurtcolor, hurtcolor, hurtcolor, 1)

			// Cancel hint
			draw_text_ext_transformed_color(pop_x + pop_w/2 - string_width("ESC to cancel") * 0.125, pop_y + 30, "ESC to cancel", 0, 1000, 0.25, 0.25, 0,
				colorgold, colorgold, colorgold, colorgold, 0.5)
		}
	}

	// Graphics tab content
	if(options_tab == 2){
		var opt_y = content_y + 10
		var opt_x = content_x + 8
		var opt_x2 = content_x + content_w - 4

		// V-Sync row
		ui_button(opt_x, opt_y, opt_x2, opt_y + 18, options_selection == 0)

		var label_color = (options_selection == 0) ? colorbluelight : colorgold
		draw_text_ext_transformed_color(opt_x + 4, opt_y + 5, "V-Sync", 0, 1000, 0.4, 0.4, 0,
			label_color, label_color, label_color, label_color, 1)

		// V-Sync status
		var vsync_text = global.vsync_enabled ? "ON" : "OFF"
		var vsync_color = global.vsync_enabled ? colorgreen : hurtcolor
		draw_text_ext_transformed_color(opt_x + 120, opt_y + 5, vsync_text, 0, 1000, 0.4, 0.4, 0,
			vsync_color, vsync_color, vsync_color, vsync_color, 1)
	}

	// Colors tab content
	if(options_tab == 3){
		var color_names = [
			"ui_border",      "pathcolor",      "colorbrown",
			"ui_btn_outline", "colorgold",      "colorgoldmed",
			"colorgoldlight", "colorgold (med)", "hurtcolor",
			"colorbluelight", "colorgreen",     "colorpurple",
			"colorgray",      "colorred",       "colorblue",
			"colorbluelight", "ui_btn_out_sel", "poisoncolor"
		]
		var color_vals = [
			ui_border,      pathcolor,      colorbrown,
			ui_btn_outline, colorgold,      colorgoldmed,
			colorgoldlight, colorgold,      hurtcolor,
			colorbluelight, colorgreen,     colorpurple,
			colorgray,      colorred,       colorblue,
			colorbluelight, ui_btn_outline_sel, poisoncolor
		]

		var cols = 3
		var swatch_w = 7
		var swatch_h = 7
		var scol_w = 74
		var srow_h = 12
		var sx = content_x + 4
		var sy = content_y + 4

		for(var i = 0; i < array_length(color_names); i++){
			var scol = i mod cols
			var srow = i div cols
			var cx = sx + scol * scol_w
			var cy = sy + srow * srow_h

			// Swatch border
			draw_rectangle_color(cx, cy, cx + swatch_w, cy + swatch_h,
				ui_border, ui_border, ui_border, ui_border, false)
			// Swatch fill
			draw_rectangle_color(cx + 1, cy + 1, cx + swatch_w - 1, cy + swatch_h - 1,
				color_vals[i], color_vals[i], color_vals[i], color_vals[i], false)

			// Name
			draw_text_ext_transformed_color(cx + swatch_w + 2, cy + 1, color_names[i], 0, 1000, 0.2, 0.2, 0,
				colorgold, colorgold, colorgold, colorgold, 1)
		}
	}

	// Hint
	draw_text_ext_transformed_color(panel_x + panel_w/2 - 35, panel_y + panel_h + 2, "TAB to switch, ESC to return",
		0, 1000, 0.25, 0.25, 0, colorgold, colorgold, colorgold, colorgold, 0.5)
}
#endregion

#region Arcade Selection (pause == 22)
if(pause == 22){
	// Draw background
	draw_sprite_ext(maptest_spr, 6, xps-0.5, yps-0.5, 1, 1, 0, c_white, 1)

	// Panel
	var panel_x = xps + 127 - 50
	var panel_y = yps + 12
	var panel_w = 100
	var panel_h = 118
	ui_panel(panel_x, panel_y, panel_x + panel_w, panel_y + panel_h)

	// Title bar
	var title_y = panel_y + 4
	var title_h = 18
	draw_rectangle_color(panel_x + 3, title_y, panel_x + panel_w - 3, title_y + title_h,
		ui_border, ui_border, ui_border, ui_border, false)
	draw_rectangle_color(panel_x + 4, title_y + 1, panel_x + panel_w - 4, title_y + title_h - 1,
		ui_btn_outline, ui_btn_outline, ui_btn_outline, ui_btn_outline, false)
	draw_rectangle_color(panel_x + 5, title_y + 2, panel_x + panel_w - 5, title_y + title_h - 2,
		colorgold, colorgold, colorgold, colorgold, false)
	draw_text_ext_transformed_color(panel_x + panel_w/2 - string_width("SELECT ARCADE") * 0.25, title_y + 4, "SELECT ARCADE", 0, 1000, 0.5, 0.5, 0,
		colorbluelight, colorbluelight, colorbluelight, colorbluelight, 1)

	// Arcade game list
	var arcade_names = ["Fish Marble", "Bee Hive", "Arcade 3", "Arcade 4", "Arcade 5", "Scores"]
	var item_pad = 6
	var item_start_y = panel_y + 28
	var item_spacing = 15
	var item_h = 14

	for(var a = 0; a < 6; a++){
		var item_y = item_start_y + (a * item_spacing)
		var item_x = panel_x + item_pad
		var item_w = panel_w - item_pad * 2

		ui_button(item_x, item_y, item_x + item_w, item_y + item_h, a == arcade_selection)

		if(a == arcade_selection){
			// Triangle arrows
			var tri_y = item_y + item_h/2
			var arrow_offset = sin(title_anim * 0.025) * 0.75
			var tri_x = item_x - 7 + arrow_offset
			draw_rectangle_color(tri_x - 1, tri_y - 4, tri_x - 1, tri_y + 4, ui_border, ui_border, ui_border, ui_border, false)
			draw_rectangle_color(tri_x, tri_y - 4, tri_x, tri_y + 4, ui_border, ui_border, ui_border, ui_border, false)
			draw_rectangle_color(tri_x + 1, tri_y - 3, tri_x + 1, tri_y + 3, ui_border, ui_border, ui_border, ui_border, false)
			draw_rectangle_color(tri_x + 2, tri_y - 2, tri_x + 2, tri_y + 2, ui_border, ui_border, ui_border, ui_border, false)
			draw_rectangle_color(tri_x + 3, tri_y - 1, tri_x + 3, tri_y + 1, ui_border, ui_border, ui_border, ui_border, false)
			draw_rectangle_color(tri_x + 4, tri_y, tri_x + 4, tri_y, ui_border, ui_border, ui_border, ui_border, false)
			draw_rectangle_color(tri_x, tri_y - 3, tri_x, tri_y - 3, colorgoldlight, colorgoldlight, colorgoldlight, colorgoldlight, false)
			draw_rectangle_color(tri_x, tri_y - 2, tri_x, tri_y + 2, colorgold, colorgold, colorgold, colorgold, false)
			draw_rectangle_color(tri_x, tri_y + 3, tri_x, tri_y + 3, colorgold, colorgold, colorgold, colorgold, false)
			draw_rectangle_color(tri_x + 1, tri_y - 2, tri_x + 1, tri_y - 2, colorgoldlight, colorgoldlight, colorgoldlight, colorgoldlight, false)
			draw_rectangle_color(tri_x + 1, tri_y - 1, tri_x + 1, tri_y + 1, colorgold, colorgold, colorgold, colorgold, false)
			draw_rectangle_color(tri_x + 1, tri_y + 2, tri_x + 1, tri_y + 2, colorgold, colorgold, colorgold, colorgold, false)
			draw_rectangle_color(tri_x + 2, tri_y - 1, tri_x + 2, tri_y - 1, colorgoldlight, colorgoldlight, colorgoldlight, colorgoldlight, false)
			draw_rectangle_color(tri_x + 2, tri_y, tri_x + 2, tri_y, colorgold, colorgold, colorgold, colorgold, false)
			draw_rectangle_color(tri_x + 2, tri_y + 1, tri_x + 2, tri_y + 1, colorgold, colorgold, colorgold, colorgold, false)
			draw_rectangle_color(tri_x + 3, tri_y, tri_x + 3, tri_y, colorgoldlight, colorgoldlight, colorgoldlight, colorgoldlight, false)
			var tri_x2 = item_x + item_w + 7 - arrow_offset
			draw_rectangle_color(tri_x2 + 1, tri_y - 4, tri_x2 + 1, tri_y + 4, ui_border, ui_border, ui_border, ui_border, false)
			draw_rectangle_color(tri_x2, tri_y - 4, tri_x2, tri_y + 4, ui_border, ui_border, ui_border, ui_border, false)
			draw_rectangle_color(tri_x2 - 1, tri_y - 3, tri_x2 - 1, tri_y + 3, ui_border, ui_border, ui_border, ui_border, false)
			draw_rectangle_color(tri_x2 - 2, tri_y - 2, tri_x2 - 2, tri_y + 2, ui_border, ui_border, ui_border, ui_border, false)
			draw_rectangle_color(tri_x2 - 3, tri_y - 1, tri_x2 - 3, tri_y + 1, ui_border, ui_border, ui_border, ui_border, false)
			draw_rectangle_color(tri_x2 - 4, tri_y, tri_x2 - 4, tri_y, ui_border, ui_border, ui_border, ui_border, false)
			draw_rectangle_color(tri_x2, tri_y - 3, tri_x2, tri_y - 3, colorgoldlight, colorgoldlight, colorgoldlight, colorgoldlight, false)
			draw_rectangle_color(tri_x2, tri_y - 2, tri_x2, tri_y + 2, colorgoldlight, colorgoldlight, colorgoldlight, colorgoldlight, false)
			draw_rectangle_color(tri_x2, tri_y + 3, tri_x2, tri_y + 3, colorgold, colorgold, colorgold, colorgold, false)
			draw_rectangle_color(tri_x2 - 1, tri_y - 2, tri_x2 - 1, tri_y - 2, colorgoldlight, colorgoldlight, colorgoldlight, colorgoldlight, false)
			draw_rectangle_color(tri_x2 - 1, tri_y - 1, tri_x2 - 1, tri_y + 1, colorgold, colorgold, colorgold, colorgold, false)
			draw_rectangle_color(tri_x2 - 1, tri_y + 2, tri_x2 - 1, tri_y + 2, colorgold, colorgold, colorgold, colorgold, false)
			draw_rectangle_color(tri_x2 - 2, tri_y - 1, tri_x2 - 2, tri_y - 1, colorgoldlight, colorgoldlight, colorgoldlight, colorgoldlight, false)
			draw_rectangle_color(tri_x2 - 2, tri_y, tri_x2 - 2, tri_y, colorgold, colorgold, colorgold, colorgold, false)
			draw_rectangle_color(tri_x2 - 2, tri_y + 1, tri_x2 - 2, tri_y + 1, colorgold, colorgold, colorgold, colorgold, false)
			draw_rectangle_color(tri_x2 - 3, tri_y, tri_x2 - 3, tri_y, colorgold, colorgold, colorgold, colorgold, false)

			draw_text_ext_transformed_color(item_x + item_w/2 - string_width(arcade_names[a]) * 0.2, item_y + 4, arcade_names[a], 0, 1000, 0.45, 0.45, 0,
				colorbluelight, colorbluelight, colorbluelight, colorbluelight, 1)
		}else{
			draw_text_ext_transformed_color(item_x + item_w/2 - string_width(arcade_names[a]) * 0.2, item_y + 4, arcade_names[a], 0, 1000, 0.45, 0.45, 0,
				colorgold, colorgold, colorgold, colorgold, 0.7)
		}
	}

	// Hint
	draw_text_ext_transformed_color(panel_x + panel_w/2 - 42, panel_y + panel_h + 4, "Press ESC to go back",
		0, 1000, 0.3, 0.3, 0, colorgold, colorgold, colorgold, colorgold, 0.5)
}
#endregion

#region Fish Marble Character Selection (pause == 25)
if(pause == 25){
	// Draw background
	draw_sprite_ext(maptest_spr, 6, xps-0.5, yps-0.5, 1, 1, 0, c_white, 1)

	// Panel
	var panel_x = xps + 127 - 70
	var panel_y = yps + 12
	var panel_w = 140
	var panel_h = 110
	ui_panel(panel_x, panel_y, panel_x + panel_w, panel_y + panel_h)

	// Title bar
	var title_y = panel_y + 4
	var title_h = 18
	draw_rectangle_color(panel_x + 3, title_y, panel_x + panel_w - 3, title_y + title_h,
		ui_border, ui_border, ui_border, ui_border, false)
	draw_rectangle_color(panel_x + 4, title_y + 1, panel_x + panel_w - 4, title_y + title_h - 1,
		ui_btn_outline, ui_btn_outline, ui_btn_outline, ui_btn_outline, false)
	draw_rectangle_color(panel_x + 5, title_y + 2, panel_x + panel_w - 5, title_y + title_h - 2,
		colorgold, colorgold, colorgold, colorgold, false)
	draw_text_ext_transformed_color(panel_x + panel_w/2 - string_width("SELECT CHARACTER") * 0.25, title_y + 4, "SELECT CHARACTER", 0, 1000, 0.5, 0.5, 0,
		colorbluelight, colorbluelight, colorbluelight, colorbluelight, 1)

	// Character cards - side by side
	var card_pad = 8
	var card_gap = 4
	var card_w = (panel_w - card_pad * 2 - card_gap) / 2
	var card_h = 60
	var card_y = panel_y + 28

	var char_names = ["CRAB", "SQUID"]
	var char_frames = [224, 252]

	for(var c = 0; c < 2; c++){
		var cx1 = panel_x + card_pad + c * (card_w + card_gap)
		var cy1 = card_y
		var cx2 = cx1 + card_w
		var cy2 = cy1 + card_h
		var card_cx = cx1 + card_w/2
		var card_cy = cy1 + card_h/2

		ui_button(cx1, cy1, cx2, cy2, c == fish_char_selection)

		// Character sprite
		draw_sprite_ext(abil_crab_spr, char_frames[c], card_cx, card_cy - 5, 1.3, 1.3, 0, c_white, 1)

		// Character name
		var text_color = (c == fish_char_selection) ? colorbluelight : colorgold
		draw_text_ext_transformed_color(card_cx - string_width(char_names[c]) * 0.2, cy2 - 10, char_names[c], 0, 1000, 0.4, 0.4, 0,
			text_color, text_color, text_color, text_color, 1)
	}

	// Hint
	draw_text_ext_transformed_color(panel_x + panel_w/2 - 42, panel_y + panel_h + 4, "SPACE to confirm, ESC back",
		0, 1000, 0.25, 0.25, 0, colorgold, colorgold, colorgold, colorgold, 0.5)
}
#endregion

#region Rogue Level Selection (pause == 23)
if(pause == 23){
	// Draw background
	draw_sprite_ext(maptest_spr, 6, xps-0.5, yps-0.5, 1, 1, 0, c_white, 1)

	// Panel
	var panel_x = xps + 127 - 50
	var panel_y = yps + 12
	var panel_w = 100
	var panel_h = 105
	ui_panel(panel_x, panel_y, panel_x + panel_w, panel_y + panel_h)

	// Title bar
	var title_y = panel_y + 4
	var title_h = 18
	draw_rectangle_color(panel_x + 3, title_y, panel_x + panel_w - 3, title_y + title_h,
		ui_border, ui_border, ui_border, ui_border, false)
	draw_rectangle_color(panel_x + 4, title_y + 1, panel_x + panel_w - 4, title_y + title_h - 1,
		ui_btn_outline, ui_btn_outline, ui_btn_outline, ui_btn_outline, false)
	draw_rectangle_color(panel_x + 5, title_y + 2, panel_x + panel_w - 5, title_y + title_h - 2,
		colorgold, colorgold, colorgold, colorgold, false)
	draw_text_ext_transformed_color(panel_x + panel_w/2 - string_width("ROGUE MODE") * 0.3, title_y + 4, "ROGUE MODE", 0, 1000, 0.6, 0.6, 0,
		colorbluelight, colorbluelight, colorbluelight, colorbluelight, 1)

	// Stage buttons
	var rogue_levels = ["Forest"]
	var item_pad = 6
	var item_start_y = panel_y + 28
	var item_spacing = 17
	var item_h = 14

	for(var r = 0; r < 1; r++){
		var item_y = item_start_y + (r * item_spacing)
		var item_x = panel_x + item_pad
		var item_w = panel_w - item_pad * 2

		ui_button(item_x, item_y, item_x + item_w, item_y + item_h, r == rogue_selection)

		if(r == rogue_selection){
			// Triangle arrows
			var tri_y = item_y + item_h/2
			var arrow_offset = sin(title_anim * 0.025) * 0.75
			var tri_x = item_x - 7 + arrow_offset
			draw_rectangle_color(tri_x - 1, tri_y - 4, tri_x - 1, tri_y + 4, ui_border, ui_border, ui_border, ui_border, false)
			draw_rectangle_color(tri_x, tri_y - 4, tri_x, tri_y + 4, ui_border, ui_border, ui_border, ui_border, false)
			draw_rectangle_color(tri_x + 1, tri_y - 3, tri_x + 1, tri_y + 3, ui_border, ui_border, ui_border, ui_border, false)
			draw_rectangle_color(tri_x + 2, tri_y - 2, tri_x + 2, tri_y + 2, ui_border, ui_border, ui_border, ui_border, false)
			draw_rectangle_color(tri_x + 3, tri_y - 1, tri_x + 3, tri_y + 1, ui_border, ui_border, ui_border, ui_border, false)
			draw_rectangle_color(tri_x + 4, tri_y, tri_x + 4, tri_y, ui_border, ui_border, ui_border, ui_border, false)
			draw_rectangle_color(tri_x, tri_y - 3, tri_x, tri_y - 3, colorgoldlight, colorgoldlight, colorgoldlight, colorgoldlight, false)
			draw_rectangle_color(tri_x, tri_y - 2, tri_x, tri_y + 2, colorgold, colorgold, colorgold, colorgold, false)
			draw_rectangle_color(tri_x, tri_y + 3, tri_x, tri_y + 3, colorgold, colorgold, colorgold, colorgold, false)
			draw_rectangle_color(tri_x + 1, tri_y - 2, tri_x + 1, tri_y - 2, colorgoldlight, colorgoldlight, colorgoldlight, colorgoldlight, false)
			draw_rectangle_color(tri_x + 1, tri_y - 1, tri_x + 1, tri_y + 1, colorgold, colorgold, colorgold, colorgold, false)
			draw_rectangle_color(tri_x + 1, tri_y + 2, tri_x + 1, tri_y + 2, colorgold, colorgold, colorgold, colorgold, false)
			draw_rectangle_color(tri_x + 2, tri_y - 1, tri_x + 2, tri_y - 1, colorgoldlight, colorgoldlight, colorgoldlight, colorgoldlight, false)
			draw_rectangle_color(tri_x + 2, tri_y, tri_x + 2, tri_y, colorgold, colorgold, colorgold, colorgold, false)
			draw_rectangle_color(tri_x + 2, tri_y + 1, tri_x + 2, tri_y + 1, colorgold, colorgold, colorgold, colorgold, false)
			draw_rectangle_color(tri_x + 3, tri_y, tri_x + 3, tri_y, colorgoldlight, colorgoldlight, colorgoldlight, colorgoldlight, false)
			var tri_x2 = item_x + item_w + 7 - arrow_offset
			draw_rectangle_color(tri_x2 + 1, tri_y - 4, tri_x2 + 1, tri_y + 4, ui_border, ui_border, ui_border, ui_border, false)
			draw_rectangle_color(tri_x2, tri_y - 4, tri_x2, tri_y + 4, ui_border, ui_border, ui_border, ui_border, false)
			draw_rectangle_color(tri_x2 - 1, tri_y - 3, tri_x2 - 1, tri_y + 3, ui_border, ui_border, ui_border, ui_border, false)
			draw_rectangle_color(tri_x2 - 2, tri_y - 2, tri_x2 - 2, tri_y + 2, ui_border, ui_border, ui_border, ui_border, false)
			draw_rectangle_color(tri_x2 - 3, tri_y - 1, tri_x2 - 3, tri_y + 1, ui_border, ui_border, ui_border, ui_border, false)
			draw_rectangle_color(tri_x2 - 4, tri_y, tri_x2 - 4, tri_y, ui_border, ui_border, ui_border, ui_border, false)
			draw_rectangle_color(tri_x2, tri_y - 3, tri_x2, tri_y - 3, colorgoldlight, colorgoldlight, colorgoldlight, colorgoldlight, false)
			draw_rectangle_color(tri_x2, tri_y - 2, tri_x2, tri_y + 2, colorgoldlight, colorgoldlight, colorgoldlight, colorgoldlight, false)
			draw_rectangle_color(tri_x2, tri_y + 3, tri_x2, tri_y + 3, colorgold, colorgold, colorgold, colorgold, false)
			draw_rectangle_color(tri_x2 - 1, tri_y - 2, tri_x2 - 1, tri_y - 2, colorgoldlight, colorgoldlight, colorgoldlight, colorgoldlight, false)
			draw_rectangle_color(tri_x2 - 1, tri_y - 1, tri_x2 - 1, tri_y + 1, colorgold, colorgold, colorgold, colorgold, false)
			draw_rectangle_color(tri_x2 - 1, tri_y + 2, tri_x2 - 1, tri_y + 2, colorgold, colorgold, colorgold, colorgold, false)
			draw_rectangle_color(tri_x2 - 2, tri_y - 1, tri_x2 - 2, tri_y - 1, colorgoldlight, colorgoldlight, colorgoldlight, colorgoldlight, false)
			draw_rectangle_color(tri_x2 - 2, tri_y, tri_x2 - 2, tri_y, colorgold, colorgold, colorgold, colorgold, false)
			draw_rectangle_color(tri_x2 - 2, tri_y + 1, tri_x2 - 2, tri_y + 1, colorgold, colorgold, colorgold, colorgold, false)
			draw_rectangle_color(tri_x2 - 3, tri_y, tri_x2 - 3, tri_y, colorgold, colorgold, colorgold, colorgold, false)

			draw_text_ext_transformed_color(item_x + item_w/2 - string_width(rogue_levels[r]) * 0.2, item_y + 4, rogue_levels[r], 0, 1000, 0.45, 0.45, 0,
				colorbluelight, colorbluelight, colorbluelight, colorbluelight, 1)
		}else{
			draw_text_ext_transformed_color(item_x + item_w/2 - string_width(rogue_levels[r]) * 0.2, item_y + 4, rogue_levels[r], 0, 1000, 0.45, 0.45, 0,
				colorgold, colorgold, colorgold, colorgold, 0.7)
		}
	}

	// Mode description
	draw_text_ext_transformed_color(panel_x + panel_w/2 - string_width("Endless waves - Survive!") * 0.175, panel_y + 50, "Endless waves - Survive!", 0, 1000, 0.35, 0.35, 0,
		colorgoldlight, colorgoldlight, colorgoldlight, colorgoldlight, 0.9)

	// Hint
	draw_text_ext_transformed_color(panel_x + panel_w/2 - 42, panel_y + panel_h + 4, "Press ESC to go back",
		0, 1000, 0.3, 0.3, 0, colorgold, colorgold, colorgold, colorgold, 0.5)
}
#endregion

#region Rogue Character Selection (pause == 27)
if(pause == 27){
	// Draw background
	draw_sprite_ext(maptest_spr, 6, xps-0.5, yps-0.5, 1, 1, 0, c_white, 1)

	// Panel
	var panel_x = xps + 10
	var panel_y = yps + 4
	var panel_w = 235
	var panel_h = 130
	ui_panel(panel_x, panel_y, panel_x + panel_w, panel_y + panel_h)

	// Title bar
	var title_y = panel_y + 3
	var title_h = 14
	draw_rectangle_color(panel_x + 3, title_y, panel_x + panel_w - 3, title_y + title_h,
		ui_border, ui_border, ui_border, ui_border, false)
	draw_rectangle_color(panel_x + 4, title_y + 1, panel_x + panel_w - 4, title_y + title_h - 1,
		ui_btn_outline, ui_btn_outline, ui_btn_outline, ui_btn_outline, false)
	draw_rectangle_color(panel_x + 5, title_y + 2, panel_x + panel_w - 5, title_y + title_h - 2,
		colorgold, colorgold, colorgold, colorgold, false)
	draw_text_ext_transformed_color(panel_x + panel_w/2 - string_width("SELECT CHARACTER") * 0.2, title_y + 3, "SELECT CHARACTER", 0, 1000, 0.45, 0.45, 0,
		colorbluelight, colorbluelight, colorbluelight, colorbluelight, 1)

	// Character names and class indices (no Human, added Trash)
	var char_names = ["Witch", "Pumpkin", "Bee", "Burger", "Fisher", "Super", "Treeling", "CakeQueen", "Trash"]
	var char_classes = [1, 2, 3, 4, 5, 6, 7, 8, 9]

	// Grid dimensions - 3x3 grid of character cards
	var grid_pad = 6
	var grid_start_x = panel_x + grid_pad
	var grid_start_y = panel_y + 22
	var cell_w = 73
	var cell_h = 33
	var cell_gap = 2

	// Draw 3x3 grid of characters
	for(var row = 0; row < 3; row++){
		for(var col = 0; col < 3; col++){
			var char_index = row * 3 + col
			var cx1 = grid_start_x + col * (cell_w + cell_gap)
			var cy1 = grid_start_y + row * (cell_h + cell_gap)
			var cx2 = cx1 + cell_w
			var cy2 = cy1 + cell_h
			var cell_cx = cx1 + cell_w/2
			var cell_cy = cy1 + cell_h/2
			var is_selected = (char_index == rogue_char_selection)

			// Draw card using ui_button
			ui_button(cx1, cy1, cx2, cy2, is_selected)

			// Draw character sprite using mask_two_spr (same as inventory)
			var class_id = char_classes[char_index]
			var mask_frame = class_id * 4
			draw_sprite_ext(mask_two_spr, mask_frame, cell_cx, cell_cy - 3, 1, 1, 0, c_white, 1)

			// Draw character name
			var text_color = is_selected ? colorbluelight : colorgold
			draw_text_ext_transformed_color(cell_cx - string_width(char_names[char_index]) * 0.15, cy2 - 8, char_names[char_index], 0, 1000, 0.3, 0.3, 0,
				text_color, text_color, text_color, text_color, 1)
		}
	}

	// Hint
	draw_text_ext_transformed_color(panel_x + panel_w/2 - 50, panel_y + panel_h + 2, "SPACE to confirm, ESC to go back", 0, 1000, 0.25, 0.25, 0,
		colorgold, colorgold, colorgold, colorgold, 0.5)
}
#endregion

#region Rogue Game Over (pause == 24)
if(pause == 24){
	// Draw background
	draw_sprite_ext(maptest_spr, 6, xps-0.5, yps-0.5, 1, 1, 0, c_white, 1)

	// Game Over title
	draw_text_ext_transformed_color(xps + 127 - 35, yps + 30, "GAME OVER", 0, 1000, 0.7, 0.7, 0,
		colorred, colorred, colorred, colorred, 1)

	// Stats display
	draw_text_ext_transformed_color(xps + 127 - 30, yps + 60, "Wave: " + string(rogue_wave), 0, 1000, 0.5, 0.5, 0,
		colorgold, colorgold, colorgold, colorgold, 1)

	draw_text_ext_transformed_color(xps + 127 - 30, yps + 80, "Level: " + string(rogue_level), 0, 1000, 0.5, 0.5, 0,
		c_white, c_white, c_white, c_white, 1)

	// Continue prompt
	draw_text_ext_transformed_color(xps + 127 - 50, yps + 115, "Press SPACE to continue",
		0, 1000, 0.4, 0.4, 0, colorgray, colorgray, colorgray, colorgray, 0.8)
}
#endregion


#region In Game
if(pause==0 || pause==26){
	if(xpos<0){
	xpos=0
	}
	if(ypos<0){
	ypos=0
	}
	if(xpostwo>rmw+1+(border)){
	xpostwo=xpostwo>rmw+1+(border)
	}
	if(ypostwo>rmh+1+(border)){
	ypostwo=rmh+1+(border)
	}

for(var a=xpos;a<xpostwo;a+=1){
	for(var b=ypos;b<ypostwo;b+=1){
		if(roomArray[a,b]!=0){
		draw_sprite(terrainspr,roomArray[a,b],mapx+a*blockwidth,mapy+b*blockwidth)
		}
	}
}

/*
for(a=0;a<rmw+1+(border);a+=1){
	for(b=0;b<rmh+1+(border);b+=1){
		if(roomArray[a,b]!=0){
		draw_sprite(terrain_spr,roomArray[a,b],mapx+a*blockwidth,mapy+b*blockwidth)
		} 
	}
}
*/
//draw_text_transformed(xps,yps,fps_real,0.5,0.5,0)

if(debug==1){
draw_text_transformed(xps,yps,Me.damagedone,0.5,0.5,0)
draw_text_transformed(xps,yps+20,(Me.damagedone)/(Me.dpstimer/60),0.5,0.5,0)
draw_text_transformed(xps,yps+40,(Me.damagedonethree)/(Me.dpstimertwo/60),0.5,0.5,0)
//draw_text_transformed(xps,yps+20,x,0.5,0.5,0)
//draw_text_transformed(xps,yps+35,camtargettwo.x,0.5,0.5,0)
//draw_text_transformed(xps,yps+50,camtarget.x+(camtarget.x-camtargettwo.x)/2,0.5,0.5,0)
//draw_text_transformed(xps,yps+65,mapyspot,0.5,0.5,0)
}

// Rogue Mode HUD
if(rogue_mode){
	// Wave counter (top left)
	draw_text_ext_transformed_color(xps + 5, yps + 5, "Wave " + string(rogue_wave),
		0, 1000, 0.45, 0.45, 0, colorgold, colorgold, colorgold, colorgold, 1)

	// Wave starting indicator
	if(rogue_wave_timer > 0 && !rogue_wave_active){
		draw_text_ext_transformed_color(xps + 5, yps + 15, "Next wave in " + string(floor(rogue_wave_timer/60)+1) + "...",
			0, 1000, 0.35, 0.35, 0, c_white, c_white, c_white, c_white, 0.8)
	}

	// Card selection overlay
	if(rogue_pause == 1){
		// Darken background
		draw_set_alpha(0.6)
		draw_rectangle_color(xps, yps, xps + 255, yps + 143, c_black, c_black, c_black, c_black, false)
		draw_set_alpha(1)

		// Title
		draw_text_ext_transformed_color(xps + 127 - 30, yps + 20, "LEVEL UP!",
			0, 1000, 0.6, 0.6, 0, colorgold, colorgold, colorgold, colorgold, 1)

		// Draw cards
		var card_spacing = 60
		var card_start_x = xps + 127 - ((levelupselecttotal_rogue - 1) * card_spacing / 2)

		for(var i = 0; i < levelupselecttotal_rogue; i++){
			var card_x = card_start_x + (i * card_spacing)
			var card_y = yps + 70

			// Get card data
			var card_id = rogueArray[1, i+1]
			var card_name = rogueArray[2, i+1]
			var sprite_idx = -1
			var stat_type = -1
			var card_desc = ""

			if(card_id >= 0){
				sprite_idx = rogueCardPool[card_id, 8]
				stat_type = rogueCardPool[card_id, 7]
				card_desc = rogueCardPool[card_id, 6]
			}

			// Card background
			draw_sprite_ext(spr_rogue_ui, 1, card_x, card_y, 1, 1, 0, c_white, 1)

			if(i == rogue_card_select){
				// Selected card highlight
				draw_sprite_ext(spr_rogue_ui, 2, card_x, card_y, 1, 1, 0, c_white, 1)

				// Card icon (animated)
				var bounce = sin(title_anim * 0.15) * 2
				if(sprite_idx >= 0){
					// Talent card - use talent_spr
					draw_sprite_ext(talent_spr, sprite_idx, card_x, card_y + bounce, 1, 1, 0, c_white, 1)
				}else if(stat_type >= 0){
					// Stat card - use spr_rogue_ui
					draw_sprite_ext(spr_rogue_ui, 3 + stat_type, card_x, card_y + bounce, 1, 1, 0, c_white, 1)
				}

				// Card name (gold)
				draw_text_ext_transformed_color(card_x - 27, card_y + 32, card_name,
					0, 1000, 0.5, 0.5, 0, colorgold, colorgold, colorgold, colorgold, 1)

				// Card description (white, smaller)
				draw_text_ext_transformed_color(card_x - 27, card_y + 42, card_desc,
					0, 1000, 0.4, 0.4, 0, c_white, c_white, c_white, c_white, 0.9)

				// Hold progress bar (below card name)
				if(rogue_card_hold > 0){
					var bar_width = 44
					var bar_height = 4
					var bar_x = card_x - bar_width/2
					var bar_y = card_y + 52
					var fill_pct = rogue_card_hold / rogue_card_hold_needed

					// Background bar
					draw_rectangle_color(bar_x, bar_y, bar_x + bar_width, bar_y + bar_height,
						c_dkgray, c_dkgray, c_dkgray, c_dkgray, false)
					// Fill bar
					draw_rectangle_color(bar_x, bar_y, bar_x + (bar_width * fill_pct), bar_y + bar_height,
						colorgold, colorgold, colorgoldlight, colorgoldlight, false)
				}
			}else{
				// Unselected card icon
				if(sprite_idx >= 0){
					// Talent card - use talent_spr
					draw_sprite_ext(talent_spr, sprite_idx, card_x, card_y, 1, 1, 0, c_white, 0.7)
				}else if(stat_type >= 0){
					// Stat card - use spr_rogue_ui
					draw_sprite_ext(spr_rogue_ui, 3 + stat_type, card_x, card_y, 1, 1, 0, c_white, 0.7)
				}

				// Card name (gray)
				draw_text_ext_transformed_color(card_x - 27, card_y + 32, card_name,
					0, 1000, 0.5, 0.5, 0, colorgray, colorgray, colorgray, colorgray, 1)

				// Card description (gray, smaller)
				draw_text_ext_transformed_color(card_x - 27, card_y + 42, card_desc,
					0, 1000, 0.4, 0.4, 0, colorgray, colorgray, colorgray, colorgray, 0.7)
			}
		}

		// Instructions
		draw_text_ext_transformed_color(xps + 127 - 55, yps + 130, "Hold SPACE to select",
			0, 1000, 0.5, 0.5, 0, c_white, c_white, c_white, c_white, 0.8)
	}
}

//Ketchup Ground
with(Abil){
	if(pin==29||pin==21){
		if(pinthree==1){
			draw_sprite_ext(sprite_index,image_index,x,y,dir,image_yscale,0,c_white,1)
		}
	}
}

with(Enemy){
	if(hurttimer>0){
	chance=(((hptotal/4)*6)/2)-3
	chancefour=1
				chancefive=20
				chancetwo=10

#region old health over enemy
				/*
				for(i=0;i<(hptotal/4);i+=1){
					draw_sprite_ext(icons_spr,4,x-chance+i*6,y-24,0.6,0.6,0,c_white,1)

					if(i<((hp+hurtamount)/4)){
						if(i<floor((hp+hurtamount)/4)){
						draw_sprite_ext(icons_spr,5,x-chance+i*6,y-24,0.6,0.6,0,c_white,1)
						}else{
						draw_sprite_ext(icons_spr,5+((hp+hurtamount) mod 4),x-chance+i*6,y-24,0.6,0.6,0,c_white,1)
						}
					}	

					if(i<(hp/4)){
						if(i<floor(hp/4)){
						draw_sprite_ext(icons_spr,0,x-chance+i*6,y-24,0.6,0.6,0,c_white,1)
						}else{
						draw_sprite_ext(icons_spr,(hp mod 4),x-chance+i*6,y-24,0.6,0.6,0,c_white,1)
						}
					}
					if(hp<=0){
						draw_sprite_ext(icons_spr,9,x-chance+i*6,y-24,0.6,0.6,0,c_white,1)
					}else{
							if(hurttimer>hurttimertotal-12){
								draw_sprite_ext(icons_spr,9,x-chance+i*6,y-24,0.6,0.6,0,c_white,1)
							}
					}
			
				}
				*/
#endregion

		//Health as Percentage
		chance=(hp/hptotal)*20
		chancefive=((hp+hurtamount)/hptotal)*20
		for(var i=0;i<20;i+=1){
						if(i mod 2 ==0){
							chancethree=1
						}else{
							chancethree=0
						}
					draw_sprite_ext(healthbar_spr,0,x-chancetwo+(i*chancefour),y-24,chancefour,chancefour,0,c_white,1)
					if(i<chance){
						draw_sprite_ext(healthbar_spr,1+chancethree,x-chancetwo+(i*chancefour),y-24,chancefour,chancefour,0,c_white,1)
					}else{
						if(i<chancefive){
							draw_sprite_ext(healthbar_spr,3+chancethree,x-chancetwo+(i*chancefour),y-24,chancefour,chancefour,0,c_white,1)
						}
					}			
		}
	}
	if(other.target==id){
		draw_sprite_ext(healthbar_spr,5,x-2.5,y-22+other.targetpos,0.7,0.7,0,c_white,1)
	}else{
		if(team==0){
			if(targ==0){
				draw_sprite_ext(healthbar_spr,22,x-2.5,y-12+other.targetpos,0.7,0.7,0,c_white,1)
			}else{
				draw_sprite_ext(healthbar_spr,21,x-2.5,y-12+other.targetpos,0.7,0.7,0,c_white,1)
			}
		}
	}
	
}

#region UI

#region Damage Array
xps=camx+screenshakeamt-camxtwo
yps=camy+hurtdraw-camytwo

//0,0=amount/0,1=timertotal//1,0=timer/1,1=dmg/1,2=x/1,3=y/1,4=typ
if(dmgArray[0,0]>=0){
	chance=24
	for(var i=1;i<dmgArray[0,0]+1;i+=1){
		chancetwo=dmgArray[i,1]+16
		if(chancetwo>20){
		chancetwo=20
		}
		if(dmgArray[i,5]<100){
		draw_sprite_ext(icons_spr,4,dmgArray[i,2]-5,dmgArray[i,3]-(dmgArray[i,0]*-0.4)-chance-0.6,0.6,0.6,0,c_white,1)
		}
				if(dmgArray[i,5]==10){
					draw_sprite_ext(icons_spr,10,dmgArray[i,2]-5,dmgArray[i,3]-(dmgArray[i,0]*-0.4)-chance-0.6,0.6,0.6,0,c_white,1)
				}else{
					if(dmgArray[i,5]==10){
						draw_sprite_ext(icons_spr,10,dmgArray[i,2]-5,dmgArray[i,3]-(dmgArray[i,0]*-0.4)-chance-0.6,0.6,0.6,0,c_white,1)
					}
				}
			if(dmgArray[i,5]==1){
				draw_sprite_ext(icons_spr,10,dmgArray[i,2]-5,dmgArray[i,3]-(dmgArray[i,0]*-0.4)-chance-0.6,0.6,0.6,0,c_white,1)
				//draw_sprite_ext(icons_spr,58,dmgArray[i,2],dmgArray[i,3],1,1,0,c_white,1)
			}else{
				if(dmgArray[i,5]==2){
					draw_sprite_ext(icons_spr,68,dmgArray[i,2]-5,dmgArray[i,3]-(dmgArray[i,0]*-0.4)-chance-0.6,0.6,0.6,0,c_white,1)
				}else{
					if(dmgArray[i,5]>=100&&dmgArray[i,5]<110){
							draw_sprite_ext(icons_spr,59+dmgArray[i,5]-100,dmgArray[i,2]-10,dmgArray[i,3]-(dmgArray[i,0]*-0.4)-chance-1,1,1,0,c_white,1)
						if(dmgArray[i,5]<103){
							draw_text_transformed_color(dmgArray[i,2]-4,dmgArray[i,3]-(dmgArray[i,0]*-0.4)-chance-3, "+",0.35,0.35,0,c_white,c_white,c_white,c_white,1)
							draw_text_transformed_color(dmgArray[i,2],dmgArray[i,3]-(dmgArray[i,0]*-0.4)-chance-3, dmgArray[i,1],0.35,0.35,0,c_white,c_white,c_white,c_white,1)
						}else{
							draw_text_transformed_color(dmgArray[i,2]-4,dmgArray[i,3]-(dmgArray[i,0]*-0.4)-chance-3, "-",0.35,0.35,0,hurtcolor,hurtcolor,hurtcolor,hurtcolor,1)
							draw_text_transformed_color(dmgArray[i,2],dmgArray[i,3]-(dmgArray[i,0]*-0.4)-chance-3, dmgArray[i,1],0.35,0.35,0,hurtcolor,hurtcolor,hurtcolor,hurtcolor,1)
						}
					}else{
						if(dmgArray[i,5]==111){
							draw_sprite_ext(icons_spr,67,dmgArray[i,2]-10,dmgArray[i,3]-(dmgArray[i,0]*-0.4)-chance-1,1,1,0,c_white,1)
							draw_text_transformed_color(dmgArray[i,2]-4,dmgArray[i,3]-(dmgArray[i,0]*-0.4)-chance-3, "+",0.35,0.35,0,c_white,c_white,c_white,c_white,1)
							draw_text_transformed_color(dmgArray[i,2],dmgArray[i,3]-(dmgArray[i,0]*-0.4)-chance-3, dmgArray[i,1],0.35,0.35,0,c_white,c_white,c_white,c_white,1)					
						}else{
							draw_sprite_ext(icons_spr,0,dmgArray[i,2]-5,dmgArray[i,3]-(dmgArray[i,0]*-0.4)-chance-0.6,0.6,0.6,0,c_white,1)
						}
					}
				}
			}
			if(dmgArray[i,4]==1){
				draw_sprite_ext(icons_spr,9,dmgArray[i,2]-5,dmgArray[i,3]-(dmgArray[i,0]*-0.4)-chance-0.6,0.6,0.6,0,c_white,1)
			}
		if(dmgArray[i,5]<100){
			if(dmgArray[i,5]!=2){
				draw_text_transformed_color(dmgArray[i,2],dmgArray[i,3]-(dmgArray[i,0]*-0.4)-chance-3, dmgArray[i,1],0.35,0.35,0,hurtcolor,hurtcolor,hurtcolor,hurtcolor,1)
			}else{
				draw_sprite_ext(icons_spr,68,dmgArray[i,2]-5,dmgArray[i,3]-(dmgArray[i,0]*-0.4)-chance-0.6,0.6,0.6,0,c_white,1)
				draw_text_transformed_color(dmgArray[i,2],dmgArray[i,3]-(dmgArray[i,0]*-0.4)-chance-3, dmgArray[i,1],0.4,0.4,0,colorlightgreen,colorlightgreen,colorlightgreen,colorlightgreen,1)
			}
		}
	}
}
#endregion

//TIMER
draw_sprite_ext(maptest_spr,26,xps-0.5,yps-0.5,1,1,0,c_white,1)


chance=floor(miniArray[0,1]/60)
chancetwo=0
chancethree=((miniArray[0,1]/miniArray[1,1])*7)+1
chancefour=31+0.5
chancefive=0.5

//GOAL Live Progress
if(lvlArray[1000,4]>0){
	draw_sprite_ext(maptest_spr,28,xps-0.5,yps-0.5,1,1,0,c_white,1)
	draw_sprite_ext(map_icons_spr,lvlArray[1000,0],xpstwo-chancefour-4,yps+chancefive+10.1,1,1,0,c_white,1)
	draw_text_ext_transformed(xpstwo-chancefour+20.5-(string_width(lvlArray[1000,4])/4),yps+chancefive+14.5,lvlArray[1000,4],0,1000,0.5,0.5,0)
}

if(chance>=60){
	chancetwo=floor(chance/60)
	chance-=chancetwo*60
	draw_text_transformed(xpstwo-19.5,yps+2,chancetwo,0.5,0.5,0)
	draw_text_transformed(xpstwo-11.5,yps+2,chance,0.5,0.5,0)
}else{
	if(floor(miniArray[0,1]/60)<=30){
			if(targetpos>=0){
				draw_text_transformed(xpstwo-12.5,yps+2,chance,0.5,0.5,0)
			}else{
				draw_text_transformed_color(xpstwo-12.5,yps+2,chance,0.5,0.5,0,hurtcolor,hurtcolor,hurtcolor,hurtcolor,1)
			}
	}else{
		draw_text_transformed(xpstwo-12.5,yps+2,chance,0.5,0.5,0)
	}
}
				draw_sprite_ext(healthbar_spr,10,xpstwo-chancefour,yps+chancefive,1,1,0,c_white,1)
	if(floor(miniArray[0,1]/60)<=30){
		if(miniArray[0,1]/60>0){
			if(targetpos>=0){
				draw_sprite_ext(healthbar_spr,9,xpstwo-chancefour,yps+chancefive,1,1,0,c_white,1)
			}else{
				draw_sprite_ext(healthbar_spr,10,xpstwo-chancefour,yps+chancefive,1,1,0,c_white,1)
			}
		}
	}else{
		draw_sprite_ext(healthbar_spr,9,xpstwo-chancefour,yps+chancefive,1,1,0,c_white,1)
	}

draw_sprite_ext(healthbar_spr,11+chancethree,xpstwo-chancefour,yps+chancefive,1,1,0,c_white,1)


for(var i=0;i<Me.hp;i+=1){
	
}

#region Target UI
xpstwo=camx+screenshakeamt+camxtwo
ypstwo=camy+hurtdraw+camytwo
if(target!=noone){
if(instance_exists(target)){	
	with(target){
		chance=(hp/hptotal)*4
		yps=other.yps
		xpstwo=other.xpstwo+16
		chancetwo=0.7
	
		if(floor(hp)<hp){
			draw_text_transformed(xpstwo-30-30,yps,floor(hp)+1,0.5,0.5,0)	
		}else{
			draw_text_transformed(xpstwo-30-30,yps,hp,0.5,0.5,0)	
		}
		if(hp<0){
		chance=0
		}
		draw_sprite_ext(healthbar_spr,6,xpstwo-74+(other.targetpos/2),yps+1.5,chancetwo,chancetwo,0,c_white,1)
		draw_sprite_ext(icons_spr,14,xpstwo-30-32-4,yps+3.1,chancetwo,chancetwo,0,c_white,1)
		draw_sprite_ext(icons_spr,22+chance,xpstwo-30-32-4,yps+3.1,chancetwo,chancetwo,0,c_white,1)
		draw_sprite_ext(icons_spr,17+chance-1,xpstwo-30-32-4,yps+3.1,chancetwo,chancetwo,0,c_white,1)
#region Old Target Hearts
		/*
		xps=other.xpstwo-32
		yps=other.yps+2
		chance=(((hptotal/4)*7)/2)-3.5
		if(hptotal>40){
			chancetwo=0.4
		}else{
			chancetwo=0.6
			xps+=60-((hptotal/4)*(10*chancetwo))
		}
		chancethree=0
		ypsplus=0

				for(var i=0;i<(hptotal/4);i+=1){
					if(i mod 10==0){
						
						ypsplus=chancethree*(10*chancetwo)
						xps-=10*(10*chancetwo)
						chancethree+=1
					}
						draw_sprite_ext(icons_spr,4,xps+i*(10*chancetwo),yps+ypsplus,chancetwo,chancetwo,0,c_white,1)

					if(i<((hp+hurtamount)/4)){
						if(i<floor((hp+hurtamount)/4)){
						draw_sprite_ext(icons_spr,5,xps+i*(10*chancetwo),yps+ypsplus,chancetwo,chancetwo,0,c_white,1)
						}else{
						draw_sprite_ext(icons_spr,5+((hp+hurtamount) mod 4),xps+i*(10*chancetwo),yps+ypsplus,chancetwo,chancetwo,0,c_white,1)
						}
					}	

					if(i<(hp/4)){
						if(i<floor(hp/4)){
						draw_sprite_ext(icons_spr,0,xps+i*(10*chancetwo),yps+ypsplus,chancetwo,chancetwo,0,c_white,1)
						}else{
						draw_sprite_ext(icons_spr,(hp mod 4),xps+i*(10*chancetwo),yps+ypsplus,chancetwo,chancetwo,0,c_white,1)
						}
					}
					if(hp<=0){
						draw_sprite_ext(icons_spr,9,xps+i*(10*chancetwo),yps+ypsplus,chancetwo,chancetwo,0,c_white,1)
					}else{
						if(hurttimer>hurttimertotal-14||other.animationtick==1&&hp<=4){
							draw_sprite_ext(icons_spr,9,xps+i*(10*chancetwo),yps+ypsplus,chancetwo,chancetwo,0,c_white,1)
						}	
					}
				
				}

		*/
#endregion
	}
}
}
#endregion
}
#endregion
#region Overworld Map
if(pause==1){
	
	draw_sprite_ext(maptest_spr,6+mapdataArray[1003,0]*2,xps-0.5,yps-0.5-143+animation,1,1,0,c_white,1)	
	draw_sprite_ext(maptest_spr,6+mapdataArray[1003,0]*2,xps-0.5,yps-0.5+animation,1,1,0,c_white,1)
	
	//Grass
	draw_sprite_ext(maptest_spr,5+mapdataArray[1003,0]*2,xps-0.5,yps-0.5-143+miniy,1,1,0,c_white,1)	
	draw_sprite_ext(maptest_spr,5+mapdataArray[1003,0]*2,xps-0.5,yps-0.5+miniy,1,1,0,c_white,1)		

	for(var a=0;a<10;a+=1){
		for(var b=0;b<10;b+=1){
			for(var i=1;i<5;i+=1){
				if(mapdataArray[mapArray[a,b],i]!=0){
					linex=xps+(a*32)+(2*16)+8-1+8
					liney=yps-(b*24)+(7*16)+8+miniy
					linextwo=xps+((mapdataArray[mapArray[a,b],i]-1)*32)+(2*16)+8-1+8
					lineytwo=yps-(b*24)+(7*16)+16+16+miniy
					if(b-1==mapdataArray[1001,1]&&mapdataArray[mapArray[a,b],i]-1==mapdataArray[1001,0]){
						if(a==selectx&&b==selecty){
							colorone=colorgold
							colortwo=colorgoldlight
						}else{
							colorone=colorgoldmed
							colortwo=colorgold
						}
					}else{
						colorone=pathcolor
						colortwo=pathcolortwo
					}
					draw_line_width_color(linex,liney,linextwo,lineytwo,1,colorone,colorone)	
					draw_line_width_color(linex+1,liney,linextwo+1,lineytwo,1,colortwo,colortwo)
					
				}
			}			
		}
	}
	for(var a=0;a<10;a+=1){
		for(var b=0;b<10;b+=1){
			if(a==selectx&&b==selecty){
					chance=0
					for(var i=1;i<5;i+=1){
						if(mapdataArray[mapArray[a,b],i]!=0){	
							if(b-1==mapdataArray[1001,1]&&mapdataArray[mapArray[a,b],i]-1==mapdataArray[1001,0]){
								chance=1
							}
						}
					}
					if(chance==1){
						draw_sprite_ext(map_icons_spr,32,xps+(a*32)+(2*16)+8+(anim/4),yps-(b*24)+(7*16)+miniy,1,1,0,c_white,1)
						draw_sprite_ext(map_icons_spr,33,xps+(a*32)+(2*16)+8+6-(anim/4),yps-(b*24)+(7*16)+miniy,1,1,0,c_white,1)						
					}else{
						draw_sprite_ext(map_icons_spr,30,xps+(a*32)+(2*16)+8-1+(anim/4),yps-(b*24)+(7*16)+miniy,1,1,0,c_white,1)
						draw_sprite_ext(map_icons_spr,31,xps+(a*32)+(2*16)+8+1+11-(anim/4),yps-(b*24)+(7*16)+miniy,1,1,0,c_white,1)
					}
				if(a==mapdataArray[1001,0]&&b==mapdataArray[1001,1]&&mapdataArray[1001,2]==0){
					
				}else{
					draw_sprite_ext(map_icons_spr,mapdataArray[mapArray[a,b],0],xps+(a*32)+(2*16)+8-1.1,yps-(b*24)+(7*16)+miniy+anim-1.3,1.15,1.15,0,c_white,1)
				}
			}else{
				if(a==mapdataArray[1001,0]&&b==mapdataArray[1001,1]&&mapdataArray[1001,2]==0){
				
				}else{
					draw_sprite_ext(map_icons_spr,mapdataArray[mapArray[a,b],0],xps+(a*32)+(2*16)+8,yps-(b*24)+(7*16)+miniy,1,1,0,c_white,1)
				}
			}
				/* line data
				for(i=1;i<5;i+=1){
					if(mapdataArray[mapArray[a,b],i]!=0){
						draw_text_transformed(xps+(a*32)+(3*16)+8-1+i*5,yps-(b*24)+(7*16)+miniy,mapdataArray[mapArray[a,b],i]-1,0.5,0.5,0)
						draw_text_transformed(xps+(a*32)+(3*16)+8-1+i*5,yps-(b*24)+(7*16)+10+miniy,a,0.5,0.5,0)
					}
				}
				//*/
		}
	}
	if(selectx==mapdataArray[1001,0]&&selecty==mapdataArray[1001,1]){
		draw_sprite_ext(map_icons_spr,15+Me.class,xps+(3*16)+mapdataArray[1001,5]-8-1.1,yps+7*16-mapdataArray[1001,6]+anim+miniy-0.3-1,1.15,1.15,0,c_white,1)
	}else{
		draw_sprite_ext(map_icons_spr,15+Me.class,xps+(3*16)+mapdataArray[1001,5]-8,yps+7*16-mapdataArray[1001,6]+(anim/2)+miniy,1,1,0,c_white,1)
	}
		
		//Center Banner
		if(phase==1){
			if(starttimer<90){
				draw_sprite_ext(maptest_spr,4,xps-0.5,yps-0.5-chance,1,1,0,c_white,1)
				draw_text_ext_transformed(xps+(255/2)+4-(string_width(mapdataArray[1004,mapdataArray[1003,0]])/3),yps+(143/2)-4-chance,mapdataArray[1004,mapdataArray[1003,0]],0,1000,0.6,0.6,0)
				draw_sprite_ext(map_icons_spr,42+(4*mapdataArray[1003,0]),xps-0.5+46+7,yps-0.5+63,1,1,0,c_white,1)	
			}
		}else{
			//Level Details
			if(phasetick==3&&miniy==toy){	
				chancetwo=16
					draw_sprite_ext(maptest_spr,6+mapdataArray[1003,0]*2,xps-0.5,yps-0.5-143+animation,1,1,0,c_white,1)	
					draw_sprite_ext(maptest_spr,6+mapdataArray[1003,0]*2,xps-0.5,yps-0.5+animation,1,1,0,c_white,1)
				draw_sprite_ext(maptest_spr,20,xps-0.5,yps-0.5-chance,1,1,0,c_white,1)
				draw_text_ext_transformed(xps+(255/2)+2-(string_width(mapdataArray[1002,mapdataArray[mapArray[selectx,selecty],0]])/4)-24,yps+(143/2)-7.5-chancetwo-chance,mapdataArray[1002,mapdataArray[mapArray[selectx,selecty],0]],0,1000,0.5,0.5,0)
				draw_text_ext_transformed(xps+(255/2)+4-20-35,yps+(143/2)+9.5-chance-chancetwo,mapdataArray[1005,mapdataArray[mapArray[selectx,selecty],0]],0,1000,0.5,0.5,0)
				draw_sprite_ext(map_icons_spr,mapdataArray[mapArray[selectx,selecty],0],xps-0.5+46+10,yps-0.5+62-chancetwo,1,1,0,c_white,1)			
				//Bounty
				if(mapdataArray[mapArray[selectx,selecty],0]<12){
					draw_sprite_ext(maptest_spr,22,xps-0.5,yps-0.5-chancetwo-chance+2,1,1,0,c_white,1)
					draw_text_ext_transformed(xps+93.5-(string_width(mapdataArray[mapArray[selectx,selecty],10])/4),yps+94-chancetwo,mapdataArray[mapArray[selectx,selecty],10],0,1000,0.5,0.5,0)
				}
			}
			if(phasetick==2){
					draw_sprite_ext(maptest_spr,6+mapdataArray[1003,0]*2,xps-0.5,yps-0.5-143+animation,1,1,0,c_white,1)	
					draw_sprite_ext(maptest_spr,6+mapdataArray[1003,0]*2,xps-0.5,yps-0.5+animation,1,1,0,c_white,1)
				draw_sprite_ext(maptest_spr,23,xps-0.5,yps-0.5-chance,1,1,0,c_white,1)	
				chancetwo=24
				draw_text_ext_transformed(xps+(255/2)+3-20-35,yps+(143/2)+8.5-chance-chancetwo-16,"Stage Complete",0,1000,0.5,0.5,0)
				draw_text_ext_transformed(xps+(255/2)+3.5-20-35,yps+(143/2)+8.5-chance-chancetwo+1,"Reward",0,1000,0.5,0.5,0)
				draw_sprite_ext(map_icons_spr,mapdataArray[mapArray[selectx,selecty],0],xps-0.5+46+10,yps-0.5+62-chancetwo,1,1,0,c_white,1)		
				//Bounty
				if(mapdataArray[mapArray[selectx,selecty],0]<12){
					draw_sprite_ext(maptest_spr,22,xps-0.5+35,yps-0.5-12-chancetwo-chance+1,1,1,0,c_white,1)
					draw_text_ext_transformed(xps+93.5+35-(string_width(mapdataArray[mapArray[selectx,selecty],10])/4),yps+81-chancetwo,mapdataArray[mapArray[selectx,selecty],10],0,1000,0.5,0.5,0)
				}				
			}else{
				if(phasetick==4){
						draw_sprite_ext(maptest_spr,6+mapdataArray[1003,0]*2,xps-0.5,yps-0.5-143+animation,1,1,0,c_white,1)	
						draw_sprite_ext(maptest_spr,6+mapdataArray[1003,0]*2,xps-0.5,yps-0.5+animation,1,1,0,c_white,1)
					draw_sprite_ext(maptest_spr,41,xps-0.5,yps-0.5-chance,1,1,0,c_white,1)	
					chancetwo=24
					draw_text_ext_transformed(xps+(255/2)+3-20-35,yps+(143/2)+8.5-chance-chancetwo-16,"Stage Complete",0,1000,0.5,0.5,0)
					draw_text_ext_transformed(xps+(255/2)+3.5-20-35,yps+(143/2)+8.5-chance-chancetwo+1,"Reward",0,1000,0.5,0.5,0)
					draw_sprite_ext(map_icons_spr,mapdataArray[mapArray[selectx,selecty],0],xps-0.5+46+10,yps-0.5+62-chancetwo,1,1,0,c_white,1)		
					
					//Bounty
					if(mapdataArray[mapArray[selectx,selecty],0]<12){
						draw_sprite_ext(maptest_spr,22,xps-0.5+35,yps-0.5-12-chancetwo-chance+1,1,1,0,c_white,1)
						draw_text_ext_transformed(xps+93.5+35-(string_width(mapdataArray[mapArray[selectx,selecty],10])/4),yps+81-chancetwo,mapdataArray[mapArray[selectx,selecty],10],0,1000,0.5,0.5,0)
					}
					//Chest
					draw_sprite_ext(chest_spr,3+12*mapdataArray[1004,3]+6+mapdataArray[1004,2]/10,xps-0.5+105+mapdataArray[1004,13]/8,yps-0.5-4-chancetwo-chance+1+115-mapdataArray[1004,9]/90,1,1,0,c_white,1)	
						if(instance_exists(Part)){
							with(Part){
								if(pin==1&&type==1){
									draw_sprite(sprite_index,image_index,x,y)
								}
							}
						}
					//item
					draw_sprite_ext(items_spr,mapdataArray[1004,4],xps-0.5+106,yps-0.5-5-chancetwo-chance+4+115-mapdataArray[1004,5]/4+mapdataArray[1004,7]/30,1,1,0,c_white,1)
						with(Part){
							if(pin==1&&type==2){
								draw_sprite(sprite_index,image_index,x,y)
							}
						}
					chancefour=3+12*mapdataArray[1004,3]+mapdataArray[1004,2]/10
					//Chest
					draw_sprite_ext(chest_spr,chancefour,xps-0.5+105+mapdataArray[1004,13]/8,yps-0.5-4-chancetwo-chance+1+115-mapdataArray[1004,9]/90,1,1,0,c_white,1)	
					
					if(1==1){
						//Equip Icon
						if(mapdataArray[1004,2]>=35){
						
						draw_sprite_ext(ui_med_spr,4+(itemArray[mapdataArray[1004,16]+1,0]*2),xps+149+0.5,yps+0.5+78-31,1,1,0,c_white,1)
						draw_sprite_ext(items_spr,mapdataArray[1004,4],xps+147,yps-0.5+77-13,1,1,0,c_white,1)
						chance=colorgray
						if(mapdataArray[1004,10]==1){
							chance=colorgreen
						}else{
							if(mapdataArray[1004,10]==2){
								chance=colorblue
							}else{
								if(mapdataArray[1004,10]==3){
										if(targetpos<=0.4){
											chance=colorpurple
										}else{
											chance=colorpurpledark
										}
								}else{
									if(mapdataArray[1004,10]==4){
										if(targetpos<-0.2){
											chance=colorred
										}else{
											if(targetpos<0.2){
												chance=colorgoldmed
											}else{
												chance=colorgold
											}
										}
									}else{
				
									}				
								}				
							}				
						}
						draw_text_ext_transformed_color(xps+140,yps+89-13,itemArray[mapdataArray[1004,16],0],0,1000,0.5,0.5,0,chance,chance,chance,chance,1)	
						}
					}
					
				}
			}
		}

	draw_sprite_ext(maptest_spr,3,xps-0.5,yps-0.5,1,1,0,c_white,1)

	draw_sprite_ext(map_icons_spr,42+(4*mapdataArray[1003,0])+mapdataArray[1000,1],xps-0.5+2,yps-0.5+2,1,1,0,c_white,1)	
		//draw_text_transformed(xps+2,yps+2,"Stage 1 Deep Woods",0.5,0.5,0)


		if(mapdataArray[mapArray[selectx,selecty],0]!=0){
			draw_sprite_ext(map_icons_spr,mapdataArray[mapArray[selectx,selecty],0],xpstwo-15-0.5,yps-0.5,1,1,0,c_white,1)	
			draw_text_ext_transformed(xpstwo-69+21.5-(string_width(mapdataArray[1002,mapdataArray[mapArray[selectx,selecty],0]])/4),yps+1,mapdataArray[1002,mapdataArray[mapArray[selectx,selecty],0]],0,1000,0.5,0.5,0)	
				
				//Bounty
				if(mapdataArray[mapArray[selectx,selecty],0]<12){
					draw_sprite_ext(maptest_spr,21,xps-0.5,yps-0.5,1,1,0,c_white,1)
					draw_text_ext_transformed(xpstwo-114+21-(string_width(mapdataArray[mapArray[selectx,selecty],10])/4),yps+1,mapdataArray[mapArray[selectx,selecty],10],0,1000,0.5,0.5,0)
				}
		}
		
		
}else{
#region Inventory
if(pause==2){
	chance=0
	chancetwo=0
		draw_sprite_ext(maptest_spr,31+pauseopt,xps-0.5,yps-0.5,1,1,0,c_white,1)
#region Store Character
	if(pauseopt==1){
		draw_sprite_ext(enemy_three_spr,214+invenArray[39,0]*0.1,xps-0.5+24+4,yps-0.5+25+6,1,1,0,c_white,1)
	}
#endregion
#region Inventory option select
			if(pauseopt==0){
				chance=1
			}else{
				draw_sprite_part_ext(maptest_spr,39,0,0,56,11,xps-0.5+1,yps+73-0.5,1,1,c_white,1)	
				chance=0
			}
			if(mouse_x>=xps+1&&mouse_x<=xps+56&&mouse_y>=yps+73&&mouse_y<=yps+84){
				chancetwo=1
				draw_sprite_part_ext(maptest_spr,39,0,30,50,15,xps-0.5+11,yps+71-0.5,1,1,c_white,1)	
				draw_sprite_ext(map_icons_spr,69+chance*6,xps-0.5-1,yps+71+targetpos/2,1,1,0,c_white,1)				
			}else{
				chancetwo=0
				draw_sprite_ext(map_icons_spr,69+chance*6,xps-0.5-1,yps+71,1,1,0,c_white,1)
			}	
			if(chance==1){
				if(pauseopt==0&&chancetwo==1){
					draw_sprite_part_ext(maptest_spr,39,0,47,60,15,xps-0.5-1,yps+71-0.5,1,1,c_white,1)
				}else{
					draw_sprite_part_ext(maptest_spr,39,0,13,15,15,xps-0.5-1,yps+71-0.5,1,1,c_white,1)
				}	
				draw_text_ext_transformed(xps+15,yps+75,"Inventory",0,1000,0.5,0.5,0)
			}else{
				if(chancetwo==0){
					draw_text_ext_transformed_color(xps+15,yps+75,"Inventory",0,1000,0.5,0.5,0,colorgray,colorgray,colorgray,colorgray,1)
				}else{
					draw_text_ext_transformed(xps+15,yps+75,"Inventory",0,1000,0.5,0.5,0)
				}
			}

			if(pauseopt==1){
				chance=1		
			}else{
				draw_sprite_part_ext(maptest_spr,39,0,0,56,11,xps-0.5+1,yps+73-0.5+19,1,1,c_white,1)
				chance=0
			}
			if(mouse_x>=xps+1&&mouse_x<=xps+56&&mouse_y>=yps+73+19&&mouse_y<=yps+84+19){
				chancetwo=1
				draw_sprite_part_ext(maptest_spr,39,0,30,50,15,xps-0.5+11,yps+71-0.5+19,1,1,c_white,1)	
				draw_sprite_ext(map_icons_spr,70+chance*6,xps-0.5-1,yps+71+19+targetpos/2,1,1,0,c_white,1)		
			}else{
				chancetwo=0
				draw_sprite_ext(map_icons_spr,70+chance*6,xps-0.5-1,yps+71+19,1,1,0,c_white,1)	
			}
			if(chance==1){
				if(pauseopt==1&&chancetwo==1){
					draw_sprite_part_ext(maptest_spr,39,0,47,60,15,xps-0.5-1,yps+71-0.5+19,1,1,c_white,1)
				}else{
					draw_sprite_part_ext(maptest_spr,39,0,13,15,15,xps-0.5-1,yps+71-0.5+19,1,1,c_white,1)
				}				
					draw_text_ext_transformed(xps+15,yps+75+19,"Store",0,1000,0.5,0.5,0)
			}else{
				if(chancetwo==0){
					draw_text_ext_transformed_color(xps+15,yps+75+19,"Store",0,1000,0.5,0.5,0,colorgray,colorgray,colorgray,colorgray,1)
				}else{
					draw_text_ext_transformed(xps+15,yps+75+19,"Store",0,1000,0.5,0.5,0)
				}
			}

			if(pauseopt==2){
				chance=1		
			}else{
				draw_sprite_part_ext(maptest_spr,39,0,0,56,11,xps-0.5+1,yps+73-0.5+38,1,1,c_white,1)
				chance=0
			}
			if(mouse_x>=xps+1&&mouse_x<=xps+56&&mouse_y>=yps+73+38&&mouse_y<=yps+84+38){
				chancetwo=1
				draw_sprite_part_ext(maptest_spr,39,0,30,50,15,xps-0.5+11,yps+71-0.5+38,1,1,c_white,1)	
				draw_sprite_ext(map_icons_spr,71+chance*6,xps-0.5-1,yps+71+38+targetpos/2,1,1,0,c_white,1)		
			}else{
				chancetwo=0
				draw_sprite_ext(map_icons_spr,71+chance*6,xps-0.5-1,yps+71+38,1,1,0,c_white,1)	
			}
			if(chance==1){
				if(pauseopt==2&&chancetwo==1){
					draw_sprite_part_ext(maptest_spr,39,0,47,60,15,xps-0.5-1,yps+71-0.5+38,1,1,c_white,1)
				}else{
					draw_sprite_part_ext(maptest_spr,39,0,13,15,15,xps-0.5-1,yps+71-0.5+38,1,1,c_white,1)
				}				
					draw_text_ext_transformed(xps+15,yps+75+38,"Mask",0,1000,0.5,0.5,0)
			}else{
				if(chancetwo==0){
					draw_text_ext_transformed_color(xps+15,yps+75+38,"Mask",0,1000,0.5,0.5,0,colorgray,colorgray,colorgray,colorgray,1)
				}else{
					draw_text_ext_transformed(xps+15,yps+75+38,"Mask",0,1000,0.5,0.5,0)
				}
			}
				
#endregion
	chance=0
	chancetwo=0
	
		var ii=0
	for(var i=0;i<27;i+=1){
		if(i>0){
			if(i<21){
				if(i mod 7 == 0){
					chance-=6*19
					chancetwo+=19
				}else{
					chance+=19
				}
			}else{
				if(pauseopt==0){
					if(i mod 3 == 0){
						chance=0
						chancetwo=-42
						if(i>21){
							chancetwo+=19
						}
					}else{
						chance+=19
					}
				}else{
					if(pauseopt==1){
				
						if(ii == 0){
							ii=19
							chance=0
							chancetwo=-40
						}else{
						
							chance+=19
							if(i+ii==45){
								chance+=19
							}
						}	
					}
				}
			}
		}

			if(i+ii==21){
				if(invenArray[30,0]!=999){
					if(itemArray[invenArray[invenArray[30,0],0],2]==1){
						draw_sprite_ext(ui_med_spr,7,xps-0.5+61-8+chance,yps-0.5+71-8+chancetwo,1,1,0,c_white,1)
					}
				}
			}
			if(i+ii==23){
				if(invenArray[30,0]!=999){
					if(itemArray[invenArray[invenArray[30,0],0],2]==2){
						draw_sprite_ext(ui_med_spr,9,xps-0.5+61-8+chance,yps-0.5+71-8+chancetwo,1,1,0,c_white,1)
					}
				}
			}
			if(invenArray[30,0]!=999){
				if(i+ii>=24&&i+ii<27){				
						if(itemArray[invenArray[invenArray[30,0],0],2]!=1&&itemArray[invenArray[invenArray[30,0],0],2]!=2||selected==i+ii&&i+ii==999){
							draw_sprite_ext(ui_med_spr,5,xps-0.5+61-8+chance,yps-0.5+71-8+chancetwo,1,1,0,c_white,1)
						}				
				}

			}
				if(i+ii==selected){
					if(selected<21){
						draw_sprite_ext(ui_med_spr,2,xps-0.5+61-8+chance,yps-0.5+71-8+chancetwo,1,1,0,c_white,1)
					}else{
						if(selected==21){
								if(invenArray[30,0]==999){
								draw_sprite_ext(ui_med_spr,7,xps-0.5+61-8+chance,yps-0.5+71-8+chancetwo,1,1,0,c_white,1)
								}
						}else{
							if(selected==23){
								if(invenArray[30,0]==999){
									draw_sprite_ext(ui_med_spr,9,xps-0.5+61-8+chance,yps-0.5+71-8+chancetwo,1,1,0,c_white,1)
								}
							}else{
								if(selected>23&&selected<40){
									if(invenArray[30,0]==999){
										draw_sprite_ext(ui_med_spr,5,xps-0.5+61-8+chance,yps-0.5+71-8+chancetwo,1,1,0,c_white,1)
									}
								}else{
		
								}				
							}				
						}				
					}
				}
			if(pauseopt==1){
				if(invenArray[30,0]>=40&&invenArray[30,0]<45&&i+ii<40&&invenArray[i+ii,0]==0||invenArray[30,0]>=40&&invenArray[30,0]&&invenArray[30,0]==i+ii){
					draw_sprite_ext(ui_med_spr,2,xps-0.5+61-8+chance,yps-0.5+71-8+chancetwo,1,1,0,c_white,1)
				}
				if(i+ii==45){
					if(invenArray[30,0]<21){
						draw_sprite_ext(ui_med_spr,2,xps-0.5+61-8+chance,yps-0.5+71-8+chancetwo,1,1,0,c_white,1)
					}
					if(invenArray[45,0]!=0){
						draw_sprite_ext(map_icons_spr,73,xps-0.5+58+chance,yps+70+15+chancetwo,1,1,0,c_white,1)
						if(mapdataArray[1010,0]+mapdataArray[1000,5]>=floor((itemArray[invenArray[45,0],4]+floor(invenArray[45,2]*2))/2)){
							draw_text_ext_transformed(xps-0.5+70+chance-string_length(floor((itemArray[invenArray[45,0],4]+floor(invenArray[45,2]*2))/2)),yps+72+chancetwo+17,floor((itemArray[invenArray[45,0],4]+floor(invenArray[45,2]*2))/2),0,1000,0.5,0.5,0)
						}else{
							draw_text_ext_transformed_color(xps-0.5+70+chance-string_length(floor((itemArray[invenArray[45,0],4]+floor(invenArray[45,2]*2))/2)),yps+72+chancetwo+17,floor((itemArray[invenArray[45,0],4]+floor(invenArray[45,2]*2))/2),0,1000,0.5,0.5,0,colorred,colorred,colorred,colorred,1)
						}
					}
				}
				if(i+ii>=40&&i+ii<45){
					if(invenArray[i+ii,0]!=0){
						draw_sprite_ext(map_icons_spr,73,xps-0.5+58+chance,yps+70+15+chancetwo,1,1,0,c_white,1)
						if(invenArray[i+ii,0]==23||invenArray[i+ii,0]==25){
							if(mapdataArray[1010,0]+mapdataArray[1000,5]>=itemArray[invenArray[i+ii,0],4]+floor(invenArray[i+ii,2])){
								draw_text_ext_transformed(xps-0.5+70+chance-string_length(itemArray[invenArray[i+ii,0],4]+floor(invenArray[i+ii,2])),yps+72+chancetwo+17,itemArray[invenArray[i+ii,0],4]+floor(invenArray[i+ii,2]),0,1000,0.5,0.5,0)
							}else{
								draw_text_ext_transformed_color(xps-0.5+70+chance-string_length(itemArray[invenArray[i+ii,0],4]+floor(invenArray[i+ii,2])),yps+72+chancetwo+17,itemArray[invenArray[i+ii,0],4]+floor(invenArray[i+ii,2]),0,1000,0.5,0.5,0,colorred,colorred,colorred,colorred,1)
							}										
						}else{
							if(mapdataArray[1010,0]+mapdataArray[1000,5]>=itemArray[invenArray[i+ii,0],4]+floor(invenArray[i+ii,2]*2)){
								draw_text_ext_transformed(xps-0.5+70+chance-string_length(itemArray[invenArray[i+ii,0],4]+floor(invenArray[i+ii,2]*2)),yps+72+chancetwo+17,itemArray[invenArray[i+ii,0],4]+floor(invenArray[i+ii,2]*2),0,1000,0.5,0.5,0)
							}else{
								draw_text_ext_transformed_color(xps-0.5+70+chance-string_length(itemArray[invenArray[i+ii,0],4]+floor(invenArray[i+ii,2]*2)),yps+72+chancetwo+17,itemArray[invenArray[i+ii,0],4]+floor(invenArray[i+ii,2]*2),0,1000,0.5,0.5,0,colorred,colorred,colorred,colorred,1)
							}
						}
					}
				}
			}
	if(pauseopt<2){
		if(invenArray[i+ii,1]==0&&invenArray[i+ii,0]!=0){
				chancefour=invenArray[i+ii,0]
				if(invenArray[i+ii,2]>=3){
					chancefour+=1
				}
			if(i+ii==selected){
				draw_sprite_ext(items_spr,chancefour,xps-0.5+69+chance,yps-0.5+79+chancetwo+targetpos,1,1,0,c_white,1)
			}else{
				draw_sprite_ext(items_spr,chancefour,xps-0.5+69+chance,yps-0.5+79+chancetwo,1,1,0,c_white,1)
			}
		}else{
			
		}
		if(i+ii==selected){
			draw_sprite_ext(ui_med_spr,1,xps-0.5+61-8+chance,yps-0.5+71-8+chancetwo,1,1,0,c_white,1)
			// Enhanced cursor for keyboard/controller mode
			if(cursor_mode == 1){
				// Draw an animated highlight without scaling
				var pulse_alpha = 0.3 + sin(current_time * 0.005) * 0.3
				draw_sprite_ext(ui_med_spr,2,xps-0.5+61-8+chance,yps-0.5+71-8+chancetwo,1,1,0,c_white,pulse_alpha)
			}
		}
			if(invenArray[i+ii,0]!=0){
				draw_sprite_ext(map_icons_spr,80+invenArray[31,16]+invenArray[i+ii,2]*3,xps-0.5+68+chance,yps-0.5+78+chancetwo,1,1,0,c_white,1)
			}
	}
	}
if(pauseopt==0){
	//Mask
	var mask_selected = (cursor_mode == 1 && selected == 998) || (mouse_x>=xps+80&&mouse_y>=yps+10&&mouse_x<xps+80+16&&mouse_y<yps+10+16)
	if(mask_selected){
		draw_sprite_ext(mask_two_spr,Me.class*4,xps-1+88,yps-0.5+18+targetpos,1,1,0,c_white,1)
		// Draw cursor highlight in keyboard mode
		if(cursor_mode == 1 && selected == 998){
			var pulse_alpha = 0.3 + sin(current_time * 0.005) * 0.3
			draw_sprite_ext(ui_med_spr,2,xps+80-8,yps+10-8,1,1,0,c_white,pulse_alpha)
		}
	}else{
		draw_sprite_ext(mask_two_spr,Me.class*4,xps-1+88,yps-0.5+18,1,1,0,c_white,1)
	}
}
	
	// Draw input mode indicator
	if(cursor_mode == 1){
		draw_text_ext_transformed_color(xps+3,yps+130,"[Controller Mode]",0,1000,0.4,0.4,0,c_white,c_white,c_white,c_white,0.7)
	}
	
	//Pet Hover Draw
	if(selected<999){
		if(invenArray[selected,0]>0){
				//Rarity Icon
				chancefour=invenArray[selected,0]
				if(invenArray[selected,2]>=3){
					chancefour+=1
				}

#region Stats Draw
//item_createstats_scr(11,"Health",2,"Attack",0,"Crit",0,"Vamp",0,"Empty",0,"Empty",0,"Empty",0,0)
rem[0]=0
for(ii=0;ii<3;ii+=1){
	if(itemArray[invenArray[selected,0],7+ii]==0){
		for(var i=0;i<3;i+=1){
			chance=0
			if(rem[0]!=0){
				for(var iii=1;iii<rem[0]+1;iii+=1){
					if((i*2)+1==rem[iii]){
						chance=1
					}
				}
			}
			if(chance==0){
				if(itemstatsArray[invenArray[selected,0],1+(i*2)]!=0){
					draw_text_ext_transformed(xps-0.5+198,yps+30+13+11+ii*11,itemstatsArray[invenArray[selected,0],0+(i*2)],0,1000,0.5,0.5,0)
					draw_text_ext_transformed(xps-0.5+230,yps+30+13+11+ii*11,itemstatsArray[invenArray[selected,0],1+(i*2)]+itemstatsArray[invenArray[selected,0],1+(i*2)]*(invenArray[selected,2]*0.2),0,1000,0.5,0.5,0)		
					rem[0]+=1
					rem[rem[0]]=(i*2)+1
					ii+=1
				}
			}
		}
	}
}
#endregion
	
				//Value
				draw_sprite_ext(map_icons_spr,73,xps-0.5+180+13,yps-1+82+14,1,1,0,c_white,1)

				draw_text_ext_transformed_color(xps-0.5+197+8,yps+98+2-1,floor((itemArray[invenArray[selected,0],4]+floor(invenArray[selected,2]*2))/2),0,1000,0.5,0.5,0,c_white,c_white,c_white,c_white,1)
				
				draw_sprite_ext(items_spr,chancefour,xps-0.5+196+8,yps-0.5+18,1,1,0,c_white,1)
				chance=colorgray
				if(invenArray[selected,2]==1){
					chance=colorgreen
				}else{
					if(invenArray[selected,2]==2){
						chance=colorblue
					}else{
						if(invenArray[selected,2]==3){
								if(targetpos<=0.4){
									chance=colorpurple
								}else{
									chance=colorpurpledark
								}
						}else{
							if(invenArray[selected,2]==4){
								if(targetpos<-0.2){
									chance=colorred
								}else{
									if(targetpos<0.2){
										chance=colorgoldmed
									}else{
										chance=colorgold
									}
								}
							}else{
				
							}				
						}				
					}				
				}
				draw_text_ext_transformed_color(xps-0.5+198,yps+30,itemArray[invenArray[selected,0],0],0,1000,0.5,0.5,0,chance,chance,chance,chance,1)
				draw_sprite_ext(map_icons_spr,80+invenArray[31,16]+invenArray[selected,2]*3,xps-0.5+203,yps+17-0.5,1,1,0,c_white,1)
			if(itemArray[invenArray[selected,0],2]==1){
				//Equip Icon
				draw_sprite_ext(ui_med_spr,6,xps-0.5+187+1,yps-0.5+102,1,1,0,c_white,1)
				//Stats
				draw_text_ext_transformed(xps-0.5+198,yps+30+13,"Ally",0,1000,0.5,0.5,0)
				draw_text_ext_transformed(xps-0.5+230,yps+30+13,"Pet",0,1000,0.5,0.5,0)
				draw_text_ext_transformed(xps-0.5+198,yps+30+13+11,"Damage",0,1000,0.5,0.5,0)
				draw_text_ext_transformed(xps-0.5+230,yps+30+13+11,itemArray[invenArray[selected,0],8]+itemArray[invenArray[selected,0],8]*(invenArray[selected,2]*0.2),0,1000,0.5,0.5,0)
				draw_text_ext_transformed(xps-0.5+198,yps+30+13+11*2,"AtkCD",0,1000,0.5,0.5,0)
				draw_text_ext_transformed(xps-0.5+230,yps+30+13+11*2,itemArray[invenArray[selected,0],9]/60,0,1000,0.5,0.5,0)
				draw_text_ext_transformed(xps-0.5+198,yps+30+13+11*3,"Speed",0,1000,0.5,0.5,0)
				if(Control.invenArray[selected,0]==5||Control.invenArray[selected,0]==6){
					chance=Control.itemArray[Control.invenArray[selected,0],10]+(Control.itemArray[Control.invenArray[selected,0],10]*(Control.invenArray[selected,2]*0.2))+itemArray[invenArray[selected,0],11]+(Control.itemArray[Control.invenArray[selected,0],11]*(Control.invenArray[selected,2]*0.2))
				}else{
					chance=Control.itemArray[Control.invenArray[selected,0],10]+itemArray[invenArray[selected,0],11]
				}
				draw_text_ext_transformed(xps-0.5+230,yps+30+13+11*3,chance,0,1000,0.5,0.5,0)
				if(itemArray[invenArray[selected,0],14]>0){
					draw_text_ext_transformed(xps-0.5+198,yps+30+13+11*4,"Vamp",0,1000,0.5,0.5,0)
					draw_text_ext_transformed(xps-0.5+230,yps+30+13+11*4,string(itemArray[invenArray[selected,0],14]+itemArray[invenArray[selected,0],14]*(invenArray[selected,2]*0.2)) + "%",0,1000,0.5,0.5,0)
				}
					//Pet
					draw_sprite_ext(ui_med_spr,15,xps-0.5+222+1,yps-0.5+94,1,1,0,c_white,1)
					chance=invenArray[31,4]
					chancefour=itemArray[invenArray[selected,0],7]
					if(invenArray[selected,2]>=3){
						chancefour=itemArray[invenArray[selected,0]+1,7]
					}	
					draw_sprite_ext(enemy_three_spr,chancefour+chance*0.1,xps-0.5+237+2,yps-0.5+113,1,1,0,c_white,1)
			}else{
				if(itemArray[invenArray[selected,0],2]==0){
					
					//Equip Icon
					draw_sprite_ext(ui_med_spr,4,xps-0.5+187+1,yps-0.5+102,1,1,0,c_white,1)			
					
						//Stats
						draw_text_ext_transformed(xps-0.5+198,yps+30+13,"Passive",0,1000,0.5,0.5,0)
						draw_text_ext_transformed(xps-0.5+230,yps+30+13,"Stats",0,1000,0.5,0.5,0)

						if(itemArray[invenArray[selected,0],7]!=0){
							draw_text_ext_transformed(xps-0.5+198,yps+30+13+11,itemArray[invenArray[selected,0]+1,7],0,1000,0.5,0.5,0)
							if(itemArray[invenArray[selected,0]+1,7]=="CD"){
								draw_text_ext_transformed(xps-0.5+230,yps+30+13+11,floor((itemArray[invenArray[selected,0],8]-(itemArray[invenArray[selected,0],8]*(invenArray[selected,2]*0.05)))/60),0,1000,0.5,0.5,0)
							}else{
								draw_text_ext_transformed(xps-0.5+230,yps+30+13+11,itemArray[invenArray[selected,0],7],0,1000,0.5,0.5,0)
							}
						}
						if(itemArray[invenArray[selected,0],8]!=0){
							draw_text_ext_transformed(xps-0.5+198,yps+30+13+22,itemArray[invenArray[selected,0]+1,8],0,1000,0.5,0.5,0)
							if(itemArray[invenArray[selected,0]+1,8]=="CD"){
								draw_text_ext_transformed(xps-0.5+230,yps+30+13+22,floor((itemArray[invenArray[selected,0],8]-(itemArray[invenArray[selected,0],8]*(invenArray[selected,2]*0.05)))/60),0,1000,0.5,0.5,0)
							}else{
								draw_text_ext_transformed(xps-0.5+230,yps+30+13+22,itemArray[invenArray[selected,0],8],0,1000,0.5,0.5,0)
							}
						}
					/*
						draw_text_ext_transformed(xps-0.5+198,yps+30+13+11,itemArray[invenArray[selected,0]+1,7],0,1000,0.5,0.5,0)
						if(itemArray[invenArray[selected,0],1]!=2){
							if(itemArray[invenArray[selected,0],1]!=4){
								draw_text_ext_transformed(xps-0.5+230,yps+30+13+11,itemArray[invenArray[selected,0],7]+(itemArray[invenArray[selected,0],7]*(invenArray[selected,2]*0.2)),0,1000,0.5,0.5,0)
							}else{
								if(itemArray[invenArray[selected,0],1]==4){
								draw_text_ext_transformed(xps-0.5+230,yps+30+13+11,string(itemArray[invenArray[selected,0],8]+(invenArray[selected,2]*itemArray[invenArray[selected,0],14])) + "%",0,1000,0.5,0.5,0)		
								}
							}
						}else{
							draw_text_ext_transformed(xps-0.5+230,yps+30+13+11,itemArray[invenArray[selected,0],7]+invenArray[selected,2],0,1000,0.5,0.5,0)
						}
					*/
				}else{
					//Active 
					if(itemArray[invenArray[selected,0],2]==2){
						draw_sprite_ext(ui_med_spr,8,xps-0.5+187+1,yps-0.5+102,1,1,0,c_white,1)		
						//Stats
						draw_text_ext_transformed(xps-0.5+198,yps+30+13,"Active",0,1000,0.5,0.5,0)
						draw_text_ext_transformed(xps-0.5+230,yps+30+13,itemArray[invenArray[selected,0]+1,8],0,1000,0.5,0.5,0)
						draw_text_ext_transformed(xps-0.5+198,yps+30+13+11,"CD",0,1000,0.5,0.5,0)
						draw_text_ext_transformed(xps-0.5+230,yps+30+13+11,(itemArray[invenArray[selected,0],9]-(itemArray[invenArray[selected,0],9]*(invenArray[selected,2]*0.05)))/60,0,1000,0.5,0.5,0)
						if(itemArray[invenArray[selected,0]+1,10]!=0){
							draw_text_ext_transformed(xps-0.5+198,yps+30+13+11*2,itemArray[invenArray[selected,0]+1,10],0,1000,0.5,0.5,0)
							draw_text_ext_transformed(xps-0.5+230,yps+30+13+11*2,itemArray[invenArray[selected,0],10]+(itemArray[invenArray[selected,0],10]*(invenArray[selected,2]*itemArray[invenArray[selected,0],11])),0,1000,0.5,0.5,0)
						}
					}else{
						//Passive Time Cooldown 
						if(itemArray[invenArray[selected,0],2]==5){
							draw_sprite_ext(ui_med_spr,8,xps-0.5+187,yps-0.5+102,1,1,0,c_white,1)		
							//Stats
							draw_text_ext_transformed(xps-0.5+198,yps+30+13,"Passive",0,1000,0.5,0.5,0)
							draw_text_ext_transformed(xps-0.5+230,yps+30+13,"Time",0,1000,0.5,0.5,0)
							draw_text_ext_transformed(xps-0.5+198,yps+30+13+11,"CD",0,1000,0.5,0.5,0)
							draw_text_ext_transformed(xps-0.5+230,yps+30+13+11,(itemArray[invenArray[selected,0],9]-(itemArray[invenArray[selected,0],9]*(invenArray[selected,2]*0.05))),0,1000,0.5,0.5,0)
							draw_text_ext_transformed(xps-0.5+198,yps+30+13+11*2,itemArray[invenArray[selected,0]+1,10],0,1000,0.5,0.5,0)
							draw_text_ext_transformed(xps-0.5+230,yps+30+13+11*2,itemArray[invenArray[selected,0],10],0,1000,0.5,0.5,0)
						
						}else{
							//Utility
							if(itemArray[invenArray[selected,0],2]==10){
								//Reset Token
								if(invenArray[selected,0]==23){
									draw_sprite_ext(ui_med_spr,8,xps-0.5+187,yps-0.5+102,1,1,0,c_white,1)		
									//Stats
									draw_text_ext_transformed(xps-0.5+198,yps+30+13,"Instant",0,1000,0.5,0.5,0)
									draw_text_ext_transformed(xps-0.5+230,yps+30+13,"Reset",0,1000,0.5,0.5,0)
									draw_text_ext_transformed(xps-0.5+198,yps+30+13+11,itemArray[invenArray[selected,0]+1,7],0,1000,0.5,0.5,0)
									draw_text_ext_transformed(xps-0.5+230,yps+30+13+11,itemArray[invenArray[selected,0],7],0,1000,0.5,0.5,0)
									//draw_text_ext_transformed(xps-0.5+198,yps+30+13+11*2,itemArray[invenArray[selected,0]+1,10],0,1000,0.5,0.5,0)
									//draw_text_ext_transformed(xps-0.5+230,yps+30+13+11*2,itemArray[invenArray[selected,0],10],0,1000,0.5,0.5,0)
								}else{
									//Heal heart
									if(invenArray[selected,0]==25){
										draw_sprite_ext(ui_med_spr,8,xps-0.5+187,yps-0.5+102,1,1,0,c_white,1)		
										//Stats
										draw_text_ext_transformed(xps-0.5+198,yps+30+13,"Instant",0,1000,0.5,0.5,0)
										draw_text_ext_transformed(xps-0.5+230,yps+30+13,"Heal",0,1000,0.5,0.5,0)
										draw_text_ext_transformed(xps-0.5+198,yps+30+13+11,itemArray[invenArray[selected,0]+1,7],0,1000,0.5,0.5,0)
										draw_text_ext_transformed(xps-0.5+230,yps+30+13+11,itemArray[invenArray[selected,0],7],0,1000,0.5,0.5,0)
										//draw_text_ext_transformed(xps-0.5+198,yps+30+13+11*2,itemArray[invenArray[selected,0]+1,10],0,1000,0.5,0.5,0)
										//draw_text_ext_transformed(xps-0.5+230,yps+30+13+11*2,itemArray[invenArray[selected,0],10],0,1000,0.5,0.5,0)
									}else{
								
									}								
								}
							}else{
				
							}				
						}				
					}				
				}
			}
		}
	}
if(pauseopt==0){
	//Pet overall
	if(invenArray[21,0]!=0){
		draw_sprite_ext(map_icons_spr,80+invenArray[31,16]+invenArray[21,2]*3,xps-0.5+29+4,yps-0.5+46,1,1,0,c_white,1)
		chance=invenArray[31,13]
			chancefour=itemArray[invenArray[21,0],7]
			if(invenArray[21,2]>=3){
				chancefour=itemArray[invenArray[21,0]+1,7]
			}	
		draw_sprite_ext(enemy_three_spr,chancefour+chance*0.1,xps-0.5+29,yps-0.5+42,1,1,0,c_white,1)		
	}
#region Player stats
						//Stats
						draw_text_ext_transformed(xps+120,yps+11,"Hp Total",0,1000,0.5,0.5,0)
						draw_text_ext_transformed(xps+167,yps+11,invenArray[24,3]+Me.hptotal,0,1000,0.5,0.5,0)
						draw_text_ext_transformed(xps+120,yps+11+11,"Attack %",0,1000,0.5,0.5,0)
						draw_text_ext_transformed(xps+167,yps+11+11,invenArray[25,3],0,1000,0.5,0.5,0)
						draw_text_ext_transformed(xps+120,yps+11+22,"Crit %",0,1000,0.5,0.5,0)
						draw_text_ext_transformed(xps+167,yps+11+22,invenArray[26,3],0,1000,0.5,0.5,0)
						draw_text_ext_transformed(xps+120,yps+11+33,"Vamp %",0,1000,0.5,0.5,0)
						draw_text_ext_transformed(xps+167,yps+11+33,invenArray[24,4],0,1000,0.5,0.5,0)
#endregion

	
	}else{
		if(pauseopt==1){
			
			if(invenArray[30,0]>=40&&invenArray[30,0]<45){
				draw_sprite_ext(map_icons_spr,76,xps-0.5+58,yps-1+14+targetpos/2,1,1,0,c_white,1)	
			}else{
				draw_sprite_ext(map_icons_spr,76,xps-0.5+58,yps-1+14,1,1,0,c_white,1)	
			}
				
			draw_text_ext_transformed(xps+74,yps+17,"Buy Item",0,1000,0.5,0.5,0)
			if(invenArray[30,0]<21){
				draw_sprite_ext(map_icons_spr,74,xps-0.5+159,yps-1+14+targetpos/2,1,1,0,c_white,1)	
			}else{
				draw_sprite_ext(map_icons_spr,74,xps-0.5+159,yps-1+14,1,1,0,c_white,1)	
			}
			draw_text_ext_transformed(xps+175,yps+17,"Sell",0,1000,0.5,0.5,0)
		}	
	}
	if(invenArray[30,0]!=999){
				chancefour=invenArray[invenArray[30,0],0]
				if(invenArray[invenArray[30,0],2]>=3){
					chancefour+=1
				}
		draw_sprite_ext(items_spr,chancefour,mouse_x,mouse_y,1,1,0,c_white,1)
	}

}
#endregion

// Only draw level UI when game is initialized
if(game_initialized){
	if(lvlArray[1010,30]==1) {
		draw_sprite_ext(maptest_spr,30,xps-0.5,yps-0.5,1,1,0,c_white,1)
		draw_sprite_ext(map_icons_spr,60,xps-0.5,yps-0.5+5-6,1,1,0,c_white,1)
		draw_sprite_ext(enemy_abil_spr,80+lvlArray[1010,31],xps-0.5+21,yps-0.5+6,1,1,0,c_white,1)
		draw_sprite_ext(enemy_abil_spr,80+lvlArray[1010,32],xps-0.5+21+9,yps-0.5+6,1,1,0,c_white,1)
		draw_sprite_ext(enemy_abil_spr,80+lvlArray[1010,33],xps-0.5+21+18,yps-0.5+6,1,1,0,c_white,1)

		draw_sprite_ext(healthbar_spr,20,xps+18,yps-0.5+9-(targetpos/3),1,1,0,c_white,1)

		if(lvlArray[1010,20]!=0){
			draw_sprite_ext(healthbar_spr,5,xps-1+196,yps-0.5+137-8+(targetpos/3),1,1,0,c_white,1)

			draw_sprite_ext(enemy_abil_spr,80+lvlArray[1010,20].item,xps-0.5+198,yps-0.5+137,1,1,0,c_white,1)
			if(lvlArray[1010,25]!=0){
			draw_sprite_ext(enemy_abil_spr,80+lvlArray[1010,25].item,xps-0.5+198+9,yps-0.5+137,1,1,0,c_white,1)
				if(lvlArray[1010,26]!=0){
				draw_sprite_ext(enemy_abil_spr,80+lvlArray[1010,26].item,xps-0.5+198+18,yps-0.5+137,1,1,0,c_white,1)
				}
			}
		}
	}
	if(pause==0){
		if(lvlArray[1000,7]>90){
			draw_sprite_ext(maptest_spr,29,xps-0.5,yps-0.5-40,1,1,0,c_white,1)
			draw_sprite(map_icons_spr,lvlArray[1000,0],xps-70+(255/2),yps+(143/2)-48)

				draw_text_ext_transformed(xps+(255/2)-string_width( string(lvlArray[1010,24]))/3.5,yps+(143/2)-3.5-40, string(lvlArray[1010,24]) ,0,1000,0.5,0.5,0)
				//draw_text_ext_transformed(xps+(255/2)-(string_width( " Waves Remain" + string(lvlArray[1000,2]+1))/3.5),yps+(143/2)-3.5-40, string(lvlArray[1000,2]+1) + " Waves Remain" ,0,1000,0.5,0.5,0)


		}
		if(lvlArray[1010,0]>1){
			draw_sprite(maptest_spr,29,xps-0.5,yps-0.5-40)
			draw_sprite(map_icons_spr,lvlArray[1000,0],xps-70+(255/2),yps+(143/2)-48)
			draw_text_ext_transformed(xps+(255/2)-(string_width("Dream Stage Complete")/3.9),yps+(143/2)-3.5-40, "Dream Stage Complete" ,0,1000,0.5,0.5,0)
		}
	}
}
}

#region Talent UI
if(pause==2&&pauseopt==2){

		//Mask UI
			//draw_text_ext_transformed(xps-0.5+3+55,yps+11, talentmapuiArray[0,101] ,0,1000,0.5,0.5,0)
			//draw_text_ext_transformed(xps-0.5+3+65,yps+11, talentmapuiArray[0,102] ,0,1000,0.5,0.5,0)
			
			draw_text_ext_transformed(xps-0.5+3,yps+11, classArray[Me.class,0] ,0,1000,0.5,0.5,0)
			draw_sprite(map_icons_spr,15+Me.class,xps+42.5,yps+8-0.5)
			
			// Switch Mask Button
			var button_x = xps + 62;
			var button_y = yps + 5;
			var button_width = 30;
			var button_height = 10;
			var button_hover = (mouse_x >= button_x && mouse_x < button_x + button_width && 
			                   mouse_y >= button_y && mouse_y < button_y + button_height) ||
			                  (cursor_mode == 1 && selected == 997);
			
			// Draw button background
			if(button_hover){
				draw_sprite_ext(ui_med_spr, 17, button_x - 4, button_y - 2, button_width/16 + 0.5, 0.875, 0, c_white, 1);
			}else{
				draw_sprite_ext(ui_med_spr, 18, button_x - 4, button_y - 2, button_width/16 + 0.5, 0.875, 0, c_white, 0.7);
			}
			
			// Draw button text
			draw_text_ext_transformed(button_x + 2, button_y + 2, "Switch", 0, 1000, 0.4, 0.4, 0)
			
			draw_text_ext_transformed(xps-0.5+3,yps+24, "Lvl" ,0,1000,0.5,0.5,0)
			draw_text_ext_transformed(xps-0.5+23-(string_length(string(classArray[Me.class,1]))*2)+4,yps+24, classArray[Me.class,1] ,0,1000,0.5,0.5,0)
			
			//Experience bar
			chance=0
			for(var i=0;i<20;i+=1){
				if(i mod 2==0){
					if(chance==1){
						chance=0
					}else{
						chance=1
					}
				}
				//level amount
				if(i<(classArray[Me.class,2]/classArray[Me.class,3])*20){
					if(chance==0){
						draw_sprite_part(maptest_spr,40,2,39,1,10,xps-0.5+36+i,yps-0.5+23)
					}else{
						draw_sprite_part(maptest_spr,40,4,39,1,10,xps-0.5+36+i,yps-0.5+23)
					}
				}else{
					if(chance==0){
						draw_sprite_part(maptest_spr,40,8,39,1,10,xps-0.5+36+i,yps-0.5+23)
					}else{
						draw_sprite_part(maptest_spr,40,10,39,1,10,xps-0.5+36+i,yps-0.5+23)
					}
				}
			}
			//Experience out of total needed
				draw_text_ext_transformed(xps+2,yps+37, "XP" ,0,1000,0.5,0.5,0)
				draw_text_ext_transformed(xps+16-(string_length(string(classArray[Me.class,2]))*2)+5.25,yps+37, classArray[Me.class,2] ,0,1000,0.5,0.5,0)
				draw_text_ext_transformed(xps+31,yps+37, "of" ,0,1000,0.5,0.5,0)
				draw_text_ext_transformed(xps+42-(string_length(string(classArray[Me.class,3]))*2)+5.25,yps+37, classArray[Me.class,3] ,0,1000,0.5,0.5,0)
				
			//Unspent point UI
				draw_text_ext_transformed(xps-0.5+3,yps+50, "Talent" ,0,1000,0.5,0.5,0)
				draw_text_ext_transformed(xps-0.5+3+25,yps+50, "Pts" ,0,1000,0.5,0.5,0)
					chance=classArray[Me.class,5]-classArray[Me.class,4]
					if(talentmapuiArray[0,104]==101){
						draw_sprite(ui_med_spr,20,xps-0.5+35,yps-0.5+38)
						
						draw_text_ext_transformed_color(xps-0.5+46-(string_length(string(chance))*2)+4,yps+50, classArray[Me.class,5]-classArray[Me.class,4] ,0,1000,0.5,0.5,0,hurtcolor,hurtcolor,hurtcolor,hurtcolor,1)
					}else{
						
						draw_text_ext_transformed(xps-0.5+46-(string_length(string(chance))*2)+4,yps+50, classArray[Me.class,5]-classArray[Me.class,4] ,0,1000,0.5,0.5,0)
					}

		
		for(var a=0;a<7;a+=1){
			for(var b=0;b<6;b+=1){
				if(talentmapuiArray[a,b]!=0){
					//Select Background
					chance=0
					if(a==talentmapuiArray[0,101]&&b==talentmapuiArray[0,102]){
						draw_sprite(ui_med_spr,17,xps-0.5+61-8+a*19,yps-0.5+14-8+b*19)
						chance=targetpos/2
					}else{	
						//Can put points into background
						if(classArray[Me.class,1]>=talentmapArray[talentmapuiArray[a,b],6]){
							chancetwo=talentmapArray[talentmapuiArray[a,b],5]
							if(talentmapArray[chancetwo,1]>=talentmapArray[chancetwo,2]||talentmapArray[talentmapuiArray[a,b],5]==0){
								draw_sprite(ui_med_spr,18,xps-0.5+61-8+a*19,yps-0.5+14-8+b*19)	
							}
						}
					}
						//Red Can't place because ability already in same slot
						//if(talentmapArray[talentmapuiArray[a,b],2]){
						if(talentmapuiArray[a,b]>=4&&talentmapuiArray[a,b]<7&&talentmapArray[7,1]>0||talentmapuiArray[a,b]>=7&&talentmapuiArray[a,b]<10&&talentmapArray[4,1]>0||talentmapuiArray[a,b]>=10&&talentmapuiArray[a,b]<13&&talentmapArray[13,1]>0||talentmapuiArray[a,b]>=13&&talentmapuiArray[a,b]<16&&talentmapArray[10,1]>0){
							draw_sprite(ui_med_spr,21,xps-0.5+61-8+a*19,yps-0.5+14-8+b*19)
						}
					if(talentmapuiArray[0,104]==talentmapuiArray[a,b]){
						draw_sprite(ui_med_spr,19,xps-0.5+61-8+a*19,yps-0.5+14-8+b*19)	
					}
					
					if(talentmapArray[talentmapuiArray[a,b],1]==0){
						
						draw_sprite(talent_spr,talentmapuiArray[a,b]+24+48*(Me.class-1),xps-0.5+61+a*19,yps-0.5+14+b*19+chance)
					}else{
										
						draw_sprite(talent_spr,talentmapuiArray[a,b]+48*(Me.class-1),xps-0.5+61+a*19,yps-0.5+14+b*19+chance)
					}
					
					//Inheritence markers
					if(classArray[Me.class,1]>=talentmapArray[talentmapuiArray[a,b],6]){
						//Blue inheritence marker
						for(var i=0;i<talentmapArray[talentmapuiArray[a,b],4];i+=1){
							draw_sprite_part(maptest_spr,40,0,31,3,3,xps-0.5+60+15-i*2+a*19,yps-0.5+13+b*19)
						}
					}else{
						//Brown inheritence marker
						for(var i=0;i<talentmapArray[talentmapuiArray[a,b],4];i+=1){
							draw_sprite_part(maptest_spr,40,0,35,3,3,xps-0.5+60+15-i*2+a*19,yps-0.5+13+b*19)
						}					
					}
					
					//Talent points icons
					for(var i=0;i<talentmapArray[talentmapuiArray[a,b],2];i+=1){
						//Green
						if(i<talentmapArray[talentmapuiArray[a,b],1]){
							if(i mod 2 ==0){
								draw_sprite_part(maptest_spr,40,4,31,1,3,xps-0.5+61+i+a*19,yps-0.5+14+b*19)
							}else{
								draw_sprite_part(maptest_spr,40,6,31,1,3,xps-0.5+61+i+a*19,yps-0.5+14+b*19)
							}
						}else{
							//Brown
								if(i mod 2 ==0){
									draw_sprite_part(maptest_spr,40,8,31,1,3,xps-0.5+61+i+a*19,yps-0.5+14+b*19)
								}else{
									draw_sprite_part(maptest_spr,40,10,31,1,3,xps-0.5+61+i+a*19,yps-0.5+14+b*19)
								}
						}
						
					}
					
					//draw_text_ext_transformed(xps-0.5+61+a*19,yps-0.5+14+b*19, talentmapuiArray[a,b] ,0,1000,0.5,0.5,0)
					//Select
					if(a==talentmapuiArray[0,101]){
						if(b==talentmapuiArray[0,102]){
							draw_sprite(ui_med_spr,16,xps-0.5+61-8+a*19,yps-0.5+14-8+b*19)
						}
					}
				}
				//draw_text_ext_transformed(xps-0.5+61+a*19,yps-0.5+14+b*19, a ,0,1000,0.5,0.5,0)
				//draw_text_ext_transformed(xps-0.5+61+10+a*19,yps-0.5+14+b*19, b ,0,1000,0.5,0.5,0)
			}
		}

		
		//Locked level bar
		for(var i=0;i<6;i+=1){
			if(classArray[Me.class,1]<i*5){
				draw_sprite_part(maptest_spr,40,0,18,134,12,xps+59-0.5,yps+109-i*19)
				draw_text_ext_transformed(xps+59-0.5+66,yps+109+2.5-i*19, i*5 ,0,1000,0.5,0.5,0)
			}
		}
		
		//Specific Talent UI
		if(talentmapuiArray[0,101]<100&&talentmapuiArray[0,102]<100){
			
			chance=talentmapuiArray[talentmapuiArray[0,101],talentmapuiArray[0,102]]
			if(chance!=0){
				if(talentmapArray[chance,1]==0){
						
					draw_sprite(talent_spr,chance+24+((Me.class-1)*48),xps-0.5+196,yps-0.5+10)
					
					if(classArray[Me.class,1]<talentmapArray[chance,6]){
						//draw_sprite_part(maptest_spr,40,0,50,8,10,xps-0.5+198,yps-0.5+53)
						//draw_text_ext_transformed(xps-0.5+210,yps+43+11, "Level" ,0,1000,0.5,0.5,0)
						//draw_text_ext_transformed(xps-0.5+228+6,yps+43+11, talentmapArray[chance,6] ,0,1000,0.5,0.5,0)
					}
					
					
					chancetwo=talentmapArray[talentmapArray[chance,5],0]
					if(talentmapArray[talentmapArray[chance,5],0]!=0){
						//draw_sprite_part(maptest_spr,40,0,50,8,10,xps-0.5+198,yps-0.5+53+11)
						
						//draw_text_ext_transformed(xps-0.5+210,yps+43+22, chancetwo ,0,1000,0.5,0.5,0)
					}
				}else{
										
					draw_sprite(talent_spr,chance+((Me.class-1)*48),xps-0.5+196,yps-0.5+10)
				}
				
				//Name
				draw_text_ext_transformed(xps-0.5+197,yps+30, talentmapArray[chance,0] ,0,1000,0.5,0.5,0)
				
				//Talent type
				draw_text_ext_transformed(xps-0.5+197,yps+43, "Talent" ,0,1000,0.5,0.5,0)
				draw_text_ext_transformed(xps-0.5+224,yps+43, talentmapArray[chance,7] ,0,1000,0.5,0.5,0)
				
				//Description
				if(Me.class==6&&chance>=1&&chance<=23){
					var _desc=""
					if(chance==1){
						_desc="Extends punch reach by +"+string(talentmapArray[1,1]*0.3)+" per point"
					}else if(chance==2){
						_desc="Punch damage +"+string(talentmapArray[2,1]*5)+"% per point"
					}else if(chance==3){
						_desc="Unlocks a 3rd combo hit with a heavy punch"
					}else if(chance==4){
						_desc="Dash forward dealing "+string(5+floor(5*talentmapArray[6,1]*0.25))+" dmg and bouncing off enemies"
					}else if(chance==5){
						_desc="Doughnut cooldown reduced by "+string(talentmapArray[5,1]*5)+"% of base"
					}else if(chance==6){
						_desc="Doughnut dmg +"+string(talentmapArray[6,1]*25)+"% Press Q to extend flight"
					}else if(chance==7){
						_desc="Chargable toast attack 50% armor while toasting"
					}else if(chance==8){
						_desc="Toast CD -"+string(talentmapArray[8,1]*20)+" Flight +"+string(talentmapArray[8,1]*18)+" Speed +"+string(talentmapArray[8,1]*0.02)
					}else if(chance==9){
						_desc="Toast dmg +"+string(talentmapArray[9,1]*25)+"% CD -"+string(talentmapArray[9,1]*25)+"%"
					}else if(chance==10){
						_desc="Charge a waffle then release a projectile that slows enemies on hit"
					}else if(chance==11){
						_desc=talentmapArray[chance,8]
					}else if(chance==12){
						_desc="Unlocks extra charge stage Waffle dmg +"+string(talentmapArray[12,1]*25)+"%"
					}else if(chance==13){
						_desc="Drop a cereal bowl that deals "+string(15+floor(15*talentmapArray[15,1]*0.25+15*talentmapArray[14,1]*0.05))+" dmg scaling with fall speed"
					}else if(chance==14){
						_desc="Cereal damage +"+string(talentmapArray[14,1]*5)+"%"
					}else if(chance==15){
						_desc="Cereal damage +"+string(talentmapArray[15,1]*25)+"%"
					}else if(chance==16){
						_desc="Hold space to hover and glide Max fall speed reduced by "+string(talentmapArray[16,1]*0.35)
					}else if(chance==17){
						_desc="Extends hover time by +"+string(talentmapArray[17,1]*11)+" frames and reduces fall speed"
					}else if(chance==18){
						_desc="Spawns orbiting breakfast items while hovering that deal dmg on contact"
					}else if(chance==19){
						_desc=string(10+talentmapArray[20,1]*2)+"% chance to drop a healing pop tart when toast hits"
					}else if(chance==20){
						_desc="Pop tart drop +"+string(talentmapArray[20,1]*2)+"% Toast dmg +"+string(talentmapArray[20,1]*5)+"%"
					}else if(chance==21){
						_desc="Picking up pop tarts grants +25% speed and +25% faster cooldowns for 5s"
					}else if(chance==22){
						_desc=talentmapArray[chance,8]
					}else if(chance==23){
						_desc="Movement speed +"+string(talentmapArray[23,1]*3.4)+"%"
					}
					draw_text_ext_transformed(xps-0.5+197,yps+43+11,_desc,22,160,0.35,0.35,0)
				}else{
					draw_text_ext_transformed(xps-0.5+197,yps+43+11, talentmapArray[chance,8] ,0,1000,0.5,0.5,0)
					if(talentmapArray[chance,9]!=0){
						draw_text_ext_transformed(xps-0.5+197,yps+43+22, talentmapArray[chance,9] ,0,1000,0.5,0.5,0)
					}
				}
				
				//Cost
				draw_text_ext_transformed(xps-0.5+197,yps+87, "Cost" ,0,1000,0.5,0.5,0)
					if(talentmapuiArray[0,104]==101){
						
						draw_text_ext_transformed_color(xps+224+9,yps+87, talentmapArray[chance,3] ,0,1000,0.5,0.5,0,hurtcolor,hurtcolor,hurtcolor,hurtcolor,1)
					}else{
						
						draw_text_ext_transformed(xps+224+9,yps+87, talentmapArray[chance,3] ,0,1000,0.5,0.5,0)
					}
				
				
				//Total points
				draw_text_ext_transformed(xps+197,yps+98, "Points" ,0,1000,0.5,0.5,0)
				draw_text_ext_transformed(xps+224+2,yps+98, talentmapArray[chance,1] ,0,1000,0.5,0.5,0)
				draw_text_ext_transformed(xps+224+9,yps+98, "of" ,0,1000,0.5,0.5,0)
				draw_text_ext_transformed(xps+224+19,yps+98, talentmapArray[chance,2] ,0,1000,0.5,0.5,0)
			}
		}
		

		//talent menu abilbar
		chancetwo=targetpos/2
		for(var i=0;i<3;i+=1){
			draw_sprite_ext(ui_abilbar_spr,3,125+xps-10+i*12,yps+137+1.5,1,1,0,c_white,1)
			draw_sprite_part(maptest_spr,40,116,0,11,9,122+xps-13+i*12,yps+133+1.5)
			
			chancethree=1
			if(i==0){
				chancethree=0
			}else{
				if(i==1){
					if(Control.talentmapArray[10,1]>0||Control.talentmapArray[13,1]>0){
						chancethree=0
					}
				}else{
					if(i==2){
						if(Control.talentmapArray[4,1]>0||Control.talentmapArray[7,1]>0){
							chancethree=0
						}
					}else{
				
					}				
				}
			}		
		
				if(i==0){
					if(chance>=1&&chance<4){
						draw_sprite_part(maptest_spr,40,96,0,9,8,123+xps-13+i*12.96,yps+134+1.5)	
						draw_sprite_ext(abilcds_cd_spr,(i+1)+(20*(Me.class-1)),125+xps-10+i*12,yps+137+1.5+chancetwo,1,1,0,c_white,1)
					}else{
						draw_sprite_ext(abilcds_cd_spr,(i+1)+(20*(Me.class-1)),125+xps-10+i*12,yps+137+1.5,1,1,0,c_white,1)
					}
				}else{
					if(i==1){

							chancefour=0
						if(talentmapArray[13,1]>0){
							chancefour+=2
						}
							if(chance>=10&&chance<16){
									draw_sprite_part(maptest_spr,40,96,0,9,8,123+xps-13+i*12,yps+134+1.5)
										
										if(talentmapArray[10,1]>0&&chance>=13||talentmapArray[13,1]>0&&chance>=10&&chance<13){
											if(chancetwo>=0){
												draw_sprite_part(maptest_spr,40,106,0,9,8,123+xps-13+i*12,yps+134+1.5)
											}else{
												draw_sprite_part(maptest_spr,40,96,0,9,8,123+xps-13+i*12,yps+134+1.5)
											}
											
										}
								if(chancethree==0){		
									draw_sprite_ext(abilcds_cd_spr,(i+1)+(20*(Me.class-1))+chancefour,125+xps-10+i*12,yps+137+1.5+chancetwo,1,1,0,c_white,1)	
								}
							}else{
								if(chancethree==0){
									draw_sprite_ext(abilcds_cd_spr,(i+1)+(20*(Me.class-1))+chancefour,125+xps-10+i*12,yps+137+1.5,1,1,0,c_white,1)
								}
							}
					}else{
						if(i==2){
									chancefour=0
								if(talentmapArray[7,1]>0){
									chancefour+=2
								}
							if(chance>=4&&chance<10){
									draw_sprite_part(maptest_spr,40,96,0,9,8,121+xps-13+i*12.96,yps+134+1.5)
										
										if(talentmapArray[4,1]>0&&chance>=7||talentmapArray[7,1]>0&&chance>=4&&chance<7){
											if(chancetwo>=0){
												draw_sprite_part(maptest_spr,40,106,0,9,8,121+xps-13+i*12.96,yps+134+1.5)
											}else{
												draw_sprite_part(maptest_spr,40,96,0,9,8,123+xps-13+i*12,yps+134+1.5)
											}
											
										}
								if(chancethree==0){
									draw_sprite_ext(abilcds_cd_spr,(i+1)+(20*(Me.class-1))+chancefour,125+xps-10+i*12,yps+137+1.5+chancetwo,1,1,0,c_white,1)	
								}
							}else{
								if(chancethree==0){
									draw_sprite_ext(abilcds_cd_spr,(i+1)+(20*(Me.class-1))+chancefour,125+xps-10+i*12,yps+137+1.5,1,1,0,c_white,1)
								}
							}

						}else{

						}
					}
				}
				
				
		}
		//draw_text_ext_transformed(xps,yps,chancetwo,0,1000,0.5,0.5,0)
}
#endregion
#endregion
#region ME UI
// Only draw Me UI when game is initialized
if(game_initialized){
		//Me Details
		draw_sprite_ext(maptest_spr,25,xps-0.5,yps-0.5,1,1,0,c_white,1)
		draw_text_ext_transformed(xpstwo-9-(string_width(mapdataArray[1010,0])/4),ypstwo-9,mapdataArray[1010,0],0,1000,0.5,0.5,0)
			if(mapdataArray[1000,5]!=0){
				if(mapdataArray[1000,5]>0){
					draw_sprite_ext(maptest_spr,24,xps-0.5,yps-0.5,1,1,0,c_white,1)
					draw_text_ext_transformed(xpstwo-9-(string_width(mapdataArray[1000,5])/4),ypstwo-7-15,mapdataArray[1000,5],0,1000,0.5,0.5,0)
				}else{
					draw_sprite_ext(maptest_spr,38,xps-0.5,yps-0.5,1,1,0,c_white,1)
					draw_text_ext_transformed(xpstwo-9-(string_width(abs(mapdataArray[1000,5]))/4),ypstwo-7-15,abs(mapdataArray[1000,5]),0,1000,0.5,0.5,0)
				}
			}

		/*with(Arcade_five){
			draw_sprite_ext(sprite_index,image_index,x,y,1,1,image_angle,c_white,1)
		}*/

with(Me){
	xps=other.xps+4
	ypsthree=other.ypstwo-5-other.hurtdraw
	chance=(((hptotal/4)*7)/2)-3.5
	
			/*
			for(i=0;i<(hptotal/4);i+=1){
					draw_sprite_ext(icons_spr,4,xps+i*10,ypsthree,1,1,0,c_white,1)

				if(i<((hp+hurtamount)/4)){
					if(i<floor((hp+hurtamount)/4)){
					draw_sprite_ext(icons_spr,5,xps+i*10,ypsthree,1,1,0,c_white,1)
					}else{
					draw_sprite_ext(icons_spr,5+((hp+hurtamount) mod 4),xps+i*10,ypsthree,1,1,0,c_white,1)
					}
				}	

				if(i<(hp/4)){
					if(i<floor(hp/4)){
					draw_sprite_ext(icons_spr,0,xps+i*10,ypsthree,1,1,0,c_white,1)
					}else{
					draw_sprite_ext(icons_spr,(hp mod 4),xps+i*10,ypsthree,1,1,0,c_white,1)
					}
				}
				if(hp<=0){
					draw_sprite_ext(icons_spr,9,xps+i*10,ypsthree,1,1,0,c_white,1)
				}else{
					if(hurttimer>hurttimertotal-14||other.animationtick==1&&hp<=4){
						if(other.pause==0){
							draw_sprite_ext(maptest_spr,27,other.xps-0.5,other.yps-0.5,1,1,0,c_white,1)
						}
						draw_sprite_ext(icons_spr,9,xps+i*10,ypsthree,1,1,0,c_white,1)
					}	
				}
				
			}
			*/
			
			
			/*
			//Health Bar New
			if(hurttimer>0){
				draw_text_transformed_color(xps-5,ypsthree-6,floor(Me.hp*10),0.4,0.4,0,Control.hurtcolor,Control.hurtcolor,Control.hurtcolor,Control.hurtcolor,1)
			}else{
				draw_text_transformed(xps-5,ypsthree-6,floor(Me.hp*10),0.4,0.4,0)
			}
			draw_text_transformed(xps-5,ypsthree,Me.hptotal*10,0.4,0.4,0)
			*/
			
			for(var i=0;i<hptotal+2;i+=1){
				//Border
				if(i==0||i==hptotal+1){
					draw_sprite_ext(icons_spr,69,xps+29.5+i*1,ypsthree+2.5,1,1,0,c_white,1)
				}else{
					if(i<=hp){
						//Main
						if(i mod 2==0){
							draw_sprite_ext(icons_spr,70,xps+29.5+i*1,ypsthree+2.5,1,1,0,c_white,1)
						}else{
							draw_sprite_ext(icons_spr,71,xps+29.5+i*1,ypsthree+2.5,1,1,0,c_white,1)
						}
					}else{
						//Hurt Amount
						if(i<=hp+hurtamount){
							if(i mod 2==0){
								draw_sprite_ext(icons_spr,72,xps+29.5+i*1,ypsthree+2.5,1,1,0,c_white,1)
							}else{
								draw_sprite_ext(icons_spr,73,xps+29.5+i*1,ypsthree+2.5,1,1,0,c_white,1)
							}						
						}else{
							//Empty
							if(i mod 2==0){
								draw_sprite_ext(icons_spr,74,xps+29.5+i*1,ypsthree+2.5,1,1,0,c_white,1)
							}else{
								draw_sprite_ext(icons_spr,75,xps+29.5+i*1,ypsthree+2.5,1,1,0,c_white,1)
							}		
						}
					}
				}
			}
			
			//xptotal=classArray[Me.class,5]
			//xp=Me.classArray[Me.class,2]
			//XP Bar New (uses rogue stats when in rogue mode)
			//if(hurttimer>0){
			//	draw_text_transformed_color(xps-5,ypsthree-6,floor(Me.hp*10),0.4,0.4,0,Control.hurtcolor,Control.hurtcolor,Control.hurtcolor,Control.hurtcolor,1)
			//}else{

			// Use rogue stats in rogue mode, adventure stats otherwise
			if(Control.rogue_mode){
				level=Control.rogue_level
				xp=Control.rogue_xp_display  // Use visual XP for smooth fill
				xptotal=Control.rogue_xp_needed
			}else{
				level=Control.classArray[Me.class,1]
				xp=Control.classArray[Me.class,2]
				xptotal=Control.classArray[Me.class,3]
			}
			
			chance=0
			if(level>9){
				chance=1.5
				if(level>19){
					chance=2
				}
			}

			
			if(Control.levelup>0){

				chancetwo=c_white
				if(Control.levelup>Control.leveluptotal-20){
					chancetwo=Control.colorgoldmed
				}else{
					if(Control.levelup>Control.leveluptotal-40){
						chancetwo=Control.colorgoldlight
					}else{
						if(Control.levelup>Control.leveluptotal-60){
							chancetwo=Control.colorgold
						}else{
			
						}			
					}			
				}

				draw_sprite_ext(maptest_spr,93,Control.xps-0.5,Control.yps-0.5,1,1,0,c_white,1)	
				
				draw_text_transformed_color(xps+15-chance,ypsthree-5,level,0.5,0.5,0,chancetwo,chancetwo,chancetwo,chancetwo,1)
				
				//draw_text_transformed_color(xps+99-chance,Control.yps+2,level,0.5,0.5,0,chancetwo,chancetwo,chancetwo,chancetwo,1)
				
				draw_text_transformed(xps+99-chance,Control.yps+2,level,0.5,0.5,0)
				draw_text_transformed(xps+99+22,Control.yps+2,"Level Up",0.5,0.5,0)
				
				draw_sprite_ext(map_icons_spr,15+Me.class,xps+79.5,Control.yps-1.5,1,1,0,c_white,1)
			}else{
				draw_text_transformed(xps+15-chance,ypsthree-5,level,0.5,0.5,0)
			}
			
			draw_sprite_ext(map_icons_spr,15+Me.class,xps-4.5,ypsthree-8.5,1,1,0,c_white,1)

			// Use appropriate pending XP based on mode
			// In rogue mode: pending shows XP waiting to fill + XP that's filling
			var pending_xp
			if(Control.rogue_mode){
				// Show pending orbs + the difference between actual and displayed XP
				pending_xp = Control.rogue_xpamount + (Control.rogue_xp - Control.rogue_xp_display)
			}else{
				pending_xp = Control.xpamount
			}
			xpamount=(xp/xptotal)*100
			xpamounttwo=((xp+pending_xp)/xptotal)*100
		//		draw_text_transformed(xps-5,ypsthree-6-20,floor(xp),0.4,0.4,0)
			//}
		//	draw_text_transformed(xps-5,ypsthree-20,Me.xptotal,0.4,0.4,0)
		//	draw_text_transformed(xps-5,ypsthree-20,Me.xptotal,0.4,0.4,0)
			
			
			
			chance=1
			for(var i=0;i<102;i+=1){

						if(chance==0){
							draw_sprite_ext(icons_spr,78,xps+75+i*1,ypsthree+7,1,1,0,c_white,1)
						}else{
							draw_sprite_ext(icons_spr,79,xps+75+i*1,ypsthree+7,1,1,0,c_white,1)
						}

				//Border
				if(i==0||i==101){
					draw_sprite_ext(icons_spr,77,xps+75+i*1,ypsthree+7,1,1,0,c_white,1)
				}else{
					if(Control.levelup>0){
							if(chance==0){
								draw_sprite_ext(icons_spr,84+2*Control.levelupimg,xps+75+i*1,ypsthree+7,1,1,0,c_white,1)
							}else{
								draw_sprite_ext(icons_spr,85+2*Control.levelupimg,xps+75+i*1,ypsthree+7,1,1,0,c_white,1)
							}	
					}else{
						if(i<=xpamount){
							//Main					
								if(chance==0){
									draw_sprite_ext(icons_spr,78,xps+75+i*1,ypsthree+7,1,1,0,c_white,1)
								}else{
									draw_sprite_ext(icons_spr,79,xps+75+i*1,ypsthree+7,1,1,0,c_white,1)
								}

						}else{
							//XP Amount
							if(i<=xpamounttwo){
								if(chance==0){
									draw_sprite_ext(icons_spr,80,xps+75+i*1,ypsthree+7,1,1,0,c_white,1)
								}else{
									draw_sprite_ext(icons_spr,81,xps+75+i*1,ypsthree+7,1,1,0,c_white,1)
								}						
							}else{
								//Empty
								if(chance==0){
									draw_sprite_ext(icons_spr,82,xps+75+i*1,ypsthree+7,1,1,0,c_white,1)
								}else{
									draw_sprite_ext(icons_spr,83,xps+75+i*1,ypsthree+7,1,1,0,c_white,1)
								}		
							}
						}
					}
				}
				

						if(i mod 5==0){
							if(chance==0){
								chance=1
							}else{
								chance=0
							}
						}


			}

#region Ability Bar
if(class!=0&&other.pause==0){
	xpos=other.xps
	ypos=other.yps

	//Crab SHARK Special Effect
	if(passive>=2&&passivefour>=11){
		if(Me.passivefourArray[100,3]==0){
			chance=-1
		}else{
			chance=1
		}
		draw_sprite_ext(abil_crab_two_spr,1+Me.passivefourArray[100,2],other.xps-0.5+38+Me.passivefourArray[100,0]/2,other.yps-0.5+138+22-2,chance,1,0,c_white,1)
	}

	for(var i=0;i<3;i+=1){
		if(i==0){
			chance=0
		}else{
			if(i==1){
				
				chance=2
			}else{
				if(i==2){
					chance=1
				}else{
		
				}		
			}		
		}
				chancefour=0
			draw_sprite_ext(ui_abilbar_spr,3,125+xpos-10+i*12,ypsthree+1.5-2,1,1,0,c_white,1)
			
			chancethree=1
			if(i==0){
				chancethree=0
			}else{
				if(i==1){
					if(Control.talentmapArray[10,1]>0||Control.talentmapArray[13,1]>0){
						chancethree=0
						if(Control.talentmapArray[13,1]>0){
							chancefour+=2
						}
					}
				}else{
					if(i==2){
						if(Control.talentmapArray[4,1]>0||Control.talentmapArray[7,1]>0){
							chancethree=0
							if(Control.talentmapArray[7,1]>0){
								chancefour+=2
							}
						}
					}else{
				
					}				
				}
			}			
		if(abilArray[chance,1]<=0){

			if(chancethree==0){
				draw_sprite_ext(abilcds_cd_spr,(i+1)+(20*(class-1))+chancefour,125+xpos-10+i*12,ypsthree+1.5-2,1,1,0,c_white,1)
			}
				draw_sprite_ext(ui_abilbar_spr,1,125+xpos-10+i*12,ypsthree+1.5-2,1,1,0,c_white,1)
				draw_sprite_ext(ui_abilbar_spr,17,125+xpos-10+i*12,ypsthree+1.5-2,1,1,0,c_white,1)
		}else{
			
			if(abilArray[chance,4]==0){
				chancetwo=abilArray[chance,1]/abilArray[chance,2]
			}else{
				if(abilArray[chance,4]==1){
					chancetwo=abilArray[chance,1]/globalcdtotal
				}else{
					if(abilArray[chance,4]==2){
						chancetwo=0.99
					}else{
						if(abilArray[chance,4]==2){
							chancetwo=0.99
						}						
					}
				}
			}
			
			draw_sprite_ext(ui_abilbar_spr,5+(chancetwo*8),125+xpos-10+i*12,ypsthree+1.5-2,1,1,0,c_white,1)
			if(chancethree==0){
				draw_sprite_ext(abilcds_cd_spr,(i+1)+(20*(class-1))+10+chancefour,125+xpos-10+i*12,ypsthree+1.5-2,1,1,0,c_white,1)
			}
			
			draw_sprite_ext(ui_abilbar_spr,1,125+xpos-10+i*12,ypsthree+1.5-2,1,1,0,c_white,1)
			if(abilArray[chance,4]==2){
				draw_sprite_ext(ui_abilbar_spr,17,125+xpos-10+i*12,ypsthree+1.5-2,1,1,0,c_white,1)
			}else{
				draw_sprite_ext(ui_abilbar_spr,18,125+xpos-10+i*12,ypsthree+1.5-2,1,1,0,c_white,1)
			}
			if(abilArray[chance,4]==0){
				chance=floor(abilArray[chance,1]/60)
				if(chance<9){
				chancetwo=2
				}else{
					if(chance<99){
						chancetwo=0
					}else{
						chancetwo=-2
					}
				}
				draw_text_transformed(125+chancetwo+xpos-10+i*12,ypsthree-2-2,chance+1,0.3,0.3,0)
				
			}
		}
	
	}

// Rogue Mode XP Bar - DISABLED (now using main XP bar with rogue stats)
// The main XP bar above now switches to rogue stats when Control.rogue_mode is true

//Class Passive
	//Burger
	if(class==4){	
		if(Control.talentmapArray[16,1]>0){	
			draw_sprite(abil_burger_spr,93,other.xps-0.5+78,other.yps-0.5+138-2)
			draw_sprite(abil_burger_spr,92,other.xps-0.5+78,other.yps-0.5+138-2+(passivefourArray[0,1]*0.5))
			draw_sprite(abil_burger_spr,82+passivefour,other.xps-0.5+78,other.yps-0.5+138+(passivefourArray[0,1]*0.5))
			if(passivefourArray[0,0]>0){
				for(var i=0;i<passivefourArray[0,0];i+=1){
					draw_sprite(abil_burger_spr,22+passivefourArray[i+1,1],other.xps-0.5+78,other.yps-0.5+138-2-passivefourArray[i+1,0]*0.5)
				}
			}
			chance=Me.passivefourArray[100,0]
			if(chance!=Me&&instance_exists(id)){
				draw_sprite_ext(abil_burger_spr,94,chance.x-1,chance.y-12+other.targetpos,0.8,0.8,0,c_white,1)
			}
		}
	}else{
		//Crab
		if(class==5){
			draw_sprite(abil_crab_spr,124+Me.passive,other.xps-0.5+78,other.yps-0.5+138-2)
			draw_sprite(abil_crab_spr,123,other.xps-2.5+78,other.yps-1.5+138+(passivefourArray[0,1]*0.5))
			if(passive<2||passivefour<11){
				draw_sprite(abil_crab_spr,127+passivefour,other.xps-2.5+78,other.yps-1.5+138-2+(passivefourArray[0,1]*0.5))
			}else{
				draw_sprite(abil_crab_spr,140,other.xps-2.5+78,other.yps-1.5+138+(passivefourArray[0,1]*0.5))
			}
			if(passivefourArray[0,0]>0){
				for(var i=0;i<passivefourArray[0,0];i+=1){
					if(passivefourArray[i+1,1]==1){
						draw_sprite(abil_crab_spr,53,other.xps-0.5+78,other.yps-0.5+138-2-passivefourArray[i+1,0]*0.5)
					}else{
						draw_sprite(abil_crab_spr,53,other.xps-0.5+78,other.yps-0.5+138-2-15+passivefourArray[i+1,0]*0.5)
					}
				}
			}		
			if(passivefourArray[0,2]>0){
				draw_sprite(abil_crab_spr,138+passivefourArray[0,3],other.xps-0.5+78,other.yps-0.5+13-28)
			}
		}else{
			//Pumpkin shell shield
			if(class==2){
				if(Control.talentmapArray[16,1]>0){
					if(passivefourArray[1000,0]==0){
						draw_sprite(mask_pump_other_spr,115,other.xps-0.5+78,other.yps-0.5+138-2)
						draw_sprite(mask_pump_other_spr,118,other.xps-0.5+78,other.yps-0.5+139-2)
					}else{
						draw_sprite(mask_pump_other_spr,115+1,other.xps-0.5+78,other.yps-0.5+138-2)
						draw_sprite(mask_pump_other_spr,119+(passivefourArray[1000,0]/passivefourArray[1000,1])*9,other.xps-0.5+78,other.yps-0.5+139-2)
					}
					
				}
				if(Control.talentmapArray[19,1]>0){
					//Sugar Rush
						draw_sprite(mask_pump_other_spr,148+talentfivetwo,other.xps-0.5+90,other.yps-0.5+138-2)
						chance=0
						draw_sprite(mask_pump_other_spr,142+talentfivetwo*0.5,other.xps-0.5+90,other.yps-0.5+137-2+(passivefourArray[0,1]*0.5))
						draw_text_transformed(other.xps-0.5+90,other.yps-0.5+138-2-5,talentfivecdcount,0.3,0.3,0)
						
						
						if(passivefourArray[0,0]>0){
							for(var i=0;i<passivefourArray[0,0];i+=1){
								if(passivefourArray[i+1,1]==1){
									draw_sprite(mask_pump_other_spr,passivefourArray[i+1,2],other.xps-0.5+92,other.yps-0.5+138-2-passivefourArray[i+1,0]*0.5)
								}else{
									draw_sprite(mask_pump_other_spr,passivefourArray[i+1,2],other.xps-0.5+92,other.yps-0.5+138-2-15+passivefourArray[i+1,0]*0.5)
								}
							}
						}	
							chance=Me.talentfivecd/Me.talentfivecdtotal*10
							chancetwo=10-chance
							for(var i=0;i<chancetwo;i+=1){
								
								if(i mod 2==0){
									draw_sprite_part(mask_pump_other_spr,114,1,0,1,1,other.xps-0.5+90-6,other.yps-0.5-5+147-2-i)
								}else{
									draw_sprite_part(mask_pump_other_spr,114,0,0,1,1,other.xps-0.5+90-6,other.yps-0.5-5+147-2-i)
								}
							}
				}
			}else{
				
				//Super Toast
				if(class==6){
					//Bacon Breakfast (charge UI removed)
					//Toaster Pastry (no UI needed)
				}else{

					//Tree
					if(class==7){
						
						if(Me.passivefourArray[1,6]>0){
							draw_sprite(abil_tree_spr,118,other.xps-0.5+83,other.yps-0.5+140-2-2)
							
							//Acorn Log
							if(passivefourArray[1,8]==0||passivefourArray[1,8]==1||passivefourArray[1,8]==2){
								for(var i=0;i<3;i+=1){
									if(i<=Me.passivefourArray[1,7]){
										draw_sprite(abil_tree_spr,112+1+(Me.passivefourArray[1,8]*2),other.xps-0.5+74+i*8,other.yps-0.5+138-2-(passivefourArray[1,31+i*2]*0.01))
									}else{
										draw_sprite(abil_tree_spr,112+(Me.passivefourArray[1,8]*2),other.xps-0.5+74+i*8,other.yps-0.5+138-2)
									}
								}
								if(Me.passivefourArray[1,7]>=2){
									draw_sprite(abil_tree_spr,118+1,other.xps-0.5+83,other.yps-0.5+140-2-2)
								}

								
									chancethree=floor((Me.passivefourArray[1,6]/(passivefourArray[1,9]*3))*25)
									if(chancethree>=16){
										chancethree=17
									}
								
									draw_sprite(abil_tree_spr,123,other.xps-0.5+68+3,other.yps-0.5+143-2)
								
									//Charge Bar
									for(var i=0;i<chancethree;i+=1){
										if(i<=8){
											chancetwo=0
										}else{
											chancetwo=1
										}				
									
										draw_sprite(abil_tree_spr,124+chancetwo,other.xps-0.5+79+i,other.yps-0.5+143-2)
									
									}
							}else{
								
								//Leaf
								if(passivefourArray[1,8]==3){
									
									chance=-1
									for(var i=0;i<9;i+=1){
										if(i<=Me.passivefourArray[1,7]){
											draw_sprite(abil_tree_spr,126,other.xps-0.5+71+i*3,other.yps+139-2+chance*0.5-(passivefourArray[1,31+i*2]*0.01))
										}else{
											draw_sprite(abil_tree_spr,127,other.xps-0.5+71+i*3,other.yps+139-2+chance*0.5)
										}		
										if(chance<1){
											chance+=1
										}else{
											chance=-1
										}
									}
									if(Me.passivefourArray[1,7]>=8){
										draw_sprite(abil_tree_spr,118+1,other.xps-0.5+83,other.yps-0.5+140-2-2)
									}									
									
								}else{
								
									if(passivefourArray[1,8]==4){
										
										
										
									}else{
									
									}
								
								}
							}
							
						}
					}else{
						//Class Dessert princess
						if(class==8){
							
							//Oven
							//if(Control.talentmapArray[19,1]>0){
								draw_sprite(abil_candy_spr,250+passivefourArray[10,2]+(passivefourArray[10,5]*3),other.xps-0.5+59,other.yps-0.5+138-2)
								chance=floor(passivefourArray[10,0]/10)
								draw_sprite(abil_candy_spr,253,other.xps-0.5+59,other.yps-0.5+138-2-chance)
							//}
						}
					}
				}
			}
		}
	}
}
#endregion

#region Scarecrow Off-Screen Indicator
if(class==1&&Control.talentmapArray[7,1]>0&&passive!=noone&&instance_exists(passive)){
	var _sx=passive.x
	var _sy=passive.y
	var _margin=8
	var _onscreen=(_sx>other.xps+_margin&&_sx<other.xpstwo-_margin&&_sy>other.yps+_margin&&_sy<other.ypstwo-_margin)
	if(!_onscreen){
		var _cx=clamp(_sx,other.xps+_margin,other.xpstwo-_margin)
		var _cy=clamp(_sy,other.yps+_margin,other.ypstwo-_margin)
		var _angle=point_direction(_cx,_cy,_sx,_sy)
		var _dir=round(_angle/45)*45

		//Icon: 137 basic, 138 haunted
		var _icon=137
		if(Control.talentmapArray[9,1]>0){
			_icon=138
		}

		//Flash when scarecrow is close to expiring (last 25%)
		var _alpha=0.85
		if(passive.dur<passive.durtotal*0.25){
			_alpha=(passive.dur mod 10)<5 ? 0.3 : 0.85
		}

		//Draw icon at screen edge
		draw_sprite_ext(abil_witch_spr,_icon,_cx,_cy,1,1,0,c_white,_alpha)

		//Arrow offset from icon center (fixed per direction)
		var _ox=0
		var _oy=0
		if(_dir==0||_dir==360){ _ox=7; _oy=0; }
		else if(_dir==45){ _ox=5; _oy=-5; }
		else if(_dir==90){ _ox=0; _oy=-7; }
		else if(_dir==135){ _ox=-5; _oy=-5; }
		else if(_dir==180){ _ox=-7; _oy=0; }
		else if(_dir==225){ _ox=-5; _oy=5; }
		else if(_dir==270){ _ox=0; _oy=7; }
		else if(_dir==315){ _ox=5; _oy=5; }
		var _ax=_cx+_ox
		var _ay=_cy+_oy

		var _ub=other.ui_border
		var _cg=other.colorgold
		var _cl=other.colorgoldlight

		if(_dir==0||_dir==360){
			//Right arrow
			draw_rectangle_color(_ax+2,_ay,_ax+2,_ay,_ub,_ub,_ub,_ub,false)
			draw_rectangle_color(_ax+1,_ay-1,_ax+1,_ay-1,_ub,_ub,_ub,_ub,false)
			draw_rectangle_color(_ax+1,_ay+1,_ax+1,_ay+1,_ub,_ub,_ub,_ub,false)
			draw_rectangle_color(_ax,_ay-2,_ax,_ay-2,_ub,_ub,_ub,_ub,false)
			draw_rectangle_color(_ax,_ay+2,_ax,_ay+2,_ub,_ub,_ub,_ub,false)
			draw_rectangle_color(_ax-1,_ay-1,_ax-1,_ay+1,_ub,_ub,_ub,_ub,false)
			draw_rectangle_color(_ax+1,_ay,_ax+1,_ay,_cl,_cl,_cl,_cl,false)
			draw_rectangle_color(_ax,_ay-1,_ax,_ay-1,_cl,_cl,_cl,_cl,false)
			draw_rectangle_color(_ax,_ay,_ax,_ay,_cg,_cg,_cg,_cg,false)
			draw_rectangle_color(_ax,_ay+1,_ax,_ay+1,_cg,_cg,_cg,_cg,false)
		}else if(_dir==180){
			//Left arrow
			draw_rectangle_color(_ax-2,_ay,_ax-2,_ay,_ub,_ub,_ub,_ub,false)
			draw_rectangle_color(_ax-1,_ay-1,_ax-1,_ay-1,_ub,_ub,_ub,_ub,false)
			draw_rectangle_color(_ax-1,_ay+1,_ax-1,_ay+1,_ub,_ub,_ub,_ub,false)
			draw_rectangle_color(_ax,_ay-2,_ax,_ay-2,_ub,_ub,_ub,_ub,false)
			draw_rectangle_color(_ax,_ay+2,_ax,_ay+2,_ub,_ub,_ub,_ub,false)
			draw_rectangle_color(_ax+1,_ay-1,_ax+1,_ay+1,_ub,_ub,_ub,_ub,false)
			draw_rectangle_color(_ax-1,_ay,_ax-1,_ay,_cl,_cl,_cl,_cl,false)
			draw_rectangle_color(_ax,_ay-1,_ax,_ay-1,_cl,_cl,_cl,_cl,false)
			draw_rectangle_color(_ax,_ay,_ax,_ay,_cg,_cg,_cg,_cg,false)
			draw_rectangle_color(_ax,_ay+1,_ax,_ay+1,_cg,_cg,_cg,_cg,false)
		}else if(_dir==90){
			//Up arrow
			draw_rectangle_color(_ax,_ay-2,_ax,_ay-2,_ub,_ub,_ub,_ub,false)
			draw_rectangle_color(_ax-1,_ay-1,_ax-1,_ay-1,_ub,_ub,_ub,_ub,false)
			draw_rectangle_color(_ax+1,_ay-1,_ax+1,_ay-1,_ub,_ub,_ub,_ub,false)
			draw_rectangle_color(_ax-2,_ay,_ax-2,_ay,_ub,_ub,_ub,_ub,false)
			draw_rectangle_color(_ax+2,_ay,_ax+2,_ay,_ub,_ub,_ub,_ub,false)
			draw_rectangle_color(_ax-1,_ay+1,_ax+1,_ay+1,_ub,_ub,_ub,_ub,false)
			draw_rectangle_color(_ax,_ay-1,_ax,_ay-1,_cl,_cl,_cl,_cl,false)
			draw_rectangle_color(_ax-1,_ay,_ax-1,_ay,_cl,_cl,_cl,_cl,false)
			draw_rectangle_color(_ax,_ay,_ax,_ay,_cg,_cg,_cg,_cg,false)
			draw_rectangle_color(_ax+1,_ay,_ax+1,_ay,_cg,_cg,_cg,_cg,false)
		}else if(_dir==270){
			//Down arrow
			draw_rectangle_color(_ax,_ay+2,_ax,_ay+2,_ub,_ub,_ub,_ub,false)
			draw_rectangle_color(_ax-1,_ay+1,_ax-1,_ay+1,_ub,_ub,_ub,_ub,false)
			draw_rectangle_color(_ax+1,_ay+1,_ax+1,_ay+1,_ub,_ub,_ub,_ub,false)
			draw_rectangle_color(_ax-2,_ay,_ax-2,_ay,_ub,_ub,_ub,_ub,false)
			draw_rectangle_color(_ax+2,_ay,_ax+2,_ay,_ub,_ub,_ub,_ub,false)
			draw_rectangle_color(_ax-1,_ay-1,_ax+1,_ay-1,_ub,_ub,_ub,_ub,false)
			draw_rectangle_color(_ax,_ay+1,_ax,_ay+1,_cl,_cl,_cl,_cl,false)
			draw_rectangle_color(_ax-1,_ay,_ax-1,_ay,_cl,_cl,_cl,_cl,false)
			draw_rectangle_color(_ax,_ay,_ax,_ay,_cg,_cg,_cg,_cg,false)
			draw_rectangle_color(_ax+1,_ay,_ax+1,_ay,_cg,_cg,_cg,_cg,false)
		}else if(_dir==45){
			//Up-Right arrow
			draw_rectangle_color(_ax+2,_ay-2,_ax+2,_ay-2,_ub,_ub,_ub,_ub,false)
			draw_rectangle_color(_ax+2,_ay-1,_ax+2,_ay-1,_ub,_ub,_ub,_ub,false)
			draw_rectangle_color(_ax-1,_ay+2,_ax-1,_ay+2,_ub,_ub,_ub,_ub,false)
			draw_rectangle_color(_ax,_ay-2,_ax,_ay-2,_ub,_ub,_ub,_ub,false)
			draw_rectangle_color(_ax-1,_ay+1,_ax-1,_ay+1,_ub,_ub,_ub,_ub,false)
			draw_rectangle_color(_ax-1,_ay,_ax-1,_ay,_ub,_ub,_ub,_ub,false)
			draw_rectangle_color(_ax+1,_ay-1,_ax+1,_ay-1,_cl,_cl,_cl,_cl,false)
			draw_rectangle_color(_ax+1,_ay,_ax+1,_ay,_cl,_cl,_cl,_cl,false)
			draw_rectangle_color(_ax,_ay,_ax,_ay,_cg,_cg,_cg,_cg,false)
			draw_rectangle_color(_ax,_ay+1,_ax,_ay+1,_cg,_cg,_cg,_cg,false)
		}else if(_dir==135){
			//Up-Left arrow
			draw_rectangle_color(_ax-2,_ay-2,_ax-2,_ay-2,_ub,_ub,_ub,_ub,false)
			draw_rectangle_color(_ax-2,_ay-1,_ax-2,_ay-1,_ub,_ub,_ub,_ub,false)
			draw_rectangle_color(_ax+1,_ay+2,_ax+1,_ay+2,_ub,_ub,_ub,_ub,false)
			draw_rectangle_color(_ax,_ay-2,_ax,_ay-2,_ub,_ub,_ub,_ub,false)
			draw_rectangle_color(_ax+1,_ay+1,_ax+1,_ay+1,_ub,_ub,_ub,_ub,false)
			draw_rectangle_color(_ax+1,_ay,_ax+1,_ay,_ub,_ub,_ub,_ub,false)
			draw_rectangle_color(_ax-1,_ay-1,_ax-1,_ay-1,_cl,_cl,_cl,_cl,false)
			draw_rectangle_color(_ax-1,_ay,_ax-1,_ay,_cl,_cl,_cl,_cl,false)
			draw_rectangle_color(_ax,_ay,_ax,_ay,_cg,_cg,_cg,_cg,false)
			draw_rectangle_color(_ax,_ay+1,_ax,_ay+1,_cg,_cg,_cg,_cg,false)
		}else if(_dir==225){
			//Down-Left arrow
			draw_rectangle_color(_ax-2,_ay+2,_ax-2,_ay+2,_ub,_ub,_ub,_ub,false)
			draw_rectangle_color(_ax-2,_ay+1,_ax-2,_ay+1,_ub,_ub,_ub,_ub,false)
			draw_rectangle_color(_ax+1,_ay-2,_ax+1,_ay-2,_ub,_ub,_ub,_ub,false)
			draw_rectangle_color(_ax,_ay+2,_ax,_ay+2,_ub,_ub,_ub,_ub,false)
			draw_rectangle_color(_ax+1,_ay-1,_ax+1,_ay-1,_ub,_ub,_ub,_ub,false)
			draw_rectangle_color(_ax+1,_ay,_ax+1,_ay,_ub,_ub,_ub,_ub,false)
			draw_rectangle_color(_ax-1,_ay+1,_ax-1,_ay+1,_cl,_cl,_cl,_cl,false)
			draw_rectangle_color(_ax-1,_ay,_ax-1,_ay,_cl,_cl,_cl,_cl,false)
			draw_rectangle_color(_ax,_ay,_ax,_ay,_cg,_cg,_cg,_cg,false)
			draw_rectangle_color(_ax,_ay-1,_ax,_ay-1,_cg,_cg,_cg,_cg,false)
		}else if(_dir==315){
			//Down-Right arrow
			draw_rectangle_color(_ax+2,_ay+2,_ax+2,_ay+2,_ub,_ub,_ub,_ub,false)
			draw_rectangle_color(_ax+2,_ay+1,_ax+2,_ay+1,_ub,_ub,_ub,_ub,false)
			draw_rectangle_color(_ax-1,_ay-2,_ax-1,_ay-2,_ub,_ub,_ub,_ub,false)
			draw_rectangle_color(_ax,_ay+2,_ax,_ay+2,_ub,_ub,_ub,_ub,false)
			draw_rectangle_color(_ax-1,_ay-1,_ax-1,_ay-1,_ub,_ub,_ub,_ub,false)
			draw_rectangle_color(_ax-1,_ay,_ax-1,_ay,_ub,_ub,_ub,_ub,false)
			draw_rectangle_color(_ax+1,_ay+1,_ax+1,_ay+1,_cl,_cl,_cl,_cl,false)
			draw_rectangle_color(_ax+1,_ay,_ax+1,_ay,_cl,_cl,_cl,_cl,false)
			draw_rectangle_color(_ax,_ay,_ax,_ay,_cg,_cg,_cg,_cg,false)
			draw_rectangle_color(_ax,_ay-1,_ax,_ay-1,_cg,_cg,_cg,_cg,false)
		}
		draw_set_color(c_white)
	}
}
#endregion

#region Scarecrow Death X
if(class==1&&scarecrow_deathtimer>0){
	var _dx=scarecrow_deathx
	var _dy=scarecrow_deathy
	var _margin=8
	var _offscreen=(_dx<=other.xps+_margin||_dx>=other.xpstwo-_margin||_dy<=other.yps+_margin||_dy>=other.ypstwo-_margin)
	if(_offscreen){
		var _cx=clamp(_dx,other.xps+_margin,other.xpstwo-_margin)
		var _cy=clamp(_dy,other.yps+_margin,other.ypstwo-_margin)
		var _ub=other.ui_border
		var _cg=other.colorgold
		var _cl=other.colorgoldlight

		//Icon: 137 basic, 138 haunted (same position as live indicator)
		var _icon=137
		if(Control.talentmapArray[9,1]>0){
			_icon=138
		}
		draw_sprite_ext(abil_witch_spr,_icon,_cx,_cy,1,1,0,c_white,0.85)

		//X drawn below the icon
		_cy+=6

		//X border (ui_border) - 1px outline around each diagonal line
		// \ diagonal border
		draw_rectangle_color(_cx-3,_cy-2,_cx-3,_cy-2,_ub,_ub,_ub,_ub,false)
		draw_rectangle_color(_cx-2,_cy-3,_cx-2,_cy-3,_ub,_ub,_ub,_ub,false)
		draw_rectangle_color(_cx-2,_cy-1,_cx-2,_cy-1,_ub,_ub,_ub,_ub,false)
		draw_rectangle_color(_cx-1,_cy-2,_cx-1,_cy-2,_ub,_ub,_ub,_ub,false)
		draw_rectangle_color(_cx-1,_cy,_cx-1,_cy,_ub,_ub,_ub,_ub,false)
		draw_rectangle_color(_cx+1,_cy,_cx+1,_cy,_ub,_ub,_ub,_ub,false)
		draw_rectangle_color(_cx+1,_cy+2,_cx+1,_cy+2,_ub,_ub,_ub,_ub,false)
		draw_rectangle_color(_cx+2,_cy+1,_cx+2,_cy+1,_ub,_ub,_ub,_ub,false)
		draw_rectangle_color(_cx+2,_cy+3,_cx+2,_cy+3,_ub,_ub,_ub,_ub,false)
		draw_rectangle_color(_cx+3,_cy+2,_cx+3,_cy+2,_ub,_ub,_ub,_ub,false)
		// / diagonal border
		draw_rectangle_color(_cx+3,_cy-2,_cx+3,_cy-2,_ub,_ub,_ub,_ub,false)
		draw_rectangle_color(_cx+2,_cy-3,_cx+2,_cy-3,_ub,_ub,_ub,_ub,false)
		draw_rectangle_color(_cx+2,_cy-1,_cx+2,_cy-1,_ub,_ub,_ub,_ub,false)
		draw_rectangle_color(_cx+1,_cy-2,_cx+1,_cy-2,_ub,_ub,_ub,_ub,false)
		draw_rectangle_color(_cx-1,_cy+2,_cx-1,_cy+2,_ub,_ub,_ub,_ub,false)
		draw_rectangle_color(_cx-2,_cy+1,_cx-2,_cy+1,_ub,_ub,_ub,_ub,false)
		draw_rectangle_color(_cx-2,_cy+3,_cx-2,_cy+3,_ub,_ub,_ub,_ub,false)
		draw_rectangle_color(_cx-3,_cy+2,_cx-3,_cy+2,_ub,_ub,_ub,_ub,false)
		//Center top/bottom border
		draw_rectangle_color(_cx,_cy-1,_cx,_cy-1,_ub,_ub,_ub,_ub,false)
		draw_rectangle_color(_cx,_cy+1,_cx,_cy+1,_ub,_ub,_ub,_ub,false)

		//X fill - solid diagonal lines
		// \ line
		draw_rectangle_color(_cx-2,_cy-2,_cx-2,_cy-2,_cl,_cl,_cl,_cl,false)
		draw_rectangle_color(_cx-1,_cy-1,_cx-1,_cy-1,_cl,_cl,_cl,_cl,false)
		draw_rectangle_color(_cx,_cy,_cx,_cy,_cg,_cg,_cg,_cg,false)
		draw_rectangle_color(_cx+1,_cy+1,_cx+1,_cy+1,_cg,_cg,_cg,_cg,false)
		draw_rectangle_color(_cx+2,_cy+2,_cx+2,_cy+2,_cg,_cg,_cg,_cg,false)
		// / line
		draw_rectangle_color(_cx+2,_cy-2,_cx+2,_cy-2,_cl,_cl,_cl,_cl,false)
		draw_rectangle_color(_cx+1,_cy-1,_cx+1,_cy-1,_cl,_cl,_cl,_cl,false)
		draw_rectangle_color(_cx-1,_cy+1,_cx-1,_cy+1,_cg,_cg,_cg,_cg,false)
		draw_rectangle_color(_cx-2,_cy+2,_cx-2,_cy+2,_cg,_cg,_cg,_cg,false)

		draw_set_color(c_white)
	}
}
#endregion

} // end game_initialized check for ME UI
}
#region Active Item Draw
if(game_initialized && invenArray[23,0]!=0&&pause==0){
	draw_sprite_ext(active_items_spr,1,xps+150-0.5,yps+131-0.5,1,1,0,c_white,1)
	if(invenArray[23,3]<=0){ 
		chance=itemArray[invenArray[23,0]+1,14]
		if(invenArray[23,2]>2){
			chance+=1
		}
	}else{
		if(invenArray[23,4]!=0){
			chancetwo=invenArray[23,3]/invenArray[23,4]
		draw_sprite_ext(ui_abilbar_spr,5+(chancetwo*9),xps+158-0.5,yps+139-0.5,1,1,0,c_white,1)
		}
		chance=itemArray[invenArray[23,0]+1,14]+2
	}
	draw_sprite_ext(active_items_spr,chance,xps+150-0.5,yps+131-0.5,1,1,0,c_white,1)

		chance=floor(invenArray[23,3]/60)
		if(chance<9){
		chancetwo=2
		}else{
			if(chance<99){
				chancetwo=0
			}else{
				chancetwo=-2
			}
		}
	if(invenArray[23,3]>0){	
		//CD
		draw_text_transformed(xps+158-0.5+chancetwo,yps+136-0.5,chance+1,0.3,0.3,0)
		//Unactivated Pixel
		draw_sprite_ext(ui_abilbar_spr,18,xps+158-0.5,yps+139-0.5,1,1,0,c_white,1)
	}else{
		//Active Pixel
		draw_sprite_ext(ui_abilbar_spr,17,xps+158-0.5,yps+139-0.5,1,1,0,c_white,1) 	
	}
		
		
}
#endregion
#endregion

#endregion


//Arcade 
if(pause==10){
	
	//Fish Marble Game
	if(arcadetype==1){
		
		
	draw_sprite_ext(maptest_spr,72,xps-0.5+bgWaveOffsetX,yps-0.5,1,1,0,c_white,1)
	draw_sprite_ext(maptest_spr,71,xps-0.5+bgWaveOffsetX,yps-0.5+bgBobOffsetY,1,1,0,c_white,1)

	draw_sprite_ext(maptest_spr,62,xps-0.5,yps-0.5,1,1,0,c_white,1)	

	
	//draw_text_transformed(xps+24+30,yps+3+30,currentWheelSegment,0.5,0.5,0)
	
	//draw_text_transformed(xps+24+30,yps+3+30,wheelAngle,0.5,0.5,0)
	//draw_text_transformed(xps+24+30,yps+3+40,currentWheelSegment,0.5,0.5,0)
	if(bonusWheelActive==0){
		chance=6
		chancetwo=5
		draw_sprite_ext(arc_fish_spin_spr,1,xps-0.5+204+chancetwo,yps-0.5+30-chance,1,1,wheelAngle,c_white,1)	
		draw_sprite_ext(arc_fish_spin_spr,14+currentWheelSegment,xps-0.5+204+chancetwo,yps-0.5+30-chance,1,1,wheelAngle,c_white,1)	
		
		if(currentWheelSegment>=1&&currentWheelSegment<2){
			draw_sprite_ext(arc_fish_spin_spr,64+crabtype+7,xps-0.5+204+chancetwo,yps-0.5+30-chance,1,1,wheelAngle,c_white,1)	
		}else{
			draw_sprite_ext(arc_fish_spin_spr,64+crabtype,xps-0.5+204+chancetwo,yps-0.5+30-chance,1,1,wheelAngle,c_white,1)	
		}
		
		draw_sprite_ext(arc_fish_flipper_spr,0,xps-0.5+204+chancetwo+36,yps-0.5+30-chance,1,1,180+flipperAngle,c_white,1)	
		
		
	}else{

	}
	
	
	
	xps=camx-camxtwo
	yps=camy-camytwo	

	//Insert Token Sign
		//draw_sprite_ext(arc_fish_big_spin_spr,23+bonusWheelFrame,xps-0.5+126,yps-0.5+72-bonusWheelTransitionY,1,1,0,c_white,1)
		draw_sprite_ext(arc_fish_big_spin_spr,46+insertTokenSignFrame,xps-0.5+126,yps-0.5+72-49+insertTokenSignY,1,1,0,c_white,1)

	if(hoopHighlightTimer>0){
		chance=2
	}else{
		chance=0
	}
	
	draw_sprite_ext(arc_fish_spin_spr,24+chance,xps-0.5+126+hoopXOffset,yps-0.5+55,1,1,0,c_white,1)	

	chancetwo=0
	for(var i=0;i<5;i+=1){
		if(i==2){
			chancetwo=-1
		}else{
			if(i==3||i==4){
				chancetwo=-2
			}	
		}
		//draw_sprite_ext(arc_fish_spin_spr,40+arcadeArray[21,i],xps+63-1.5+chancetwo+33*i,yps-0.5+95,1,1,0,c_white,1)
		draw_sprite_ext(arc_fish_spin_spr,40+arcadeArray[21,i],xps+63+10-1.5+chancetwo+28*i,yps-0.5+95,1,1,0,c_white,1)
		
		if(arcadeArray[31+i,0]!=0){
			draw_sprite_ext(abil_crab_spr,183+arcadeArray[31+i,0],xps+64+10-1.5+chancetwo+28*i,yps-0.5+93-0.5+(arcadeArray[31+i,1]*0.01),1,1,0,c_white,1)
		}
		//draw_sprite_ext(arc_fish_bonus_spin_spr,44,xps+63-1.5+chancetwo+33*i,yps-0.5+95,1,1,0,c_white,1)
		
		//draw_sprite_ext(arc_fish_bonus_spin_spr,44,xps+63-1.5+chancetwo+33*i,yps-0.5+95,1,1,0,c_white,1)

	}

	// --- Board water waves (no alpha, dithered ambient) ---
	var _bLeft=xps+49
	var _bRight=xps+205
	var _bTop=yps+66
	var _waveColors
	_waveColors[0]=$756446
	_waveColors[1]=$A8945E
	_waveColors[2]=$A8945E

	// Ambient waves: 3 rows of peaks, clustered toward center
	var _bMidX=(_bLeft+_bRight)*0.5
	var _bMidY=_bTop+6
	for(var _wl=0;_wl<3;_wl++){
		var _ly=_bMidY+(_wl-1)*12
		var _col=_waveColors[_wl]
		var _inset=0
		if(_wl==0) _inset=18
		if(_wl==1) _inset=8
		if(_wl==2) _inset=-2
		for(var _pk=0;_pk<6;_pk++){
			// Per-peak unique Y and X offsets using different hash seeds
			var _pkYOffset=round(sin(_pk*173.9+_wl*67.3)*5)
			var _pkXOffset=round(sin(_pk*83.7+_wl*197.3)*5)
			var _peakLy=_ly+_pkYOffset
			var _cx=_bMidX+((_pk-2.5)*22)+_pkXOffset
			var _pkSeed=sin(_pk*127.1+_wl*311.7)*0.5+0.5
			var _heightMul=1.5+_pkSeed*1.5
			var _speedMul=0.7+_pkSeed*0.6
			var _vis=sin(boardWavePhase*0.6*_speedMul+_pk*2.1+_wl*2.3)
			if(abs(_vis)<0.08) continue
			var _peakWidth=round(3+abs(_vis)*4)
			var _prevOy=0
			for(var _wx=max(_bLeft+_inset,_cx-_peakWidth);_wx<=min(_bRight-_inset,_cx+_peakWidth);_wx+=1){
				var _dist=abs(_wx-_cx)
				var _t=1-(_dist/_peakWidth)
				var _curve=_t*_t
				var _oy=round(abs(_vis)*_heightMul*_curve)
				if(_oy<1){ _prevOy=0; continue; }
				draw_rectangle_colour(_wx,_peakLy-_oy,_wx,_peakLy-_oy,_col,_col,_col,_col,false)
				if(_prevOy>0){
					var _lo=min(_oy,_prevOy)
					var _hi=max(_oy,_prevOy)
					for(var _fy=_lo+1;_fy<_hi;_fy++){
						draw_rectangle_colour(_wx,_peakLy-_fy,_wx,_peakLy-_fy,_col,_col,_col,_col,false)
					}
				}
				_prevOy=_oy
			}
		}
	}

	// Push wave fronts (3 independent waves) — drawn below fish
	var _waveTop=yps+60
	var _waveBot=yps+102
	for(var _band=0;_band<2;_band++){
		if(boardPushWaveY[_band]<_waveTop) continue
		var _bandY=boardPushWaveY[_band]
		var _progress=clamp((_bandY-_waveTop)/(_waveBot-_waveTop),0,1)
		var _waveInset=round(lerp(18,-2,power(_progress,0.35)))
		for(var _wx=_bLeft+_waveInset;_wx<_bRight-_waveInset;_wx+=1){
			var _oy=round(sin((_wx*0.15)+boardWavePhase)*2)
			var _py=_bandY+_oy
			draw_rectangle_colour(_wx,_py-1,_wx,_py-1,$A8945E,$A8945E,$A8945E,$A8945E,false)
			draw_rectangle_colour(_wx,_py,_wx,_py,$D8DEBC,$D8DEBC,$D8DEBC,$D8DEBC,false)
			draw_rectangle_colour(_wx,_py+1,_wx,_py+1,$A8945E,$A8945E,$A8945E,$A8945E,false)
		}
	}

	with(Arcade){
		if(depth==11){
			draw_sprite_ext(sprite_index,image_index,x,y,dir,1,image_angle,c_white,1)
		}
	}

	with(Arcade){
		if(depth==10){
			draw_sprite_ext(sprite_index,image_index,x,y,1,1,image_angle,c_white,1)
		}
	}
	with(Arcade){
		if(depth==9){
			draw_sprite_ext(sprite_index,image_index,x,y,1,1,image_angle,c_white,1)
		}
	}

	draw_sprite_ext(arc_fish_spin_spr,25+chance,xps-0.5+126+hoopXOffset,yps-0.5+55,1,1,0,c_white,1)

	//Particles
	with(Part){
		var _pdir = variable_instance_exists(id, "dir") ? dir : 1
		draw_sprite_ext(sprite_index,image_index,x,y,_pdir,1,image_angle,c_white,1)
	}


	if(bonusWheelActive==1){
		
		
		draw_sprite_ext(arc_fish_spin_spr,1,xps-0.5+204+5,yps-0.5+30-6,1,1,savedWheelAngle,c_white,1)	
		draw_sprite_ext(arc_fish_spin_spr,14+savedWheelSegment,xps-0.5+204+5,yps-0.5+30-6,1,1,savedWheelAngle,c_white,1)	
		draw_sprite_ext(arc_fish_flipper_spr,0,xps-0.5+204+5+36,yps-0.5+30-6,1,1,180,c_white,1)	
		
		draw_sprite_ext(arc_fish_spin_spr,64+crabtype,xps-0.5+204+5,yps-0.5+30-6,1,1,savedWheelAngle,c_white,1)	
		
		draw_sprite_ext(maptest_spr,75,xps-0.5,yps-0.5,1,1,0,c_white,1)	
		
		
		if(bonusWheelState!=3){
			draw_sprite_ext(arc_fish_big_spin_spr,23+bonusWheelFrame,xps-0.5+126,yps-0.5+72-bonusWheelTransitionY,1,1,0,c_white,1)
			
			draw_sprite_ext(arc_fish_big_spin_spr,1,xps-0.5+126,yps-0.5+72-bonusWheelTransitionY,1,1,wheelAngle,c_white,1)	
			draw_sprite_ext(arc_fish_big_spin_spr,14+currentWheelSegment,xps-0.5+126,yps-0.5+72-bonusWheelTransitionY,1,1,wheelAngle,c_white,1)	
			draw_sprite_ext(arc_fish_big_flipper_spr,0,xps-0.5+126+61,yps-0.5+71-bonusWheelTransitionY,1,1,180+bonusFlipperAngle,c_white,1)

		}else{
			draw_sprite_ext(arc_fish_big_spin_spr,23+bonusWheelFrame,xps-0.5+126,yps-0.5+71-150+bonusWheelTransitionY,1,1,0,c_white,1)

			draw_sprite_ext(arc_fish_big_spin_spr,1,xps-0.5+126,yps-0.5+72-150+bonusWheelTransitionY,1,1,wheelAngle,c_white,1)
			draw_sprite_ext(arc_fish_big_spin_spr,14+currentWheelSegment,xps-0.5+126,yps-0.5+72-150+bonusWheelTransitionY,1,1,wheelAngle,c_white,1)
			draw_sprite_ext(arc_fish_big_flipper_spr,0,xps-0.5+126+61,yps-0.5+71-150+bonusWheelTransitionY,1,1,180+bonusFlipperAngle,c_white,1)		
			
		}
	}	
	


	//Ticket counts bottom screen
	if(arcadeArray[100,0]>0){
	    for(var a=1;a<=arcadeArray[100,0];a+=1){
	        draw_text_transformed(arcadeArray[100+a,2],yps+120+arcadeArray[100+a,0]*0.2,arcadeArray[100+a,1],0.5,0.5,0)
	    }
	}
	
	//Crab abil
	if(arcadeArray[40,0]>0){
		
		draw_sprite_ext(arc_fish_spin_spr,50+arcadeArray[40,3],xps-0.5+arcadeArray[40,2],yps-0.5+142+10-arcadeArray[40,1]*0.5,1,1,0,c_white,1)	
	}

	//Front of arcade cabinet
	draw_sprite_ext(maptest_spr,64,xps-0.5,yps-0.5,1,1,0,c_white,1)	

	if(arcadepetrarity>=3){
		chance=14
	}

	//Crab
	draw_sprite_ext(abil_crab_spr,crabAnimBase+floor(crabAnimFrame/30)+chance,xps-0.5+28,yps-0.5+12,1,1,0,c_white,1)	
	
	//Rarity
	draw_sprite_ext(map_icons_spr,80+invenArray[31,16]+(arcadepetrarity*3),xps+29.5,yps-0.5+12,1,1,0,c_white,1)

	//Cannons
	draw_sprite_ext(arc_fish_spin_spr,28,xps-0.5+24,yps-0.5+82,1,1,0,c_white,1)	
	draw_sprite_ext(arc_fish_spin_spr,29,xps-0.5+24,yps-0.5+82,1,1,cannonAngle,c_white,1)	
	draw_sprite_ext(arc_fish_spin_spr,30,xps-0.5+24,yps-0.5+82,1,1,0,c_white,1)	

	draw_sprite_ext(arc_fish_spin_spr,28,xps-0.5+24+207,yps-0.5+82,-1,1,0,c_white,1)	
	draw_sprite_ext(arc_fish_spin_spr,29,xps-0.5+24+207,yps-0.5+82,-1,1,cannonAngle*-1,c_white,1)	
	draw_sprite_ext(arc_fish_spin_spr,30,xps-0.5+24+207,yps-0.5+82,-1,1,0,c_white,1)	

	//Spin Points
	for(var i=0;i<spinPointsAccumulated;i+=1){
		draw_sprite_ext(abil_crab_spr,192,xps-0.5+246,yps-0.5+36-i*4,-1,1,0,c_white,1)
		draw_sprite_ext(abil_crab_spr,194,xps-0.5+246,yps-0.5+36-i*4,-1,1,0,c_white,1)
	}

	
	//Spin Number
	draw_text_transformed(xps+244,yps+15-0.5,spinsAvailable-isSpinning,0.5,0.5,0)		
	
	//Coin/Token
	draw_text_transformed(xps+244,yps+114,tokens,0.5,0.5,0)
	

	//FishShells
	//draw_text_transformed(xps+127,yps+135,arcadeArray[30],0.5,0.5,0)

	/*
	draw_text_transformed(xps+24,yps+3,"Tickets",0.5,0.5,0)
	draw_text_transformed(xps+24+30,yps+3,totalTickets,0.5,0.5,0)

	draw_text_transformed(xps+24,yps+3+20,"Plays",0.5,0.5,0)
	draw_text_transformed(xps+24+30,yps+3+20,playsRemaining,0.5,0.5,0)	
	*/
	
	//Tickets
	draw_sprite_ext(arc_fish_spin_spr,35,xps+28.5,yps+120.5,1,1,0,c_white,1)	
	
	for(var i=1;i<arcadeArray[0,1]+1;i+=1){
		draw_sprite_ext(arc_fish_spin_spr,32,xps+26.5,yps+112+.5+(arcadeArray[i,1]*0.5)+ticketDropOffset,1,1,0,c_white,1)
	}

	if(arcadeArray[36,0]>0){
		draw_sprite_ext(abil_crab_spr,196,xps-0.5+7+chancetwo+4,yps-0.5+136,1,1,0,c_white,1)
	}
	if(arcadeArray[36,1]>0){
		draw_sprite_ext(abil_crab_spr,197,xps-0.5+246+chancetwo+4,yps-0.5+136,1,1,0,c_white,1)	
	}
	/*
	draw_text_transformed(xps+24+100,yps+3,arcadeArray[0,0],0.5,0.5,0)
	draw_text_transformed(xps+24+110,yps+3,arcadeArray[0,1],0.5,0.5,0)
	draw_text_transformed(xps+24+120,yps+3,arcadeArray[0,2],0.5,0.5,0)
	
	for(i=0;i<10;i+=1){
		draw_text_transformed(xps+24+50,yps+3+(i*10)-10,arcadeArray[i,0],0.5,0.5,0)
		draw_text_transformed(xps+24+65,yps+3+(i*10)-10,arcadeArray[i,1],0.5,0.5,0)
		draw_text_transformed(xps+24+80,yps+3+(i*10)-10,arcadeArray[i,2],0.5,0.5,0)
	}
	*/
	
	draw_sprite_ext(arc_fish_spin_spr,34,xps+28.5,yps+120.5,1,1,0,c_white,1)



	//Tickets Count
	draw_text_transformed(xps+25+2-(string_length(totalTickets)*2.3),yps+110,totalTickets,0.5,0.5,0)
	
	if(pendingTickets>0){
		draw_text_transformed(xps+25+2-(string_length(pendingTickets)*2.3),yps+110-15,pendingTickets,0.5,0.5,0)	
	}
	

	
	//Test
	
	draw_text_transformed(xps+225=20+1.5,yps+110,bonusWheelState,0.5,0.5,0)
	draw_text_transformed(xps+225=20+1.5,yps+110-10,bonusWheelTransitionY,0.5,0.5,0)
	
	//Play Count
	draw_sprite_ext(arc_fish_spin_spr,35,xps+214+15-0.5,yps+103+18-0.5,1,1,0,c_white,1)	

	
	//Token
	if(tokenDropAnimation>0){
		draw_sprite_ext(arc_fish_spin_spr,36+tokentype,xps+226,yps+110+tokenDropAnimation,1,1,tokenangle,c_white,1)	
	}	
	draw_sprite_ext(arc_fish_spin_spr,34,xps+214+15-0.5,yps+103+18-0.5,1,1,0,c_white,1)	
	draw_text_transformed(xps+225+1.5-(string_length(playsRemaining)*1.5),yps+110,playsRemaining,0.5,0.5,0)

	}else{
	
		//BeeHive Arcade

		draw_sprite_ext(arcade_big_spr,1,xps-0.5,yps-0.5,0.5,0.5,0,c_white,1)	

		with(Arcade_four){
			draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,c_white,1)
		}

		with(Arcade_two){
			draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,color,1)
		}
		
		with(Arcade_five){
			draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,c_white,1)
		}		

		with(Arcade){
			draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,color,1)
		}

		with(Arcade_three){
			draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,c_white,1)
		}

		if(arcpause==1){
			for(var i=0;i<levelupselecttotal;i+=1){
				draw_sprite_ext(arcade_bee_big,345,xps-0.5+125-50+i*28.5,yps-0.5+75,0.5,0.5,0,c_white,1)
							
				
				if(i==arcselect){
					draw_sprite_ext(arcade_bee_big,346,xps-0.5+125-50+i*28.5,yps-0.5+75,0.5,0.5,0,c_white,1)	
					draw_sprite_ext(arcade_bee_big,347+arcadeArray[1,i+1]+10,xps-0.5+125-50+i*28.5,yps-0.5+75+arcmenutickamount,0.5,0.5,0,c_white,1)
					
					draw_text_transformed(xps-0.5+113-50+i*28.5,yps-0.5+81,arcadeArray[2,i+1],0.3,0.3,0)

					if(arcadeArray[1,i+1]==0){
						if(playerbee.statatt>0){
							draw_text_transformed(xps-0.5+114-50+i*28.5,yps+81-16,playerbee.statatt,0.3,0.3,0)
						}
						
						draw_text_transformed(xps-0.5+113-50+i*28.5,yps-0.5+81+7.5,playerbee.statattdraw,0.3,0.3,0)
						draw_text_transformed(xps-0.5+113+4-50+10+i*28.5,yps-0.5+81+7.5,playerbee.statattdrawtwo,0.3,0.3,0)
					}else{

						if(arcadeArray[1,i+1]==1){
							if(playerbee.statattsped>0){
								draw_text_transformed(xps-0.5+114-50+i*28.5,yps+81-16,playerbee.statattsped,0.3,0.3,0)
							}
						
							draw_text_transformed(xps-0.5+113-50+i*28.5,yps-0.5+81+7.5,playerbee.statattspeddraw,0.3,0.3,0)
							draw_text_transformed(xps-0.5+113+4-50+10+i*28.5,yps-0.5+81+7.5,playerbee.statattspeddrawtwo,0.3,0.3,0)
						}else{

							if(arcadeArray[1,i+1]==2){
								if(playerbee.statsped>0){
									draw_text_transformed(xps-0.5+114-50+i*28.5,yps+81-16,playerbee.statsped,0.3,0.3,0)
								}
						
								draw_text_transformed(xps-0.5+113-50+i*28.5,yps-0.5+81+7.5,playerbee.statspeddraw,0.3,0.3,0)
								draw_text_transformed(xps-0.5+113+4-50+10+i*28.5,yps-0.5+81+7.5,playerbee.statspeddrawtwo,0.3,0.3,0)
							}else{
					
							}
						}
					}	
					
				}else{
					draw_sprite_ext(arcade_bee_big,347+arcadeArray[1,i+1],xps-0.5+125-50+i*28.5,yps-0.5+75,0.5,0.5,0,c_white,1)	
					draw_text_transformed_color(xps-0.5+113-50+i*28.5,yps-0.5+81,arcadeArray[2,i+1],0.3,0.3,0,colorgray,colorgray,colorgray,colorgray,1)
					
					
					if(arcadeArray[1,i+1]==0){
						if(playerbee.statatt>0){
							draw_text_transformed_color(xps-0.5+114-50+i*28.5,yps+81-16,playerbee.statatt,0.3,0.3,0,colorgray,colorgray,colorgray,colorgray,1)
						}
					}else{

						if(arcadeArray[1,i+1]==1){
							if(playerbee.statattsped>0){
								draw_text_transformed_color(xps-0.5+114-50+i*28.5,yps+81-16,playerbee.statattsped,0.3,0.3,0,colorgray,colorgray,colorgray,colorgray,1)
							}
						}else{

							if(arcadeArray[1,i+1]==2){
								if(playerbee.statsped>0){
									draw_text_transformed_color(xps-0.5+114-50+i*28.5,yps+81-16,playerbee.statsped,0.3,0.3,0,colorgray,colorgray,colorgray,colorgray,1)
								}
							}else{
					
							}
						}
					}	
					
				}


				
				
			}
		}
	
		draw_sprite_ext(maptest_spr,100,xps-0.5,yps-0.5,1,1,0,c_white,1)	

		//Tickets Count
			draw_text_transformed(xps,yps+100,"Lvl",0.5,0.5,0)
			draw_text_transformed(xps+2+10,yps+100,totalTickets,0.5,0.5,0)
			draw_text_transformed(xps+10+20+2,yps+100,bonusRollActive,0.5,0.5,0)
		
		if(instance_exists(playerbee)){
				draw_text_transformed(xps,yps+100+30,"AS",0.5,0.5,0)
				draw_text_transformed(xps+10+2,yps+100+30,playerbee.statattspeddraw,0.5,0.5,0)
				draw_text_transformed(xps+10+20+2,yps+100+30,playerbee.statattsped,0.5,0.5,0)
				draw_text_transformed(xps,yps+90+30,"S",0.5,0.5,0)
				draw_text_transformed(xps+10+2,yps+90+30,playerbee.statspeddraw,0.5,0.5,0)
				draw_text_transformed(xps+10+20+2,yps+90+30,playerbee.statsped,0.5,0.5,0)
				draw_text_transformed(xps,yps+80+30,"A",0.5,0.5,0)
				draw_text_transformed(xps+10+2,yps+80+30,playerbee.statattdraw,0.5,0.5,0)
				draw_text_transformed(xps+10+20+2,yps+80+30,playerbee.statatt,0.5,0.5,0)
				
				draw_text_transformed(xps,yps+23,arcwave,0.5,0.5,0)
				draw_text_transformed(xps+10,yps+23,arcwavetimer,0.5,0.5,0)
			
		}

		//,xps-0.5,yps-0.5
		
		/*
		for (b = 0; b < grid_height; b++) {
		    for (a = 0; a < grid_width; a++) {
				if(world[ a, b]==0){
				  draw_sprite(t_spr, 0, xps-0.5+(a * tile_size), yps-0.5+(b * tile_size));
				}else{
					if(world[ a, b]==1){
					  draw_sprite(t_spr, 1, xps-0.5+(a * tile_size), yps-0.5+(b * tile_size));
					}else{
						if(world[ a, b]==10){
						  draw_sprite(t_spr, 2, xps-0.5+(a * tile_size), yps-0.5+(b * tile_size));
						}else{
							if(world[ a, b]==20){
							  draw_sprite(t_spr, 3, xps-0.5+(a * tile_size), yps-0.5+(b * tile_size));
							}else{
				
							}				
						}				
					}				
				}
		    }
		}
		

		for (yc = 0; yc < grid_height; yc++) {
		    for (xc = 0; xc < grid_width; xc++) {
		        draw_sprite(t_spr, world[# xc, yc], xps-0.5+(xc * tile_size), yps-0.5+(yc * tile_size));
				
				draw_sprite(o_spr, world_layer2[# xc, yc], xps-0.5+(xc * tile_size), yps-0.5+(yc * tile_size));
		    }
		}	
		*/
		


	}

}


if(pause!=0){
	draw_sprite_ext(healthbar_spr,25,mouse_x,mouse_y,1,1,0,c_white,1)
}

//draw_text_transformed(xps,yps,fps_real,0.5,0.5,0)
//draw_text_transformed(xps,yps,lvlArray[1000,0],0.5,0.5,0)

//draw_text_transformed(xps,yps+16,midx,0.5,0.5,0)
//draw_text_transformed(xps,yps+32,Me.x,0.5,0.5,0)


//draw_text_transformed(xps,yps+16,Control.talentmapArray[11,1],0.5,0.5,0)
//draw_text_transformed(xps,yps+28,Me.abilArray[2,2]-(Control.talentmapArray[11,1]*5),0.5,0.5,0)

if(instance_exists(Abil)){
	with(Abil){
		if(pin==17){
			//draw_text_transformed(other.xps,other.yps+48,x,0.5,0.5,0)
		}
	}
}
/*
if(Me.class==1){
draw_text_transformed(other.xps,other.yps+48,Me.abilArray[16,1],0.5,0.5,0)
}else{
	Me.abilArray[16,1]=0
}
*/

//if(invenArray[30,0]!=999){
if(drawone!=9999999){
	draw_text_transformed(xps,yps+11,drawone,0.5,0.5,0)
}
//draw_text_transformed(xps,yps+21,drawtwo,0.5,0.5,0)
//draw_text_transformed(xps,yps+21,Control.talentmapArray[17,1],0.5,0.5,0)

//}

for(var i=0;i<3;i+=1){
//draw_text_transformed(xps,yps+11,Me.abilArray[i,0],0.5,0.5+i*10,0)
//draw_text_transformed(xps,yps+11,Me.abilArray[i,1],0.5+50,0.5+i*10,0)
//draw_text_transformed(xps,yps+11,Me.abilArray[i,2],0.5+100,0.5+i*10,0)
}

/*
	draw_text_ext_transformed(xps,yps, talentmapuiArray[0,101] ,0,1000,0.5,0.5,0)
	draw_text_ext_transformed(xps+15,yps, talentmapuiArray[0,102] ,0,1000,0.5,0.5,0)
	
	draw_text_ext_transformed(xps,yps+8, floor(((xps+mouse_x-3-60)/131)*7)-41 ,0,1000,0.5,0.5,0)
	draw_text_ext_transformed(xps+15,yps+8, floor(((yps+mouse_y-13-13)/112)*6)-32 ,0,1000,0.5,0.5,0)

	draw_text_ext_transformed(xps,yps+16, xps ,0,1000,0.5,0.5,0)
	draw_text_ext_transformed(xps+15,yps+16, yps ,0,1000,0.5,0.5,0)
				
			
	draw_text_ext_transformed(xps+48,yps, floor(((mouse_x-xps+385-3-67)/131)*7)-20 ,0,1000,0.5,0.5,0)
	draw_text_ext_transformed(xps+48+16,yps, floor(((mouse_y-yps+305-25-13)/112)*6)-15 ,0,1000,0.5,0.5,0)
*/
/*
if(Me.class==9){
draw_text_transformed(xps,yps,Me.passivefourArray[1,0],0.5,0.5,0)
draw_text_transformed(xps,yps+10,Me.passivefourArray[1,1],0.5,0.5,0)
draw_text_transformed(xps,yps+20,Me.passivefourArray[1,2],0.5,0.5,0)
draw_text_transformed(xps,yps+30,Me.passivefourArray[1,3],0.5,0.5,0)
draw_text_transformed(xps,yps+40,Me.passivefourArray[1,4],0.5,0.5,0)

draw_text_transformed(xps,yps+60,Me.passivefourArray[1,6],0.5,0.5,0)
draw_text_transformed(xps,yps+70,Me.passivefourArray[1,7],0.5,0.5,0)
draw_text_transformed(xps,yps+80,Me.passivefourArray[1,8],0.5,0.5,0)
draw_text_transformed(xps,yps+90,Me.passivefourArray[1,9],0.5,0.5,0)
}