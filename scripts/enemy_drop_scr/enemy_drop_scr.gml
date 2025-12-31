function enemy_drop_scr() {
#region Apple Run
	if(drop!=0){
#region Recipe Items
		for(i=0;i<drop;i+=1){
			created=instance_create_depth(x-2+random(2)+i*1,y-2+random(2)-i*8,9,Abil)
			with(created){
				sprite_index=enemy_abil_spr
				pin=100
				spin=choose(random_range(-4,-2),random_range(2,4))
				image_speed=0
				imgsped=0
					if(other.item<10){
						item=other.item
						img=61+item
						imgcap=0
						dur=1500
					}else{
						item=other.item
						img=80+item
						imgcap=0
						dur=50000					
					}
			      
			
				image_index=img
			
				dmg=1
				phase=0

			
				grav=0.01
				vsp=-0.3
				hsp=0
				imgangle=0
				dir=1
				yrebound=0.4
				part=1
						
				en=2
				type=1
				move=1
				diddmg=0
				creator=other.id
				phase=0
				phasecheck=1	
				imgangle=0
			}
		}
		drop=0
#endregion	
	}else{
#endregion
	}


}
