function gravity_scr() {
	/*
	hsp += hspfraction
	vsp += vspfraction

	hspfraction = hsp - (floor(abs(hsp)) * sign(hsp))
	hsp -= hspfraction
	vspfraction = vsp - (floor(abs(vsp)) * sign(vsp))
	vsp -= vspfraction
	*/

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

	if(place_meeting(x,y+vsp,Block)){
		while(!place_meeting(x,y+sign(vsp),Block)){
			y = y + sign(vsp)
		}
		if(vsp>3){
		part_create_scr(1)
		}
		vsp=0
	}

	x=x+hsp
	y=y+vsp


	// Check for ground with small buffer for floating point precision
	if(instance_place(x,y+1,Block)||instance_place(x,y+2,Block)){
		grounded=1
		wall=0
		jumps=jumptotal
	}else{
		grounded=0
	}

	if(grounded==0){
		if(instance_place(x+1,y,Block)||instance_place(x-1,y,Block)){
			if(instance_place(x+1,y,Block)){
			wall=1
			}else{
			wall=2
			}
			if(vsp>wallsped){
			vsp=wallsped
			}
		}else{
			wall=0
		}
	}

	if(stun<=0){
		remhsp=hsp
		hsp=0
	}



}
