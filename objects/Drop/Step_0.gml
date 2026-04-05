/// Drop item step

//Shaking dispenser mode (emerald/treasure chest popping out items)
if(dispenser==1){
	x=Me.x
	y=Me.y-6
	shake=random_range(-1,1)

	dispenser_timer-=1
	if(dispenser_timer<=0&&dispenser_count>0){
		//Pop out one item
		if(dispenser_type==0){
			//Treasure chest - pop coin
			var _coin=instance_create_depth(x,y,0,Drop)
			with(_coin){
				type=6
				img=96
				image_index=img
				dur=600
				durtotal=dur
				hsp=random_range(-1,1)
				vsp=random_range(-2,-1)
				grav=0.12
				gravtwo=0.02
			}
		}else if(dispenser_type==1){
			//Emerald - pop xp orb
			var _orb=instance_create_depth(x,y,1,Xp)
			with(_orb){
				pin=1
				vsp=random_range(-2,-1)
				hsp=random_range(-1,1)
				pickupdelay=60
			}
		}
		dispenser_count-=1
		dispenser_timer=12
	}

	//Done dispensing
	if(dispenser_count<=0&&dispenser_timer<=0){
		//Fish dispenser - apply heal when shake finishes
		if(dispenser_type==2){
			Me.hp=min(Me.hp+dispenser_heal,Me.hptotal)
			Me.healrecieved=1
			Me.healtick=1
		}
		instance_destroy()
	}
	exit
}

//Normal item physics
vsp+=grav
if(gravtwo!=0){
	if(instance_place(x+hsp,y,Block)){
		gravtwo=0
		hsp=0
	}
	image_angle+=hsp*spin
	if(abs(hsp+gravtwo*sign(hsp)*-1)>0.01){
		hsp+=gravtwo*sign(hsp)*-1
	}else{
		gravtwo=0
		hsp=0
	}
}

//Player attraction (after pickup delay)
if((type==5||type==6)&&(durtotal-dur)>=60){
	var _dx=Me.x-x
	var _dy=Me.y-y
	var _dist=sqrt(_dx*_dx+_dy*_dy)
	if(_dist<46&&_dist>1){
		var _pull=0.15*(1-_dist/46)
		hsp+=(_dx/_dist)*_pull
		vsp+=(_dy/_dist)*_pull
	}
}

//Solid collision
if(instance_place(x+hsp,y,Block)){
	hsp=0
}
if(instance_place(x,y+vsp,Block)){
	vsp=0
}
hsp*=0.92
if(abs(hsp)<0.05){ hsp=0 }

//Blink when almost expired
if(dur<60){
	visible=(dur mod 12)<6
}else{
	visible=true
}

x+=hsp
y+=vsp

//Animation
if(image_index+imgsped<img+imgcap+1){
	image_index+=imgsped
}else{
	image_index=img
}

//Duration
if(dur>0){
	dur-=1
}else{
	instance_destroy()
}
