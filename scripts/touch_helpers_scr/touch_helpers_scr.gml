// Touch helper functions

// Helper function to check if a rectangular area was touched
function touch_in_rect(x1, y1, x2, y2) {
	return (global.touch_x >= x1 && global.touch_x <= x2 && 
	        global.touch_y >= y1 && global.touch_y <= y2);
}

// Helper function to check if touch was pressed in area
function touch_pressed_in_rect(x1, y1, x2, y2) {
	return global.touch_pressed && touch_in_rect(x1, y1, x2, y2);
}

// Helper function for circular touch areas
function touch_in_circle(cx, cy, radius) {
	return point_distance(global.touch_x, global.touch_y, cx, cy) <= radius;
}