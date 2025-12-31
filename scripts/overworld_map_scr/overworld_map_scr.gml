function overworld_map_scr() {
#region Always
	
#endregion
	
		if(phase==0){
			miniy=133
			miniybase=mapdataArray[1001,1]
			phase=1
			ytimer=0
			xtimer=0
			toy=0
			toytick=0
			selectx=2
			selecty=1
			starttimer=0
		
		
		}else{
			chance=0.02
			if(mapdataArray[1000,1]+chance<4){
				mapdataArray[1000,1]+=chance
			}else{
				mapdataArray[1000,1]=0
			}
		
			if(phase==1){
				if(starttimer>=90){
					if(miniy>mapdataArray[1001,1]*24){
						miniy-=1
					}else{
						phase=2
					}
				}
					starttimer+=1
					if(global.con_h_up||global.con_h_down||global.con_h_right||global.con_h_left||global.conp_h_up||global.conp_h_down||global.conp_h_right||global.conp_h_left){
						phase=2
						miniy=0
						selectx=2
						selecty=1
						xtimer=15
						ytimer=15
					}
			}else{
			
				if(phase==2){			
#region Character Map Movement      
					if(phasetick==1){
						if(mapdataArray[1001,2]==0){
							if(global.con_h_e||global.conp_h_e||global.conp_h_shift||global.conp_h_space){
								if(selecty-1==mapdataArray[1001,1]){
									for(i=1;i<5;i+=1){
										if(mapdataArray[mapArray[selectx,selecty],i]>0){
											if(mapdataArray[mapArray[selectx,selecty],i]-1==mapdataArray[1001,0]){
												mapdataArray[1001,2]=1
												mapdataArray[1001,3]=selectx*32
												mapdataArray[1001,4]=selecty*24
												mapdataArray[1001,7]=selectx
												mapdataArray[1001,8]=selecty
													chance=0.3
													spedx =  mapdataArray[1001,3] - mapdataArray[1001,5]
													spedy = mapdataArray[1001,4] - mapdataArray[1001,6]
													distance = sqrt(spedx*spedx + spedy*spedy)
													 spedx = spedx * chance / distance
													 spedy = spedy * chance / distance			

											}
										}else{
											i=5
										}
									}
								}
							}
						}else{
							//Movement Process
							if(mapdataArray[1001,2]==1){

								if(mapdataArray[1001,5]==mapdataArray[1001,3]&&mapdataArray[1001,6]==mapdataArray[1001,4]){
								
									phasetick=3

									mapdataArray[1001,2]=0
									//Me x position
									mapdataArray[1001,0]=mapdataArray[1001,7]
									//Me y position
									mapdataArray[1001,1]=mapdataArray[1001,8]
								
									miniybase+=1
										toy=mapdataArray[1001,8]*24
									if(toy>133){
										toy=133
									}
								
								}else{
									if(spedx>0){
										if(mapdataArray[1001,5]+spedx<(mapdataArray[1001,3])){
											mapdataArray[1001,5]+=spedx
										}else{		
											mapdataArray[1001,5]=(mapdataArray[1001,3])
										}
									}else{
										if(mapdataArray[1001,5]+spedx>(mapdataArray[1001,3])){
											mapdataArray[1001,5]+=spedx
										}else{		
											mapdataArray[1001,5]=(mapdataArray[1001,3])
										}								
									}

									if(spedy>0){
										if(mapdataArray[1001,6]+spedy<(mapdataArray[1001,4])){
											mapdataArray[1001,6]+=spedy
										}else{		
											mapdataArray[1001,6]=(mapdataArray[1001,4])
										}
									}else{
										if(mapdataArray[1001,6]+spedy>(mapdataArray[1001,4])){
											mapdataArray[1001,6]+=spedy
										}else{		
											mapdataArray[1001,6]=(mapdataArray[1001,4])
										}								
									}
								}
							}
						}
					}else{
					if(global.con_p_w||global.conp_p_w){
						phasetick=4
							
							//Chest phase
							mapdataArray[1004,1]=0
							//Chest animation
							mapdataArray[1004,2]=0
							//Chest type
							mapdataArray[1004,3]=choose(0,1,2)
							//Item type
							mapdataArray[1004,4]=(irandom(10)*2)+1
							//Item Animation
							mapdataArray[1004,5]=0	
							//Item Float
							mapdataArray[1004,6]=0
							mapdataArray[1004,7]=0
							//Chest Float
							mapdataArray[1004,8]=0
							mapdataArray[1004,9]=0
							mapdataArray[1004,11]=0
							mapdataArray[1004,12]=0
							mapdataArray[1004,13]=0
							mapdataArray[1004,14]=3
							mapdataArray[1004,15]=8
							//Raw item no rarity
							mapdataArray[1004,16]=mapdataArray[1004,4]
							
							//Item rarity
							chance=irandom(99)
							if(chance<40){
								mapdataArray[1004,10]=1
							}else{
								if(chance<70){
									mapdataArray[1004,10]=2
								}else{
									if(chance<90){
										mapdataArray[1004,10]=3
										mapdataArray[1004,4]+=1
									}else{
										if(chance<=100){
											mapdataArray[1004,10]=4
											mapdataArray[1004,4]+=1
										}else{
								
										}								
									}								
								}								
							}
							mapdataArray[1004,12]=6-mapdataArray[1004,10]
						
						mapdataArray[1000,5]+=mapdataArray[mapArray[mapdataArray[1001,0],mapdataArray[1001,1]],10]
						mapdataArray[1000,6]=0
						
					}	
						if(phasetick==2){
							if(global.con_p_e||global.conp_p_e||global.con_p_space||global.conp_p_space){
								//mapdataArray[mapArray[mapdataArray[1001,0],mapdataArray[1001,1]],0]=15			
								phasetick=1
								if(mapdataArray[1001,8]==9){
									mapdataArray[1003,0]+=1
									phase=0
									map_gen_scr()	
								}
							}
						
						}else{
							if(phasetick==3){
								if(global.con_p_e||global.conp_p_e||global.con_p_space||global.conp_p_space){
									global.con_p_e=false
									global.con_p_space=false
									
									// Check if entering dungeon
									var node_x = Control.selectx;
									var node_y = Control.selecty;
									var node_index = mapArray[node_x, node_y];
									var node_type = mapdataArray[node_index, 0];
									
									if(node_type == 7){
										// Enter dungeon mode (icon 7 = dungeon entrance)
										dungeon_init()
										return; // Exit overworld_map_scr immediately
									}else{
										// Normal level entry
										pause=0
										lvlselect=2
										worldgen_scr()
									}
								}
							}else{
								
								//Chest Reward
								if(phasetick==4){
									if(targettick==0){
										if(targetpos<0.6){
											targetpos+=0.02
										}else{
											targettick=1
										}
									}else{
										if(targetpos>-0.6){
											targetpos-=0.02
										}else{
											targettick=0
										}	
									}		
									if(mapdataArray[1004,1]==0){
											if(mapdataArray[1004,8]==0){
												if(mapdataArray[1004,9]<90){
													mapdataArray[1004,9]+=1
												}else{
													mapdataArray[1004,8]=1
												}
											}else{
												if(mapdataArray[1004,9]>0){
													mapdataArray[1004,9]-=1
												}else{
													mapdataArray[1004,8]=0
												}														
											}
										if(global.con_p_e||global.conp_p_e||global.con_p_space||global.conp_p_space){
											mapdataArray[1004,1]=1
											mapdataArray[1004,9]=0
											for(i=0;i<10;i+=1){
												created=instance_create_depth(xps-0.5+106-2+random(4)-6+random(12),yps-0.5-5-1+irandom(2)-chancetwo-chance+4+119-1.5+random(3),0,Part)
												with(created){
													type=choose(1,1,1,1,2)
													pin=1
													depth=other.depth+1
													spin=1
													img=125+4*other.mapdataArray[1004,10]-4
													imgcap=2
													imgsped=0
													image_speed=0
													image_index=img+irandom(3)
													dur=30+choose(0,0,0,1,1,2)+irandom(20)
													direction=90
													speed=random_range(0.3,0.6)
													//speed=0.1
													durtotal=dur
													hsp=hspeed
													vsp=vspeed
													chance=random_range(0.7,1)
													xscale=chance
													yscale=chance
												}	
											}											
										}
									}else{
											
											//Rarity spark
											mapdataArray[1004,11]+=1
											if(mapdataArray[1004,11] mod 3==0){
												created=instance_create_depth(xps-0.5+106-2+random(4)-6+random(12),yps-0.5-5-chancetwo-chance+4+119-1.5+random(3),0,Part)
												with(created){
													type=choose(1,1,1,1,2)
													pin=1
													depth=other.depth+1
													spin=1
													img=125+4*other.mapdataArray[1004,10]-4
													imgcap=2
													imgsped=0
													image_speed=0
													image_index=img+irandom(3)
													dur=40+choose(0,0,0,1,1,2)+irandom(20)
													direction=90
													speed=random_range(0.3,0.4)
													//speed=0.1
													durtotal=dur
													hsp=hspeed
													vsp=vspeed
													chance=random_range(0.7,1)
													xscale=chance
													yscale=chance
												}	
											}
											//Chest animation
											if(mapdataArray[1004,2]<60-2){
												mapdataArray[1004,2]+=2
											}
											if(mapdataArray[1004,5]<60-2){
												if(mapdataArray[1004,2]>=35){
													mapdataArray[1004,15]=8
												}else{
													mapdataArray[1004,15]=16
												}
												if(mapdataArray[1004,5]>0){
													if(mapdataArray[1004,5] mod 10==0){
														if(mapdataArray[1004,14]>0){
															mapdataArray[1004,14]-=1
														}
													}
												}
												//Chest shake while opening
												if(mapdataArray[1004,12]==0){
													if(mapdataArray[1004,13]<8){
														mapdataArray[1004,13]+=mapdataArray[1004,14]
													}else{
														mapdataArray[1004,12]=1
													}
												}else{
													if(mapdataArray[1004,13]>0){
														mapdataArray[1004,13]-=mapdataArray[1004,14]
													}else{
														mapdataArray[1004,12]=0
													}														
												}											
											}
											if(mapdataArray[1004,2]>=35&&mapdataArray[1004,5]<60-2){
												mapdataArray[1004,5]+=1
											}else{
												if(mapdataArray[1004,5]>=60-2){
													if(mapdataArray[1004,6]==0){
														if(mapdataArray[1004,7]<90){
															mapdataArray[1004,7]+=1
														}else{
															mapdataArray[1004,6]=1
														}
													}else{
														if(mapdataArray[1004,7]>0){
															mapdataArray[1004,7]-=1
														}else{
															mapdataArray[1004,6]=0
														}														
													}
												}
											}
										if(global.con_p_e||global.conp_p_e||global.con_p_space||global.conp_p_space){
											//mapdataArray[mapArray[mapdataArray[1001,0],mapdataArray[1001,1]],0]=15			
											phasetick=1
											with(Part){
												if(pin==1){
													instance_destroy()
												}
											}
											if(mapdataArray[1001,8]==9){
												mapdataArray[1003,0]+=1
												phase=0
												map_gen_scr()	
											}
											//Place Reward Item
											chance=-1
											for(i=0;i<20;i+=1){
												if(invenArray[i,0]==0){
													chance=i
													i=20
												}
											}
											if(chance==-1){
												chance=30
											}
											invenArray[chance,0]=mapdataArray[1004,16]
											invenArray[chance,1]=0
											invenArray[chance,2]=mapdataArray[1004,10]
											invenArray[chance,3]=0
											invenArray[chance,4]=0
											invenArray[chance,5]=0
											
											
											//No room must sell
											if(chance==30){
												mapdataArray[1000,5]+=floor((itemArray[invenArray[invenArray[30,0],0],4]+floor(invenArray[invenArray[30,0],2]*2))/2)
												mapdataArray[1000,6]=0												
											}


										}
									}
										//Always
										if(instance_exists(Part)){
											with(Part){
												if(pin==1){
													if(dur>0){
														dur-=1
													}else{
														instance_destroy()
													}
												}
											}
										}
								}else{
									
								}							
							}
					
						}
					}

#endregion
				
				if(xtimer>0){
					xtimer-=1
				}
				if(ytimer>0){
					ytimer-=1
				}
				
					if(toy>miniy){
						if(miniy+0.5<=toy){
								miniy+=0.8
						}else{
							miniy=toy
						}
					}
				
					if(toy<miniy){
						if(miniy-0.5>=toy){
								if(miniy>0){
								miniy-=0.8
								}
						}else{
							miniy=toy
						}
					}


					if(global.con_p_m){
						chance=0
						if(global.con_p_1||(global.conp_p_shl&&global.conp_h_left)){
							mapdataArray[1003,0]=0
							chance=1
						}
						if(global.con_p_2||(global.conp_p_shl&&global.conp_h_right)){
							mapdataArray[1003,0]=1
							chance=1
						}
							phase=0
							map_gen_scr()	
					
						if(chance==1){
							phase=0
							map_gen_scr()					
						}
					}
#region Map Controls
	if(phasetick!=3&&phasetick!=2&&phasetick!=4&&mapdataArray[1001,2]!=1){
		
					if(global.con_h_right||global.conp_h_right){
						if(selecty<10){
							if(mapdataArray[mapArray[selectx,selecty],0]>=15&&mapdataArray[mapArray[selectx,selecty],0]<25){
								//selecty+=1
							}
						}
						if(xtimer==0){
							if(selectx<4&&mapdataArray[mapArray[selectx+1,selecty],0]!=0){
								selectx+=1
							}else{
								selectx+=1
									if(selectx>=5){
									selectx=0
									}
								while(mapdataArray[mapArray[selectx,selecty],0]==0){
									if(selectx>=5){
									selectx=0
									}
									selectx+=1
								}
							}
							xtimer=15
							mapdataArray[1000,3]=1
						}					
					}else{
						if(mapdataArray[1000,3]==1){
							xtimer=0
						}							
					}
					if(global.con_h_left||global.conp_h_left){
						if(selecty<10){
							if(mapdataArray[mapArray[selectx,selecty],0]>=15&&mapdataArray[mapArray[selectx,selecty],0]<25){
								//selecty+=1
							}
						}
						if(xtimer==0){
							if(selectx>0&&mapdataArray[mapArray[selectx-1,selecty],0]!=0){
								selectx-=1
							}else{
								selectx-=1
									if(selectx<=0){
									selectx=5
									}
								while(mapdataArray[mapArray[selectx,selecty],0]==0){
									if(selectx<=0){
									selectx=5
									}
									selectx-=1
								}
							}
							xtimer=15
							mapdataArray[1000,3]=2
						}					
					}else{
						if(mapdataArray[1000,3]==2){
							xtimer=0
						}							
					}
					if(global.con_h_up||global.conp_h_up){
						if(selecty<9&&ytimer==0){
							selecty+=1
							if(selecty>miniybase+2&&toy+24<133||selecty>=(toy/24)+4&&toy+24<133){
								toy+=24
							}
							if(selecty==9){
								if(toy<133){
									toy=133
								}
							}
							if(mapdataArray[mapArray[selectx,selecty],0]==0){
								if(selectx<3){
									selectx=0
									while(mapdataArray[mapArray[selectx,selecty],0]==0){
										selectx+=1
									}
								}else{
									selectx=5
									while(mapdataArray[mapArray[selectx,selecty],0]==0){
										selectx-=1
									}
								}
							}
							ytimer=20
							mapdataArray[1000,2]=1
						}
					}else{
						if(mapdataArray[1000,2]==1){
							ytimer=0
						}
					}
					if(global.con_h_down||global.conp_h_down){
						if(selecty>0&&ytimer==0){
							if(selecty>0&&toy>=24){
								toy-=24
							}else{
								toy=0
							}
							selecty-=1
							if(mapdataArray[mapArray[selectx,selecty],0]==0){
								if(selectx<3){
									selectx=0
									while(mapdataArray[mapArray[selectx,selecty],0]==0){
										selectx+=1
									}
								}else{
									selectx=5
									while(mapdataArray[mapArray[selectx,selecty],0]==0){
										selectx-=1
									}
								}
							}
							ytimer=20
							mapdataArray[1000,2]=2
						}
					}else{
						if(mapdataArray[1000,2]==2){
							ytimer=0
						}				
					}
	}
#endregion
						if(animationtick==0){
							if(anim<0.5){
								anim+=0.02
							}else{
								animationtick=1
							}
						}else{
							if(anim>-0.5){
								anim-=0.02
							}else{
								animationtick=0
							}	
						}
						if(animation<143){
							animation+=0.015
						}else{
							animation=0
						}
				}
			}
		}



}
