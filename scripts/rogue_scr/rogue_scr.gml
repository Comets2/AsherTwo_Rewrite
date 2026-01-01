// Rogue Mode Script - Endless wave survival with card upgrades

function rogue_worldgen_scr() {
	// Generate the Extra Large arena for Rogue mode
	with(Control){
		stagetimer = 0

		// Use Extra Large size (100x25 blocks)
		lvlselect = 5
		rmtype = 1

		// Set level type for rogue mode
		lvlArray[1000,0] = 100  // Special rogue level type

		// Position player at center
		with(Me){
			x = other.midx
			y = other.midy + 32
		}

		xto = camtarget.x
		yto = camtarget.y - 8
		camx = xto
		camy = yto

		border = 14
		bordertwo = border/2

		rmw = lvlArray[lvlselect,0] + bordertwo  // 100 + 7 = 107
		rmh = lvlArray[lvlselect,1] + bordertwo  // 25 + 7 = 32

		mapx = midx - ((rmw*blockwidth)/2)
		mapy = midy - ((rmh*blockwidth)/2)

		mapxspot = mapx + (border/2)*16
		mapyspot = mapy + (border/2)*16
		mapxspottotal = mapx + rmw*16
		mapyspottotal = mapy + rmh*16

		Me.midx = x
		Me.midy = y

		// Clear existing blocks
		if(instance_exists(Block)){
			with(Block){
				instance_destroy()
			}
		}

		// Clear existing enemies
		if(instance_exists(Enemy)){
			with(Enemy){
				instance_destroy()
			}
		}

		// Generate room boundaries
		for(var a = 0; a < rmw+1+(border); a += 1){
			for(var b = 0; b < rmh+1+(border); b += 1){
				roomArray[a,b] = 0
				if(a < bordertwo || a > rmw || b < bordertwo || b > rmh){
					roomArray[a,b] = 2
				}
				if(a == bordertwo || b == bordertwo || a == rmw+1 || b == rmh+1){
					if(b == rmh+1 && a != rmw+1 && a > bordertwo && a < rmw+1){
						roomArray[a,b] = 1
					}else{
						roomArray[a,b] = 2
					}
					var created = instance_create_depth(mapx+a*blockwidth, mapy+b*blockwidth, 0, Block)
					with(created){
						sprite_index = block_spr
						image_index = 0
						image_speed = 0
					}
				}
			}
		}

		// Add platforms throughout the arena
		rogue_generate_platforms_scr()

		// Setup spawn points
		rogue_setup_spawns_scr()

		// Initialize rogue stats on player
		rogue_init_stats_scr()
	}
}

function rogue_generate_platforms_scr() {
	// Generate platforms spread across the XL arena
	with(Control){
		var platform_data = [
			// [x_offset, y_offset, width]
			[15, 8, 6],
			[30, 12, 8],
			[45, 6, 7],
			[60, 14, 6],
			[75, 10, 8],
			[90, 8, 5],
			[25, 18, 6],
			[55, 18, 7],
			[80, 16, 6]
		]

		for(var p = 0; p < array_length(platform_data); p++){
			var plat_x = bordertwo + platform_data[p][0]
			var plat_y = bordertwo + platform_data[p][1]
			var plat_w = platform_data[p][2]

			for(var px = plat_x; px < plat_x + plat_w; px++){
				if(px < rmw){
					roomArray[px, plat_y] = 1
					var created = instance_create_depth(mapx+px*blockwidth, mapy+plat_y*blockwidth, 0, Block)
					with(created){
						sprite_index = block_spr
						image_index = 0
						image_speed = 0
					}
				}
			}
		}
	}
}

function rogue_setup_spawns_scr() {
	// Set up spawn points across the arena
	with(Control){
		var base_x = mapx + bordertwo*16
		var base_y = mapy + bordertwo*16

		// 10 spawn points spread across the arena
		rogueSpawnArray[0,0] = base_x + 5*16
		rogueSpawnArray[0,1] = base_y + 5*16

		rogueSpawnArray[1,0] = base_x + 5*16
		rogueSpawnArray[1,1] = base_y + 18*16

		rogueSpawnArray[2,0] = base_x + 25*16
		rogueSpawnArray[2,1] = base_y + 8*16

		rogueSpawnArray[3,0] = base_x + 25*16
		rogueSpawnArray[3,1] = base_y + 16*16

		rogueSpawnArray[4,0] = base_x + 45*16
		rogueSpawnArray[4,1] = base_y + 5*16

		rogueSpawnArray[5,0] = base_x + 45*16
		rogueSpawnArray[5,1] = base_y + 18*16

		rogueSpawnArray[6,0] = base_x + 65*16
		rogueSpawnArray[6,1] = base_y + 8*16

		rogueSpawnArray[7,0] = base_x + 65*16
		rogueSpawnArray[7,1] = base_y + 16*16

		rogueSpawnArray[8,0] = base_x + 85*16
		rogueSpawnArray[8,1] = base_y + 5*16

		rogueSpawnArray[9,0] = base_x + 85*16
		rogueSpawnArray[9,1] = base_y + 18*16
	}
}

