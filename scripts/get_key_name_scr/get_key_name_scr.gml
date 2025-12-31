function get_key_name_scr(key_code){
	// Return human-readable key name
	switch(key_code){
		case vk_up: return "Up"
		case vk_down: return "Down"
		case vk_left: return "Left"
		case vk_right: return "Right"
		case vk_space: return "Space"
		case vk_enter: return "Enter"
		case vk_escape: return "Escape"
		case vk_shift: return "Shift"
		case vk_control: return "Ctrl"
		case vk_alt: return "Alt"
		case vk_tab: return "Tab"
		case vk_backspace: return "Backspace"
		case vk_delete: return "Delete"
		case vk_insert: return "Insert"
		case vk_home: return "Home"
		case vk_end: return "End"
		case vk_pageup: return "PgUp"
		case vk_pagedown: return "PgDn"
		case vk_f1: return "F1"
		case vk_f2: return "F2"
		case vk_f3: return "F3"
		case vk_f4: return "F4"
		case vk_f5: return "F5"
		case vk_f6: return "F6"
		case vk_f7: return "F7"
		case vk_f8: return "F8"
		case vk_f9: return "F9"
		case vk_f10: return "F10"
		case vk_f11: return "F11"
		case vk_f12: return "F12"
		case vk_numpad0: return "Num 0"
		case vk_numpad1: return "Num 1"
		case vk_numpad2: return "Num 2"
		case vk_numpad3: return "Num 3"
		case vk_numpad4: return "Num 4"
		case vk_numpad5: return "Num 5"
		case vk_numpad6: return "Num 6"
		case vk_numpad7: return "Num 7"
		case vk_numpad8: return "Num 8"
		case vk_numpad9: return "Num 9"
		case vk_multiply: return "Num *"
		case vk_divide: return "Num /"
		case vk_add: return "Num +"
		case vk_subtract: return "Num -"
		case vk_decimal: return "Num ."
		default:
			// Check for letter keys (A-Z)
			if(key_code >= 65 && key_code <= 90){
				return chr(key_code)
			}
			// Check for number keys (0-9)
			if(key_code >= 48 && key_code <= 57){
				return chr(key_code)
			}
			return "Key " + string(key_code)
	}
}
