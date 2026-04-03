function anim_scr() {
	if(hp>0&&animstop<=0){
		if(animtick<100){
			animtick+=1
		}else{
			animtick=0
		}
	
		animx=0
		animy=0
	
		if(image_index>=3&&image_index<4||image_index>=6&&image_index<7){
		animx=1*dir
		}else{
			if(image_index>=4&&image_index<5||image_index>=7&&image_index<8){
			animy=1
			}else{
	
			}	
		}
	
		//SANIMATION AND PARTICLE STAND RUN WALL
		if(grounded==1){
			if(moving==0){
				if(class==10){
					img=1
					imgcap=0
				}else{
					img=1
					imgcap=1
				}
			image_index=img
			}else{
				//run puffs
				if(animtick mod 9 ==0){
					xpos=x
					ypos=y+8+1
				part_create_scr(2)
				}
			}
		}else{
			if(wall!=0){
				//run puffs
				if(animtick mod 9 ==0){
					if(wall==1){
					xpos=x+4
					}else{
					xpos=x-4
					}
					ypos=y+8+1
				part_create_scr(2)
				}
			}
		}

		//FALL JUMP ANIMATION
		if(vsp<0){
				if(class==10){
					img=5
					imgcap=1
				}else{
					img=7
					imgcap=3
				}
				if(image_index<img||image_index>img+imgcap){
				image_index=img
				}
		}else{
			if(vsp>0){
				if(class==10){
					img=7
					imgcap=1
				}else{
					img=10
					imgcap=3
				}
				if(image_index<img||image_index>img+imgcap){
				image_index=img
				}
			}
		}

	}else{
		if(animstop>0){
			animstop-=1
		}
	}
		//ALL ANIMATION IMAGE CHECK
		if(animstop<=0){
		if(image_index+imgsped<img+imgcap+1){
		image_index+=imgsped
		}else{
		image_index=img
		}
		}
	
		if(anim>0){
			anim-=1
			animx=1*dir
			animy=animysave
			var _atk = animsave
			if(class==10){ _atk=9 }
			if(img!=_atk){
				img=_atk
				image_index=img
				if(_atk==14||_atk==9){
					imgcap=1
				}
			}

		}


}
