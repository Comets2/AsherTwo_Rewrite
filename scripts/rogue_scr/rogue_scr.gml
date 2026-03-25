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

		// Platforms disabled for now
		// rogue_generate_platforms_scr()

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
		rogue_statcooldown = 0  // Cooldown reduction bonus
		rogue_statpower = 0    // Health/Power bonus
	}

	// Initialize card pool
	rogue_init_card_pool_scr()

	// Reset blocked and acquired talents for this run
	with(Control){
		for(var i = 0; i < 24; i++){
			rogue_blocked_talents[i] = false
			rogue_acquired_talents[i] = false
		}

		// Reset all talent points for fresh rogue run
		// This ensures talents from adventure mode don't carry over
		for(var i = 0; i < 24; i++){
			talentmapArray[i, 1] = 0  // Reset points spent
		}
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
		pause = 26  // Pause gameplay (26 = rogue card selection, unused by other systems)
		rogue_card_select = 0
		rogue_card_hold = 0  // Reset hold timer to prevent accidental selection

		// Build valid card pool
		var valid_cards = []
		var valid_count = 0

		for(var card_id = 0; card_id < rogue_card_pool_size; card_id++){
			var card_type = rogueCardPool[card_id, 1]
			var talent_idx = rogueCardPool[card_id, 2]
			var prereq = rogueCardPool[card_id, 3]
			var blocks = rogueCardPool[card_id, 4]
			var repeatable = rogueCardPool[card_id, 5]

			var is_valid = true

			// Stat cards (type 0) are always valid
			if(card_type == 0){
				is_valid = true
			}else{
				// Talent cards need additional checks

				// Check if already acquired (and not repeatable)
				if(repeatable == 0 && rogue_acquired_talents[talent_idx]){
					is_valid = false
				}

				// Check if this talent is blocked by a branch choice
				if(rogue_blocked_talents[talent_idx]){
					is_valid = false
				}

				// Check prerequisite (prereq talent must be acquired)
				if(prereq > 0 && !rogue_acquired_talents[prereq]){
					is_valid = false
				}

				// Check if blocked by another card that blocks this talent
				// (e.g., if Gourds acquired, Sprout is blocked)
				if(blocks > 0 && rogue_acquired_talents[blocks]){
					// This card blocks a talent that's already acquired
					// So this card shouldn't appear (the opposite branch was chosen)
					is_valid = false
				}
			}

			if(is_valid){
				valid_cards[valid_count] = card_id
				valid_count += 1
			}
		}

		// Pick 3 unique cards from valid pool
		var cards_to_show = min(levelupselecttotal_rogue, valid_count)

		for(var i = 0; i < levelupselecttotal_rogue; i++){
			if(i < cards_to_show && valid_count > 0){
				// Pick random card from remaining valid cards
				var pick_idx = irandom(valid_count - 1)
				var card_id = valid_cards[pick_idx]

				rogueArray[1, i+1] = card_id
				rogueArray[2, i+1] = rogueCardPool[card_id, 0]  // Card name

				// Remove picked card from valid pool (swap with last)
				valid_cards[pick_idx] = valid_cards[valid_count - 1]
				valid_count -= 1
			}else{
				// Not enough valid cards, show empty slot
				rogueArray[1, i+1] = -1
				rogueArray[2, i+1] = ""
			}
		}
	}
}

