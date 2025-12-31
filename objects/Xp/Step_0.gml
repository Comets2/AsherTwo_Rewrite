/// @description Insert description here
// You can write your code in this editor

if(check==1){
check=0

	if(pin==1){
		sprite_index=part_spr
		img=choose(182,192)
		img=182
		imgcap=8
		image_index=img+irandom(imgcap)
		
		spin=1
		imgangle=random(360)
		imgsped=0.06
	}
}

//XP
if(pin==1){
	if(distance_to_point(Me.x,Me.y-2)<32){
		move_towards_point(Me.x,Me.y-2,0.5)
		hsp=hspeed
		vsp=vspeed
		speed=0
	}

}


if(spin==1){
	image_angle+=hsp*5
}


if(!instance_place(x,y+vsp,Block)){
	vsp+=grav
	y+=vsp
}else{
	vsp=0
	
	if(distance_to_point(Me.x,Me.y-2)<=8){
		if(x<Me.x-1){
			x+=1
		}else{
			if(x>Me.x+1){
				x-=1
			}		
		}
		if(y<Me.y-1){
			y+=1
		}else{
			if(y>Me.y+1){
				y-=1
			}		
		}		
	}	
}

if(!instance_place(x+hsp,y,Block)){
	x+=hsp
	
	if(hsp>gravtwo){
		hsp-=gravtwo
	}else{
		if(hsp<0-gravtwo){
			hsp+=gravtwo
		}else{
			hsp=0
		}		
	}
}else{

	hsp=0
}

if(image_index+imgsped<=img+imgcap){
	image_index+=imgsped
}else{
	image_index=img
}


if(instance_place(x,y,Me)){
	audio_play_sound_at(choose(snd_ac_cute_1,snd_ac_cute_2,snd_ac_cute_3,snd_ac_cute_4),x,y, 0, Control.falloff_ref, Control.falloff_max, 2, false, 1)
		
				Control.xpamount+=1
				Control.xptimer=60
	
	
	for(i=0;i<1;i+=1){
			created=instance_create_depth(x,y,0,Part)
			with(created){
				//pin=1
				type=1
				pin=1
				depth=other.depth-1
				spin=1
				img=211
				imgcap=2
				imgsped=0.08
				image_speed=0
				image_index=irandom_range(img,img+imgcap)
				dur=22+irandom(30)
				durtotal=dur
				hsp=random(0.08)*choose(1,-1)
				vsp=random_range(0.03,0.06)
				grav=0.2
				image_angle=random(360)
			}
		}	
	
	instance_destroy()
}

if(instance_place(x,y,Xp)){
	hsp=choose(0.1,-0.1)
}


y-=0.04
if(spintwo!=0){
	image_angle+=spintwo
}

