if(Control.pause==0){
	progtimer+=1
	
	if(Me.hp>0){
	
		if(hp>0){
		enemy_scr()
			if(wallcheck==1){
			enemy_grav_scr()
			}
		}else{
			if(drop!=0){
				enemy_drop_scr()
				
			}
			if(xpspawn==1){
				xpspawn=0
				
				
				for(i=0;i<xpdrop;i+=1){
					created=instance_create_depth(x-4+random(8),y-4+random(8),1,Xp)
					with(created){
						pin=1
					
						vsp=random_range(0.25,0.5)*-1
						hsp=random_range(0,0.3)*choose(1,-1)
					
					}
				}
			}
		}
		hurt_scr()

	}
				if(sounddel>0){
					sounddel-=1
				}
			if(moving==1){
				if(grounded==1){
					if(sounddel==0){
						audio_play_sound_at(choose(snd_player_walk_1,snd_player_walk_2,snd_player_walk_3),x,y,0,32,150,2,false,8)
						sounddel=24
					}
				}
			}
}