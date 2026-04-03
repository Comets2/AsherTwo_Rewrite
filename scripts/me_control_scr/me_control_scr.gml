function me_control_scr() {
	moving=0
	justjump=0

	hit=instance_place(x,y,Enemy)
	if(hit!=noone){
		if(hit.playerhurt==1){
		if(hurttimer<=hurttimertotal-20){
			hurttick=1
			dmgrecieved+=1
		}
	
		stun=1
		if(x<hit.x){
			hsp=-2
		}else{
			hsp=2
		}
		remhsp=hsp
		}
	}
	if(stun>0){
	stun-=1
	}else{
		if(con_p_down){
			if(vsp<0){
			vsp=0
						xpos=x
						ypos=y+8+1
					part_create_scr(2)
			}
		}


			// Calculate movement speed with rogue bonus
			var move_speed = sped
			if(Control.rogue_mode){
				move_speed += sped * (rogue_statsped * 0.05)  // +5% per point
			}

			// Determine target speed from input
			var _target=0
			if(con_h_right){
				_target=move_speed
				dir=1
				moving=1
				if(grounded==1){
					if(class==10){
						img=1
						imgcap=3
					}else{
						img=1
						imgcap=5
					}
				}
			}
			if(con_h_left){
				_target=-move_speed
				dir=-1
				moving=1
				if(grounded==1){
					if(class==10){
						img=1
						imgcap=3
					}else{
						img=1
						imgcap=5
					}
				}
			}

			// Acceleration/deceleration
			if(_target!=0){
				if(abs(remhsp)<abs(_target)){
					remhsp+=sign(_target)*accel
					if(abs(remhsp)>abs(_target)){
						remhsp=_target
					}
				}else{
					remhsp=_target
				}
			}else{
				if(abs(remhsp)>decel){
					remhsp-=sign(remhsp)*decel
				}else{
					remhsp=0
				}
			}
			hsp=remhsp

				if(sounddel>0){
					sounddel-=1
				}
			if(moving==1){
				if(grounded==1){
					if(sounddel==0){
						audio_play_sound(choose(snd_player_walk_1,snd_player_walk_2,snd_player_walk_3),8,false)
						sounddel=24
					}
				}
			}

			if(jumptimer>0){
				jumptimer-=1
			}
			if(jump_buffer>0){
				jump_buffer-=1
			}
			if(coyote_timer>0){
				coyote_timer-=1
			}

		if(!global.con_h_down&&!global.conp_h_down){
			if(con_h_space){
				if(jumptimer>0){
					if(jumptimer mod 2==0){
					vsp+=jump
					}
				}
			}else{
				// Jump cut: on space release while ascending with active jumptimer
				if(jumptimer>0&&vsp<0){
					vsp*=jump_cut_factor
					jumptimer=0
				}
			}
		}

			var _can_ground_jump=(grounded==1||coyote_timer>0)
			var _can_jump=(_can_ground_jump||jumps>0||wall!=0)
			var _want_jump=(con_p_space||(jump_buffer>0&&(grounded==1||wall!=0)))

			if(_want_jump){
				if(_can_jump){
					if(!_can_ground_jump){
					part_create_scr(1)
					}
						if(wall==0&&!_can_ground_jump){
						jumps-=1
						}
					vsp=jump+jumpstart
					// Wall jump directional bias
					if(wall!=0&&!_can_ground_jump){
						var _wall_dir=(wall==1)?1:-1
						var _held_dir=0
						if(con_h_right) _held_dir=1
						if(con_h_left) _held_dir=-1
						if(_held_dir==_wall_dir||_held_dir==0){
							// Holding toward wall or neutral: wall climb
							remhsp=-_wall_dir*wall_jump_kick*0.3
							vsp=(jump+jumpstart)*1.1
						}else{
							// Holding away from wall: wall kick
							remhsp=-_wall_dir*wall_jump_kick
							vsp=(jump+jumpstart)*0.7
						}
						hsp=remhsp
					}
					if(!con_h_down){
					jumptimer=jumptimertotal
					}
						if(class==10){
							img=5
							imgcap=1
						}else{
							img=7
							imgcap=2
						}
					justjump=1
					coyote_timer=0
					jump_buffer=0
				}else{
					if(con_p_space){
					jump_buffer=jump_buffer_total
					}
				}
			}
	}


}
