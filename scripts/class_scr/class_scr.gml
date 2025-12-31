function class_scr() {


	if(pet==noone){
		if(Control.invenArray[21,0]!=0){
			pet=instance_create_depth(x,y,9,Enemy)
			pet.pin=200
			pet.nodestroy=1
			pet.team=0
			pet.targ=0
		}
			/*
			pet=instance_create_depth(x-10,y,9,Enemy)
			pet.pin=200
			pet=instance_create_depth(x+10,y,9,Enemy)
			pet.pin=200
			*/
	}else{
	
	}
		if(classcheck==1){
			for(i=0;i<3;i+=1){
				abilArray[i,1]=0
			}
			sped=spedsave
		}

	if(class==0){
		if(classcheck==1){
			classcheck=0
			hp=16
			hptotal=hp
			mespr=me_spr
			wep=0
			maskextra=0
		}	
	}else{
#region Witch Class
	//____________________________________________________________________________---------------------(Witch)---------------------____________________________________________________________________________	
	if(class==1){
		if(classcheck==1){
			classcheck=0
			hp=12
			hptotalback=hp
			mespr=me_spr
			wep=1
			maskextra=0 
			mespr=me_mask_witch_spr
			
				abilArray[0,2]=40
				abilArray[1,2]=99999999999
				abilArray[2,2]=640
				passive=noone
				
				abilArray[16,0]=100
				abilArray[16,1]=0
				abilArray[16,2]=0
				abilArray[16,3]=0
				abilArray[16,4]=1000
				
				abilArray[16,5]=0
				abilArray[16,6]=0
				abilArray[16,7]=0
				abilArray[16,8]=0
				abilArray[16,9]=0
				abilArray[16,10]=0
				//x
				abilArray[16,11]=0
				//y
				abilArray[16,12]=0
				
				wepanim=0
				
				
		}
		

		
		if(Control.talentmapArray[6,1]>0){
			
			if(wep<4){
				wep=4 
			}
			
			wepanim+=1
			if(wepanim mod 30 ==0){
				if(wep+1<13){
					wep+=1
				}else{
					wep=4
				}
			}
		}else{
			wep=1
		}
		
		//Control.talentmapArray[16,1]=1
		
		
		//Spirit orbs 
		if(Control.talentmapArray[16,1]>0){
			
				//x
				abilArray[16,11]=Me.x
				//y
				abilArray[16,12]=Me.y

				chance=0
				with(Abil){
					if(pin==9){
						other.chance+=1
					}
				}

			if(abilArray[16,4]>0){
				abilArray[16,4]-=1
			}else{
				abilArray[16,4]=1000
			}
			if(abilArray[16,0]>0){
				if(chance<3+Control.talentmapArray[18,1]){
					abilArray[16,0]-=1
				}
			}else{

				if(chance<3+Control.talentmapArray[18,1]){
								//Spirit orb
								created=instance_create_depth(x,y,0,Abil)
								with(created){
									sndobjectone=instance_create_depth(x,y,0,Snd)
									with(sndobjectone){
										sndemitone=audio_emitter_create()				
										audio_play_sound_on(sndemitone,choose(snd_pumpkin_throw_all_1,snd_pumpkin_throw_all_2),false,8)
										audio_emitter_falloff(sndemitone, 48, Control.falloff_max, Control.falloff_factor)					
									}	
									//0=TRUE/False,1=Target,2=X,3=Y,4=Img,5=ImgCap,6=Amount,7=Delay,8=DelayAmount,9=Dur,10=hsp,11=vsp,12=DurExtra,13=XscaleYscale,14=XscaleMaxYscaleMax,15=ImgSped
									//part_gen_scr(1,0,5,5,34,2,1,1,2,16,0,0,8,0.6,1,0)

									img=77
										partone=39
										parttwo=127
										partthree=128
										temp=0

									sprite_index=abil_witch_spr
									img=130+(choose(0,0,0,0,0,0,1,2,2,3)*3)
									img=123+choose(0,3)
									imgsped=0
									
									img=130+choose(0,3)
									imgsped=0.1
									
									imgcap=2
									image_index=img
									image_speed=0
									imgangle=0
									dur=9999999
									en=0
									tick=0
									ticktwo=0
									
									pin=9
									phase=0
									sped=0.5
									spedtwo=0.1
									range=260
									rangetwo=5
									attcd=320
									attcdtotal=attcd
									attcd=irandom_range(attcd*0.25,attcd)
									hsp=0
									vsp=0
									grav=0
									hittrigger=0
									hittriggertwo=0
									depth=other.depth-1
									
									dmg=2
									
									dir=choose(1,-1)
										spotx=random_range(-5,5)
										spoty=random_range(-5,5)
										
										spotytwo=spoty
										
									dur=10
									phase=0
									
									x=Me.x-spotx
									y=Me.y-spoty
									
									sped=1.1
									if(Control.talentmapArray[18,1]>0){
										sped=1.7
									}
									sped+=random_range(-0.05,0.05)
								}	
					}
								//cd
								abilArray[16,0]=180-(180*(0.1*Control.talentmapArray[17,1]))
				}
			
				with(Abil){
					if(pin==9&&phase==0){
						dur=10
					}
				}
				if(abilArray[16,2]>0){
					abilArray[16,2]-=1
				
				}
			}
		
		
		
		//Abil Cooldowns
		//Broom
		if(Control.talentmapArray[4,1]>0){
			abilArray[1,2]=99999999999
		}else{
			//Scarecrow
			if(Control.talentmapArray[7,1]>0){
				abilArray[1,2]=400-(20*Control.talentmapArray[8,1])-(100*Control.talentmapArray[9,1])
				
				//Bird CD indicator
				if(!instance_exists(passivetwo)){
							passivetwo=instance_create_depth(x,y,depth+2,Abil)
							with(passivetwo){
								tick=0
								type=1
								pin=4
								sprite_index=abil_witch_spr
								depth=other.depth-1
								img=67
								imgcap=1
								imgsped=0
								image_speed=0
								image_index=img
								dur=500
								durtotal=dur
								phase=-1
								dir=Me.dir
								tick=0
							}	
				}else{
					with(passivetwo){
						dur=2
						
						
						if(tick==1){
						
								tick=2
								visible=false

						}else{
							if(tick==2){
								if(!instance_exists(other.passive)){
									if(other.abilArray[1,1]<=0){
										tick=0
										visible=true
									}	
								}
							}
						}
					
						if(Me.dir==1){
							dir=1
							x=Me.x-1
							y=Me.y+1
						}else{
							dir=-1
							x=Me.x+1
							y=Me.y+1			
						}
					}
				}
			}
		}
		
			if(!instance_exists(passive)){
				passive=noone
			}
		
		if(grounded==1){
			//Broom reset on land
			if(Control.talentmapArray[4,1]>0){
				abilArray[1,1]=0
			}
		}
		chance=instance_place(x+hsp,y+vsp,Abil)
		if(chance!=noone){
			if(chance.pin==3){
				if(vsp>0.5){
				vsp=0.5
				}
				if(vsp>-1){
					vsp-=0.32
				}
			}
		}
	}else{
#endregion
#region Pumpkin Class
		//____________________________________________________________________________---------------------(Pumpkin)---------------------____________________________________________________________________________	
		if(class==2){
			if(classcheck==1){
				classcheck=0
				hp=12
				hptotalback=hp	
				passive=0
				passivetwo=0
				passivethree=1
				passivefour=0
				abil1safety=0
				ghostpassive=0
				
				
				mespr=me_spr
				wep=0
				maskextra=0
					abilArray[0,2]=40
					abilArray[1,2]=240
					abilArray[2,2]=640

					//Passive
						//CD
						passivefourArray[1000,0]=0
						passivefourArray[1000,1]=15000
						//passivefourArray[1000,1]=200
						passivefourArray[0,3]=0
						
					//Shield passive Control.talentmapArray[16,1]
						talent=1
					//Shield small pumpkins Control.talentmapArray[18,1]
					
					//Small pumpkin duration + more movement on Q
						talentthree=1
					//Huge pumpkin slam weight
						talentfour=1
					//Sugar Rush
						talentfivecdcount=0
						talentfive=1
						talentfivecd=irandom_range(1000,3000)
						talentfivecdtotal=10000
						//talentfivecdtotal=1000
						talentfivetwo=0
						talentfivethree=0
						//sugar UI
						passivefourArray[1,0]=0
					
					//talenttwo=0
					//talentthree=0
					//talentfour=0
					//talentfive=0
					
					
			}
			
			if(abil1safety>0){
				abil1safety-=1
			}
			//W bouncing pumpkin invisibility while riding
			if(passive>0){
				passive-=1
				visible=false
				if(passive==0){
					visible=true
				}
			}
			//Passive Sugar Rush
			if(Control.talentmapArray[19,1]>0){
				if(talentfivecd>0){
					talentfivecd-=1
				}
					if(talentfivecd<=0){
								talentfivecd=talentfivecdtotal
							for(i=0;i<1;i+=1){
								//Sugar Rush Passive
								created=instance_create_depth(Control.midx+48,random_range(Control.mapyspot+48,Control.mapyspottotal-48),0,Abil)
								with(created){
									sndobjectone=instance_create_depth(x,y,0,Snd)
									with(sndobjectone){
										sndemitone=audio_emitter_create()				
										audio_play_sound_on(sndemitone,choose(snd_pumpkin_throw_all_1,snd_pumpkin_throw_all_2),false,8)
										audio_emitter_falloff(sndemitone, 48, Control.falloff_max, Control.falloff_factor)					
									}	
									//0=TRUE/False,1=Target,2=X,3=Y,4=Img,5=ImgCap,6=Amount,7=Delay,8=DelayAmount,9=Dur,10=hsp,11=vsp,12=DurExtra,13=XscaleYscale,14=XscaleMaxYscaleMax,15=ImgSped
									part_gen_scr(1,0,5,5,34,2,1,1,2,16,0,0,8,0.6,1,0)
									
									sprite_index=mask_pump_other_spr
									img=130+(choose(0,0,0,0,0,0,1,2,2,3)*3)
									img=130
									imgsped=0
									imgcap=3
									image_index=img
									image_speed=0
									imgangle=0
									dur=9999999
									en=0
									phase=1
									tick=0
									
									pin=17
									sped=0.5
									spedtwo=0.1
									range=260
									rangetwo=5
									attcd=320
									attcdtotal=attcd
									attcd=irandom_range(attcd*0.25,attcd)
									hsp=0
									vsp=0
									grav=0
									hittrigger=0
									hittriggertwo=0
									depth=other.depth+1
									
									
									dir=choose(1,-1)
									dir=-1
									if(dir==1){
										x-=range
									}else{
										x+=range
									}

									startx=x
									starty=y
								}
							}
					}

				hit=instance_place(x,y,Part)
				if(hit!=noone){
					if(hit.pin==2){
				
						if(talentfivetwo+passivefourArray[0,0]<10){
								with(hit){
									other.chance=image_index
									instance_destroy()
								}
							audio_play_sound(choose(snd_crab_fish_pickup_1,snd_crab_fish_pickup_2,snd_crab_fish_pickup_3),8,false)
							passivefourArray[0,0]+=1
							passivefourArray[passivefourArray[0,0],0]=30
							passivefourArray[passivefourArray[0,0],1]=1
							passivefourArray[passivefourArray[0,0],2]=chance
							
						}
					}
				}
			
			if(passivefourArray[0,0]>0){
				for(i=0;i<passivefourArray[0,0];i+=1){
					if(passivefourArray[i+1,0]>0){
						passivefourArray[i+1,0]-=1
						if(passivefourArray[i+1,0]<3){
							passivefourArray[0,1]=5
						}
					}else{
						if(passivefourArray[i+1,1]==1){
							talentfivetwo+=1
							//Actual passive timer
							passivefourArray[0,3]+=300
						}
						for(ii=i;ii<passivefourArray[0,0];ii+=1){
							if(ii<passivefourArray[0,0]-1){
								passivefourArray[ii+1,0]=passivefourArray[ii+2,0]
								passivefourArray[ii+1,1]=passivefourArray[ii+2,1]
							}else{
								passivefourArray[ii+1,0]=0
								passivefourArray[ii+1,1]=0
							}
						}
						passivefourArray[0,0]-=1
					}
				}
			}
			if(passivefourArray[0,1]>0){
				passivefourArray[0,1]-=1
			}
				//Sugar rush passive effect
				if(passivefourArray[0,3]>0){
					passivefourArray[0,3]-=1
							
							//Ghost
								if(talentfivethree==0){
									if(talentfivethree==0){
										talentfivethree=1
										
											chancetwo=0
											ghosttrigger=0
											ghostpassive=instance_create_depth(x,y,9,Abil)
											with(ghostpassive){
												dir=Me.dir
												if(dir==-1){
													xscale=-1
												}
												
												dmg=1
												attcdtwo=0
												attcd=0
												attacktrigger=0
												xtargetsave=0
												ytargetsave=0
												attack=0
												range=16
												xtarget=Me.x
												ytarget=Me.y	
												target=Me
												yspot=y
												tick=0
												pin=18
												en=0
												cd=60 
												vsp=0
												type=1
												creator=other.id
												image_speed=0
												dmg=2
												chance=dmg
												dmg+=dmg*(Control.invenArray[25,3]*0.01)
												dmg+=chance*(Control.invenArray[20,3]*0.01)
												sprite_index=mask_pump_other_spr
													if(other.chancetwo<3){
														img=208
														enopt=0
													}else{
														img=208
														enopt=1
													}
													img=214
													img=208
												image_index=img
												imgcap=3
												imgsave=208
												imgsped=0.08
												sped=0.5
												dur=3000
												durtotal=dur
												phase=1
												attacking=0
											}
									}
								}
							
							//abilArray[0,1]
							if(abilArray[1,1]>0){
								abilArray[1,1]-=1
							}
							if(abilArray[2,1]>0){
								abilArray[2,1]-=1
							}
								//Particle
								if(passivefourArray[0,3] mod 3==0){
									for(i=0;i<1;i+=1){
										if(instance_exists(ghostpassive)){
											created=instance_create_depth(ghostpassive.x-6+random(12),ghostpassive.y-6+random(12),0,Part)
											with(created){
													type=1
													pin=1
												depth=choose(6,10,10,10)
												spin=100
												img=18
												imgcap=2
												imgsped=0
												sprite_index=mask_pump_other_spr
												image_speed=0
												image_index=img+irandom(imgcap)
												dur=15+irandom(10)
												durtotal=dur
												hsp=random(0.2)*choose(1,-1)
												vsp=random(0.2)*choose(1,-1)
									
												grav=0.003
												gravtwo=0

												chance=random_range(0.7,0.85)
												xscale=chance
												yscale=chance
												phase=1
												speed=0
												mask_index=dummy_spr
												image_angle=random(360)
												imgangle=image_angle
											}	
										}else{
											talentfivethree=0
										}
									}
								}
					if(passivefourArray[0,3] mod 300== 0){
						talentfivetwo-=1
					}
				}
			}
			//Passive Shell Shield Armor
			if(Control.talentmapArray[16,1]>0){
				passivefourArray[1000,1]=15000-(Control.talentmapArray[17,1]*750)-(Control.talentmapArray[18,1]*3750)
				
				if(passivefourArray[1000,0]>0){
					passivefourArray[1000,0]-=1
				}else{
				
					if(hurttick==1){
						hurttick=0
						dmgrecieved=0
						immunetwo=20	
						if(Control.talentmapArray[18,1]>0){
							
							for(i=0;i<5;i+=1){
								temp=1
								
								created=instance_create_depth(x,y,0,Abil)
		
								with(created){
								sndobjectone=instance_create_depth(x,y,0,Snd)
								with(sndobjectone){
									sndemitone=audio_emitter_create()				
									audio_play_sound_on(sndemitone,choose(snd_pumpkin_throw_all_1,snd_pumpkin_throw_all_2),false,8)
									audio_emitter_falloff(sndemitone, 48, Control.falloff_max, Control.falloff_factor)					
								}	
									//0=TRUE/False,1=Target,2=X,3=Y,4=Img,5=ImgCap,6=Amount,7=Delay,8=DelayAmount,9=Dur,10=hsp,11=vsp,12=DurExtra,13=XscaleYscale,14=XscaleMaxYscaleMax,15=ImgSped
									part_gen_scr(1,0,5,5,34,2,1,1,2,16,0,0,8,0.6,1,0)
									hurtnum=0
									hurtArray[0]=0
								talent=1
								dmg=2
								dmg+=dmg*(Control.invenArray[25,3]*0.01)
								type=1
								pin=11
								diddmg=0
								move=0
								grav=0.03
								grav=0
								gravtwo=0.04
								gravtwo=0
								gravthree=0.01
								gravthree=0
								creator=other.id
								sprite_index=abil_spr
								depth=other.depth-1
								mask_index=mask_pump_spr
								img=9+choose(0,0,0,0,0,1,1,1,2,3)
								imgcap=0
								imgsped=0.1
								image_speed=0
								image_index=irandom_range(img,img+imgcap)
								if(other.i==1){
									dur=35+80
								}else{
									dur=30+80
								}
								durtotal=dur
								phase=1
								speed=0
								imgangle=random(360)
									chancethree=1
									chance=-0.4+(other.i*0.4)
									spinamt=1.5
									spin=choose(-0.2,0.2)
									if(other.i==0){
										if(other.temp==1||other.temp==2||other.temp==4||other.temp==5){
											spin=spinamt
										}else{
											spin=spinamt*-1
										}
										snd=snd_pumpkin_small_blast_1
									}else{
										if(other.i==2){
											if(other.temp==1||other.temp==2||other.temp==4||other.temp==5){
												spin=spinamt*-1
											}else{
												spin=spinamt
											}
											snd=snd_pumpkin_small_blast_2
										}else{
											snd=snd_pumpkin_small_blast_3
										}					
									}
									
									grav=0.1
									gravtwo=0.1
									if(other.i==0){
										hsp=0
										vsp=-2.8
										imgangle=180
									}else{
										if(other.i==1){
											hsp=2.1
											vsp=-2
											imgangle=180-39
										}else{
											if(other.i==2){
												hsp=-2.1
												vsp=-2
												imgangle=180+30
											}else{
												if(other.i==3){
													hsp=-1.7
													vsp=-2.4
													imgangle=180+30
												}else{
													if(other.i==4){
														hsp=1.7
														vsp=-2.4
														imgangle=180-39
													}else{
													
													}													
												}
											}										
										}										
									}
				//					imgangle=imgangle*other.dir

								}	
							}						
						}
						
						passivefourArray[1000,0]=passivefourArray[1000,1]
						passivefourArray[1000,0]=10
							
						if(passivetwo==0||!instance_exists(passivetwo)){
							audio_play_sound_at(choose(snd_pumpkin_armor_1,snd_pumpkin_armor_2,snd_pumpkin_armor_3),x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)

													//Shell
													for(i=0;i<5;i+=1){
														created=instance_create_depth(x,y-14,0,Part)
														with(created){
															type=2
															pin=1
															pintwo=1
															depth=other.depth+1
															spin=1
																img=34
																imgcap=4
															imgsped=0
															image_speed=0
															image_index=img+irandom(imgcap)
															dur=15+other.i*5
															speed=random_range(0.15,0.3)
															direction=random(360)
															durtotal=dur
															hsp=hspeed
															vsp=vspeed
															//hsp+=other.hsp
															//vsp+=other.vsp
															grav=0.04
															gravtwo=0.02
															grav=0.005
															gravtwo=0
															chance=1
															xscale=chance
															yscale=chance
															phase=1
															mask_index=mask_pump_part_spr
															speed=0
														}		
													}

						passivetwo=instance_create_depth(x,y,0,Abil)
							with(passivetwo){
								pin=16
								phase=1
								hsp=0
								vsp=0
								dur=100
								image_speed=0
								sprite_index=mask_pump_other_spr
								imgsped=0.35
								imgcap=9
								img=24
								image_index=img
								depth=5
								starty=14
							}	
						}
					}
				}
			}
		}else{
	#endregion
#region Bee Class
		//____________________________________________________________________________---------------------(Bee)---------------------____________________________________________________________________________	
		if(class==3){
			if(classcheck==1){
				classcheck=0
				hp=12
				hptotalback=hp	
				passive=0
				mespr=me_mask_bee_spr
				wep=2
				maskextra=1
				sndplaying=0
				beecd=0
					abilArray[0,2]=40
					abilArray[1,2]=80
					abilArray[2,2]=6000000
					passiveArray[20,1]=0
			
				for(a=0;a<10;a+=1){
					for(b=0;b<10;b+=1){
					passiveArray[a,b]=0
					}
				}
				passiveArray[2,5]=0
				passiveArray[2,10]=0
				passiveArray[2,11]=0
				passiveArray[20,0]=0
			
				//Center x
				passiveArray[10,0]=x
				//Center Y
				passiveArray[10,1]=y-29
				
				//Create small bee
				passiveArray[11,0]=0

					with(Abil){
						if(pin==23){
							instance_destroy()
						}
					}

					chance=0
					chancetwo=0
					chancethree=4
					chancefour=0
				
				for(i=0;i<10;i+=1){
				
					chance+=chancethree+2

						if(i==3){
							chance=2
							chancetwo+=chancethree*2
						}
						if(i==7){
							chance=chancethree
							chancetwo+=chancethree*2
						}

						if(i==1){
							chancefour=2.5
						}else{
							if(i==8){
								chancefour=-2.5
							}else{
								chancefour=0
							}
						}
				
					created=instance_create_depth(x+chance-15,y+chancefour-29+chancetwo,0,Abil)
					with(created){
						sndgen=0
						if(other.i==1){
							sndgen=1
							sndobjectone=instance_create_depth(x,y,0,Snd)
							with(sndobjectone){
								sndemitone=audio_emitter_create()		
							}
						}
						sndone=0
						sndtwo=0
						dmg=1
						dmg+=dmg*(Control.invenArray[25,3]*0.01)
							randomsped=random_range(0.001,0.01)
						tick=0
						ticksped=0.05+randomsped
						ticktwo=0
						tickx=0
						ticky=0
						sped=2
						spedsave=sped
						spedsavetwo=12
					
						if(other.i mod 2 ==0){
							tick=0
							ticktwo=0
						}else{
							tick=1
							ticktwo=1			
						}
						if(other.i==0){
							rangex=3
							rangey=3
						}else{
							rangex=0
							rangey=0					
						}
							rangex=irandom_range(2,5)
							rangey=irandom_range(2,5)
							tick=choose(0,1)
							ticktwo=choose(0,1)
					
					xspot=x
					yspot=y
					type=1
					pin=23
					move=1
					diddmg=0
					creator=other.id
					sprite_index=abil_spr
					depth=other.depth-1
					img=25
					imgcap=3
					imgsped=0.2
					image_speed=0
					image_index=irandom_range(img,img+imgcap)
					dur=9000
					durtotal=dur
					phase=1
					targetx=other.x
					targety=other.y
					xpos=other.x-x
					ypos=other.y-y-29
					num=other.i
						lastx=x
						lasty=y
					if(num==5){
						
					}
					
					hsp=0
					vsp=0
					attcd=0
					
					}				
				}

			}
			

			//Cooldowns
			if(Control.talentmapArray[4,1]>0){
				abilArray[1,2]=80
			}else{
				if(Control.talentmapArray[7,1]>0){
					abilArray[1,2]=350
				}
			}
			//Hover
			if(Control.talentmapArray[10,1]>0){
				abilArray[2,2]=6000000
			}else{
				//Shield
				if(Control.talentmapArray[13,1]>0){
					abilArray[2,2]=960
					abilArray[2,2]-=abilArray[2,2]*(Control.talentmapArray[14,1]*0.05)
				}
			}
			

//Honey Heal
hit=instance_place(x,y+2,Abil)
if(hit!=noone){
	if(hit.pin==21){
		if(hit.pintwo==2){
			//hurttick=1
			//dmgrecieved+=1
			//CD
			if(Control.talentmapArray[20,1]>0){
				//Part effect
				passiveArray[20,1]=90
			}
			if(Control.talentmapArray[23,1]>0){
				if(passiveArray[20,0]<120){
					passiveArray[20,0]+=1
				}else{
					passiveArray[20,0]=0
				}
				if(passiveArray[20,0]==119){
				
						healtick=1
						
						audio_play_sound_at(choose(snd_bee_heal_1,snd_bee_heal_2,snd_bee_heal_3),x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
						healrecieved+=0.01*(Control.talentmapArray[23,1])
						
					for(i=0;i<4;i+=1){
							created=instance_create_depth(x-2+random(4),y-2.5+random(5),0,Part)
						with(created){
							pin=1
							type=1
							depth=other.depth-1
							spin=1
							img=103
							img+=choose(0,1,2,3)
							if(choose(0,1)==0){
								//depth=Me.depth+1
							}
							img+=3
							sprite_index=mask_bee_spr
					
							imgcap=1
							imgsped=0
							image_speed=0
							image_index=irandom_range(img,img+imgcap)
							dur=5+choose(0,0,0,1,1,2)+irandom(13)+13
							durtotal=dur
							hsp=random_range(-0.3,0.3)
							vsp=random_range(-0.3,0.3)
							grav=0
							image_angle-=15
							image_angle+=random(30)
								chance=random_range(0.6,1)
								chance=1
								xscale=chance
								yscale=chance

							}		
						}
				
				}
				//Honey effect for attack
				//Part effect
				passiveArray[20,1]=90		
			}
		}
	}
}
		//Honey effect for attack
		if(passiveArray[20,1]>0){
				//Honey Particle
				if(passiveArray[20,1] mod 5 ==0){
					for(i=0;i<1;i+=1){
							created=instance_create_depth(x-4+random(8),y-6+random(12),0,Part)
						with(created){
							pin=1
							type=1
							depth=other.depth-1
							spin=1
							img=103
							img+=choose(0,1,2)
							sprite_index=mask_bee_spr
					
							imgcap=1
							imgsped=0
							image_speed=0
							image_index=irandom_range(img,img+imgcap)
							dur=7+choose(0,0,0,1,1,2)+irandom(3)
							durtotal=dur
							hsp=0
							vsp=random_range(0.5,1)
							grav=0.1
							image_angle-=15
							image_angle+=random(30)
								chance=random_range(0.6,1)
								chance=1
								xscale=chance
								yscale=chance

							}		
						}					
					}
					passiveArray[20,1]-=1
		}else{
		
		}

if(Control.talentmapArray[23,1]>0){
	if(irandom(99)<=(Control.talentmapArray[23,1]*20)){
		if(hurttick>0){

					//larger honey
					for(i=0;i<1;i+=1){
								
						created=instance_create_depth(x,y-3,0,Part)
							with(created){
								type=2
								pintwo=1
								pin=1
								phase=101
								depth=other.depth-1
								spin=1
								img=37
								sprite_index=mask_bee_spr
					
								imgcap=3
								imgsped=0
								image_speed=0
								image_index=irandom_range(img,img+imgcap)
								dur=50+choose(0,0,0,1,1,2)+irandom(15)
								durtotal=dur
									hsp=random_range(-0.6,0.6)
									vsp=random_range(-1,-2)
									vsp=-1
									hsp=0
									grav=0.1
									image_angle=0

								}		
						}	
		}
	}
}


#region Attack
		//Attack glob
		if(passiveArray[2,0]==1){	
				if(passiveArray[2,10]!=0){
					if(instance_exists(passiveArray[2,10])){
						if(passiveArray[2,11] mod 45 == 0){
							chance=1
							chance+=chance*(Control.talentmapArray[5,1]*0.05)
							chance+=chance*(Control.invenArray[25,3]*0.01)
							passiveArray[2,10].hurttick=1
							passiveArray[2,10].dmgrecieved+=chance
								with(passiveArray[2,10]){
										if(Control.talentmapArray[6,1]>0){
											//poison effect
												effectArray[0,0]=effectArray[0,1]*6
														
												if(effectArray[0,3]<3+Control.talentmapArray[18,1]){
													effectArray[0,3]+=1
												}
										}	
								}
							Me.damagedone+=passiveArray[2,10].dmgrecieved
						}
						passiveArray[2,11]+=1
					}else{
						passiveArray[2,10]=0
						with(Abil){
							if(pin==21&&pintwo!=1){
								dur=0
								phase=0
							}
						}				
					}
				}
		
		}
#endregion
#region Hover
		//Swarm CD
		if(Control.talentmapArray[10,1]>0){
			if(grounded==1){
				abilArray[2,1]=0
			}
		}
		//Hover
		if(passiveArray[2,0]==2){
			with(Abil){
				if(pin==23){
					if(sndgen==1){
						if(Me.sndplaying==1){
							Me.sndplaying=0
							with(sndobjectone){
								if(!audio_emitter_exists(sndemitone)){
									sndemitone=audio_emitter_create()
								}
												//choose(snd_bee_swarm_2,snd_bee_swarm_3)
								audio_play_sound_on(sndemitone,choose(snd_bee_swarm_3),false,8)
								audio_emitter_falloff(sndemitone, 48, Control.falloff_max, Control.falloff_factor)		
							}
						}
					}	
				}
			}
			if(passiveArray[2,3]==1&&passiveArray[2,4]==1){
				chance=0
			hit=instance_place(x,y,Abil)
			chance=0
				if(hit!=noone){
					if(hit.pin==23){
						chance=1
					}
				}
				if(chance==1){
					passiveArray[2,5]=1
					passiveArray[1,1]=x
					passiveArray[1,2]=y+8
					passiveArray[2,0]=3
					passiveArray[2,6]=0
					passiveArray[2,7]=0
					//Duration
					
					//passiveArray[2,9]=120
					passiveArray[2,9]=25+(40*Control.talentmapArray[11,1])
					passiveArray[2,11]=x
					passiveArray[2,12]=y
				}
			}
		}
		//Hover
		if(passiveArray[2,5]==1&&passiveArray[2,0]==3){
			if(passiveArray[2,9]>0){
				passiveArray[2,9]-=1
			}else{
				passiveArray[2,5]=0
				passiveArray[2,0]=0		
				abilArray[2,4]=3
			}
		
			hit=instance_place(x,y,Abil)
			chance=0
			if(x>=passiveArray[2,11]-5&&x<=passiveArray[2,11]+5){
					chance=1
					if(passiveArray[2,6]==0){
						if(y>passiveArray[1,2]-8-3){
							vsp=-0.35
						}else{
							passiveArray[2,6]=1
						}
					}else{
						if(y<passiveArray[1,2]-8+3){
							vsp=-0.25
						}else{
							passiveArray[2,6]=0
						}
					}
				
				/*
					if(global.con_h_right||global.conp_h_right||global.con_h_left||global.conp_h_left){
						passiveArray[2,11]+=x+hsp
					}

					
					/*
					if(vsp>0.5){
						vsp=-0.3			
					}else{
						if(vsp>-1){
							vsp-=0.3
						}
					}
					*/
				if(Control.talentmapArray[10,1]>0){
					if(global.con_p_space){
						if(jumps==0){
							vsp=-5
						}
						passiveArray[2,5]=0
						passiveArray[2,0]=0
						abilArray[2,4]=3
					}
				}
				
			}
				if(chance==0){
					vsp=-3.5
					abilArray[2,4]=3
					passiveArray[2,5]=0
					if(Control.talentmapArray[10,1]>0){
						passiveArray[2,0]=0		
					}
				}
		
		}
		//Hover
		if(passiveArray[2,0]==4){
			with(Abil){
				if(pin==23){
					if(sndgen==1){
						if(Me.sndplaying==1){
							Me.sndplaying=0
							with(sndobjectone){
								if(!audio_emitter_exists(sndemitone)){
									sndemitone=audio_emitter_create()
								}
												//choose(snd_bee_swarm_2,snd_bee_swarm_3)
								audio_play_sound_on(sndemitone,choose(snd_bee_swarm_3),false,8)
								audio_emitter_falloff(sndemitone, 48, Control.falloff_max, Control.falloff_factor)		
							}
						}
					}	
				}
			}
			if(passiveArray[2,3]==1&&passiveArray[2,4]==1){
				chance=0
			hit=instance_place(x,y,Abil)
			chance=0
				if(hit!=noone){
					if(hit.pin==23){
						chance=1
					}
				}
				if(chance==1){
					passiveArray[2,5]=1
					passiveArray[1,1]=x
					passiveArray[1,2]=y+8
					passiveArray[2,0]=5
					passiveArray[2,6]=0
					passiveArray[2,7]=0
					//Duration
					passiveArray[2,9]=120
					passiveArray[2,11]=x
					passiveArray[2,12]=y
				}
			}
		}else{
			
			//Shield Pop
			if(passiveArray[2,0]==5){
				passiveArray[2,5]=1
				
				//Duration
				if(passiveArray[2,50]>0){
					passiveArray[2,50]-=1
				}else{
					passiveArray[2,0]=0
						passiveArray[2,5]=0
						passiveArray[2,0]=0
						//disabled cd
						//abilArray[2,4]=3
						
				}
				if(beecd>0){
					beecd-=1
				}
				
					if(hurttick==1){
						
						if(beecd<=0&&Control.talentmapArray[15,1]>0){
							beecd=100
							for(i=0;i<5;i+=1){
							//Small bee
								created=instance_create_depth(x-2+irandom(4),y-2+irandom(4),0,Abil)
								with(created){
										poison=0
										diddmg=0
										dmg=1
					
										dmg+=dmg*(Control.invenArray[25,3]*0.01)
								
										type=0
										pin=21
										pintwo=1
										pinthree=1
										xoffset=random_range(-6,6)
										yoffset=random_range(-8,4)
										
										
										phase=1
										en=0
										creator=other.id
										imgsped=0.2
											img=25
											temp=1
											tick=0
											range=16
											ticktwo=0
											startx=x
											starty=y
		
										imgcap=1
										sprite_index=abil_spr
										image_index=img
										depth=Me.depth+1
										image_speed=0
										dur=500+irandom(200)
										dur+=(dur*(Control.talentmapArray[8,1]*0.1))
										durtotal=dur
										sped=0.01
										attcd=50
										phasetwo=0
										tick=choose(0,1)
										ticktwo=choose(0,1)
										sped=0.02+choose(-0.002,-0.004,-0.006,0.002,0.004,0.006)
										spedtwo=0.3+choose(0.03,0.015,0,-0.015,-0.03)
										
										sped+=0.6
										spedtwo+=0.6
										
										durextra=irandom(20)
								
										xspot=random_range(-3,3)
										yspot=random_range(-3,3)
										tick=choose(0,1)
								}	
							}
						}
						
						hurttick=0
						dmgrecieved=0
						immunetwo=20	
						audio_play_sound_at(choose(snd_pumpkin_armor_1,snd_pumpkin_armor_2,snd_pumpkin_armor_3),x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)

													//Shell
													for(i=0;i<5;i+=1){
														created=instance_create_depth(x,y,0,Part)
														with(created){
															type=2
															pin=1
															pintwo=1
															depth=other.depth-2
															spin=1
																img=34
																imgcap=4
															imgsped=0
															image_speed=0
															image_index=img+irandom(imgcap)
															dur=15+other.i*5
															speed=random_range(0.3,0.45)
															direction=random(360)
															durtotal=dur
															hsp=hspeed
															vsp=vspeed
															//hsp+=other.hsp
															//vsp+=other.vsp
															grav=0.04
															gravtwo=0.02
															grav=0.005
															gravtwo=0
															chance=1
															xscale=chance
															yscale=chance
															phase=1
															mask_index=mask_pump_part_spr
															speed=0
														}		
													}
					}
						
						passivefourArray[1000,0]=passivefourArray[1000,1]
						passivefourArray[1000,0]=10
							
						if(passivetwo==0||!instance_exists(passivetwo)){

						//Bee Shield
						passivetwo=instance_create_depth(x,y,0,Abil)
							with(passivetwo){
								pin=16
								phase=1
								hsp=0
								vsp=0
								dur=100
								image_speed=0
								sprite_index=mask_bee_spr
								imgsped=0.35
								imgcap=9
								
								img=50+Control.talentmapArray[15,1]*10
								image_index=img
								depth=other-1
								starty=-2
							}	
						}	
			
			}
		}

#endregion
#region To Location
	if(passiveArray[2,0]==0){
		passiveArray[1,1]=x
		passiveArray[1,2]=y-25
	}else{
		if(passiveArray[2,0]==1){
			if(instance_exists(passiveArray[2,1])){
				passiveArray[1,1]=passiveArray[2,1].x
				passiveArray[1,2]=passiveArray[2,1].y+8
			}else{
				passiveArray[2,0]=0
			}
		}else{
			if(passiveArray[2,0]==2||passiveArray[2,0]==4||passiveArray[2,0]==5){
				passiveArray[1,1]=passiveArray[2,1].x
				passiveArray[1,2]=passiveArray[2,1].y+12+4
				passiveArray[2,11]=x
				passiveArray[2,12]=y
			}
		}
	}
#endregion
		
			if(passiveArray[0,1]>0){
				if(passiveArray[0,1] mod 4 ==0){
					xpos=x
					ypos=y+2+1
					if(choose(0,1)==0){
						if(passiveArray[0,2]==1){
						ypos-=2
						}				
					}else{
						if(passiveArray[0,2]==1){
						ypos-=2
						}
					}
					abil_create_scr(0)
					passiveArray[0,2]+=1
				}
				passiveArray[0,1]-=1
			}else{
				passiveArray[0,2]=0
			}

		}else{
	#endregion
#region Burger Class
		//____________________________________________________________________________---------------------(Burger)---------------------____________________________________________________________________________	
		if(class==4){
			//audio_play_sound(choose(snd_burger_passive_collect_1,snd_burger_passive_collect_2),8,false)
			if(classcheck==1){
				classcheck=0
				hp=16
				hptotalback=hp	
				passive=0
				passivetwo=0
				passivethree=0
				passivefour=0
				mespr=me_mask_burger_spr
				mespr=me_spr
				wep=3
				maskextra=0
				passivetimer=0
				jumpafter=1
					abilArray[0,2]=60
					abilArray[1,2]=480
					abilArray[2,2]=2000
				
					passivefourArray[0,0]=0
					
					//Target
					passivefourArray[100,0]=Me
					passivefourArray[100,1]=0
					
						passivefourArray[100,10]=0
					
					passiveArray[0,1]=0
					
			}
			
			
			if(Control.talentmapArray[19,1]>0){
				if(jumpafter<1){
					jumpafter-=1
				}
				if(jumps==0){
					if(jumpafter==1){
						if(global.con_p_space||global.conp_p_space){
							jumpafter=0
								vsp-=1
								created=instance_create_depth(Me.x,Me.y,0,Abil)
							with(created){
									diddmg=0
									version=0
									dmg=3
									isfry=0
			
									dmg+=dmg*(Control.talentmapArray[2,1]*0.05)
									dmg+=dmg*(Control.talentmapArray[3,1]*0.25)
									dmg+=dmg*(Control.invenArray[25,3]*0.01)	

									type=0
									pin=28
									isfry=0
									en=0
									creator=other.id
									imgsped=0
									imgangle=0
										img=70
										
										temp=1
										move=0
										pintwo=3

									if(Me.passivethree>0){
										version=1
										img+=3
										dmg=4
									}

									imgcap=2
									sprite_index=abil_burger_two_spr
									image_index=img
									depth=Me.depth+1
									image_speed=0
									dur=120+irandom(35)
									dur+=100

									durtotal=dur
									grav=0.1
									gravtwo=0.05
							
									dir=other.dir

									bounce=50
									chance=-1
	
									timer=28+irandom(20)
						
								thro=5
								tomtype=5
								image_index=img
								grav=random_range(0.07,0.12)
								sped=random_range(2.5,3)			
			
								hsp=0
								vsp=1.5	
								hsp=hsp*Me.dir*-1						

								timer=0
							}		
						}
					}
				}
				if(grounded==1){
					if(jumpafter<=-40){
						jumpafter=1
					}
				}
			}
			
			
			//CD for W ketchup
			if(Control.talentmapArray[10,1]>0){	
				abilArray[2,2]=2000
			}else{
				if(Control.talentmapArray[13,1]>0){	
					abilArray[2,2]=1000
				}else{
				
				}
			}

			//Target 
			if(!instance_exists(passivefourArray[100,0])||passivefourArray[100,1]<=0){
				passivefourArray[100,0]=Me
			}
			if(passivefourArray[100,1]>0){
				passivefourArray[100,1]-=1
			}
	
			//Kids meal passive
			if(Control.talentmapArray[16,1]>0){	
			//Meal
			hit=instance_place(x,y,Part)
			if(hit!=noone){
				if(hit.pin==2){
					if(hit.type==3){
						audio_play_sound(choose(snd_burger_passive_collect_1,snd_burger_passive_collect_2),8,false)
					}
				}
			}
			
			
			if(passivefourArray[0,0]>0){
				for(i=0;i<passivefourArray[0,0];i+=1){
					if(passivefourArray[i+1,0]>0){
						passivefourArray[i+1,0]-=1
						if(passivefourArray[i+1,0]<3){
							passivefourArray[0,1]=5
						}
					}else{
						for(ii=i;ii<passivefourArray[0,0];ii+=1){
							if(ii<passivefourArray[0,0]-1){
								passivefourArray[ii+1,0]=passivefourArray[ii+2,0]
								passivefourArray[ii+1,1]=passivefourArray[ii+2,1]
							}else{
								passivefourArray[ii+1,0]=0
								passivefourArray[ii+1,1]=0
							}
						}
					
						passivefour+=1
						passivefourArray[0,0]-=1
					}
				}
			}
			if(passivefourArray[0,1]>0){
				passivefourArray[0,1]-=1
			}
			
			
			passivetimer+=1
			chance=251-(Control.talentmapArray[17,1]*20)
			if(passivetimer==301){
				passivetimer=0
					with(Control){
					
						chance=mapxspot+16+irandom(mapxspottotal-16-mapxspot)
						chancetwo=mapyspot+16+irandom(mapyspottotal-16-mapyspot)
						created=instance_create_depth(chance,chancetwo,0,Part)
						with(created){
							pin=2
							type=3
							tick=0
							ticktwo=0
							sprite_index=abil_burger_spr
							depth=other.depth+1
							spin=0
							img=22+choose(0,1,2)
							imgcap=0
							imgsped=0
							image_speed=0
							image_index=img
							dur=1000
							durtotal=dur
							hsp=0
							vsp=0
							grav=0
							tick=0
							while(instance_place(x,y,Block)){
								x=other.mapxspot+16+irandom(other.mapxspottotal-16-other.mapxspot)
								y=other.mapyspot+16+irandom(other.mapyspottotal-16-other.mapyspot)						
							}
							starty=y
						
						}	
					}
			}
			if(passivefour>=8){
				passivefour-=8
					with(Control){		
						chance=mapxspot+16+irandom(mapxspottotal-16-mapxspot)
						chancetwo=mapyspot+16+irandom(mapyspottotal-16-mapyspot)
						created=instance_create_depth(chance,chancetwo,10,Enemy)
						with(created){
							pin=300
							sprite_index=enemy_three_spr
								img=225
								image_index=img
							phase=1
							while(instance_place(x,y,Block)||abs(x-Me.x)<20){
								x=other.mapxspot+16+irandom(other.mapxspottotal-16-other.mapxspot)
								y=other.mapyspot+16+irandom(other.mapyspottotal-16-other.mapyspot)						
							}
						}
					for(i=0;i<5;i+=1){
								chance=irandom(360)
								for(ii=0;ii<10;ii+=1){
									created=instance_create_depth(x-4+random(8),y-4+random(8),0,Part)
									with(created){
										type=1
										pin=1
										depth=other.depth-1
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
					playerhurt=0
					}			
			}
			}
			//Burger Dash Invis
			if(passive>0){
				passive-=1
				visible=false
				if(passive==0){
					visible=true
				}
			}
#region Ketchup Affect
	if(passivethree>0){
	passivethree-=1
			if(passivetimer mod 5 ==0){
				for(i=0;i<1;i+=1){
						created=instance_create_depth(x-4+random(8),y-6+random(12),0,Part)
					with(created){
						pin=1
						type=1
						depth=other.depth-1
						spin=1
						img=34
					
						imgcap=1
						imgsped=0
						image_speed=0
						image_index=irandom_range(img,img+imgcap)
						dur=7+choose(0,0,0,1,1,2)+irandom(3)
						durtotal=dur
						hsp=0
						vsp=random_range(0.5,1)
						grav=0.1
						image_angle-=15
						image_angle+=random(30)
							chance=random_range(0.6,1)
							chance=1
							xscale=chance
							yscale=chance

						}		
					}	
				}
	}
	if(grounded==1){
		chance=instance_place(x,y+1,Block)
		if(chance!=noone){
			if(chance.type==1){
				passivethree=120
				if(abilArray[0,1]>1){
				abilArray[0,1]-=1
				}
				if(abilArray[1,1]>1){
				abilArray[1,1]-=1
				}
					if(abilArray[2,1]>1){
						abilArray[2,1]-=1
					}
			}
		}
	}
#endregion
		}else{
	#endregion
#region Crab Class
	//____________________________________________________________________________---------------------(Crab)---------------------____________________________________________________________________________	
	if(class==5){
		if(classcheck==1){
			passivethree=2
			passivefour=0
			classcheck=0
			hp=12
			hptotalback=hp
			mespr=me_mask_pirate_spr
			wep=0
			maskextra=0
			passivetimer=0
			passivetimertwo=0
			bubbleshield=noone
			
				abilArray[0,2]=40
				abilArray[1,2]=500-(Control.talentmapArray[5,1]*25)
				abilArray[2,2]=500-(Control.talentmapArray[11,1]*25)
				
							temp=1
						passivefourArray[0,0]=0
						passivefourArray[0,1]=0
						passivefourArray[0,2]=0
						passivefourArray[0,3]=0
			passivetwo=instance_create_depth(x,y,0,Abil)
			with(passivetwo){
					diddmg=0
					dmg=4
					dmg+=dmg*(Control.invenArray[25,3]*0.01)
					Me.passive=0
					nodestroy=1
				type=0
				pin=43
				en=0
				creator=other.id
				imgsped=0.05
						img=1+(Me.passive*3)
					temp=1
					attcd=0
		
				imgcap=2
				sprite_index=abil_crab_spr
				image_index=img
				depth=Me.depth+1
				image_speed=0
				dur=150
				durtotal=dur
					fishbarrel=instance_create_depth(x,y,0,Abil)
					with(fishbarrel){
						img=141
						pin=45
						imgcap=0
						imgsped=0
						sprite_index=abil_crab_spr
						image_index=img
						depth=Me.depth		
						dur=150
						durtotal=dur
						phase=-1
						nodestroy=1
					}	
					box=instance_create_depth(x,y,0,Abil)
					with(box){
						img=71+(Me.passive)
						pin=45
						imgcap=0
						imgsped=0
						sprite_index=abil_crab_spr
						image_index=img
						depth=Me.depth+1		
						dur=150
						durtotal=dur
						phase=-1
					}
					
			}	
					//Shark x
					passivefourArray[100,0]=180
					//Shark x tick
					passivefourArray[100,1]=0
					//Shark img
					passivefourArray[100,2]=0
					//Shark xscale flip
					passivefourArray[100,3]=0
						/*
					beebee=instance_create_depth(x,y,0,Abil)
					with(beebee){
						img=140
						//img=144
						pin=0
						imgcap=0
						imgsped=0.13
						imgsped=0.07
						image_speed=0
						imgcap=3
						sprite_index=enemy_spr
						image_index=img
						depth=Me.depth		
						dur=150
						durtotal=dur
						phase=-1
						nodestroy=1
						sped=0.5
					}	
					*/
		}
		
		if(Control.talentmapArray[11,1]>0){
			abilArray[2,2]=500-(Control.talentmapArray[11,1]*25)
		}
				//passive=2
				//passivefour=11
				/*
				with(beebee){
					if(x<Me.x-sped*2){
						x+=sped
						dir=1
					}else{
						if(x>Me.x+sped*2){
							x-=sped
							dir=-1
						}else{
					
						}					
					}
					if(y<Me.y-32-sped*2){
						y+=sped
					}else{
						if(y>Me.y-32+sped*2){
							y-=sped
						}else{
					
						}					
					}
				}
				*/
#region Fish passive
				if(passivefour>10&&passive<2){
					passivefour-=10
					passivefourArray[0,2]=60
					passivefourArray[0,3]=0
					if(passive<2){
						passive+=1
					}
				}else{
					
					if(Control.talentmapArray[19,1]>0){
						
						//SHARK
						//Swim
						if(passivefourArray[100,1]==0){
							if(passivefourArray[100,0]>0){
								passivefourArray[100,0]-=1
							}else{
								passivefourArray[100,1]=1
								passivefourArray[100,3]=1
							}
						}else{
							if(passivefourArray[100,0]<360){
								passivefourArray[100,0]+=1
							}else{
								passivefourArray[100,1]=0
								passivefourArray[100,3]=0
							}					
						}
						//Shark img
						if(passivefourArray[100,0] mod 40==0){
							if(passivefourArray[100,2]==0){
								passivefourArray[100,2]=1
							}else{
								passivefourArray[100,2]=0
							}
						}
					}
				}
				
				

					if(hurttick>0){
						
						if(instance_exists(bubbleshield)){
							passivetimertwo=0
							with(bubbleshield){
								
								audio_play_sound_at(choose(snd_crab_bubble_pop_1,snd_crab_bubble_pop_2),x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
								chance=irandom(360)
								for(i=0;i<10;i+=1){
									created=instance_create_depth(x-2+random(4),y-1.5+random(3),0,Part)
									with(created){
									type=1
									pin=1
									sprite_index=abil_crab_spr
									depth=other.depth+1
									spin=1
										if(irandom(2)==0){
											img=32+choose(0,0,1)
											vsp=-random_range(0.03,0.09)*1.8
										}else{
											img=29+irandom(2)
											vsp=random_range(0.09,0.15)*1.8
										}
									imgcap=1
									imgsped=0
									image_speed=0
									image_index=img
									dur=12+choose(0,0,0,1,1,2)+irandom(20)
									durtotal=dur
									chance=random_range(0.7,1)
									xscale=chance
									yscale=chance
									hsp=(0-0.25+other.i*0.05)*1.5
									}		
								}									
								
								instance_destroy()
							}
						}else{
							
						if(passive>0||passivefour>0){
							chance=0
							chancetwo=0
							chancethree=0
							if(passive>0){
								passive-=1
								chance=10
								chancethree=3
							}else{
								if(passivefour>6){
									chancethree=3
								}else{
									if(passivefour>4){
										chancethree=2
									}else{
										if(passivefour>2){
											chancethree=1
										}
									}
								}
								chance=passivefour
								passivefour=0
							}
										for(i=0;i<chancethree;i+=1){
												created=instance_create_depth(x,y-14,0,Part)
												with(created){
													pin=2
													type=3
													tick=0
													ticktwo=0
													spin=10
													sprite_index=abil_crab_spr
													depth=other.depth+1
													img=53+choose(0)
													imgcap=0
													imgsped=0
													image_speed=0
													image_index=img
													dur=1000
													durtotal=dur
													if(other.chancethree==3){
														hsp=0-0.9+other.i*0.9
													}else{
														hsp=choose(0-0.9,0.9)
													}
													hsp-=0.1+random(0.2)
										
													vsp=-2
													if(other.i==1){
														vsp-=0.55
													}
													grav=0.08
													gravtwo=0.01
													tick=0
													starty=y
													imgangle=random_range(-30,30)
													image_angle=random(360)
													if(other.dir==1){
														dir=1
										
													}else{
														dir=-1
														xscale=-1
													}
									
												}	
										
										}						
								passivefourArray[0,2]=30
								passivefourArray[0,3]=1
							for(i=0;i<chance;i+=1){
								passivefourArray[0,0]+=1
								passivefourArray[passivefourArray[0,0],0]=30+i*3
								passivefourArray[passivefourArray[0,0],1]=2
							}
						}
					}
				}

	
		hit=instance_place(x,y,Part)
		if(hit!=noone){
			if(hit.pin==2){
				
				if(passive<2||passivefour<11){
					if(Control.talentmapArray[19,1]>0||passive<2||passive==2&&passivefour<9){
						with(hit){
							instance_destroy()
						}
						audio_play_sound(choose(snd_crab_fish_pickup_1,snd_crab_fish_pickup_2,snd_crab_fish_pickup_3),8,false)
						passivefourArray[0,0]+=1
						passivefourArray[passivefourArray[0,0],0]=30
						passivefourArray[passivefourArray[0,0],1]=1
					}
				}
			}
		}
			if(passivefourArray[0,2]>0){
				passivefourArray[0,2]-=1
			}
			if(passivefourArray[0,0]>0){
				for(i=0;i<passivefourArray[0,0];i+=1){
					if(passivefourArray[i+1,0]>0){
						passivefourArray[i+1,0]-=1
						if(passivefourArray[i+1,0]<3){
							passivefourArray[0,1]=5
						}
					}else{
						if(passivefourArray[i+1,1]==1){
							passivefour+=1
						}
						for(ii=i;ii<passivefourArray[0,0];ii+=1){
							if(ii<passivefourArray[0,0]-1){
								passivefourArray[ii+1,0]=passivefourArray[ii+2,0]
								passivefourArray[ii+1,1]=passivefourArray[ii+2,1]
							}else{
								passivefourArray[ii+1,0]=0
								passivefourArray[ii+1,1]=0
							}
						}
						passivefourArray[0,0]-=1
					}
				}
			}
			if(passivefourArray[0,1]>0){
				passivefourArray[0,1]-=1
			}
#endregion
		with(passivetwo){
			dur=2
		
		
#region Crab

#endregion
		}
#region Bubbles
		if(Control.talentmapArray[16,1]>0){
			passivetimer+=1
			if(passivetimer==326-(Control.talentmapArray[17,1]*35)){
				audio_play_sound_at(choose(snd_crab_bubble_1,snd_crab_bubble_2,snd_crab_bubble_3,snd_crab_bubble_4),x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
				passivetimer=0
				passivetwo.attcd=1
				if(passivetimertwo<5){
					passivetimertwo+=1
					
				}
			}
				//Bubble Shield
				if(Control.talentmapArray[18,1]>0){
					if(passivetimertwo>=5&&passivetimertwo<100){
						passivetimertwo=100
						
						if(!instance_exists(bubbleshield)){
						
							bubbleshield=instance_create_depth(x,y,0,Abil)
							with(bubbleshield){
								img=164
								pin=44
								phase=-1
								imgcap=3
								imgsped=0.04
								sprite_index=abil_crab_spr
								image_index=img
								image_speed=0
								depth=Me.depth-1		
								dur=150
								durtotal=dur
								phase=-1
								tick=0
								ypos=0
								lastx=x
								lasty=y
								sped=1.9
								ypostwo=y
								speed=0
							}	
						}
					}
					
					if(passivetimertwo>=100){
						if(instance_exists(bubbleshield)){
							with(bubbleshield){
								
								if(tick==0){
									if(ypos>-1){
										ypos-=0.02
									}else{
										tick=1
									}
								}else{
									if(ypos<1){
										ypos+=0.02
									}else{
										tick=0
									}								
								}

								dur=150

							}	
						}else{
							bubbleshield=noone
							passivetimertwo=0
						}	
					}
				}
		}
#endregion

	}else{
#endregion

#region Super Class
	//____________________________________________________________________________---------------------(Super)---------------------____________________________________________________________________________	
	if(class==6){
		if(classcheck==1){
			//In use for punch momentum
			passivethree=1
			passivefour=0
			classcheck=0
			hp=12
			hptotalback=hp
			mespr=me_mask_super_spr
			wep=0
			maskextra=0
			
			//In use for glide particles
			passivetimer=0
			
				abilArray[0,2]=35
				abilArray[1,2]=340
				abilArray[2,2]=900
				
				
							temp=1
						passivefourArray[0,0]=0
						passivefourArray[0,1]=0
						passivefourArray[0,2]=0
						passivefourArray[0,3]=0
						
						//Float
						passivefourArray[1,0]=0
						//Bacon create
						passivefourArray[1,1]=0
						//Pancake Bacon flight time
						passivefourArray[1,2]=0
						//CAP
						passivefourArray[1,3]=100
						
						//BB Overall
						passivefourArray[1,10]=0
						//Item 1
						passivefourArray[1,11]=0
						//Item 1 tick
						passivefourArray[1,12]=0	
						//Item 2
						passivefourArray[1,13]=0						
						//Item 2 tick
						passivefourArray[1,14]=0	
						//Item 3
						passivefourArray[1,15]=0						
						//Item 3 tick
						passivefourArray[1,16]=0	
						//Sped amount
						passivefourArray[1,20]=0

					passivefourArray[100,0]=180
					passivefourArray[100,1]=0
					passivefourArray[100,2]=0
					passivefourArray[100,3]=0
					
					
		}
		passivefourArray[1,20]=spedsave
		
		//Balanced Breakfast
		if(Control.talentmapArray[19,1]>0){
			//Milk
			passivefourArray[1,11]=0
			//Douhnut
			if(Control.talentmapArray[4,1]>0){
				passivefourArray[1,13]=1
			}else{
				//Toaster
				if(Control.talentmapArray[7,1]>0){
					passivefourArray[1,13]=2
				}else{
					passivefourArray[1,13]=0
				}
			}
		
			//Waffle
			if(Control.talentmapArray[10,1]>0){
				passivefourArray[1,15]=1
			}else{
				//Cereal
				if(Control.talentmapArray[13,1]>0){
					passivefourArray[1,15]=2
				}else{
					passivefourArray[1,15]=0
				}
			}
			
			//Super Toast
			if(passivefourArray[1,10]<=0){
				if(passivefourArray[1,12]==1&&passivefourArray[1,14]==1&&passivefourArray[1,16]==1){
					passivefourArray[1,10]=300
				}
			}else{
				passivefourArray[1,10]-=1
				passivefourArray[1,20]+=(Control.talentmapArray[20,1]*0.017)+(Control.talentmapArray[19,1]*0.085)
				
				if(passivefourArray[1,10]==0){
					passivefourArray[1,12]=0
					passivefourArray[1,14]=0
					passivefourArray[1,16]=0				
				}
			}
		}

		//Coffee
		if(Control.talentmapArray[23,1]>0){
			passivefourArray[1,20]+=(Control.talentmapArray[23,1]*0.034)
		}
				
		if(passivefourArray[1,20]>0){
			sped=passivefourArray[1,20]
		}
		
		//Punch Attack Speed
		if(passivefourArray[0,0]>0){
			passivefourArray[0,0]-=1
			
			if(passivefourArray[0,1]<2){
				abilArray[0,2]=27-passivefourArray[0,1]*3
				abilArray[0,2]=6
			}
		}else{
			passivefourArray[0,1]=0
		}
		
		//CD
		if(Control.talentmapArray[10,1]>0){
			abilArray[2,2]=360
		}else{
			if(Control.talentmapArray[13,1]>1){
				abilArray[2,2]=900
			}
		}
		//CD
		if(Control.talentmapArray[4,1]>0){
			//Doughnut
			chance=380
			abilArray[1,2]=chance-((Control.talentmapArray[5,1]*0.05)*chance)
		}else{
			if(Control.talentmapArray[7,1]>1){
				
				abilArray[1,2]=500
			}
		}

		if(passivetimer<100){
			passivetimer+=1
		}else{
			passivetimer=0
		}

chance=2

	//For punch momentum
	if(grounded==1){
		passivethree=1
		//Hover length
		passivefourArray[1,0]=(Control.talentmapArray[17,1]*11)+(Control.talentmapArray[16,1]*10)
	}


					
					//Super Bacon
					for(i=0;i<passivefourArray[1,1];i+=1){
						if(Control.talentmapArray[18,1]>0){
							created=instance_create_depth(x-3+random(6),y-6+random(6),0,Abil)
							with(created){
			
								type=1
								pin=53
								phase=0
								move=0
								diddmg=0
								dmg=0.5
				
								chance=dmg
			
			
								//dmg+=chance*(Control.talentmapArray[3,1]*0.25)
								dmg+=chance*(Control.invenArray[25,3]*0.01)
			
								creator=other.id
			
								depth=other.depth-1
								spin=1
								extra=0
									sprite_index=abil_super_two_spr
									img=342
									imgcap=1
			
								image_speed=0
								image_index=img+irandom(2)
								dur=45
								count=0
								durtotal=dur
								phase=0
							
								direction=random_range(30,60)
								speed=1
								sped=speed
								hsp=hspeed
								vsp=vspeed
								grav=0.05
								gravtwo=0.001
				
								hsp=hsp*Me.dir
								speed=0
								tick=0
								starty=y
								tickamount=0
								imgangle=random(360)
				
							}						
						}
					}
					passivefourArray[1,1]=0

	//Bacon Cape
		if(global.con_h_space||global.conp_h_space){

			chancetwo=0
			chancethree=2.3-(Control.talentmapArray[16,1]*0.35)-(Control.talentmapArray[17,1]*0.06)
			
			
			if(global.con_h_down&&passivefourArray[1,0]>0||global.conp_h_down&&passivefourArray[1,0]>0){
				if(passivefourArray[1,0]>0){
					passivefourArray[1,0]-=1
					chance=-grav-0.1
					vsp=chance
					chancetwo=1
					jumps=0
				}
			}else{
				if(jumps<=0){

						if(vsp>-3){
							chance=-grav-0.1
							if(passivefourArray[1,0]>0&&vsp>=chance){
								passivefourArray[1,0]-=1
								vsp=chance
								chancetwo=1
							}else{
								vsp-=grav-(grav*0.4)
								if(vsp>chancethree){
								 vsp=chancethree
								}
								chancetwo=1
							
							}
						}
				}else{
					if(vsp>chancethree){
						 vsp=chancethree
						 chancetwo=1
					}	
				}
			}
			if(chancetwo==1){
				
				//Flight passive
				if(passivefourArray[1,2]<passivefourArray[1,3]){
					passivefourArray[1,2]+=1
				}
				
				//Cereal Part
					if(passivetimer mod 7==0){
							created=instance_create_depth(x-4+random(8),y+2-4+random(8),0,Part)
							with(created){
										type=2
										pin=1
										pintwo=1
										depth=other.depth+1
										spin=1
										img=150+irandom(6)

										imgcap=1
										imgsped=0
										image_speed=0
										image_index=img
										imgsped=0
										sprite_index=abil_super_two_spr
										image_speed=0
										image_angle=random(360)
										dur=15+irandom(10)
													
										direction=random_range(60,120)
										speed=0
										durtotal=dur
										hsp=hspeed
										vsp=vspeed
														//hsp+=other.hsp
														//vsp+=other.vsp
										grav=0.06
										gravtwo=0.03
										chance=1
										xscale=chance
										yscale=chance
										phase=1
										speed=0
						}	
					}		
			}
		}
	//}

#endregion
		}else{
		
#region Super Class
	//____________________________________________________________________________---------------------(Tree)---------------------____________________________________________________________________________	
	if(class==7){
		if(classcheck==1){
			//In use for punch momentum
			passivethree=1
			passivefour=0
			classcheck=0
			hp=12
			hptotalback=hp
			mespr=me_mask_tree_spr
			wep=15
			maskextra=0
			
			//In use for glide particles
			passivetimer=0
			
				//Transform is Free
				//Control.talentmapArray[4,1]=3
			
				abilArray[0,2]=100
				abilArray[1,2]=340
				abilArray[2,2]=500
				
				
							temp=1
						passivefourArray[0,0]=0
						passivefourArray[0,1]=0
						passivefourArray[0,2]=0
						passivefourArray[0,3]=0
						
						//Float Leaf
						passivefourArray[1,0]=0
						//Bacon create
						passivefourArray[1,1]=0
						//Pancake Bacon flight time
						passivefourArray[1,2]=0
						//CAP
						passivefourArray[1,3]=100
						
						//Tree Stump
						passivefourArray[1,5]=0
						
						//Charge
						passivefourArray[1,6]=0
						//Charge Level
						passivefourArray[1,7]=0
						
						//Type
						passivefourArray[1,8]=0
						
						//Charge amount CD
						passivefourArray[1,9]=0
						
						//BB Overall
						passivefourArray[1,10]=0
						//Item 1
						passivefourArray[1,11]=0
						//Item 1 tick
						passivefourArray[1,12]=0	
						//Item 2
						passivefourArray[1,13]=0						
						//Item 2 tick
						passivefourArray[1,14]=0	
						//Item 3
						passivefourArray[1,15]=0						
						//Item 3 tick
						passivefourArray[1,16]=0	
						//Sped amount
						passivefourArray[1,20]=0
						
						//Charge tick
						passivefourArray[1,30]=0
						passivefourArray[1,31]=34
						passivefourArray[1,32]=0
						passivefourArray[1,33]=17
						passivefourArray[1,34]=0
						passivefourArray[1,35]=0
						passivefourArray[1,36]=0
						passivefourArray[1,37]=34
						passivefourArray[1,38]=0
						passivefourArray[1,39]=17
						passivefourArray[1,38]=0
						passivefourArray[1,39]=0
						passivefourArray[1,40]=0
						passivefourArray[1,41]=34
						passivefourArray[1,40]=0
						passivefourArray[1,41]=17
						passivefourArray[1,42]=0
						passivefourArray[1,43]=0	
						passivefourArray[1,44]=0
						passivefourArray[1,45]=0		
						passivefourArray[1,46]=34
						passivefourArray[1,47]=0	
						passivefourArray[1,48]=17
						passivefourArray[1,49]=0
						passivefourArray[1,50]=0
						passivefourArray[1,51]=0
						passivefourArray[1,52]=0	
						

					passivefourArray[100,0]=180
					passivefourArray[100,1]=0
					passivefourArray[100,2]=0
					passivefourArray[100,3]=0
					
					//Sappling Attack
					passivefourArray[100,10]=0
					passivefourArray[100,14]=0
					
					
		}
		
		//Sapling
		if(!instance_exists(passivefourArray[100,14])){
			Me.passivefourArray[100,14]=0
		}
		
		
		if(Control.talentmapArray[1,1]>0){
			abilArray[0,2]=100-Control.talentmapArray[2,1]*2
		}
		
		if(Control.talentmapArray[4,1]>0){
			abilArray[1,2]=340-(340*(Control.talentmapArray[5,1]*0.1))-(340*(Control.talentmapArray[6,1]*0.35))
			if(Control.talentmapArray[6,1]>0){
				abilArray[1,2]=0
			}
		}
		
		passivefourArray[1,21]=0
		
		//Tree Stump
		if(passivefourArray[1,5]==0){
			mespr=me_mask_tree_spr
			wep=15
			passivefourArray[1,21]=0
		}else{
			if(passivefourArray[1,5]==1){
				if(passivefourArray[1,6]>0){
					mespr=mask_tree_tree_charge_spr
				}else{
					mespr=mask_tree_tree_spr
				}
				wep=0	
				passivefourArray[1,21]=1
			}
		}
		
			if(passivefourArray[1,21]==1){
				sped=spedsave*0.4
			}else{
				sped=spedsave
			}

		
		//Charge ticks
		if(passivefourArray[1,6]>0){
			for(i=0;i<9;i+=1){
				if(passivefourArray[1,30+i*2]==0){
					if(passivefourArray[1,31+i*2]<50){
						passivefourArray[1,31+i*2]+=1
					}else{
						passivefourArray[1,30+i*2]=1
					}
				}else{
					if(passivefourArray[1,31+i*2]>0){
						passivefourArray[1,31+i*2]-=1
					}else{
						passivefourArray[1,30+i*2]=0
					}			
				}
			}
		}
	
	
		//Float Leaf
		if(Control.talentmapArray[23,1]>0){
				chance=0.75
				if(global.con_h_space&&vsp>chance&&grounded==0||global.conp_h_space&&vsp>chance&&grounded==0){
					chancetwo=0
					vsp=2-Control.talentmapArray[23,1]*0.25
				
					if(passivefourArray[1,0]==0){
						chancetwo=1
					
						passivefourArray[1,0]=instance_create_depth(xpos,ypos,0,Abil)
						with(passivefourArray[1,0]){
			
							startx=x
							starty=y
			
							count=7			
							sprite_index=abil_tree_spr
							depth=other.depth+1
						
							image_speed=0
							type=1
							pin=69
							phase=999
							move=0
							diddmg=0
							dmg=2
							tick=0
							ticky=0
							dmg=0
							creator=other.id
							spin=1
						
							if(other.passivefourArray[1,5]==0){
								img=44
							}else{
								img=130
							}
							image_index=img
							imgcap=3
							imgsped=0.1
							dur=40
							durtotal=dur
							phase=-1
							temp=other.temp
							inside=0
								imgangle=direction
							hsp=0
							vsp=0
							speed=0
							image_angle=0
						}						
					
					}else{
					
						if(instance_exists(passivefourArray[1,0])){
							with(passivefourArray[1,0]){
								x=other.x+2
								if(other.passivefourArray[1,5]==0){
									y=other.y-2
								}else{
									y=other.y-12
								}
								dur=10
							}					
					
						chancetwo=1
						if(grounded==1){
							with(passivefourArray[1,0]){
								instance_destroy()
							}
							passivefourArray[1,0]=0
						}	
						}else{
							passivefourArray[1,0]=0
						}
					}
				
				}else{
						if(instance_exists(passivefourArray[1,0])){
							with(passivefourArray[1,0]){
								instance_destroy()
							}
							passivefourArray[1,0]=0	
						}			
				}
			}
		
	}else{
#endregion	

#region Candy Class
	//____________________________________________________________________________---------------------(Candy)---------------------____________________________________________________________________________	
	if(class==8){
		if(classcheck==1){
			classcheck=0
			hp=12
			hptotalback=hp
			mespr=me_spr
			wep=17
			wep=choose(17,17,17,17,17,17,18,18,18,18,18,18,19,19,20)
			maskextra=0 
			mespr=me_mask_candy_spr
			
				abilArray[0,2]=60
				abilArray[1,2]=720
				abilArray[2,2]=640
				passive=noone
				
				abilArray[16,0]=100
				abilArray[16,1]=0
				abilArray[16,2]=0
				abilArray[16,3]=0
				abilArray[16,4]=1000
				
				abilArray[16,5]=0
				abilArray[16,6]=0
				abilArray[16,7]=0
				abilArray[16,8]=0
				abilArray[16,9]=0
				abilArray[16,10]=0
				//x
				abilArray[16,11]=0
				//y
				abilArray[16,12]=0
				
				wepanim=0
				
				//Balloons
				passivefourArray[1,0]=0	
				
				//Balloon CD
				passivefourArray[1,1]=0	
				
				//Sugar Rush
				passivefourArray[1,2]=0	
				passivefourArray[1,3]=0
				
				gumdrop=0
				
				//Oven
				
				//Heat
				passivefourArray[10,0]=0
				//Cool timer
				passivefourArray[10,1]=0
				//Heat Level
				passivefourArray[10,2]=0
				//Overheat
				passivefourArray[10,3]=0
				
				
				//heat tick
				passivefourArray[10,4]=0
				passivefourArray[10,5]=0
				
		}
			
			//For Fire Effect on oven indicator
			if(passivefourArray[10,2]==1){
				if(passivefourArray[10,4]<30){
					passivefourArray[10,4]+=1
				}else{
					passivefourArray[10,4]=0
					
					if(passivefourArray[10,5]==0){
						passivefourArray[10,5]=1
					}else{
						passivefourArray[10,5]=0
					}
				}
			}else{
				passivefourArray[10,5]=0
			}

			
			//Oven
			//if(Control.talentmapArray[19,1]>0){
			
			if(passivefourArray[10,3]==0){
					if(passivefourArray[10,1]<35){
						passivefourArray[10,1]+=1
					}else{
						passivefourArray[10,1]=0
				
						//Oven cool
						if(passivefourArray[10,0]>0){
							passivefourArray[10,0]-=1
						}	
					}
				
					//Heat Levels
					if(passivefourArray[10,0]<60){
						passivefourArray[10,2]=0
					}else{
						//Fire sweet spot
						if(passivefourArray[10,0]<90){
							passivefourArray[10,2]=1
						}else{
							//Burnt
							passivefourArray[10,2]=2
							passivefourArray[10,3]=1
							wep=21
						}				
					}
				}else{
				
					//Overheat
					if(passivefourArray[10,3]==1){
						if(passivefourArray[10,1]<3){
							passivefourArray[10,1]+=1
						}else{
							passivefourArray[10,1]=0
							//Oven cool
							if(passivefourArray[10,0]>0){
								passivefourArray[10,0]-=1
							}else{
								passivefourArray[10,3]=0
							}
						}
					}
				
				}
				

			
			
			
			
			//}


			//Cookie Choose
			if(wep==0){
				if(abilArray[0,1]==0){
					wep=choose(17,17,17,17,17,17,18,18,18,18,18,18,19,19,20)
					if(passivefourArray[10,2]==2||passivefourArray[10,3]==1){
						wep=21
					}
				}
			}

			//Float Balloons
			if(passivefourArray[1,1]>0){
				
				if(!instance_exists(passivefourArray[1,0])){
					
							passivefourArray[1,0]=instance_create_depth(xpos,ypos,0,Abil)
							with(passivefourArray[1,0]){
			
								y-=7
							
								startx=x
								starty=y
			
								count=7			
								sprite_index=abil_candy_spr
								depth=other.depth+1
						
								image_speed=0
								type=1
								pin=69
								phase=999
								move=0
								diddmg=0
								dmg=2
								tick=0
								ticky=0
								dmg=0
								creator=other.id
								spin=1
						
								if(Control.talentmapArray[12,1]>0){
									img=120
								}else{
									img=117
								}
								image_index=img
								imgcap=2
								imgsped=0.08
								dur=300
								durtotal=dur
								phase=-1
								//temp=other.temp
								inside=0
									imgangle=direction
								hsp=0
								vsp=0
								speed=0
								image_angle=0
								fly=0
								
							}	
				}else{
				
					if(vsp>0.75){
						//vsp=2-Control.talentmapArray[23,1]*0.25
						//vsp=2.5-Control.talentmapArray[23,1]*0.22
						
							//Triple Balloon
							if(Control.talentmapArray[12,1]>0){
									vsp=1.4
							}else{
								//Double Balloon
									vsp=1.9
							}	
							if(global.con_h_down||global.conp_h_down){
								vsp=3
							}
							if(global.con_h_space||global.conp_h_space){
								vsp-=0.5
							}
					}else{
					
						if(vsp<0){
							if(grounded==0){
								//Triple Balloon
								if(Control.talentmapArray[12,1]>0){
										vsp-=Control.talentmapArray[23,1]*0.015
								}else{
									//Double Balloon
									vsp-=Control.talentmapArray[23,1]*0.007
									
								}								
								
							}
						}
					}
				
				//Balloon Active
					with(passivefourArray[1,0]){
						x=other.x
						y=other.y-2
						dur=250
						
					}	
					
					//if(hurttick>0&&immune==0||global.con_h_down&&global.con_p_space||global.conp_h_down&&global.conp_p_space){
					if(hurttick>0&&immune==0){
						passivefourArray[1,1]=0
						passivefourArray[1,0].fly=1
					}
				}		

			}
			
			with(Abil){
				if(pin==69){
					if(fly>0){
						fly+=1
						y-=1
						if(fly>=250){
							instance_destroy()
						}
					}
				}
			}


			//	if(Control.talentmapArray[10,1]>0){
					if(global.con_p_space){
						if(jumps==0&&justjump==0&&gumdrop==0){
							vsp=-5
							
							created=instance_create_depth(x,y+8,Fakeblock)
							with(created){
								visible = true
								sprite_index=abil_candy_spr
								image_speed=0
								colors=irandom(3)
								img=173+colors*8
								imgcap=3
								image_index=img
								imgsped=0
								tick=1
								dur=999
							
								pin=74
								type=99
								hp=3
								
								hptick=0
							
							}
							gumdrop=3
						}
					}
				//}

			//Gumdrop
			
			if(grounded==1){
				if(gumdrop>0){
					gumdrop-=1
				}
			}

				if(instance_exists(Fakeblock)){
					chance=0
					hit=instance_place(x,y+vsp,Fakeblock)
					if(hit!=noone){
						if(hit.type==99){
							if(global.con_h_space||global.conp_h_space){
								vsp=-5.3
							}else{
								vsp=-4.5
							}
							hit.tick=1
							hit.hp-=1
							Me.jumps=0
							chance=1
							hit.hptick=1
						}
					}
					
					if(chance==0){
						hit=instance_place(x,y+1,Fakeblock)
						if(hit!=noone){
							if(hit.type==99){
								if(global.con_h_space||global.conp_h_space){
									vsp=-5.3
								}else{
									vsp=-4.5
								}
								hit.tick=1
								hit.hp-=1
								Me.jumps=0
								chance=1
								hit.hptick=1
							}
						}						
					}
				
				
					with(Fakeblock){
						if(type=99){
							dur-=1
							
							if(dur mod 200==0){
								hp-=1
								hptick=1
								tick=1
							}
					
							if(hptick==1){
								hptick=0
								for(i=0;i<3;i+=1){
									created=instance_create_depth(x-3+random(6),y+5-2+random(4),0,Part)
									with(created){
										type=3
										pin=1
										pintwo=1
										depth=other.depth+choose(-1,1)
										spin=1
										img=213+other.colors*5
										imgcap=4
										imgsped=0
										sprite_index=abil_candy_spr
										image_speed=0
										image_index=img+irandom(imgcap)
										image_angle=0
										dur=30+irandom(30)
										direction=random(360)
										imgangle=direction
										image_angle=direction
										durtotal=dur
										hsp=random_range(-1,1)
										vsp=random_range(0.5,0.8)*-1
										//hsp+=other.hsp
										//vsp+=other.vsp
										grav=0.06
										gravtwo=0.03
										chance=1
										xscale=chance
										yscale=chance
										phase=1
										speed=0
										spin=1
									}		
								}									
							}
					
							if(tick==1){
								if(image_index<img+imgcap){
									image_index+=0.1
								}else{
									image_index=img
									tick=0
								}
							}
							
							if(hp<=0){
								
								//Gumdrop Parts
								for(i=0;i<4;i+=1){
									created=instance_create_depth(x,y,0,Part)
									with(created){
										type=2
										pin=1
										pintwo=1
										depth=other.depth+1
										spin=1
										img=other.img+4
										imgcap=3
										imgsped=0
										sprite_index=abil_candy_spr
										image_speed=0
										image_index=img+other.i
										image_angle=0
										dur=70+irandom(70)
										direction=other.i*90
										speed=-random_range(0.4,1)
										durtotal=dur
										hsp=hspeed
										vsp=vspeed
										//hsp+=other.hsp
										//vsp+=other.vsp
										grav=0.06
										gravtwo=0.03
										chance=1
										xscale=chance
										yscale=chance
										phase=1
										speed=0
									}		
								}		
								
								instance_destroy()
							}
						}
					}
				}
			
			/*
			//Float Balloons
			if(Control.talentmapArray[23,1]>0){
				
				if(passivefourArray[1,1]>0){
					passivefourArray[1,1]-=1
					
					if(instance_exists(passivefourArray[1,0])){
						passivefourArray[1,0].y-=1
						if(passivefourArray[1,1]==0){
							with(passivefourArray[1,0]){
								instance_destroy()
							}
							passivefourArray[1,0]=0			
						}
									
					}

				}else{
				if(!instance_exists(passivefourArray[1,0])){
					
					if(grounded==1){
							passivefourArray[1,0]=instance_create_depth(xpos,ypos,0,Abil)
							with(passivefourArray[1,0]){
			
								y-=7
							
								startx=x
								starty=y
			
								count=7			
								sprite_index=abil_candy_spr
								depth=other.depth+1
						
								image_speed=0
								type=1
								pin=69
								phase=999
								move=0
								diddmg=0
								dmg=2
								tick=0
								ticky=0
								dmg=0
								creator=other.id
								spin=1
						
								img=120
								image_index=img
								imgcap=2
								imgsped=0.08
								dur=300
								durtotal=dur
								phase=-1
								//temp=other.temp
								inside=0
									imgangle=direction
								hsp=0
								vsp=0
								speed=0
								image_angle=0
								fly=0
							}	
					}
				}else{
				
					if(vsp>0.75){
						//vsp=2-Control.talentmapArray[23,1]*0.25
						vsp=2.5-Control.talentmapArray[23,1]*0.22
					}else{
					
						if(vsp<0){
							if(grounded==0){
								vsp-=Control.talentmapArray[23,1]*0.015
							}
						}
					}
				
				//Balloon Active
					with(passivefourArray[1,0]){
						x=other.x
						y=other.y-2
						dur=250
					}	
					
					if(hurttick>0&&immune==0||global.con_h_down&&global.con_p_space||global.conp_h_down&&global.conp_p_space){
						passivefourArray[1,1]=250
						passivefourArray[1,0].fly=1
					}
				}
			}
			

			}else{
			
				//Change of talent delete
				if(instance_exists(passivefourArray[1,0])){
					with(passivefourArray[1,0]){
						instance_destroy()
					}
					passivefourArray[1,0]=0						
				}
			}
			*/
			
			
#endregion			
	}else{

#region Candy Class
	//____________________________________________________________________________---------------------(Trash)---------------------____________________________________________________________________________	
	if(class==9){
		if(classcheck==1){
			classcheck=0
			hp=12
			hptotalback=hp
			mespr=me_spr
			wep=27
			maskextra=0 
			mespr=me_mask_trash_spr
			
				abilArray[0,2]=60
				abilArray[1,2]=720
				abilArray[2,2]=640
				passive=noone
				
				abilArray[16,0]=100
				abilArray[16,1]=0
				abilArray[16,2]=0
				abilArray[16,3]=0
				abilArray[16,4]=1000
				
				abilArray[16,5]=0
				abilArray[16,6]=0
				abilArray[16,7]=0
				abilArray[16,8]=0
				abilArray[16,9]=0
				abilArray[16,10]=0
				//x
				abilArray[16,11]=0
				//y
				abilArray[16,12]=0
				
				wepanim=0
				
				//Mouse Count
				passivefourArray[1,0]=0	
				//Total Mouses
				passivefourArray[1,5]=3	
				
				//M1, M2, M3
				passivefourArray[1,1]=0	
				passivefourArray[1,2]=0	
				passivefourArray[1,3]=0	
				passivefourArray[1,4]=0	
				
				//M1 in reserve, M2 in reserve, M3 in reserve inventory
				passivefourArray[1,6]=10	
				passivefourArray[1,7]=10	
				passivefourArray[1,8]=10	
				passivefourArray[1,9]=10	
				
				wep=27+choose(0,0,0,0,2,2,1,1,3,4)	
				wep=27+choose(0,2,1,3,4)	

				
		}

		//Mouse
		passivefourArray[1,0]=0	
		
		//Count Number of Alive Mice
		for(i=0;i<passivefourArray[1,5];i+=1){
			if(passivefourArray[1,1+i]!=0){
				if(instance_exists(passivefourArray[1,1+i])){
					passivefourArray[1,0]+=1
				}else{
					passivefourArray[1,1+i]=0
				}
			}
		}
		
//If the mice are less than the cap set mouse at ready to either one in the inventory or to a random
if(passivefourArray[1,0] < passivefourArray[1,5] && wep == 0){
    if(passivefourArray[1,6] != 10){
        wep = 27 + passivefourArray[1,6];
        
        // Shift all mice down in the inventory
        for(i=0; i<passivefourArray[1,5]-1; i+=1){
            passivefourArray[1,6+i] = passivefourArray[1,7+i];
        }
        
        // Set the last slot to 10 (empty)
        passivefourArray[1,6+passivefourArray[1,5]-1] = 10;
    } else {
        wep = 27 + choose(0,0,0,0,2,2,1,1,2,3);
    }
}

		
	}else{
	
	//Class
	}
#endregion	

	}
		}}}}}
		}
	}
	}
//#endregion
//#endregion
#region Health
	chance=0
	if(hptotalback+Control.invenArray[24,3]>hptotal){
	chance=hptotalback+Control.invenArray[24,3]-hptotal
	}else{
		if(hptotalback+Control.invenArray[24,3]<hptotal){
		chance=hptotalback+Control.invenArray[24,3]-hptotal
		}
	}
	hptotal=hptotalback+Control.invenArray[24,3]
	hp+=chance
#endregion
#region Passive Check
	if(hurttick==1&&hp>0){
		for(i=0;i<3;i+=1){
			if(Control.invenArray[24+i,0]!=0){
				if(Control.itemArray[Control.invenArray[24+i,0],1]==4){
					if(random(100)<=Control.itemArray[Control.invenArray[24+i,0],8]+(Control.invenArray[24+i,2]*Control.itemArray[Control.invenArray[24+i,0],14])){
						chance=Control.itemArray[Control.invenArray[24+i,0],6]
						chancetwo=Control.invenArray[24+i,2]
						abil_create_scr(4)	
					}
					if(Control.itemArray[Control.invenArray[24+i,0],8]+(Control.invenArray[24+i,0]*Control.itemArray[Control.invenArray[24+i,0],14])>100){
						chancethree=Control.itemArray[Control.invenArray[24+i,0],8]+(Control.invenArray[24+i,2]*Control.itemArray[Control.invenArray[24+i,0],14])-100
						if(random(100)<=chancethree){
							chance=Control.itemArray[Control.invenArray[24+i,0],6]
							chancetwo=Control.invenArray[24+i,2]
							abil_create_scr(4)	
						}				
					}
				}
			}
		}
	}
		
		//Timer Check
		for(i=0;i<3;i+=1){
			if(Control.invenArray[24+i,0]!=0){
				if(Control.itemArray[Control.invenArray[24+i,0],2]==5){
					check=floor(Control.stagetimer/60)
					if(check>0&&Control.invenArray[24+i,9]!=check){
						if(check mod floor(Control.itemArray[Control.invenArray[24+i,0],7]-Control.invenArray[24+i,2]*0.02)==0){
							chance=Control.itemArray[Control.invenArray[24+i,0],6]
							chancetwo=Control.invenArray[24+i,2]
							chancefive=Control.invenArray[24+i,0]
						
							Control.invenArray[24+i,9]=check
							abil_create_scr(4)										
						}
					}
				}
			}
		}

#endregion


}
