/// @description Leaderboard save/load system

/// @function leaderboard_load()
/// @description Loads leaderboard from disk. Call once in Control Create_0.
function leaderboard_load() {
	global.lb_count = 0
	global.lb_username = "Player"
	global.lb_total_tickets = 0
	global.lb_total_plays = 0

	// Initialize array to 10 empty slots
	for (var i = 0; i < 10; i++) {
		global.lb_entries[i, 0] = 0   // score (tickets)
		global.lb_entries[i, 1] = ""  // date string
		global.lb_entries[i, 2] = ""  // username at time of entry
	}

	var _fname = "leaderboard.json"
	if (!file_exists(_fname)) return

	var _file = file_text_open_read(_fname)
	var _str = ""
	while (!file_text_eof(_file)) {
		_str += file_text_read_string(_file)
		file_text_readln(_file)
	}
	file_text_close(_file)

	if (_str == "") return

	var _data = json_parse(_str)
	if (variable_struct_exists(_data, "username")) {
		global.lb_username = _data.username
	}
	if (variable_struct_exists(_data, "total_tickets")) {
		global.lb_total_tickets = _data.total_tickets
	}
	if (variable_struct_exists(_data, "total_plays")) {
		global.lb_total_plays = _data.total_plays
	}
	if (variable_struct_exists(_data, "entries")) {
		var _arr = _data.entries
		global.lb_count = min(array_length(_arr), 10)
		for (var i = 0; i < global.lb_count; i++) {
			global.lb_entries[i, 0] = _arr[i].score
			global.lb_entries[i, 1] = _arr[i].date
			global.lb_entries[i, 2] = _arr[i].name
		}
	}
}

/// @function leaderboard_save()
/// @description Writes leaderboard to disk as JSON.
function leaderboard_save() {
	var _entries = []
	for (var i = 0; i < global.lb_count; i++) {
		array_push(_entries, {
			score: global.lb_entries[i, 0],
			date:  global.lb_entries[i, 1],
			name:  global.lb_entries[i, 2]
		})
	}
	var _data = {
		username: global.lb_username,
		total_tickets: global.lb_total_tickets,
		total_plays: global.lb_total_plays,
		entries: _entries
	}
	var _str = json_stringify(_data)
	var _file = file_text_open_write("leaderboard.json")
	file_text_write_string(_file, _str)
	file_text_close(_file)
}

/// @function leaderboard_add(_score)
/// @description Adds a new entry, sorts descending, caps at 10, saves.
function leaderboard_add(_score) {
	// Always increment play count
	global.lb_total_plays += 1
	global.lb_total_tickets += max(0, _score)

	// Don't add a zero-score entry to the leaderboard
	if (_score <= 0) {
		leaderboard_save()
		return
	}

	// Build date string
	var _date = string(current_year) + "-"
		+ (current_month < 10 ? "0" : "") + string(current_month) + "-"
		+ (current_day < 10 ? "0" : "") + string(current_day) + " "
		+ (current_hour < 10 ? "0" : "") + string(current_hour) + ":"
		+ (current_minute < 10 ? "0" : "") + string(current_minute)

	// Insert at end (or at position 9 if full)
	var _pos = min(global.lb_count, 9)
	global.lb_entries[_pos, 0] = _score
	global.lb_entries[_pos, 1] = _date
	global.lb_entries[_pos, 2] = global.lb_username
	if (global.lb_count < 10) global.lb_count++

	// Insertion sort descending by score
	for (var i = global.lb_count - 1; i > 0; i--) {
		if (global.lb_entries[i, 0] > global.lb_entries[i - 1, 0]) {
			var _ts = global.lb_entries[i, 0]
			var _td = global.lb_entries[i, 1]
			var _tn = global.lb_entries[i, 2]
			global.lb_entries[i, 0] = global.lb_entries[i - 1, 0]
			global.lb_entries[i, 1] = global.lb_entries[i - 1, 1]
			global.lb_entries[i, 2] = global.lb_entries[i - 1, 2]
			global.lb_entries[i - 1, 0] = _ts
			global.lb_entries[i - 1, 1] = _td
			global.lb_entries[i - 1, 2] = _tn
		}
	}

	leaderboard_save()
}

/// @function leaderboard_get_count()
/// @description Returns number of leaderboard entries.
function leaderboard_get_count() {
	return global.lb_count
}
