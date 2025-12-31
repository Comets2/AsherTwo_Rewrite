function game_start_scr(){
	// Initialize world generation
	worldgen_initialize_scr()
	worldgen_scr()

	// Initialize items
	items_scr()

	// Initialize player
	Me.passiveArray[2,50] = 0
	Me.class = 0

	// Initialize talent system
	talentmapuiArray[0,100] = 0
	talentcreate_scr()

	// Initialize XP and level system
	xp = 0
	xptotal = 0
	xpamount = 0
	xptimer = 0
	timertime = 0
	levelup = 0
	leveluptotal = 120
	levelupimg = 0

	// Mark game as initialized
	game_initialized = true
}
