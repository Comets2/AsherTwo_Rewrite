function anim_scr() {
	if(hp>0&&animstop<=0){
		if(animtick<100){
			animtick+=1
		}else{
			animtick=0
		}
	
		animx=0
		animy=0
	
		var _boff = 0
		if(class==10){ _boff = hog_mounted*34 }
		if(image_index>=3+_boff&&image_index<4+_boff||image_index>=6+_boff&&image_index<7+_boff){
		animx=1*dir
		}else{
			if(image_index>=4+_boff&&image_index<5+_boff||image_index>=7+_boff&&image_index<8+_boff){
			animy=1
			}else{

			}
		}
	
		//SANIMATION AND PARTICLE STAND RUN WALL
		if(grounded==1){
			if(moving==0){
				if(anim<=0){
				if(class==10){
					img=1+(hog_mounted*34)
					imgcap=0
				}else{
					img=1
					imgcap=1
				}
				image_index=img
				}
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
		if(anim<=0){
		if(vsp<0){
				if(class==10){
					img=5+(hog_mounted*34)
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
					img=7+(hog_mounted*34)
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
		}

	}else{
		if(animstop>0){
			animstop-=1
		}
	}

		if(anim>0){
			anim-=1
			animx=1*dir
			animy=animysave
			var _atk = animsave
			if(class==10){ _atk=9+(hog_mounted*34) }
			img=_atk
			if(_atk==14||_atk==9||_atk==43){
				imgcap=1
			}
			if(image_index<img||image_index>img+imgcap){
				image_index=img
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

		// Mount safety: ensure image_index is always in mounted range
		if(class==10 && hog_mounted==1 && image_index<35){
			image_index=img
		}


}
