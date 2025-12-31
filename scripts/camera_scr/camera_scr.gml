function camera_scr() {
	xto=camtarget.x
	yto=camtarget.y-8

	if(hurtdraw>1){
		hurtdraw=1
	}

		if(screenshake>0){
			screenshake-=1
		
			if(screenshaketick==0){
				if(screenshakeamt<1){
					screenshakeamt+=1
				}else{
					screenshaketick=1
				}
			}else{
				if(screenshakeamt>-1){
					screenshakeamt-=1
				}else{
					screenshaketick=0
				}			
			}
		}

	if(players>1){
		playercamx=camtarget.x-(camtarget.x-camtargettwo.x)/2
		playercamy=camtarget.y-(camtarget.y-camtargettwo.y)/2
		playercamxdif=abs((camtarget.x-camtargettwo.x)/2)
		playercamydif=abs((camtarget.y-camtargettwo.y)/2)
	

				campercent=0.007
				camborder=40
				camxres=((playercamxdif-camborder)*campercent)

				campercent=0.012
				camborder=10
				camyres=((playercamydif-camborder)*campercent)
	
				if(camxres>camyres){
					playercamdif=playercamxdif	
					campercent=0.007
					camborder=40		
				}else{
					playercamdif=playercamydif	
					campercent=0.012
					camborder=10
				}


		if(playercamdif>200){
		playercamdif=200
		}
	
			if(playercamdif>camborder||playercamdif<-camborder){
				camcheck=1

				camxres=camxressave+camxressave*((playercamdif-camborder)*campercent)
				camyres=camyressave+camyressave*((playercamdif-camborder)*campercent)
			}else{
				if(camxres!=camxressave||camyres!=camyressave){
					camcheck=1
					camxres=camxressave
					camyres=camyressave		
				}
			}

			if(camcheck==1){
				camcheck=0
				var pm = matrix_build_projection_ortho(camxres,camyres,1,10000)
				camera_set_proj_mat(camera,pm)	
				camxtwo=floor(camxres/2)
				camytwo=floor(camyres/2)
			}
	}



		if(players==1){
			xto=camtarget.x
			yto=camtarget.y-8
			if(yto>mapyspottotal-42){
				yto=mapyspottotal-42
			}
		}else{
			xto=playercamx
			yto=playercamy
		}
	
	camx += ((xto - camx)/10)+Control.screenshakeamt
	camy += ((yto - camy)/10)+Control.hurtdraw

	if(camtarget==noone){
		xto=0
		yto=0
	}

	vm = matrix_build_lookat(camx,camy,-10,camx,camy,0,0,1,0)
	camera_set_view_mat(camera,vm)






}
