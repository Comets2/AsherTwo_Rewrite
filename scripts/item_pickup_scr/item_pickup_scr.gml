function item_pickup_scr() {
#region Item Pickup
	if(lvlArray[1010,20]==0){
		with(Me){
			hit=instance_place(x,y,Abil)
			if(hit!=noone){
				if(hit.pin==100){
					if(other.lvlArray[1010,21]!=hit){
					other.lvlArray[1010,20]=hit
					lvlArray[1010,21]=1
					}
				}
			}
		}
	}else{
		if(instance_exists(lvlArray[1010,20])){
			lvlArray[1010,20].dur+=1
			lvlArray[1010,20].x=Me.x
			lvlArray[1010,20].y=Me.y
			lvlArray[1010,20].imgangle+=lvlArray[1010,20].spin
		
		if(global.con_p_r){
			lvlArray[1010,21]=lvlArray[1010,20]
			lvlArray[1010,22]=20

			with(lvlArray[1010,20]){
				phase=0
				grav=0.1
				vsp=1
				if(global.con_h_up||global.conp_h_up){
					temp=2
				}else{
					if(global.con_h_down||global.conp_h_down){
					temp=3
					}else{
						temp=1
					}		
				}		
				grav=0.1
				gravtwo=0.04
				gravthree=0.01
				imgangle=random(360)		
					if(temp==1){
					imgangle=340
						hsp=1.8
						vsp=-2.2		
					}else{
						if(temp==2){
						imgangle=210
							hsp=1.2
							vsp=-3.5			
						}else{
							if(temp==3){
								imgangle=-85
								hsp=2.4
								vsp=-0.5
							}else{
			
							}			
						}		
					}
					imgangle=imgangle*Me.dir
					hsp = hsp*Me.dir
					if(dur<150){
						dur=150
					}

				}	
			lvlArray[1010,20]=0	
		}
		}else{
			lvlArray[1010,20]=0
		}


	}

		if(lvlArray[1010,22]>0){
			lvlArray[1010,22]-=1
		}else{
			lvlArray[1010,21]=1
		}
#endregion


}
