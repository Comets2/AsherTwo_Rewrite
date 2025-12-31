function enemy_move_scr(argument0) {
	

#region Start-Anchor Turns
	//____________________________________________________________________________---------------------(Start Anchor Turns)---------------------____________________________________________________________________________
	if(argument0==0){
		if(rangetick==0){
			if(startx+range>x&&!instance_place(x+1,y,Block)){
				x+=sped*slow
				moving=1
			}else{
				rangetick=1
				dir=-1
			}
		}else{
			if(startx-range<x&&!instance_place(x-1,y,Block)){
				x-=sped*slow
				moving=1
			}else{
				rangetick=0
				dir=1
			}			
		}
	}else{
#endregion
#region Jump Random
	//____________________________________________________________________________---------------------(Jump Random)---------------------____________________________________________________________________________
		if(argument0==1){
	
			if(jumptimer>0){
				jumptimer-=1
			}else{
				if(grounded==1){
					groundcheck=1
					jumptimer=jumptimertotal
					vsp=jump*slow
					img=jumpimg
					imgcap=1
					imgsped=jumpimgsped
					image_index=img
					moving=0
				}
			}
	
		}else{
#endregion
#region Timer Based Turns
	//____________________________________________________________________________---------------------(Timer Based Turns)---------------------____________________________________________________________________________		
			if(argument0==2){	
				if(rangetimer>0){
					rangetimer-=1
				}else{
					if(grounded==1){
						rangetimer=rangetimertotal
						if(rangetick==0){
							rangetick=1
							dir=-1
						}else{
							rangetick=0
							dir=1
						}
					}
				}
			
				if(rangetick==0){
					if(instance_place(x+1,y,Block)){
						rangetimer=0
					}else{
						hsp=sped*slow
						moving=1
					}
				}else{
					if(instance_place(x-1,y,Block)){
						rangetimer=0
					}else{
						hsp=(sped*slow)*-1
						moving=1
					}	
				}

			}else{
#endregion
#region Wall Climb
	//____________________________________________________________________________---------------------(Wall Climb)---------------------____________________________________________________________________________		
				if(argument0==3){
	chance=0
	if(chance==0){
					if(dir==1){
						if(x<=Control.mapxspottotal){
							if(instance_place(x+1,y,Block)){
								if(wallcheck==1){
									wallcheck=0
									img=wallimg
									imgcap=wallimgcap
									imgsped=0.1
									image_index=img
									wallx=x+5
									moving=0
								}
								groundcheck=0
								vsp=0
								y+=wallsped*slow
									if(x<wallx){
									x+=0.5
									}
							}else{
								if(wallcheck==0){
								wallcheck=1
								y-=1
								groundcheck=1
								}
							}	
						}
					}else{
						if(x>=Control.mapxspot+16){
							if(instance_place(x-1,y,Block)){
								if(wallcheck==1){
									wallcheck=0
									img=wallimg
									imgcap=wallimgcap
									imgsped=0.1
									image_index=img
									wallx=x-5
									moving=0
								}
								groundcheck=0
								vsp=0
								y+=wallsped*slow
									if(x>wallx){
									x-=0.5
									}
							}else{
								if(wallcheck==0){
								wallcheck=1
								y-=1
								groundcheck=1
								}
							}
						}
					}
	}	
			
				}else{
#endregion
#region Ground Check
	//____________________________________________________________________________---------------------(Ground Check)---------------------____________________________________________________________________________		
					if(argument0==4){
							if(groundcheck==1){
								if(instance_place(x,y+1,Block)){
									groundcheck=0
									imgsped=imgspedsave
									img=imgsave
									imgcap=imgcapsave
									image_index=img
								}
							}
				
					}else{
#endregion
#region Grounded
	//____________________________________________________________________________---------------------(Grounded)---------------------____________________________________________________________________________		
						if(argument0==5){
							if(instance_place(x,y+1,Block)){
								grounded=1
							}else{
								grounded=0
							}
				
						}else{
#endregion
#region Y move Freeform
	//____________________________________________________________________________---------------------(Y move Freeform)---------------------____________________________________________________________________________		
							if(argument0==6){
								if(rangeticktwo==0){
									if(starty+rangetwo>y){
										y+=spedtwo*slow
									}else{
										rangeticktwo=1
									}
								}else{
									if(starty-rangetwo<y){
										y-=spedtwo*slow
									}else{
										rangeticktwo=0
									}			
								}
				
							}else{
#endregion
#region X move Freeform
		//____________________________________________________________________________---------------------(X move Freeform)---------------------____________________________________________________________________________		
								if(argument0==7){
									if(rangetick==0){
										if(startx+range>x+sped){
											x+=sped*slow
											
										}else{
											rangetick=1
											//dir=-1
										}
									}else{
										if(startx-range<x-sped){
											x-=sped*slow
										}else{
											rangetick=0
											//dir=1
										}			
									}
				
								}else{
#endregion
#region X move Freeform
		//____________________________________________________________________________---------------------(Fly To target)---------------------____________________________________________________________________________		
								if(argument0==8){
									chance=0
									if(y+sped<ytarget){
										y+=sped*slow
									}else{
										if(y-sped>ytarget){
											y-=sped*slow
										}else{
											y=ytarget
											chance+=1
										}							
									}
									if(x+sped<xtarget){
										x+=sped*slow
										dir=1
									}else{
										if(x-sped>xtarget){
											x-=sped*slow
											dir=-1
										}else{
											x=xtarget
											chance+=1
										}							
									}
				
								}else{
#endregion
								}	
								}				
							}					
						}				
					}
			
				}
			}
		}
	}


}

