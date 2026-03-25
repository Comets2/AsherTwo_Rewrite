/// @description Standardized UI drawing functions

/// @function ui_panel(x1, y1, x2, y2)
/// @description Draws a UI panel with dark brown border, brown fill, and accent highlights on top+right
function ui_panel(_x1, _y1, _x2, _y2) {
	// Border (1px dark brown)
	draw_rectangle_color(_x1, _y1, _x2, _y2,
		ui_border, ui_border, ui_border, ui_border, false)
	// Fill (brown) - 1px inset
	draw_rectangle_color(_x1 + 1, _y1 + 1, _x2 - 1, _y2 - 1,
		pathcolor, pathcolor, pathcolor, pathcolor, false)
	// Accent highlight - top edge (1px, on first pixel of fill)
	draw_rectangle_color(_x1 + 1, _y1 + 1, _x2 - 1, _y1 + 1,
		colorbrown, colorbrown, colorbrown, colorbrown, false)
	// Accent highlight - right edge (1px, on first pixel of fill)
	draw_rectangle_color(_x2 - 1, _y1 + 1, _x2 - 1, _y2 - 1,
		colorbrown, colorbrown, colorbrown, colorbrown, false)
}

/// @function ui_button(x1, y1, x2, y2, selected)
/// @description Draws a button/card. Border outline, darker tan border, tan fill. Selected: tan orange fill with gold selector frame
function ui_button(_x1, _y1, _x2, _y2, _selected) {
	// Outer 1px: border color
	draw_rectangle_color(_x1, _y1, _x2, _y2,
		ui_border, ui_border, ui_border, ui_border, false)
	if (_selected) {
		// Selected fill (tan orange)
		draw_rectangle_color(_x1, _y1, _x2, _y2,
			colorgoldmed, colorgoldmed, colorgoldmed, colorgoldmed, false)
		// Gold selector frame extended 1px outside button bounds
		ui_selector(_x1 - 1, _y1 - 1, _x2 + 1, _y2 + 1)
		// Restore selected fill inside the selector frame
		draw_rectangle_color(_x1 + 3, _y1 + 3, _x2 - 3, _y2 - 3,
			colorgoldmed, colorgoldmed, colorgoldmed, colorgoldmed, false)
	} else {
		// 1px darker tan between border and fill
		draw_rectangle_color(_x1 + 1, _y1 + 1, _x2 - 1, _y2 - 1,
			ui_btn_outline, ui_btn_outline, ui_btn_outline, ui_btn_outline, false)
		// Normal tan fill
		draw_rectangle_color(_x1 + 2, _y1 + 2, _x2 - 2, _y2 - 2,
			colorgold, colorgold, colorgold, colorgold, false)
	}
}

/// @function ui_selector(x1, y1, x2, y2)
/// @description Draws a beveled gold selector frame with dark outline and inner border
function ui_selector(_x1, _y1, _x2, _y2) {
	// Ring 1 (outer): border outline color
	draw_rectangle_color(_x1, _y1, _x2, _y2,
		ui_border, ui_border, ui_border, ui_border, false)

	// Ring 2 (1px inset): beveled gold edges
	// Draw left+bottom first (medium gold)
	draw_rectangle_color(_x1 + 1, _y1 + 1, _x1 + 1, _y2 - 1,
		colorgold, colorgold, colorgold, colorgold, false)
	draw_rectangle_color(_x1 + 1, _y2 - 1, _x2 - 1, _y2 - 1,
		colorgold, colorgold, colorgold, colorgold, false)
	// Draw top+right on top (light gold wins shared corners)
	draw_rectangle_color(_x1 + 1, _y1 + 1, _x2 - 1, _y1 + 1,
		colorgoldlight, colorgoldlight, colorgoldlight, colorgoldlight, false)
	draw_rectangle_color(_x2 - 1, _y1 + 1, _x2 - 1, _y2 - 1,
		colorgoldlight, colorgoldlight, colorgoldlight, colorgoldlight, false)

	// Ring 3 (2px inset): border outline color
	draw_rectangle_color(_x1 + 2, _y1 + 2, _x2 - 2, _y1 + 2,
		ui_border, ui_border, ui_border, ui_border, false)
	draw_rectangle_color(_x2 - 2, _y1 + 2, _x2 - 2, _y2 - 2,
		ui_border, ui_border, ui_border, ui_border, false)
	draw_rectangle_color(_x1 + 2, _y2 - 2, _x2 - 2, _y2 - 2,
		ui_border, ui_border, ui_border, ui_border, false)
	draw_rectangle_color(_x1 + 2, _y1 + 2, _x1 + 2, _y2 - 2,
		ui_border, ui_border, ui_border, ui_border, false)

	// Ring 4 (3px inset): inner fill border (hurtcolor/red)
	draw_rectangle_color(_x1 + 3, _y1 + 3, _x2 - 3, _y1 + 3,
		hurtcolor, hurtcolor, hurtcolor, hurtcolor, false)
	draw_rectangle_color(_x2 - 3, _y1 + 3, _x2 - 3, _y2 - 3,
		hurtcolor, hurtcolor, hurtcolor, hurtcolor, false)
	draw_rectangle_color(_x1 + 3, _y2 - 3, _x2 - 3, _y2 - 3,
		hurtcolor, hurtcolor, hurtcolor, hurtcolor, false)
	draw_rectangle_color(_x1 + 3, _y1 + 3, _x1 + 3, _y2 - 3,
		hurtcolor, hurtcolor, hurtcolor, hurtcolor, false)
}
