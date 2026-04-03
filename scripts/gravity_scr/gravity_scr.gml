function gravity_scr() {
	/*
	hsp += hspfraction
	vsp += vspfraction

	hspfraction = hsp - (floor(abs(hsp)) * sign(hsp))
	hsp -= hspfraction
	vspfraction = vsp - (floor(abs(vsp)) * sign(vsp))
	vsp -= vspfraction
	*/

	// Determine effective gravity and terminal velocity
	var _eff_grav=grav
	var _eff_gravtotal=gravtotal

	if(grounded==0){
		// Fast fall: increase gravity when holding down while falling
		if(con_h_down&&vsp>=0){
			_eff_grav=grav*fast_fall_grav_mult
			_eff_gravtotal=fast_fall_max
		}
	}

	if(vsp<_eff_gravtotal){
		vsp+=_eff_grav
		if(vsp>_eff_gravtotal){
			vsp=_eff_gravtotal
		}
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
			remhsp=0
		}else{
			y -= yplus
		}
	}

	// Apply horizontal position before vertical collision check
	// so corners are resolved correctly on both axes
	x=x+hsp

	if(place_meeting(x,y+vsp,Block)){
		// Corner correction: nudge horizontally when hitting ceiling
		var _corrected=false
		if(vsp<0){
			var _max_nudge=4
			for(var _n=1;_n<=_max_nudge;_n++){
				if(!place_meeting(x+_n,y+vsp,Block)&&!place_meeting(x+_n,y,Block)){
					x+=_n
					_corrected=true
					break
				}
				if(!place_meeting(x-_n,y+vsp,Block)&&!place_meeting(x-_n,y,Block)){
					x-=_n
					_corrected=true
					break
				}
			}
		}

		if(!_corrected){
			while(!place_meeting(x,y+sign(vsp),Block)){
				y=y+sign(vsp)
			}
			if(vsp>3){
			part_create_scr(1)
			}
			vsp=0
		}
	}

	y=y+vsp


	// Check for ground with small buffer for floating point precision
	var _was_grounded=grounded
	if(instance_place(x,y+1,Block)||instance_place(x,y+2,Block)){
		grounded=1
		wall=0
		jumps=jumptotal
	}else{
		grounded=0
		// Ledge assist: nudge onto platform edges when barely missing
		if(vsp>=0&&remhsp!=0){
			var _nudge_dir=sign(remhsp)
			for(var _ln=1;_ln<=3;_ln++){
				if((instance_place(x+(_nudge_dir*_ln),y+1,Block)||instance_place(x+(_nudge_dir*_ln),y+2,Block))&&!place_meeting(x+(_nudge_dir*_ln),y,Block)){
					x+=_nudge_dir*_ln
					grounded=1
					wall=0
					jumps=jumptotal
					break
				}
			}
		}
	}
	// Coyote time: grace period when walking off ledge
	if(_was_grounded==1&&grounded==0&&justjump==0){
		coyote_timer=coyote_total
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
		hsp=0
	}



}
