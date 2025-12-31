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
}
/*
//draw_text_transformed(x,y-20,abilArray[0,1],0.5,0.5,0)
//draw_text_transformed(x+10,y-20,abilArray[0,2],0.5,0.5,0)

draw_text_transformed(x+20,y-20,fps_real,0.5,0.5,0)
