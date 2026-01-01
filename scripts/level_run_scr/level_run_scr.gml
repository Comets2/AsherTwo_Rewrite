function level_run_scr() {
#region Level Data

	/*
					//Goal (Enemy Waves)
					lvlArray[1000,0]=1
					//Goal total (Total number of waves)
					lvlArray[1000,1]=3	
					//Goal current	(Current wave number on)
					lvlArray[1000,2]=3 + floor(mapdataArray[1001,8]/2)
					//Goal counter type (Count down)
					lvlArray[1000,3]=1		
					//Goal counter two (Enemy number)
					lvlArray[1000,4]=1
					//Level phase
					lvlArray[1000,5]=0
					//Level check
					lvlArray[1000,6]=0
				
					//Timer (60*180=3 minutes)
					miniArray[1,1]=(60*180)+1
					miniArray[0,1]=miniArray[1,1]
					//Ground Spawner Location x,y
					lvlArray[1000,10]=xpos+1*16
					lvlArray[1000,11]=ypos+7*16

					lvlArray[1000,10]=xpos+12*16
					lvlArray[1000,11]=ypos+9*16
 
					lvlArray[1000,10]=xpos+23*16
					lvlArray[1000,11]=ypos+7*16
	*/
#endregion

	// Rogue mode uses its own run script
	if(rogue_mode){
		rogue_run_scr()
		return
	}

	if(pause==0){
	stagetimer+=1
	}


#region Monster Camps
	if(lvlArray[1000,0]==1){
	//Spawn Waves
	if(lvlArray[1000,6]==0){
		lvlArray[1000,6]=1
		lvlArray[1000,7]=210
		lvlArray[1000,5]=0
		lvlArray[1000,8]=irandom(3)*30
		lvlArray[1010,5]=lvlArray[1000,8]
		lvlArray[1010,0]=0
		//Timer timer ramp
		lvlArray[1010,2]=30
		lvlArray[1010,3]=60
		//miniArray[0,1]=0
	}

			if(lvlArray[1000,2]+1>1){
				lvlArray[1010,24]= string(lvlArray[1000,2]+1) + " Waves Remain"
			
			}else{
				if(lvlArray[1000,2]+1==1){
					lvlArray[1010,24]= string(lvlArray[1000,2]+1) + " Wave Remains"
				}
			}

		if(miniArray[0,1]==0){
			if(lvlArray[1010,2] mod lvlArray[1010,3]==0||lvlArray[1010,3]==0){
				if(lvlArray[1010,3]>30){
					lvlArray[1010,3]-=1
				}
#region Leaf Attack							
										enopt=1
										for(i=0;i<2;i+=1){
											created=instance_create_depth(random_range(mapxspot-8,mapxspottotal+8),mapy,10,Abil)
											with(created){
												sprite_index=enemy_abil_spr
												pin=33
												image_speed=0
												imgsped=0
											
													if(other.enopt==0){
														img=22+irandom(3)
													}else{
														img=22+irandom(3)+4
													}
														slow=0
												image_index=img
												imgcap=1	
												en=1
												sped=0.2
												dmg=2
												startx=x
												starty=y
												rangetick=other.i
												range=24
												diddmg=0
												hsp=0
												if(other.i==1){
													vsp=0.1
												}else{
													if(other.i==2){
														vsp=0.15
													}else{
														vsp=0.2
													}
												}
												vsp+=random(0.2)
												imgangle=0
										
												dur=2100
												move=1
												phasecheck=1
												imgangle=choose(0,180)
											}		
										}
#endregion		
			
			}
			lvlArray[1010,2]+=1
		}

		if(lvlArray[1000,7]>0){
			if(lvlArray[1000,7]==60){
				if(lvlArray[1000,5]==0){
					chancetwo=lvlArray[1000,8]
					for(i=0;i<5;i+=1){
						if(lvlArray[1000,10+chancetwo+i*5]!=0){
								chance=irandom(360)
								for(ii=0;ii<10;ii+=1){
									created=instance_create_depth(lvlArray[1000,10+chancetwo+i*5]-4+random(8),lvlArray[1000,11+chancetwo+i*5]-4+random(8),0,Part)
									with(created){
									type=1
									pin=1
									depth=other.depth+1
									spin=1
									img=irandom(4)+52
									imgcap=1
									imgsped=0
									image_speed=0
									image_index=irandom_range(img,img+imgcap)
									image_index=img
									dur=60+choose(0,0,0,1,1,2)+irandom(20)
									direction=irandom(360)
									speed=random_range(0.05,0.1)
									speed=random_range(0.01,0.05)
									durtotal=dur
									hsp=hspeed
									vsp=vspeed
									chance=random_range(0.7,1)
									xscale=chance
									yscale=chance
									}		
								}		
						}
		
					}
				}
			}
			lvlArray[1000,7]-=1
		}else{
			if(lvlArray[1000,5]==0){
				chancetwo=lvlArray[1000,8]
				
				lvlArray[1000,5]=1
				for(i=0;i<6;i+=1){
					if(lvlArray[1000,10+chancetwo+i*5]!=0){
						created=instance_create_depth(lvlArray[1000,10+chancetwo+i*5],lvlArray[1000,11+chancetwo+i*5],10,Enemy)
						if(mapdataArray[1001,8]<3){
					
						}
						
							if(mapdataArray[1001,8]==1){
								created.enopt=0	
								chance=0+chancetwo
							}else{
								if(mapdataArray[1001,8]==2||mapdataArray[1001,8]==3){
									created.enopt=choose(0,0,0,0,1)		
									chance=choose(0,0,0,1)+chancetwo
								}else{
									if(mapdataArray[1001,8]==4){
										created.enopt=choose(0,0,1)	
										chance=choose(0,0,1)+chancetwo
									}else{
										if(mapdataArray[1001,8]==5){
											created.enopt=choose(0,1)
											chance=choose(0,1,2)+chancetwo
										}else{
											if(mapdataArray[1001,8]==6){
												created.enopt=choose(0,1,1)		
												chance=choose(1,2)+chancetwo
											}else{
												if(mapdataArray[1001,8]==7){
													created.enopt=1		
													chance=2+chancetwo
												}else{
						
												}						
											}							
										}							
									}						
								}						
							}	
							created.pin = lvlArray[1000,(12+chance)+i*5]
						
					}
		
				}
			}else{
				if(exitdoor==0){
				lvlArray[1000,4]=0
				with(Enemy){
					if(team!=0&&team!=3){
						other.lvlArray[1000,4]+=1
					}
				}
				if(lvlArray[1000,4]==0){
					if(lvlArray[1000,2]>0){
						lvlArray[1000,2]-=1
						lvlArray[1000,6]=0
					}else{
						if(lvlArray[1010,0]==0){
							lvlArray[1010,0]=120
						}
						if(lvlArray[1010,0]==1){
							exitdoor=1
							
							
							
							with(Abil){
								if(pin!=23&&nodestroy==0){							
									instance_destroy()
								}
							}
							with(Enemy){
								if(nodestroy==0){							
									instance_destroy()
								}							
							}
							with(Part){
								if(nodestroy==0){							
									instance_destroy()
								}								
							}
							phasetick=2
							mapdataArray[1000,5]+=mapdataArray[mapArray[mapdataArray[1001,0],mapdataArray[1001,1]],10]
						}else{
							if(lvlArray[1010,0]>1){
								lvlArray[1010,0]-=1
							}
						}
					}
					}
				}		
			}

		}
	}else{
#endregion
#region Boss Level
	if(lvlArray[1000,0]==3){
		if(lvlArray[1000,6]==0){
			lvlArray[1000,6]=1
			created=instance_create_depth(midx+60,midy+110,10,Enemy)
			with(created){
				pin=4
				enopt=choose(0,1)
			}	
				boss=1+created.enopt
		}
				lvlArray[1000,4]=0
				with(Enemy){
					if(team!=0&&team!=3){
						other.lvlArray[1000,4]+=1
					}
				}
				
				
				if(exitdoor==0){
				if(lvlArray[1000,4]==0){
						if(lvlArray[1010,0]==0){
							lvlArray[1010,0]=120
						}
						if(lvlArray[1010,0]==1){
							exitdoor=1
							with(Abil){
								if(pin!=23){
									instance_destroy()
								}
							}
							phasetick=2
							mapdataArray[1000,5]+=mapdataArray[mapArray[mapdataArray[1001,0],mapdataArray[1001,1]],10]
						}else{
							if(lvlArray[1010,0]>1){
								lvlArray[1010,0]-=1
							}
						}
				
				}	
				}

	}else{
#endregion
#region Mini Boss 
	if(lvlArray[1000,0]==2){
		if(lvlArray[1000,6]==0){
			lvlArray[1000,6]=1
			lvlArray[1000,7]=210		
			lvlArray[1010,31]=0
	
#region Witch
	if(rmtype==3){
		
		
		witch=0
		if(witch==0){
				chance=instance_create_depth(midx+60+3,midy+114,30,Enemy)
				with(chance){
					pin=110
					enopt=1
					xpdrop=30
				}				
		}else{
		
				chance=instance_create_depth(midx+60+3,midy+114,30,Enemy)
				with(chance){
					pin=105
					enopt=1
					xpdrop=30
				}	
				created=instance_create_depth(midx+60+3,midy+114,25,Enemy)
				with(created){
					pin=106
					atttick=1
					chance=other.chance
					chance.brewtwo=id
				}	
				created=instance_create_depth(midx+60+3-9*16,midy+114-4*16,25,Enemy)
				with(created){
					pin=106
					enopt=1
					atttick=0
					chance=other.chance
					chance.brewone=id
				}	
				created=instance_create_depth(midx+60+3+9*16,midy+114-4*16,25,Enemy)
				with(created){
					pin=106
					enopt=1
					atttick=2
					chance=other.chance
					chance.brewthree=id
				}	
				boss=1+created.enopt
#region Start Apple
			created=instance_create_depth(midx+60+5,midy+114+12,9,Abil)
			with(created){
				sprite_index=enemy_abil_spr
				pin=100
				spin=choose(random_range(-4,-2),random_range(2,4))
				image_speed=0
				imgsped=0
					item=14
					imgcap=0
					img=80+item
					dur=1500
					xpdrop=30
				
			
			
				image_index=img
			
				dmg=1
				phase=0

			
				grav=0.01
				vsp=1
				hsp=0
				imgangle=0
				dir=1
				yrebound=0.4
				part=1
						
				en=2
				type=1
				move=1
				diddmg=0
				creator=other.id
				phase=0
				phasecheck=1	
				imgangle=0
			}
#endregion
	}
	}else{
#endregion
#region Elmwood
	if(rmtype==1){
				chance=instance_create_depth(midx+60+3,midy+100,30,Enemy)
				with(chance){
					pin=107
				}	
	}
#endregion

	}
		}
	if(lvlArray[1000,7]>0){
		lvlArray[1000,7]-=1
	}else{
#region Witch Brew
	with(Abil){
		if(pin==100){
			hit=instance_place(x,y-2,Enemy)
			if(hit!=noone){
				if(hit.pin==105){
					if(x>hit.x-4&&x<hit.x+4){
					hsp=0
					}
					if(hit.brew==0){
						if(id!=other.lvlArray[1010,20]&&id!=other.lvlArray[1010,25]&&id!=other.lvlArray[1010,26]){
						hit.brew=id
						hit.brewtick=0
						vsp=0
						grav=0
						}
					}
				}
			}
		}

	}
	}
#endregion

			if(exitdoor=0){
				lvlArray[1000,4]=0
				with(Enemy){
					if(team!=0&&team!=3){
						other.lvlArray[1000,4]+=1
					}
				}
				if(lvlArray[1000,4]==0){
						if(lvlArray[1010,0]==0){
							lvlArray[1010,0]=120
						}
						if(lvlArray[1010,0]==1){
							
							exitdoor=1
							with(Abil){
								if(pin!=23){
									instance_destroy()
								}
							}
							phasetick=2
							mapdataArray[1000,5]+=mapdataArray[mapArray[mapdataArray[1001,0],mapdataArray[1001,1]],10]
						}else{
							if(lvlArray[1010,0]>1){
								lvlArray[1010,0]-=1
							}
						}
				
				}	
			}

	}else{
#endregion
#region Apple Minigame
	if(lvlArray[1000,0]==9){
		if(lvlArray[1000,6]==0){
			lvlArray[1000,6]=1
			lvlArray[1000,7]=210
			lvlArray[1000,8]=0
			lvlArray[1010,20]=0
			lvlArray[1010,21]=1
			lvlArray[1010,22]=0
			lvlArray[1010,23]=choose(0,1)
		
#region Start Apple
			created=instance_create_depth(midx+60+3,mapy+150,9,Abil)
			with(created){
				sprite_index=enemy_abil_spr
				pin=100
				spin=choose(random_range(-4,-2),random_range(2,4))
				image_speed=0
				imgsped=0
					item=0
					imgcap=0
					img=61+item
					dur=1500
			
			
				image_index=img
			
				dmg=1
				phase=0

			
				grav=0.01
				vsp=1
				hsp=0
				imgangle=0
				dir=1
				yrebound=0.4
				part=1
						
				en=2
				type=1
				move=1
				diddmg=0
				creator=other.id
				phase=0
				phasecheck=1	
				imgangle=0
			}
#endregion
				created=instance_create_depth(midx+60+3,midy+110+63-5,30,Enemy)
				with(created){
					pin=101
					
				}
				created=instance_create_depth(midx+60+3,midy+110+63,30,Enemy)
				with(created){
					pin=100
				}	
				created=instance_create_depth(midx+60-2-(13.5*16),midy+110+67-5*16-9,30,Enemy)
				with(created){
					pin=104
				}	
				created=instance_create_depth(midx+60-6+(14.5*16),midy+110+67-5*16-9,30,Enemy)
				with(created){
					pin=104
					dir=-1
				}	
		}
	
	//Timer
	if(miniArray[0,1]==0){
			exitdoor=1
			mapdataArray[mapArray[mapdataArray[1001,0],mapdataArray[1001,1]],10]=floor(Control.lvlArray[1000,4]/10)
			with(Abil){
				if(pin!=23){
					instance_destroy()
				}
			}
			phasetick=2
			mapdataArray[1000,5]+=mapdataArray[mapArray[mapdataArray[1001,0],mapdataArray[1001,1]],10]
	}
	

		if(lvlArray[1000,7]>0){
			lvlArray[1000,7]-=1
		}
		lvlArray[1000,8]+=1
	
	item_pickup_scr()

#region Apple spawn

	if(lvlArray[1000,8] mod 200 ==0){

	if(lvlArray[1000,8]>=3600){
		if(lvlArray[1000,8]>=7200){
		if(mapdataArray[1001,8]<5){
		chance=8
		}else{
		chance=16
		}
	
	
		if(irandom(100)<=chance){
		created=instance_create_depth(random_range(mapxspot+48,mapxspottotal-48),mapy+150,9,Enemy)
							created.pin=3
							created.enopt=5
		}
	}
#region Leaf Attack							
										enopt=lvlArray[1010,23]
										chance=1
										for(i=0;i<chance;i+=1){
											created=instance_create_depth(random_range(mapxspot-8,mapxspottotal+8),mapy,10,Abil)
											with(created){
												sprite_index=enemy_abil_spr
												pin=33
												image_speed=0
												imgsped=0
											
													if(other.enopt==0){
														img=22+irandom(3)
													}else{
														img=22+irandom(3)+4
													}
														
												image_index=img
												imgcap=1	
												en=1
												sped=0.2
												dmg=2
												startx=x
												starty=y
												rangetick=other.i
												range=24
												diddmg=0
												hsp=0
												if(other.i==1){
													vsp=0.1
												}else{
													if(other.i==2){
														vsp=0.15
													}else{
														vsp=0.2
													}
												}
												vsp+=random(0.2)
												imgangle=0
										
												dur=2100
												move=1
												phasecheck=1
												imgangle=choose(0,180)
											}		
										}
#endregion		

		if(irandom(100)<=66){
				created=instance_create_depth(random_range(mapxspot+26,mapxspottotal-26),mapy+150,9,Abil)
				with(created){
					sprite_index=enemy_abil_spr
					pin=30
					spin=choose(random_range(-4,-2),random_range(2,4))
					image_speed=0
					imgsped=0
					img=4+choose(0,1)
			
					image_index=img
					imgcap=0
					dmg=1
					phase=0

					dur=400
					grav=0.01
					vsp=0
					hsp=0
					imgangle=0
					dir=1
					yrebound=0.4
					part=1
						
					en=1
					type=1
					move=1
					diddmg=0
					creator=other.id
					phase=0
					phasecheck=1	
					imgangle=random(360)
				}
		}
	}
		for(i=0;i<2;i+=1){
			created=instance_create_depth(random_range(mapxspot+26,mapxspottotal-26),mapy+150,9,Abil)
			with(created){
				sprite_index=enemy_abil_spr
				pin=100
				spin=choose(random_range(-4,-2),random_range(2,4))
				image_speed=0
				imgsped=0
				if(irandom(3)<=2){
					item=choose(0,0,0,0,0,0,1,1,1,2)
					imgcap=0
					img=61+item
					dur=1500
				}else{
					item=choose(0,0,0,0,0,0,1,1,1,2)+3
					img=67+(item-3)*2
					imgcap=1
					imgsped=0.05
					dur=1000
				}
			
			
				image_index=img
			
				dmg=1
				phase=0

			
				grav=0.01
				vsp=1
				hsp=0
				imgangle=0
				dir=1
				yrebound=0.4
				part=1
						
				en=2
				type=1
				move=1
				diddmg=0
				creator=other.id
				phase=0
				phasecheck=1	
				imgangle=315+random(90)
			}
		}
	}
#endregion	

	}else{
#endregion
#region Witch Minigame
	if(lvlArray[1000,0]==11){
		if(lvlArray[1000,6]==0){
			lvlArray[1000,6]=1
			Me.x+=40
			Me.y+=96
				miniArray[1,1]=(60*60*4)+1
				miniArray[0,1]=(60*60*4)+1
			lvlArray[1000,7]=210
			lvlArray[1000,8]=0
			lvlArray[1010,20]=0
			lvlArray[1010,21]=1
			lvlArray[1010,22]=0
			lvlArray[1010,23]=choose(0,1)
			lvlArray[1010,25]=0
			lvlArray[1010,26]=0
			lvlArray[1010,27]=0
			lvlArray[1010,30]=1
			lvlArray[1010,31]=10+irandom(3)
			lvlArray[1010,32]=10+irandom(3)
			lvlArray[1010,33]=10+irandom(3)
		
		
#region Start Apple
			created=instance_create_depth(midx+60+3,midy+242-10.5,9,Abil)
			with(created){
				sprite_index=enemy_abil_spr
				pin=100
				spin=choose(random_range(-4,-2),random_range(2,4))
				image_speed=0
				imgsped=0
					item=other.lvlArray[1010,31]
					imgcap=0
					img=80+item
					dur=1500
			
			
				image_index=img
			
				dmg=1
				phase=0

			
				grav=0.01
				vsp=1
				hsp=0
				imgangle=0
				dir=1
				yrebound=0.4
				part=1
						
				en=2
				type=1
				move=1
				diddmg=0
				creator=other.id
				phase=0
				phasecheck=1	
				imgangle=0
			}
#endregion

				created=instance_create_depth(midx+60+3,midy+242-32,30,Enemy)
				with(created){
					pin=105
				
				}	
				created=instance_create_depth(midx+60+3,midy+242-32,25,Enemy)
				with(created){
					pin=106
				}	

#region Enemy Spawns
		chancetwo=0
		for(i=0;i<30;i+=1){

			chance=0
			if(i<15){
			chance=choose(0,0,1)
			}
			if(chance==0){
			created=instance_create_depth(lvlArray[1000,10+chancetwo],lvlArray[1000,10+chancetwo+1],10,Enemy)
				created.drop=1
				if(i<15){
				created.pin=1
				created.drop=2
				if(mapdataArray[1001,8]<5){
					created.enopt=choose(0,2)
				}else{
					created.enopt=choose(1,2)
				}
				if(created.enopt==0||created.enopt==1){
								created.item=11
				}else{
					if(created.enopt==2){
									created.item=12
					}			
				}
				}else{
				created.pin=3
				if(mapdataArray[1001,8]<5){
					created.enopt=choose(0,6,7)
				}else{
					created.enopt=choose(1,6,7)
				}
				if(created.enopt==0||created.enopt==1){
								created.item=11
				}else{
					if(created.enopt==6){
									created.item=10
					}else{
						if(created.enopt==7){
										created.item=12
						}else{
			
						}			
					}			
				}
					for(ii=0;ii<irandom(2);ii+=1){
						created=instance_create_depth(lvlArray[1000,10+chancetwo]-16+random(16),lvlArray[1000,10+chancetwo+1],10,Enemy)
						created.drop=1
						created.pin=3
							if(mapdataArray[1001,8]<5){
								created.enopt=choose(0,6,7)
							}else{
								created.enopt=choose(1,6,7)
							}
							if(created.enopt==0||created.enopt==1){
											created.item=11
							}else{
								if(created.enopt==6){
												created.item=10
								}else{
									if(created.enopt==7){
													created.item=12
									}else{
			
									}			
								}			
							}
					}
				}
			}
			chancetwo+=2
		}
#region	Bat Spawn
					//Ground Spawner Location x,y
					chance=mapx+8*16
					chancetwo=mapy+8*16
				created=instance_create_depth(chance+8*16,chancetwo+2*16,30,Enemy)
				with(created){
					pin=5
					drop=2
					item=13
					enopt=choose(1,0,1)
				}
				created=instance_create_depth(chance+8*16,chancetwo+11*16,30,Enemy)
				with(created){
					pin=5
					drop=2
					item=13
					enopt=choose(0,0,1)
				}
				created=instance_create_depth(chance+8*16,chancetwo+20*16,30,Enemy)
				with(created){
					pin=5
					drop=2
					item=13
					enopt=choose(0,0,1)
				}
			
				created=instance_create_depth(chance+92*16,chancetwo+2*16,30,Enemy)
				with(created){
					pin=5
					drop=2
					item=13
					enopt=choose(1,0,1)
				}
				created=instance_create_depth(chance+92*16,chancetwo+11*16,30,Enemy)
				with(created){
					pin=5
					drop=2
					item=13
					enopt=choose(0,0,1)
				}
				created=instance_create_depth(chance+92*16,chancetwo+20*16,30,Enemy)
				with(created){
					pin=5
					drop=2
					item=13
					enopt=choose(0,0,1)
				}
		chancethree=choose(6,26,46)
		chancefour=choose(56,76,96)
				created=instance_create_depth(chance+chancethree*16,chancetwo+1*16,30,Enemy)
				with(created){
					pin=5
					drop=2
					item=13
					enopt=1
				}		
				created=instance_create_depth(chance+chancefour*16,chancetwo+1*16,30,Enemy)
				with(created){
					pin=5
					drop=2
					item=13
					enopt=1
				}
		chancethree=choose(25,45)
		chancefour=choose(56,76)
				created=instance_create_depth(chance+chancethree*16,chancetwo+11*16,30,Enemy)
				with(created){
					pin=5
					drop=2
					item=13
					enopt=1
				}		
				created=instance_create_depth(chance+chancefour*16,chancetwo+11*16,30,Enemy)
				with(created){
					pin=5
					drop=2
					item=13
					enopt=1
				}
#endregion
#endregion
		}

#region Ingredients
	if(lvlArray[1010,20]!=0){
		if(lvlArray[1010,25]==0){
				if(lvlArray[1010,22]==0){
					with(Abil){
						if(pin==100){
							hit=instance_place(x,y,Me)
							if(hit!=noone){
								if(id!=Control.lvlArray[1010,20]){
									if(Control.lvlArray[1010,21]!=id){
									Control.lvlArray[1010,25]=id
									}
								}
							}
						}
					}
				}
		}else{
			if(instance_exists(lvlArray[1010,25])){
				lvlArray[1010,25].dur+=1
				if(Me.dir==1){
					lvlArray[1010,25].x=Me.x-1
				}else{
					lvlArray[1010,25].x=Me.x+1
				}
				lvlArray[1010,25].y=Me.y
				lvlArray[1010,25].imgangle+=lvlArray[1010,25].spin
			}
				if(lvlArray[1010,26]==0){
					if(lvlArray[1010,22]==0){
						with(Abil){
							if(pin==100){
								hit=instance_place(x,y,Me)
								if(hit!=noone){
									if(id!=Control.lvlArray[1010,25]&&id!=Control.lvlArray[1010,20]){
										if(Control.lvlArray[1010,21]!=id){
										Control.lvlArray[1010,26]=id
										}
									}
								}
							}
						}
					}
				}else{
					if(instance_exists(lvlArray[1010,26])){
						lvlArray[1010,26].dur+=1
						lvlArray[1010,25].dur+=1
						if(Me.dir==1){
							lvlArray[1010,26].x=Me.x-2
						}else{
							lvlArray[1010,26].x=Me.x+2
						}
						lvlArray[1010,26].y=Me.y
						lvlArray[1010,26].imgangle+=lvlArray[1010,26].spin
					}
				}
		}
	}else{
		if(lvlArray[1010,25]!=0){
			lvlArray[1010,20]=lvlArray[1010,25]
			lvlArray[1010,25]=0
			if(lvlArray[1010,26]!=0){
				lvlArray[1010,25]=lvlArray[1010,26]
				lvlArray[1010,26]=0
			}
		}
	}

	item_pickup_scr()
#endregion
#region Witch Brew
	with(Abil){
		if(pin==100){
			hit=instance_place(x,y-2,Enemy)
			if(hit!=noone){
				if(hit.pin==105){
					if(x>hit.x-4&&x<hit.x+4){
					hsp=0
					}
					if(hit.brew==0){
						if(id!=other.lvlArray[1010,20]&&id!=other.lvlArray[1010,25]&&id!=other.lvlArray[1010,26]){
						hit.brew=id
						hit.brewtick=0
						vsp=0
						grav=0
						}
					}
				}
			}
		}

	}
	//Timer
	if(miniArray[0,1]==0){
			exitdoor=1
			mapdataArray[mapArray[mapdataArray[1001,0],mapdataArray[1001,1]],10]=floor(Control.lvlArray[1000,4]/10)
			with(Abil){
				if(pin!=23){
					instance_destroy()
				}
			}
			phasetick=2
			mapdataArray[1000,5]+=mapdataArray[mapArray[mapdataArray[1001,0],mapdataArray[1001,1]],10]
	}

#endregion

		if(lvlArray[1000,7]>0){
			lvlArray[1000,7]-=1
		}
	
	}else{
#endregion

	}}}}

	}


//Exit Door
if(exitdoor==1){
	
	with(Snd){
		
		//instance_destroy()
	}
	
	exitdoor=2
	
	door=instance_create_depth(midx+48,midy+48,Dummy)
	with(door){
		sprite_index=abil_crab_spr
		img=262
		image_index=img
		image_speed=0
		imgsped=0
		dur=9999999999999999999999999999999999999999999999999999999999999999999999999999
	}
	
}else{
	
	if(pause==0){
		if(exitdoor==2){
			with(door){
				if(instance_place(x,y,Me)){
					other.pause=1
					
				}
			}
		}
	}
	
if(pause==1){
	with(door){
		instance_destroy()
	}
	exitdoor=0
	
							with(Abil){
								if(pin!=23&&nodestroy==0){							
									instance_destroy()
								}
							}
							with(Enemy){
								if(nodestroy==0){							
									instance_destroy()
								}							
							}
							with(Part){
								if(nodestroy==0){							
									instance_destroy()
								}								
							}
							
							if(phasetick==2){
								if(mapdataArray[1004,4]!=0){
									phasetick=4
										//Chest phase
										mapdataArray[1004,1]=0
										//Chest animation
										mapdataArray[1004,2]=0
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
							}
}
}

}