if(Control.pause==0){
	if(maskextra!=0){
		draw_sprite_ext(me_mask_extra_spr,maskextra,x+animx,y+animy,dir,1,0,color,1)	
	}

	draw_sprite_ext(mespr,image_index,x,y,dir,1,0,color,1)
	if(class>0&&maskdraw==1){
	draw_sprite_ext(mask_spr,(class-1)*4+1,x+animx,y+animy,dir,1,0,color,1)
	}

		if(wep!=0){
		draw_sprite_ext(wep_spr,wep,x+animx+wepx,y+animy+wepy,dir,1,wepangle,color,1)
		}
		//Sugar Rush timer bar
		if(class==6&&passivefourArray[1,10]>0){
			var _width=floor((passivefourArray[1,10]/300)*10)
			var _rows=ceil(_width/15)
			var _bx=x-7
			var _by=y-16-(_rows-1)*2
			for(var _p=0;_p<_width;_p+=1){
				var _row=_p div 15
				draw_sprite(abil_super_two_spr,409+(_p mod 2),_bx+(_p mod 15),_by+_row*2)
			}
		}
	// Charge hitbox sprite
	if(class==10 && hog_mounted==1 && hog_charge>=1){
		hog_charge_img+=0.05
		if(hog_charge_img>=4){ hog_charge_img=1 }
		draw_sprite_ext(abil_goblin_effect_charge_spr,floor(hog_charge_img),x+(dir*10),y,dir,1,0,c_white,1)
	}else{
		hog_charge_img=1
	}
}
/*
//draw_text_transformed(x,y-20,abilArray[0,1],0.5,0.5,0)
//draw_text_transformed(x+10,y-20,abilArray[0,2],0.5,0.5,0)

draw_text_transformed(x+20,y-20,fps_real,0.5,0.5,0)