function rogue_init_stats_scr() {
	// Initialize rogue-specific stats on the player
	with(Me){
		rogue_statatt = 0      // Attack bonus
		rogue_statsped = 0     // Speed bonus
		rogue_statattsped = 0  // Attack speed bonus
		rogue_statpower = 0    // Health/Power bonus
	}
}

function rogue_run_scr() {
	// Main rogue gameplay loop - called each step when rogue_mode is active
	with(Control){
		stagetimer += 1

		// Handle card selection pause
		if(rogue_pause == 1){
			rogue_card_input_scr()
			return
		}

		// Wave management
		if(rogue_wave_timer > 0){
			rogue_wave_timer -= 1
			if(rogue_wave_timer == 0){
				rogue_wave += 1
				rogue_spawn_wave_scr()
			}
		}else{
			// Check if wave is complete
			rogue_enemies_remaining = 0
			with(Enemy){
				if(team != 0 && team != 3){
					other.rogue_enemies_remaining += 1
				}
			}

			if(rogue_enemies_remaining == 0 && rogue_wave_active){
				rogue_wave_active = false
				rogue_wave_timer = 120  // 2 second break between waves

				// Check for level up
				if(rogue_xp >= rogue_xp_needed){
					rogue_xp -= rogue_xp_needed
					rogue_level += 1
					rogue_xp_needed = 10 + (rogue_level * 5)
					rogue_trigger_levelup_scr()
				}
			}
		}

		// Check for player death
		if(instance_exists(Me)){
			if(Me.hp <= 0){
				pause = 24  // Game over screen
			}
		}
	}
}

function rogue_spawn_wave_scr() {
	// Spawn enemies for current wave
	with(Control){
		rogue_wave_active = true

		// Scale enemy count with wave number
		var enemy_count = 3 + floor(rogue_wave * 1.2)
		if(enemy_count > 15) enemy_count = 15

		for(var e = 0; e < enemy_count; e++){
			var spawn_idx = e mod 10

			var created = instance_create_depth(
				rogueSpawnArray[spawn_idx, 0],
				rogueSpawnArray[spawn_idx, 1],
				10, Enemy
			)

			// Select enemy type based on wave difficulty (Forest enemies: pin 1-5)
			with(created){
				if(Control.rogue_wave < 3){
					pin = choose(1, 1, 3, 3)  // Trees and runners
					enopt = 0
				}else if(Control.rogue_wave < 6){
					pin = choose(1, 2, 3, 3)  // Add fliers
					enopt = choose(0, 1)
				}else if(Control.rogue_wave < 10){
					pin = choose(1, 2, 3, 5)  // Add bats
					enopt = choose(0, 1, 1)
				}else{
					pin = choose(1, 2, 3, 3, 5)  // All forest enemies
					enopt = choose(0, 1, 1, 2)
				}

				// Initialize enemy
				enemy_scr()

				// Scale enemy HP with wave
				hp = hp * (1 + (Control.rogue_wave * 0.08))
				hptotal = hp

				// Set XP drop
				xpdrop = 1 + floor(Control.rogue_wave / 3)
			}
		}
	}
}

function rogue_trigger_levelup_scr() {
	// Pause game and show card selection
	with(Control){
		rogue_pause = 1
		rogue_card_select = 0

		// Generate random cards
		for(var i = 0; i < levelupselecttotal_rogue; i++){
			rogueArray[1, i+1] = irandom(3)  // 0-3: Attack, AttSpeed, Speed, Health

			switch(rogueArray[1, i+1]){
				case 0:
					rogueArray[2, i+1] = "Attack"
					break
				case 1:
					rogueArray[2, i+1] = "Att Speed"
					break
				case 2:
					rogueArray[2, i+1] = "Speed"
					break
				case 3:
					rogueArray[2, i+1] = "Health"
					break
			}
		}
	}
}

function rogue_card_input_scr() {
	// Handle card selection input
	with(Control){
		// Left/Right navigation
		if(global.con_p_right || global.conp_p_right){
			rogue_card_select += 1
			if(rogue_card_select >= levelupselecttotal_rogue){
				rogue_card_select = 0
			}
		}
		if(global.con_p_left || global.conp_p_left){
			rogue_card_select -= 1
			if(rogue_card_select < 0){
				rogue_card_select = levelupselecttotal_rogue - 1
			}
		}

		// Confirm selection
		if(global.con_p_space || global.conp_p_space || global.con_p_enter || global.con_p_e || global.conp_p_e){
			var card_type = rogueArray[1, rogue_card_select + 1]

			// Apply stat upgrade to Me
			switch(card_type){
				case 0:  // Attack
					Me.rogue_statatt += 1
					break
				case 1:  // Attack Speed
					Me.rogue_statattsped += 1
					break
				case 2:  // Speed
					Me.rogue_statsped += 1
					break
				case 3:  // Health
					Me.rogue_statpower += 1
					Me.hptotal += 2
					Me.hp = min(Me.hp + 2, Me.hptotal)
					break
			}

			rogue_pause = 0  // Resume gameplay
		}
	}
}

function rogue_collect_xp_scr(amount) {
	// Called when enemy dies - add XP
	with(Control){
		rogue_xp += amount
	}
}
