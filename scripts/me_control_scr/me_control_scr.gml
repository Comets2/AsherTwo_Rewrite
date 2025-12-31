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


			if(con_h_right){
				hsp=sped
				dir=1
				moving=1
				if(grounded==1){
				img=1
				imgcap=5
				}
			}
			if(con_h_left){
				hsp=sped*-1
				dir=-1
				moving=1
				if(grounded==1){
				img=1
				imgcap=5
				}
			}

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
		
		if(!global.con_h_down&&!global.conp_h_down){
			if(con_h_space){
				if(jumptimer>0){
					if(jumptimer mod 2==0){
					vsp+=jump
					}
				}
			}


			if(con_p_space){
				if(grounded==1||jumps>0||wall!=0){
					if(grounded==0){
					part_create_scr(1)
					}
						if(wall==0){
						jumps-=1
						}
					vsp=jump+jumpstart
					if(!con_h_down){
					jumptimer=jumptimertotal
					}
						img=7
						imgcap=2
					justjump=1
				
				}
			}
		}
	}


}