function rogue_card_input_scr() {
	// Handle card selection input
	// Use direct keyboard/gamepad checks since controls_scr runs after this in Step_1
	with(Control){
		// Left/Right navigation (reset hold timer when changing selection)
		var nav_right = keyboard_check_pressed(global.consave_right) || gamepad_button_check_pressed(0, gp_padr)
		var nav_left = keyboard_check_pressed(global.consave_left) || gamepad_button_check_pressed(0, gp_padl)

		if(nav_right){
			rogue_card_select += 1
			if(rogue_card_select >= levelupselecttotal_rogue){
				rogue_card_select = 0
			}
			rogue_card_hold = 0  // Reset hold on navigation
		}
		if(nav_left){
			rogue_card_select -= 1
			if(rogue_card_select < 0){
				rogue_card_select = levelupselecttotal_rogue - 1
			}
			rogue_card_hold = 0  // Reset hold on navigation
		}

		// Hold to confirm selection (check if button is HELD, not just pressed)
		var confirm_held = keyboard_check(global.consave_space) || keyboard_check(global.consave_enter) ||
		                   keyboard_check(global.consave_e) || gamepad_button_check(0, gp_face1) ||
		                   mouse_check_button(mb_left)

		if(confirm_held){
			rogue_card_hold += 1

			// Confirm when held long enough
			if(rogue_card_hold >= rogue_card_hold_needed){
				var card_id = rogueArray[1, rogue_card_select + 1]

				// Skip if invalid card
				if(card_id >= 0){
					var card_type = rogueCardPool[card_id, 1]
					var talent_idx = rogueCardPool[card_id, 2]
					var blocks = rogueCardPool[card_id, 4]
					var stat_type = rogueCardPool[card_id, 7]

					if(card_type == 0){
						// Stat card - apply stat upgrade to Me
						switch(stat_type){
							case 0:  // Attack
								Me.rogue_statatt += 1
								break
							case 1:  // Cooldown
								Me.rogue_statcooldown += 1
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
					}else{
						// Talent card - unlock/upgrade talent
						talentmapArray[talent_idx, 1] = 1  // Set talent as acquired

						// Mark as acquired in rogue tracking
						rogue_acquired_talents[talent_idx] = true

						// Handle blocking (e.g., Gourds blocks Sprout)
						if(blocks > 0){
							rogue_blocked_talents[blocks] = true
						}
					}
				}

				rogue_card_hold = 0  // Reset for next time
				rogue_pause = 0  // Resume gameplay
				pause = 0  // Unpause all gameplay
			}
		}else{
			// Reset hold timer if button released
			rogue_card_hold = 0
		}
	}
}

function rogue_collect_xp_scr(amount) {
	// Called when XP is picked up - add to pending XP with delay timer
	with(Control){
		rogue_xpamount += amount
		rogue_xptimer = 60
	}
}

function rogue_init_card_pool_scr() {
	// Initialize rogue cards based on player class
	// rogueCardPool[card_id, property]:
	// 0: Name, 1: Type, 2: Talent index, 3: Prerequisite, 4: Blocks, 5: Repeatable, 6: Description, 7: Stat type, 8: Sprite index

	with(Control){
		// === STAT CARDS (0-3) - Always available, repeatable, shared by all classes ===
		// Card 0: Attack
		rogueCardPool[0,0] = "Attack"
		rogueCardPool[0,1] = 0  // Type: stat
		rogueCardPool[0,2] = -1 // No talent
		rogueCardPool[0,3] = 0  // No prereq
		rogueCardPool[0,4] = 0  // No block
		rogueCardPool[0,5] = 1  // Repeatable
		rogueCardPool[0,6] = "+5% Damage"
		rogueCardPool[0,7] = 0  // Stat type: attack
		rogueCardPool[0,8] = -1 // No talent sprite

		// Card 1: Cooldown
		rogueCardPool[1,0] = "Cooldown"
		rogueCardPool[1,1] = 0
		rogueCardPool[1,2] = -1
		rogueCardPool[1,3] = 0
		rogueCardPool[1,4] = 0
		rogueCardPool[1,5] = 1
		rogueCardPool[1,6] = "+3% Faster"
		rogueCardPool[1,7] = 1
		rogueCardPool[1,8] = -1

		// Card 2: Speed
		rogueCardPool[2,0] = "Speed"
		rogueCardPool[2,1] = 0
		rogueCardPool[2,2] = -1
		rogueCardPool[2,3] = 0
		rogueCardPool[2,4] = 0
		rogueCardPool[2,5] = 1
		rogueCardPool[2,6] = "+5% Movement"
		rogueCardPool[2,7] = 2
		rogueCardPool[2,8] = -1

		// Card 3: Health
		rogueCardPool[3,0] = "Health"
		rogueCardPool[3,1] = 0
		rogueCardPool[3,2] = -1
		rogueCardPool[3,3] = 0
		rogueCardPool[3,4] = 0
		rogueCardPool[3,5] = 1
		rogueCardPool[3,6] = "+2 HP"
		rogueCardPool[3,7] = 3
		rogueCardPool[3,8] = -1

		// Class-specific talent cards
		if(Me.class == 1){
			rogue_init_witch_cards_scr()
		}else if(Me.class == 2){
			rogue_init_pumpkin_cards_scr()
		}else{
			// Default: use stat cards only for classes without talent cards
			rogue_card_pool_size = 4
		}
	}
}

function rogue_init_pumpkin_cards_scr() {
	// Initialize Pumpkin class talent cards (4-24)
	with(Control){
		// === E ABILITY UPGRADES (4-6) - Talents 1-3 ===
		// Card 4: Pumpkin Power (Talent 1)
		rogueCardPool[4,0] = "Pumpkin Power"
		rogueCardPool[4,1] = 2  // Type: ability_buff
		rogueCardPool[4,2] = 1  // Talent 1
		rogueCardPool[4,3] = 0  // No prereq (E always available)
		rogueCardPool[4,4] = 0
		rogueCardPool[4,5] = 0  // Not repeatable
		rogueCardPool[4,6] = "E: +5% Damage"
		rogueCardPool[4,7] = -1
		rogueCardPool[4,8] = 49 // talent_spr index

		// Card 5: Pumpkin AOE (Talent 2)
		rogueCardPool[5,0] = "Pumpkin AOE"
		rogueCardPool[5,1] = 2
		rogueCardPool[5,2] = 2  // Talent 2
		rogueCardPool[5,3] = 1  // Requires Talent 1
		rogueCardPool[5,4] = 0
		rogueCardPool[5,5] = 0
		rogueCardPool[5,6] = "E: Larger Area"
		rogueCardPool[5,7] = -1
		rogueCardPool[5,8] = 50

		// Card 6: Pumpkin Spirit (Talent 3)
		rogueCardPool[6,0] = "Pumpkin Spirit"
		rogueCardPool[6,1] = 2
		rogueCardPool[6,2] = 3  // Talent 3
		rogueCardPool[6,3] = 2  // Requires Talent 2
		rogueCardPool[6,4] = 0
		rogueCardPool[6,5] = 0
		rogueCardPool[6,6] = "E: +25% Damage"
		rogueCardPool[6,7] = -1
		rogueCardPool[6,8] = 51

		// === Q ABILITY CARDS - GOURDS BRANCH (7-9) - Talents 4-6 ===
		// Card 7: Gourds (Talent 4) - Unlock
		rogueCardPool[7,0] = "Gourds"
		rogueCardPool[7,1] = 1  // Type: ability_unlock
		rogueCardPool[7,2] = 4  // Talent 4
		rogueCardPool[7,3] = 0  // No prereq
		rogueCardPool[7,4] = 7  // Blocks Talent 7 (Sprout)
		rogueCardPool[7,5] = 0
		rogueCardPool[7,6] = "Q: 3-Pumpkin Spread"
		rogueCardPool[7,7] = -1
		rogueCardPool[7,8] = 52

		// Card 8: Gourds Buff (Talent 5)
		rogueCardPool[8,0] = "Gourds Buff"
		rogueCardPool[8,1] = 2
		rogueCardPool[8,2] = 5  // Talent 5
		rogueCardPool[8,3] = 4  // Requires Talent 4
		rogueCardPool[8,4] = 0
		rogueCardPool[8,5] = 0
		rogueCardPool[8,6] = "Q: +5% Damage"
		rogueCardPool[8,7] = -1
		rogueCardPool[8,8] = 53

		// Card 9: Gourds Modify (Talent 6)
		rogueCardPool[9,0] = "Gourds Modify"
		rogueCardPool[9,1] = 2
		rogueCardPool[9,2] = 6  // Talent 6
		rogueCardPool[9,3] = 5  // Requires Talent 5
		rogueCardPool[9,4] = 0
		rogueCardPool[9,5] = 0
		rogueCardPool[9,6] = "Q: +25% Duration"
		rogueCardPool[9,7] = -1
		rogueCardPool[9,8] = 54

		// === Q ABILITY CARDS - SPROUT BRANCH (10-12) - Talents 7-9 ===
		// Card 10: Sprout (Talent 7) - Unlock
		rogueCardPool[10,0] = "Sprout"
		rogueCardPool[10,1] = 1  // Type: ability_unlock
		rogueCardPool[10,2] = 7  // Talent 7
		rogueCardPool[10,3] = 0  // No prereq
		rogueCardPool[10,4] = 4  // Blocks Talent 4 (Gourds)
		rogueCardPool[10,5] = 0
		rogueCardPool[10,6] = "Q: Minion Pumpkin"
		rogueCardPool[10,7] = -1
		rogueCardPool[10,8] = 55

		// Card 11: Sprout Buff (Talent 8)
		rogueCardPool[11,0] = "Sprout Buff"
		rogueCardPool[11,1] = 2
		rogueCardPool[11,2] = 8  // Talent 8
		rogueCardPool[11,3] = 7  // Requires Talent 7
		rogueCardPool[11,4] = 0
		rogueCardPool[11,5] = 0
		rogueCardPool[11,6] = "Q: Spread Damage"
		rogueCardPool[11,7] = -1
		rogueCardPool[11,8] = 56

		// Card 12: Sprout Modify (Talent 9)
		rogueCardPool[12,0] = "Sprout Modify"
		rogueCardPool[12,1] = 2
		rogueCardPool[12,2] = 9  // Talent 9
		rogueCardPool[12,3] = 8  // Requires Talent 8
		rogueCardPool[12,4] = 0
		rogueCardPool[12,5] = 0
		rogueCardPool[12,6] = "Q: Enhanced Spread"
		rogueCardPool[12,7] = -1
		rogueCardPool[12,8] = 57

		// === W ABILITY CARDS - HAUNT BRANCH (13-15) - Talents 10-12 ===
		// Card 13: Haunt (Talent 10) - Unlock
		rogueCardPool[13,0] = "Haunt"
		rogueCardPool[13,1] = 1  // Type: ability_unlock
		rogueCardPool[13,2] = 10 // Talent 10
		rogueCardPool[13,3] = 0  // No prereq
		rogueCardPool[13,4] = 13 // Blocks Talent 13 (JackoLantern)
		rogueCardPool[13,5] = 0
		rogueCardPool[13,6] = "W: Bouncing Pumpkin"
		rogueCardPool[13,7] = -1
		rogueCardPool[13,8] = 58

		// Card 14: Haunt Buff (Talent 11)
		rogueCardPool[14,0] = "Haunt Buff"
		rogueCardPool[14,1] = 2
		rogueCardPool[14,2] = 11 // Talent 11
		rogueCardPool[14,3] = 10 // Requires Talent 10
		rogueCardPool[14,4] = 0
		rogueCardPool[14,5] = 0
		rogueCardPool[14,6] = "W: +5% Damage"
		rogueCardPool[14,7] = -1
		rogueCardPool[14,8] = 59

		// Card 15: Haunt Modify (Talent 12)
		rogueCardPool[15,0] = "Haunt Modify"
		rogueCardPool[15,1] = 2
		rogueCardPool[15,2] = 12 // Talent 12
		rogueCardPool[15,3] = 11 // Requires Talent 11
		rogueCardPool[15,4] = 0
		rogueCardPool[15,5] = 0
		rogueCardPool[15,6] = "W: +25% AOE"
		rogueCardPool[15,7] = -1
		rogueCardPool[15,8] = 60

		// === W ABILITY CARDS - JACKOLANTERN BRANCH (16-18) - Talents 13-15 ===
		// Card 16: JackoLantern (Talent 13) - Unlock
		rogueCardPool[16,0] = "JackoLantern"
		rogueCardPool[16,1] = 1  // Type: ability_unlock
		rogueCardPool[16,2] = 13 // Talent 13
		rogueCardPool[16,3] = 0  // No prereq
		rogueCardPool[16,4] = 10 // Blocks Talent 10 (Haunt)
		rogueCardPool[16,5] = 0
		rogueCardPool[16,6] = "W: Slam Pumpkin"
		rogueCardPool[16,7] = -1
		rogueCardPool[16,8] = 61

		// Card 17: JackoLantern Buff (Talent 14)
		rogueCardPool[17,0] = "JackoLantern Buff"
		rogueCardPool[17,1] = 2
		rogueCardPool[17,2] = 14 // Talent 14
		rogueCardPool[17,3] = 13 // Requires Talent 13
		rogueCardPool[17,4] = 0
		rogueCardPool[17,5] = 0
		rogueCardPool[17,6] = "W: +5% Damage"
		rogueCardPool[17,7] = -1
		rogueCardPool[17,8] = 62

		// Card 18: JackoLantern Modify (Talent 15)
		rogueCardPool[18,0] = "JackoLantern Modify"
		rogueCardPool[18,1] = 2
		rogueCardPool[18,2] = 15 // Talent 15
		rogueCardPool[18,3] = 14 // Requires Talent 14
		rogueCardPool[18,4] = 0
		rogueCardPool[18,5] = 0
		rogueCardPool[18,6] = "W: Gravity Effect"
		rogueCardPool[18,7] = -1
		rogueCardPool[18,8] = 63

		// === PASSIVE CARDS - SHELL SHIELD BRANCH (19-21) - Talents 16-18 ===
		// Card 19: Shell Shield (Talent 16) - Unlock
		rogueCardPool[19,0] = "Shell Shield"
		rogueCardPool[19,1] = 3  // Type: passive_unlock
		rogueCardPool[19,2] = 16 // Talent 16
		rogueCardPool[19,3] = 0  // No prereq
		rogueCardPool[19,4] = 0
		rogueCardPool[19,5] = 0
		rogueCardPool[19,6] = "Block Damage"
		rogueCardPool[19,7] = -1
		rogueCardPool[19,8] = 64

		// Card 20: Shell Shield+ (Talent 17)
		rogueCardPool[20,0] = "Shell Shield+"
		rogueCardPool[20,1] = 4  // Type: passive_buff
		rogueCardPool[20,2] = 17 // Talent 17
		rogueCardPool[20,3] = 16 // Requires Talent 16
		rogueCardPool[20,4] = 0
		rogueCardPool[20,5] = 0
		rogueCardPool[20,6] = "Reduced Cooldown"
		rogueCardPool[20,7] = -1
		rogueCardPool[20,8] = 65

		// Card 21: Shell Shield++ (Talent 18)
		rogueCardPool[21,0] = "Shell Shield++"
		rogueCardPool[21,1] = 4
		rogueCardPool[21,2] = 18 // Talent 18
		rogueCardPool[21,3] = 17 // Requires Talent 17
		rogueCardPool[21,4] = 0
		rogueCardPool[21,5] = 0
		rogueCardPool[21,6] = "Counter-Attack"
		rogueCardPool[21,7] = -1
		rogueCardPool[21,8] = 66

		// === PASSIVE CARDS - TICK OR TREAT BRANCH (22-24) - Talents 19-21 ===
		// Card 22: Tick or Treat (Talent 19) - Unlock
		rogueCardPool[22,0] = "Tick or Treat"
		rogueCardPool[22,1] = 3  // Type: passive_unlock
		rogueCardPool[22,2] = 19 // Talent 19
		rogueCardPool[22,3] = 0  // No prereq
		rogueCardPool[22,4] = 0
		rogueCardPool[22,5] = 0
		rogueCardPool[22,6] = "Auto Buff Orb"
		rogueCardPool[22,7] = -1
		rogueCardPool[22,8] = 67

		// Card 23: Tick or Treat+ (Talent 20)
		rogueCardPool[23,0] = "Tick or Treat+"
		rogueCardPool[23,1] = 4  // Type: passive_buff
		rogueCardPool[23,2] = 20 // Talent 20
		rogueCardPool[23,3] = 19 // Requires Talent 19
		rogueCardPool[23,4] = 0
		rogueCardPool[23,5] = 0
		rogueCardPool[23,6] = "Larger Area"
		rogueCardPool[23,7] = -1
		rogueCardPool[23,8] = 68

		// Card 24: Tick or Treat++ (Talent 21)
		rogueCardPool[24,0] = "Tick or Treat++"
		rogueCardPool[24,1] = 4
		rogueCardPool[24,2] = 21 // Talent 21
		rogueCardPool[24,3] = 20 // Requires Talent 20
		rogueCardPool[24,4] = 0
		rogueCardPool[24,5] = 0
		rogueCardPool[24,6] = "Enhanced Effect"
		rogueCardPool[24,7] = -1
		rogueCardPool[24,8] = 69

		// Total cards: 25 (indices 0-24)
		rogue_card_pool_size = 25
	}
}

function rogue_init_witch_cards_scr() {
	// Initialize Witch class talent cards (4-24)
	// Witch talents from talentcreate_scr.gml:
	// 1-3: Spell (E), 4-6: Broom (Q), 7-9: Scarecrow (Q2)
	// 10-12: Bats (W), 13-15: Cauldron (W2)
	// 16-18: Spirit Orbs (P), 19-21: Tick or Treat (P2)
	with(Control){
		// === E ABILITY - SPELL (Cards 4-6) - Talents 1-3 ===
		// Card 4: Spell Power (Talent 1)
		rogueCardPool[4,0] = "Spell Power"
		rogueCardPool[4,1] = 2  // Type: ability_buff
		rogueCardPool[4,2] = 1  // Talent 1
		rogueCardPool[4,3] = 0  // No prereq (E always available)
		rogueCardPool[4,4] = 0
		rogueCardPool[4,5] = 0  // Not repeatable
		rogueCardPool[4,6] = "E: +5% Damage"
		rogueCardPool[4,7] = -1
		rogueCardPool[4,8] = -1 // Placeholder sprite

		// Card 5: Spell AOE (Talent 2)
		rogueCardPool[5,0] = "Spell AOE"
		rogueCardPool[5,1] = 2
		rogueCardPool[5,2] = 2  // Talent 2
		rogueCardPool[5,3] = 1  // Requires Talent 1
		rogueCardPool[5,4] = 0
		rogueCardPool[5,5] = 0
		rogueCardPool[5,6] = "E: Larger Area"
		rogueCardPool[5,7] = -1
		rogueCardPool[5,8] = -1

		// Card 6: Spell Spirit (Talent 3)
		rogueCardPool[6,0] = "Spell Spirit"
		rogueCardPool[6,1] = 2
		rogueCardPool[6,2] = 3  // Talent 3
		rogueCardPool[6,3] = 2  // Requires Talent 2
		rogueCardPool[6,4] = 0
		rogueCardPool[6,5] = 0
		rogueCardPool[6,6] = "E: +25% Damage"
		rogueCardPool[6,7] = -1
		rogueCardPool[6,8] = -1

		// === Q ABILITY - BROOM BRANCH (Cards 7-9) - Talents 4-6 ===
		// Card 7: Broom (Talent 4) - Unlock, blocks Scarecrow (talent 7)
		rogueCardPool[7,0] = "Broom"
		rogueCardPool[7,1] = 1  // Type: ability_unlock
		rogueCardPool[7,2] = 4  // Talent 4
		rogueCardPool[7,3] = 0  // No prereq
		rogueCardPool[7,4] = 7  // Blocks Talent 7 (Scarecrow)
		rogueCardPool[7,5] = 0
		rogueCardPool[7,6] = "Q: Spread Damage"
		rogueCardPool[7,7] = -1
		rogueCardPool[7,8] = -1

		// Card 8: Broom Buff (Talent 5)
		rogueCardPool[8,0] = "Broom Buff"
		rogueCardPool[8,1] = 2
		rogueCardPool[8,2] = 5  // Talent 5
		rogueCardPool[8,3] = 4  // Requires Talent 4
		rogueCardPool[8,4] = 0
		rogueCardPool[8,5] = 0
		rogueCardPool[8,6] = "Q: +5% Damage"
		rogueCardPool[8,7] = -1
		rogueCardPool[8,8] = -1

		// Card 9: Broom Modify (Talent 6)
		rogueCardPool[9,0] = "Broom Modify"
		rogueCardPool[9,1] = 2
		rogueCardPool[9,2] = 6  // Talent 6
		rogueCardPool[9,3] = 5  // Requires Talent 5
		rogueCardPool[9,4] = 0
		rogueCardPool[9,5] = 0
		rogueCardPool[9,6] = "Q: Duration +"
		rogueCardPool[9,7] = -1
		rogueCardPool[9,8] = -1

		// === Q2 ABILITY - SCARECROW BRANCH (Cards 10-12) - Talents 7-9 ===
		// Card 10: Scarecrow (Talent 7) - Unlock, blocks Broom (talent 4)
		rogueCardPool[10,0] = "Scarecrow"
		rogueCardPool[10,1] = 1  // Type: ability_unlock
		rogueCardPool[10,2] = 7  // Talent 7
		rogueCardPool[10,3] = 0  // No prereq
		rogueCardPool[10,4] = 4  // Blocks Talent 4 (Broom)
		rogueCardPool[10,5] = 0
		rogueCardPool[10,6] = "Q: Minion Control"
		rogueCardPool[10,7] = -1
		rogueCardPool[10,8] = -1

		// Card 11: Scarecrow Buff (Talent 8)
		rogueCardPool[11,0] = "Scarecrow Buff"
		rogueCardPool[11,1] = 2
		rogueCardPool[11,2] = 8  // Talent 8
		rogueCardPool[11,3] = 7  // Requires Talent 7
		rogueCardPool[11,4] = 0
		rogueCardPool[11,5] = 0
		rogueCardPool[11,6] = "Q: Spread Damage"
		rogueCardPool[11,7] = -1
		rogueCardPool[11,8] = -1

		// Card 12: Scarecrow Modify (Talent 9)
		rogueCardPool[12,0] = "Scarecrow Modify"
		rogueCardPool[12,1] = 2
		rogueCardPool[12,2] = 9  // Talent 9
		rogueCardPool[12,3] = 8  // Requires Talent 8
		rogueCardPool[12,4] = 0
		rogueCardPool[12,5] = 0
		rogueCardPool[12,6] = "Q: Enhanced Spread"
		rogueCardPool[12,7] = -1
		rogueCardPool[12,8] = -1

		// === W ABILITY - BATS BRANCH (Cards 13-15) - Talents 10-12 ===
		// Card 13: Bats (Talent 10) - Unlock, blocks Cauldron (talent 13)
		rogueCardPool[13,0] = "Bats"
		rogueCardPool[13,1] = 1  // Type: ability_unlock
		rogueCardPool[13,2] = 10 // Talent 10
		rogueCardPool[13,3] = 0  // No prereq
		rogueCardPool[13,4] = 13 // Blocks Talent 13 (Cauldron)
		rogueCardPool[13,5] = 0
		rogueCardPool[13,6] = "W: High Damage"
		rogueCardPool[13,7] = -1
		rogueCardPool[13,8] = -1

		// Card 14: Bats Buff (Talent 11)
		rogueCardPool[14,0] = "Bats Buff"
		rogueCardPool[14,1] = 2
		rogueCardPool[14,2] = 11 // Talent 11
		rogueCardPool[14,3] = 10 // Requires Talent 10
		rogueCardPool[14,4] = 0
		rogueCardPool[14,5] = 0
		rogueCardPool[14,6] = "W: +5% Damage"
		rogueCardPool[14,7] = -1
		rogueCardPool[14,8] = -1

		// Card 15: Bats Modify (Talent 12)
		rogueCardPool[15,0] = "Bats Modify"
		rogueCardPool[15,1] = 2
		rogueCardPool[15,2] = 12 // Talent 12
		rogueCardPool[15,3] = 11 // Requires Talent 11
		rogueCardPool[15,4] = 0
		rogueCardPool[15,5] = 0
		rogueCardPool[15,6] = "W: +25% AOE"
		rogueCardPool[15,7] = -1
		rogueCardPool[15,8] = -1

		// === W2 ABILITY - CAULDRON BRANCH (Cards 16-18) - Talents 13-15 ===
		// Card 16: Cauldron (Talent 13) - Unlock, blocks Bats (talent 10)
		rogueCardPool[16,0] = "Cauldron"
		rogueCardPool[16,1] = 1  // Type: ability_unlock
		rogueCardPool[16,2] = 13 // Talent 13
		rogueCardPool[16,3] = 0  // No prereq
		rogueCardPool[16,4] = 10 // Blocks Talent 10 (Bats)
		rogueCardPool[16,5] = 0
		rogueCardPool[16,6] = "W: Area Damage"
		rogueCardPool[16,7] = -1
		rogueCardPool[16,8] = -1

		// Card 17: Cauldron Buff (Talent 14)
		rogueCardPool[17,0] = "Cauldron Buff"
		rogueCardPool[17,1] = 2
		rogueCardPool[17,2] = 14 // Talent 14
		rogueCardPool[17,3] = 13 // Requires Talent 13
		rogueCardPool[17,4] = 0
		rogueCardPool[17,5] = 0
		rogueCardPool[17,6] = "W: +5% Damage"
		rogueCardPool[17,7] = -1
		rogueCardPool[17,8] = -1

		// Card 18: Cauldron Modify (Talent 15)
		rogueCardPool[18,0] = "Cauldron Modify"
		rogueCardPool[18,1] = 2
		rogueCardPool[18,2] = 15 // Talent 15
		rogueCardPool[18,3] = 14 // Requires Talent 14
		rogueCardPool[18,4] = 0
		rogueCardPool[18,5] = 0
		rogueCardPool[18,6] = "W: Gravity Effect"
		rogueCardPool[18,7] = -1
		rogueCardPool[18,8] = -1

		// === PASSIVE - SPIRIT ORBS (Cards 19-21) - Talents 16-18 ===
		// Card 19: Spirit Orbs (Talent 16) - Unlock
		rogueCardPool[19,0] = "Spirit Orbs"
		rogueCardPool[19,1] = 3  // Type: passive_unlock
		rogueCardPool[19,2] = 16 // Talent 16
		rogueCardPool[19,3] = 0  // No prereq
		rogueCardPool[19,4] = 0
		rogueCardPool[19,5] = 0
		rogueCardPool[19,6] = "Block Damage"
		rogueCardPool[19,7] = -1
		rogueCardPool[19,8] = -1

		// Card 20: Spirit Orbs+ (Talent 17)
		rogueCardPool[20,0] = "Spirit Orbs+"
		rogueCardPool[20,1] = 4  // Type: passive_buff
		rogueCardPool[20,2] = 17 // Talent 17
		rogueCardPool[20,3] = 16 // Requires Talent 16
		rogueCardPool[20,4] = 0
		rogueCardPool[20,5] = 0
		rogueCardPool[20,6] = "Large Area"
		rogueCardPool[20,7] = -1
		rogueCardPool[20,8] = -1

		// Card 21: Spirit Orbs++ (Talent 18)
		rogueCardPool[21,0] = "Spirit Orbs++"
		rogueCardPool[21,1] = 4
		rogueCardPool[21,2] = 18 // Talent 18
		rogueCardPool[21,3] = 17 // Requires Talent 17
		rogueCardPool[21,4] = 0
		rogueCardPool[21,5] = 0
		rogueCardPool[21,6] = "Large Area"
		rogueCardPool[21,7] = -1
		rogueCardPool[21,8] = -1

		// === PASSIVE - TICK OR TREAT (Cards 22-24) - Talents 19-21 ===
		// Card 22: Tick or Treat (Talent 19) - Unlock
		rogueCardPool[22,0] = "Tick or Treat"
		rogueCardPool[22,1] = 3  // Type: passive_unlock
		rogueCardPool[22,2] = 19 // Talent 19
		rogueCardPool[22,3] = 0  // No prereq
		rogueCardPool[22,4] = 0
		rogueCardPool[22,5] = 0
		rogueCardPool[22,6] = "Buff Attack"
		rogueCardPool[22,7] = -1
		rogueCardPool[22,8] = -1

		// Card 23: Tick or Treat+ (Talent 20)
		rogueCardPool[23,0] = "Tick or Treat+"
		rogueCardPool[23,1] = 4  // Type: passive_buff
		rogueCardPool[23,2] = 20 // Talent 20
		rogueCardPool[23,3] = 19 // Requires Talent 19
		rogueCardPool[23,4] = 0
		rogueCardPool[23,5] = 0
		rogueCardPool[23,6] = "Larger Area"
		rogueCardPool[23,7] = -1
		rogueCardPool[23,8] = -1

		// Card 24: Tick or Treat++ (Talent 21)
		rogueCardPool[24,0] = "Tick or Treat++"
		rogueCardPool[24,1] = 4
		rogueCardPool[24,2] = 21 // Talent 21
		rogueCardPool[24,3] = 20 // Requires Talent 20
		rogueCardPool[24,4] = 0
		rogueCardPool[24,5] = 0
		rogueCardPool[24,6] = "Enhanced Effect"
		rogueCardPool[24,7] = -1
		rogueCardPool[24,8] = -1

		// Total cards: 25 (indices 0-24)
		rogue_card_pool_size = 25
	}
}
