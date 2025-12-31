function part_create_scr(argument0) {
	if(argument0==1){
	//____________________________________________________________________________---------------------(JUMP PUFFS)---------------------____________________________________________________________________________
	for(i=0;i<6;i+=1){
			created=instance_create_depth(x-2+i,y+8,0,Part)
			with(created){
			type=1
			pin=1
			creator=other.id
			depth=other.depth-1
			spin=1
			img=1
			imgcap=3
			imgsped=0.1
			image_speed=0
			image_index=irandom_range(img,img+imgcap)
			dur=24+irandom(12)
			durtotal=dur
			speed=random_range(0.03,0.1)
			direction=other.i*40
			hsp=hspeed
			vsp=vspeed
			speed=0
			}
		}
	}else{
	//____________________________________________________________________________---------------------(Run/Wall PUFFS)---------------------____________________________________________________________________________
		if(argument0==2){
			created=instance_create_depth(xpos,ypos,0,Part)
			with(created){
			type=1
			pin=1
			creator=other.id
			depth=other.depth-1
			spin=1
			img=1
			imgcap=3
			imgsped=0.1
			image_speed=0
			image_index=irandom_range(img,img+imgcap)
			dur=12+irandom(12)
			durtotal=dur
			speed=0
			hsp=hspeed
			vsp=vspeed
			speed=0
			}	
		}else{
		
		
		}
	}


}
