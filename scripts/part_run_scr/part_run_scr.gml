function part_run_scr() {
	if(instance_exists(Part)){
		with(Part){
			if(pin==1){
				if(type==1){
					x+=hsp
					y+=vsp
				}else{
				
					if(type==2){
						vsp+=grav
						
					
							
							if(instance_place(x,y+vsp,Block)){
								if(pintwo==0){	
									instance_destroy()
								}
							vsp=0
							}

									//Ketchup slow effect
									if(phase==100){
										with(Enemy){
											hit=instance_place(x,y,other)	
											if(hit!=noone){
												if(team!=0){
													debuffArray[1,0]=150
												}
											}
										}	
									}

						if(phase==1){
							if(hsp>0){
								if(hsp-gravtwo>=0.2){
									hsp-=gravtwo
								}else{
								hsp=0
								phase=0
								}
							}else{
								if(hsp+gravtwo<=-0.2){
									hsp+=gravtwo
								}else{
								hsp=0
								phase=0
								}
							}
						}else{
#region Ketchup
							if(phase==100){
								if(Me.class==4){
									if(vsp==0){
	
										hit=instance_place(x,y+1,Block)
										if(hit!=noone){
											phase=0
											if(hit.type==0){
												hit.type=1
												created=instance_create_depth(hit.x,hit.y-1,0,Abil)
												with(created){
														diddmg=0
														dmg=4
														dmg+=dmg*(Control.invenArray[25,3]*0.01)
														Me.passive=1
														block=other.hit
													type=0
													pin=29
													pinthree=1
													phase=0
													en=0
													creator=other.id
													imgsped=0
														img=46
														if(block.image_index==2){
															img=55	
															y+=1
														}else{
															if(block.image_index==3){
																img=55	
																dir=-1
																y+=1
															}else{
													
															}													
														}
		
													imgcap=10000
													sprite_index=abil_burger_spr
													image_index=img
													depth=0
													image_speed=0
													dur=2000
													durtotal=dur
													//pintwo=0
												}
												hit.created=created
											}else{
												if(hit.type==1){
													with(hit.created){
														phase=0
														dur=300
													}
												}
											}
											instance_destroy()
										}
									}
								}
							}else{
								//Honey
								if(phase==101){
								
									if(Me.class==3){
										if(vsp==0){
	
											hit=instance_place(x,y+1,Block)
											if(hit!=noone){
												
												phase=0
												if(hit.type==0){
													hit.type=1
													created=instance_create_depth(hit.x,hit.y-1,0,Abil)
													with(created){
															diddmg=0
															dmg=4
															dmg+=dmg*(Control.invenArray[25,3]*0.01)
															block=other.hit
														type=0
														pin=21
														pinthree=1
														pintwo=2
														phase=0
														en=0
														creator=other.id
														imgsped=0
															img=18
															if(block.image_index==2){
																img+=9
																y+=1
															}else{
																if(block.image_index==3){
																	img+=9
																	dir=-1
																	y+=1
																}else{
													
																}													
															}
														
														imgcap=10000
														sprite_index=mask_bee_spr
														image_index=img
														depth=0
														image_speed=0
														dur=2000
														durtotal=dur
														pintwo=2
													}
													hit.created=created
												}else{
													if(hit.type==1){
														with(hit.created){
															phase=0
															dur=300
														}
													}
												}
												instance_destroy()
											}
										}
									}
								}else{
							
								}							
							}
#endregion
						}
					
						x+=hsp
						y+=vsp		
					}else{
					
					
						if(type==3){
							
							if(spin==1){
								image_angle+=hsp*10
							}
							
							x+=hsp
							y+=vsp
							
							vsp+=grav
							if(hsp>0){
								if(hsp-gravtwo>=0.2){
									hsp-=gravtwo
								}else{
								hsp=0
								phase=0
								}
							}else{
								if(hsp+gravtwo<=-0.2){
									hsp+=gravtwo
								}else{
								hsp=0
								phase=0
								}
							}						
						}					
					}
				
				}
			}else{
				//Item Pickup
				if(pin==2){
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
						if(instance_place(x,y+vsp,Block)){
								vsp=0
						}
						x+=hsp
						y+=vsp	
					if(type==3){
						
						if(tick==0){
							if(y>starty-0.5){
								y-=0.02
							}else{
								tick=1
							}
						}else{
							if(tick==1){
								if(y<starty+0.5){
									y+=0.02
								}else{
									tick=0
								}	
							}
						}
					}
				}

			}

				if(image_index+imgsped<img+imgcap+1){
				image_index+=imgsped
				}else{
				image_index=img
				}
			if(dur>0){
				dur-=1
			}else{
				if(dur>-900){
				instance_destroy()
				}
			}
		
		}
	}




}
