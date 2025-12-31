xbor=(16*4)-800-400
ybor=((Control.lvlselect*2.5)*16.5)-(4*16)
xpos=((x-Control.xto)/25)+32
xpostwo=(x-Control.xto)/10
xposthree=((x-Control.xto)/90)-64
ypos=(x-Control.yto)/22
ypostwo=(x-Control.yto)/18
yposthree=(x-Control.yto)/28

for(i=0;i<7;i+=1){
	draw_sprite(backspr,9,Control.midx+animthree+xbor,Control.midy+yposthree+ybor+animthreey)
	xbor+=400
}
xbor=(16*4)-800
for(i=0;i<5;i+=1){
	draw_sprite(backspr,6,Control.midx+xposthree+xbor,Control.midy+yposthree+ybor)
	xbor+=400
}
xbor=(16*4)-800
for(i=0;i<5;i+=1){
//	draw_sprite(background_spr,4,Control.midx+xpostwo+xbor,Control.midy+ypostwo+ybor)	

	draw_sprite(backspr,3+animticktwo,Control.midx+xpos+xbor,Control.midy+ypos+ybor)
	
	draw_sprite(backspr,animtick,Control.midx+xpostwo+xbor,Control.midy+ypostwo+ybor)
	
	if(Control.boss>0){
		draw_sprite(backspr,11,Control.midx+xpostwo+xbor,Control.midy+ypostwo+ybor)
	}
	
	xbor+=400
}


