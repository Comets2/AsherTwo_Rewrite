function enemy_grav_scr() {

	if(vsp<gravtotal){
	vsp += grav
	}

	if(place_meeting(x+hsp,y,Block)){
		yplus=0
		while(place_meeting(x+hsp,y-yplus,Block)&& yplus <= abs(3*hsp)){
			yplus += 1
		}
		if(place_meeting(x+hsp,y-yplus,Block)){
			while(!place_meeting(x+sign(hsp),y,Block)){
				x = x + sign(hsp)
			}
			hsp=0
		}else{
			y -= yplus
		}
	}
	if(grav!=0){
		if(place_meeting(x,y+vsp,Block)){
			while(!place_meeting(x,y+sign(vsp),Block)){
				y = y + sign(vsp)
			}
			if(vsp>3){
			part_create_scr(1)
			}
			vsp=0
		}
	}

	x=x+hsp
	y=y+vsp


}
