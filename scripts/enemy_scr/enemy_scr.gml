function enemy_scr() {

	if(target!=0){

		if(instance_exists(target)){
	
		}else{
		target=0
		}
	}else{
	target=Me
	}

	if(instance_exists(Me)){
		with(Me){
			if(point_distance(x,y,other.x,other.y)<96){
		
			}	
		}
	}
	
	
#region Main Enemies
#region Tree (Acorn throw)
	//____________________________________________________________________________---------------------(Tree medium)---------------------____________________________________________________________________________
	if(pin==1){
		//Sleep 
		if(phase==1){
			if(check==1){
				sprite_index=enemy_spr
				mask_index=enemy_spr_mask
				if(enopt==0){
					imgextra=0
					attcd=90
					attcdtotal=210
						hp=24
						hptotal=hp
						xpdrop=irandom_range(3,5)
				}else{
					if(enopt==1){
						imgextra=13
						attcd=0
						attcdtotal=150
							hp=32
							hptotal=hp
							xpdrop=irandom_range(4,6)
					}else{
						//Mushroom
						if(enopt==2){
							imgextra=83
							attcd=0
							attcdtotal=210
								hp=32
								hptotal=hp
						}else{
				
						}				
					}
				}
				check=0
				img=1+imgextra
				imgcap=1
				imgsped=0.01
				timer=30
				image_index=img
				atcd=0
				dmg=2

				imgsave=img
				imgcapsave=imgcap

			}
				if(hurttimer>0||hurttick==1){
					phase=2
					img=imgsave+2
					imgcap=1
					image_index=img
					imgsped=0.03
				
				}
			if(timer>0){
				with(Me){
					if(point_distance(x,y,other.x,other.y)>96){
						other.timer=0
					}
				}
			}else{
				with(Me){
					if(point_distance(x,y,other.x,other.y)<96){
					other.phase=2
					other.img=other.imgsave+2
					other.imgcap=1
					other.image_index=other.img
					other.imgsped=0.03
					}
				}
			}
		}else{
			//Main
			if(phase==2){
				if(attcd>0){
				attcd-=1
			
					if(attcd>30){
						if(target.x<x){
						dir=1
						}else{
						dir=-1
						}
					}
					if(attcd==30){
						img=imgsave+7
						image_index=img
						imgcap=1
						imgsped=0.05
						atcd=1
					}
					if(image_index>=img+imgcap&&atcd==1){
						atcd=0
#region Acorn Attack
					audio_play_sound_at(choose(snd_enemy_spit_low_1,snd_enemy_spit_low_2,snd_enemy_spit_low_3),x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
						created=instance_create_depth(x,y+5,depth-1,Abil)
						with(created){
							sprite_index=enemy_abil_spr
							pin=30
							spin=5
							image_speed=0
							imgsped=0
							if(other.enopt<2){
								img=1+other.enopt
							}else{
								img=79
							}
							image_index=img
							imgcap=0
							dmg=2
						
							dur=400
							grav=0.1
							vsp=choose(-2.5,2.5)
							hsp=-0.5

							dur=350
						
							vsp=choose(0.45,-0.45,-0.9,0.9,-0.9)
							hsp=-1.5
							if(other.enopt<2){
								img=1+other.enopt
								grav=0.02
							}else{
								if(other.enopt==2){
									img=79
									grav=0.01
										hsp=-0.4
									if(vsp<0){
										hsp=-0.15
									}
									dur=650
								}
							}
							imgangle=180
							dir=-1
							yrebound=0.9
							part=1
						
							en=1
							type=1
							move=1
							diddmg=0
							creator=other.id
							phase=0
							phasecheck=1
							hsp=hsp*other.dir
						}
#endregion
					}
				}else{
					attcd=attcdtotal
					img=imgsave+2
					image_index=img
					imgcap=1
					imgsped=0.03
				}
			}
		}
	}else{
#endregion
#region Acorn Fly
	//____________________________________________________________________________---------------------(Acorn Flier)---------------------____________________________________________________________________________
	if(pin==2){
		//Sleep 
		if(phase==1){
			if(check==1){
				check=0
			
						hp=8
						hptotal=hp
				if(enopt==0){
					imgextra=42
					attdeltotal=220
					xpdrop=choose(1,1,1,2)
				}else{
					imgextra=0
					attdeltotal=150
						hp=12
						hptotal=hp
						xpdrop=choose(2,2,2,3)
				}
				grav=0
				sprite_index=enemy_three_spr

				img=1+imgextra
				image_index=img
				imgcap=1
				imgsped=0.02
			
				imgsave=img
				imgspedsave=imgsped
				imgcapsave=imgcap
			
				attackimg=7+imgextra
				attackimgcap=1
			
				startx=x
				starty=y
				rangex=16
				rangey=4
				rangetick=0
				rangeticktwo=0
				sped=0.15
				spedtwo=0.15
				attdel=0
				atttime=25
			
			}
		
			if(attdel>0){
			attdel-=1
				if(attdel==10){
								audio_play_sound_at(choose(snd_enemy_spit_high_1,snd_enemy_spit_high_2),x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
								created=instance_create_depth(x,y+5,depth-1,Abil)
							
								with(created){
									sprite_index=enemy_abil_spr
									partmake=1
									pin=32
									image_speed=0
									imgsped=0
									img=7
									image_index=img
									imgcap=1	
									en=1
									sped=0.8
									move_towards_point(Me.x,Me.y,sped)
									imgangle=direction
									hsp=hspeed
									vsp=vspeed
									speed=0
								
									dur=300
									move=1
									phasecheck=0
								}	

						
				}
			}else{
			attdel=attdeltotal
			}
				if(rangetick==0){
					if(y>starty-rangey){
						y-=sped
						if(attdel>atttime){
						img=imgsave
						imgcap=imgcapsave
						image_index=imgsave
						}else{
						img=attackimg
						image_index=attackimg
						imgcap=attackimgcap
						}
					}else{
						rangetick=1
					}
				}else{
					if(y<starty+rangey){
						y+=sped
						if(attdel>atttime){
						image_index=imgsave+1
						img=imgsave+1
						imgcap=imgcapsave
						}else{
						image_index=attackimg+1
						img=attackimg+1
						imgcap=attackimgcap
						}
					}else{
						rangetick=0
					}			
				}
			
				if(rangeticktwo==0){
					if(x>startx-rangex){
						x-=spedtwo
					}else{
						rangeticktwo=1
					}
				}else{
					if(x<startx+rangex){
						x+=spedtwo
					}else{
						rangeticktwo=0
					}			
				}
		
				if(hurttimer>0&&hp<8||hurttick==1&&hp<8){
					phase=2
					img=imgsave+2
					imgcap=3
					vsp=0.01
					image_index=img
					imgsped=0.05
					audio_play_sound_at(choose(snd_enemy_yell_4,snd_enemy_yell_5,snd_enemy_yell_6),x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
				}
		}else{
		
			if(phase==2){
				if(image_index>=5){
					phase=3
					img=imgsave+4
					imgcap=1
					image_index=img
					vsp=0.5
					grav=0.1
					dur=150
				}
			}else{
				if(phase==3){
					if(dur<=0||instance_place(x,y+1,Block)){
						phase=4
						dur=10
					}else{
					dur-=1
					}
				}else{
					if(phase==4){
							created=instance_create_depth(x,y+5,depth-1,Abil)
							with(created){
								audio_play_sound_at(choose(snd_enemy_explosion_small_1,snd_enemy_explosion_small_2),x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
								sprite_index=enemy_abil_acorn_spr
								pin=31
								image_speed=0
								imgsped=0.2
								img=10
								imgcap=0
								dmg=2


								dur=200
								grav=0
								vsp=0
								hsp=0
								imgangle=0
								dir=1
						
								en=1
								//type=1
								//move=1
								diddmg=1
								creator=other.id
								//phase=0
							
								hurtnum=0
								hurtArray[0]=0
							}	
							dmgrecieved=10
							hurttick=1
					}
				}
			}
		}
	}else{
#endregion
#region Acorn Run
		//____________________________________________________________________________---------------------(Running Acorn)---------------------____________________________________________________________________________
		if(pin==3){
			if(phase==1){
				if(check==1){
					yellcd=0
					sprite_index=enemy_three_spr
					check=0
					hp=8
					hptotal=hp	
					
				
					//Brown
					if(enopt==1||enopt==4){
						imgextra=0
						wallsped=-0.5
						sped=0.5
						rangetimertotal=240
						rangetimer=irandom(rangetimertotal)
						jump=-5.2
						jumptimertotal=130
						hp=12
						hptotal=hp	
						
						if(enopt==1){
							xpdrop=choose(2,2,2,3)
						}
					}else{
						if(enopt==0||enopt==3){
					//Green
						imgextra=16
						wallsped=-0.3
						sped=0.3
						rangetimertotal=240
						rangetimer=irandom(rangetimertotal)
						jump=-4.8
						jumptimertotal=180
						
						if(enopt==3){
							hp=4
							hptotal=hp						
						}else{
							xpdrop=choose(1,1,1,2)
						}
						}else{
							if(enopt==5||enopt==6){
								//Apple
							imgextra=73
							wallsped=-0.3
							sped=0.2
							rangetimertotal=240
							rangetimer=irandom(rangetimertotal)
							jump=-4.8
							jumptimertotal=300
							drop=1
							item=2
							if(enopt==6){
								drop=1	
								item=10
							}
							}else{
								if(enopt==7||enopt==8){
									//Mushroom
								imgextra=44+15
								wallsped=-0.3
								sped=0.2
								rangetimertotal=240
								rangetimer=irandom(rangetimertotal)
								jump=-4.4
								jumptimertotal=180
								if(enopt==3){
									hp=4
									hptotal=hp						
								}
								}else{
						
								}							
							}				
						}
					}
						img=11+imgextra
						imgcap=5
						image_index=img
						imgsped=0.1
						imgspedsave=imgsped
						imgsave=img
						imgcapsave=imgcap

						startx=x
						range=48
						rangetick=choose(0,1)
						if(rangetick==1){
							dir=-1
						}
				
						wallimg=19+imgextra
						wallimgcap=3
						wallcheck=1
				
						jumptimer=irandom(jumptimertotal)
						jumpimg=17+imgextra
						jumpimgsave=jumpimg
						jumpimghurt=23+imgextra
						jumpimgsped=0.1
						groundcheck=0	
				
				}
				
				if(yellcd>0){
					yellcd-=1
				}


				if(stun>0){
				
					stun-=1
				
				}else{
					if(hurttimer>50||hurttick==1){
						if(grounded==1){  
							jumptimer=0
							jumpimg=jumpimghurt
							if(yellcd==0){
								yellcd=60
								audio_play_sound_at(choose(snd_enemy_yell_1,snd_enemy_yell_2,snd_enemy_yell_3),x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
							}
						}
					}else{
						jumpimg=jumpimgsave
					}
					//Grounded
					enemy_move_scr(5)
					//Wall Climb
					enemy_move_scr(3)
						//Ground Check
						enemy_move_scr(4)

					if(wallcheck==1){
						//Walk Timer
						enemy_move_scr(2)
						//Jump
						enemy_move_scr(1)

					}
				}
				

			}else{
	
			}
		}else{
#endregion
#region Boss Tree One
	//____________________________________________________________________________---------------------(Boss Tree One)---------------------____________________________________________________________________________
	if(pin==4){
#region Phase 1
		if(phase==1){
			if(check==1){
#region Check

				xpdrop=80+irandom(10)

				y-=64
				sprite_index=boss_tree_one_spr
				mask_index=dummy_spr
				apples=0
				
				xpdrop=60+irandom(5)
				
				if(enopt==0||enopt==1){
					imgextra=0
					attcd=90
					attcdtotal=180
				}else{
					imgextra=13
					attcd=0
					attcdtotal=120
				}
					optsavetwo=choose(0,1)
					optsave=choose(0,1)
					hp=300
					hptotal=hp
					grav=0
				lastphase=3
				check=0
				img=1
				imgcap=1
				imgsped=0.02
				timer=30
				atcd=0
			
				if(enopt==0){
					img=1
				}else{
					img=7
				}
				imgsave=img
				image_index=imgsave
				imgcapsave=imgcap
				imgspedsave=imgsped
			
				startx=x
				starty=y
				range=6
				rangetwo=4
				rangetick=1
				rangetwo=1
				rangeticktwo=1
				sped=0.05
				spedtwo=0.01
			
				attcd=200
				attcdtotal=attcd
				attopt=0
				hand=0
			
				chance=140
				arenax=x-chance
				arenaxtwo=x+chance
				arenay=y-48
#endregion
#region Eyes
			eyes=instance_create_depth(x,y,9,Part)
			with(eyes){
				sprite_index=boss_tree_one_spr
				img=13
				imgsped=0
				imgcap=0
				dur=-999
				image_index=13
				mask_index=dummy_spr
				image_speed=0
				pin=9999
				color=c_white
			}
#endregion
#region Hands
		for(i=0;i<2;i+=1){
			created=instance_create_depth(x-90+i*180,y+32,4,Enemy)
			with(created){
				pin=1000
				enopt=choose(0,1)
				enopt=0
				sprite_index=boss_tree_one_hand_spr
				if(enopt==0){
					imgextra=0
					attcd=90
					attcdtotal=180
				}else{
					imgextra=13
					attcd=0
					attcdtotal=120
				}
					hp=150
					hptotal=hp
					grav=0
				check=0
					if(other.enopt==0){
						img=1
					}else{
						img=1+5
					}
				imgcap=1
				if(enopt==0){
					imgsave=img
				}else{
					imgsave=img+5
				}
				imgcapsave=imgcap
				imgsped=0.03
				timer=30
				image_index=imgsave
				atcd=0
				startx=x
				starty=y
				sped=0.1
				attcd=0
				attcdtotal=attcd

				imgsave=img
				imgcapsave=imgcap
				imgspedsave=imgsped
			
					startx=x
					starty=y
					range=4
					rangetwo=4
					rangetick=1
					rangetwo=1
					rangeticktwo=1
					sped=0.05
					spedtwo=0.01
				
					if(other.i==0){
						other.handone=id
						dir=1
					}else{
						other.handtwo=id
						dir=-1
					}
			}
		}
#endregion

			}
#region Attack CD

#region Apple Sky
	if(apples==1){
		chance=irandom_range(7,13)
		chancetwo=irandom(20)
		with(chancetwo==chance){
			chancetwo=irandom(20)
		}
		for(i=0;i<19;i+=1){
			if(i!=chance&&i!=chancetwo){
				created=instance_create_depth(arenax+i*16,other.arenay,depth-1,Abil)
				with(created){
								sprite_index=enemy_abil_spr
								pin=30
								spin=choose(2,4,6)
								dir=choose(1,-1)
								//spin=choose(1,-1)
								image_speed=0
								imgsped=0
									img=choose(55,55,55,55,55,57,57,59)
									img+=choose(0,0,0,1)
						
								image_index=img
								imgcap=0
								dmg=1

								dur=220+random(100)
								grav=0.01
								vsp=random(0.2)*choose(1,-1)
								hsp=0
								imgangle=180
								dir=-1
								yrebound=0.4
								part=0
						
								en=1
								type=1
								move=1
								diddmg=0
								creator=other.id
								phase=0
								phasecheck=1			
				}
			}
		}
		apples+=1
	}
#endregion
							handamt=0
							if(instance_exists(handone)||instance_exists(handtwo)){
								if(!instance_exists(handone)){
									hand=1
								}else{
									handamt+=1
								}
								if(!instance_exists(handtwo)){
									hand=0
								}else{
									handamt+=1
								}
							}else{
								phase=2
								check=1		
								attcd=100
							}
						
			if(attcd>0){
				attcd-=1
				if(attcd==60){
					img=imgsave+2
					imgcap=1
					image_index=img
					imgsped=0.032
					range=2
					sped=0.5
					audio_play_sound_at(choose(snd_boss_yell_1,snd_boss_yell_2),x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
				}else{
					if(attcd==40){
							if(instance_exists(handone)||instance_exists(handtwo)){
								if(!instance_exists(handone)){
									hand=1
								}
								if(!instance_exists(handtwo)){
									hand=0
								}

				
						if(attopt==0){
							if(hand==0){
								handone.attcd=1
								hand=1
							}else{
								handtwo.attcd=1
								hand=0
							}
							attopt=1
						}else{
							if(attopt==1){
									attopttwo=choose(0,1)
								if(instance_exists(handone)){
										handone.attcd=10
									if(attopttwo==0){
										handone.atttimer=0
									}else{
										handone.atttimer=40
									}
								}
								if(instance_exists(handtwo)){
										handtwo.attcd=10
									if(attopttwo==1){
										handtwo.atttimer=0
									}else{
										handtwo.atttimer=40
									}
								}
								attopt=0
							}else{
			
							}			
						}
					}else{
						phase=2
						check=1
					}				
					}else{
					}
				}
			}else{
					img=imgsave
					imgcap=1
					image_index=img
					imgsped=imgspedsave
					range=4
					sped=0.05
			
				attcd=attcdtotal*5
			}
#endregion
		
			enemy_move_scr(6)
			enemy_move_scr(7)
				with(Enemy){
					if(pin==1000){
						if(hp>0){
						if(attcd<=0){
							enemy_move_scr(6)
							enemy_move_scr(7)	
						}else{
#region Hand Grab Attack
							if(attcd==1){
								if(!instance_place(x,y,Block)){
									y+=2
										chance=4
										if(dir==1){
											if(image_angle-chance>=270){
												image_angle-=chance
											}else{
												if(image_angle==0){
													image_angle=355
												}else{
													image_angle=270
												}								
											}
										}else{
											if(image_angle+chance<=90){
												image_angle+=chance
											}else{
												image_angle=90
											}						
										}
								}else{
									attcd=2
									y+=3
								}
									if(instance_place(x,y,Me)){
										img=imgsave+2
										image_index=img
										attcd=4
									
									}
							}else{
								//Grab forward
								if(attcd==2){
									if(dir==1){
										if(x<startx+185){
											x+=3.5
										}else{
											attcd=3
											img=imgsave+2
											image_index=img+1
											audio_play_sound_at(choose(snd_boss_grab_1,snd_boss_grab_2),x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
										}
									}else{
										if(x>startx-185){
											x-=3.5
										}else{
											attcd=3
											img=imgsave+2
											image_index=img+1
											audio_play_sound_at(choose(snd_boss_grab_1,snd_boss_grab_2),x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
										}								
									}
									target=instance_place(x,y,Me)
									if(target==noone){
										target=instance_place(x,y,Enemy)
											if(target!=noone){
												if(target.pin!=3){
													target=noone
												}
											}
									}
									if(target!=noone){
										img=imgsave+2
										image_index=img
										attcd=4
										imgsped=0.1
									}
								}else{
									if(attcd==3||attcd==4){
										if(dir==1){
											if(x>startx||y>starty){
												if(x>startx){
													x-=3
												}else{
													x=startx
												}
											}else{
													if(attcd==4){
														if(instance_exists(target)){
														target.vsp=-7
														target.x-=3
															if(target!=Me){
																target.check=1
																target.phase=1
																target.enopt=4
															}
														}
													}
												attcd=0
												img=imgsave
												image_index=img
												image_angle=0
												imgsped=imgspedsave
												other.attcd=other.attcdtotal
											}
										}else{
											if(x<startx||y>starty){
												if(x<startx){
													x+=3
												}else{
													x=startx
												}
											}else{
													if(attcd==4){
														if(instance_exists(target)){
															target.vsp=-7
															target.x+=1
															if(target!=Me){
																target.check=1
																target.phase=1
																target.enopt=4
															}
														}
													}
												attcd=0
												img=imgsave
												image_index=img
												image_angle=0
												imgsped=imgspedsave
												other.attcd=other.attcdtotal
											}									
										}
										if(y>starty){
											y-=1.5
										}
										if(attcd==4){
											if(instance_exists(target)){
												target.x=x
												target.y=y
											}
										}else{
											chance=1.5
											if(dir==1){
										
												if(image_angle+chance<=360&&image_angle>180){
													image_angle+=chance
												}else{
													image_angle=0
												}
											}else{
												if(image_angle-5>0){
													image_angle-=chance
												}else{
													image_angle=0
												}						
											}									
										}
									}else{
#endregion
#region Hand Slam Attack
										if(attcd==10||attcd==11){
											if(attcd==10){
												img=imgsave+2+1
												image_index=img
												tick=0
												attcd=11
												other.apples=0
											}

												chance=10
												if(dir==1){
													if(image_angle-chance>=270){
														image_angle-=chance
													}else{
														if(image_angle==0){
															image_angle=355
														}else{
															image_angle=270
														}								
													}
												}else{
													if(image_angle+chance<=90){
														image_angle+=chance
													}else{
														image_angle=90
													}						
												}	
											if(atttimer<=0){								
												if(!instance_place(x,y,Block)){
													y+=7
												}else{
													attcd=12
													Control.screenshake=4
													audio_play_sound_at(choose(snd_boss_slam_1,snd_boss_slam_2,snd_boss_slam_3),x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
#region Acorn From Sky
	if(Control.boss==1){
					if(tick==2){
								if(dir==1){
									if(other.attopttwo==0){
										created=instance_create_depth(random_range(other.arenax,other.arenaxtwo),other.arenay,5,Enemy)
										created.pin=3
										created.enopt=3
									}
								}else{
									if(other.attopttwo==1){
										created=instance_create_depth(random_range(other.arenax,other.arenaxtwo),other.arenay,5,Enemy)
										created.pin=3
										created.enopt=3
									}												
								}	
					}
					if(other.handamt==2){
						chance=1
					}else{
						chance=3
					}

					for(i=0;i<chance;i+=1){
						created=instance_create_depth(random_range(other.arenax,other.arenaxtwo),other.arenay,depth-1,Abil)
						with(created){
							sprite_index=enemy_abil_spr
							pin=30
								spin=choose(2,4,6)
								dir=choose(1,-1)
							image_speed=0
							imgsped=0
							if(Control.boss==1){
								img=choose(3,4)
							}else{
								img=choose(4,5)
							}
						
							image_index=img
							imgcap=0
							dmg=1

							dur=200
							grav=0.01
							vsp=0
							hsp=0
							imgangle=180
							dir=-1
							yrebound=0.4
							part=0
						
							en=1
							type=1
							move=1
							diddmg=0
							creator=other.id
							phase=0
							phasecheck=1
						}
					}
	}else{
	other.apples+=1
					if(other.handamt==2){
						chance=1
					}else{
						chance=3
					}
	}
#endregion
													if(tick==0){
														if(dir==1){
															if(other.attopttwo==0){
																with(other){
																	if(instance_exists(handtwo)){
																		handtwo.atttimer=0
																	}
																}
															}
														}else{
															if(other.attopttwo==1){
																with(other){
																	if(instance_exists(handone)){
																		handone.atttimer=0
																	}
																}
															}												
														}	
													}
												}
											}else{
												atttimer-=1
											}
										}else{
											chance=2
											if(y-chance>=starty){
												y-=chance
											}else{
												y=starty
												attcd=11
												if(tick<5){
													tick+=1
												}else{
													attcd=0
													img=imgsave
													image_index=imgsave
													image_angle=0
													imgsped=imgspedsave	
													if(other.handamt==1){
														other.attcd=other.attcdtotal
													}else{
														if(dir==1){
															if(other.attopttwo==0){
																other.attcd=other.attcdtotal
															}
														}else{
															if(other.attopttwo==1){
																other.attcd=other.attcdtotal
															}												
														}
													}
												}
											}
										}
#endregion
									}
								}
							}
						}
					}
					}
				}
			
	
		}else{
#endregion	
#region Phase 2
			if(phase==2){
				if(check==1){
					check=0
					mask_index=sprite_index
					attcd=90
					optfour=0
				
					img=imgsave+2
					imgcap=1
					image_index=img
					imgsped=0.032
					range=2
					sped=0.5
				}
				if(y+0.2<starty){
					y+=0.2
				}
			
			if(x<startx+16&&x>startx-16){
			enemy_move_scr(6)
			enemy_move_scr(7)			
				if(attcd>0){
						attcd-=1
					if(attcd==60){
						img=imgsave+2
						imgcap=1
						image_index=img
						imgsped=0.032
						range=2
						sped=0.5
					}else{
						if(attcd==40){
							if(attopt==0){

							}else{
			
							}		
						}
					}
				}else{
					audio_play_sound_at(choose(snd_boss_yell_1,snd_boss_yell_2),x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
					/*
					img=imgsave
					imgcap=1
					image_index=img
					imgsped=imgspedsave
					range=4
					sped=0.05
					*/
					if(lastphase==3){
						phase=4
						check=1
						lastphase=4
					}else{
						phase=3
						check=1	
						lastphase=3
					}
		
				}
			}else{
				if(x>startx+16){
					x-=3
				}else{
					if(x<startx-16){
						x+=3
					}		
				}
			}
			}else{
#endregion	
#region Phase 3
				if(phase==3){
					if(check==1){
					
						if(optsave==0){
							optsave=1
						}else{
							optsave=0
						
						}
						if(optsavetwo==0){
							optsavetwo=1
								img=imgsave+1
								imgcap=1
								image_index=img
								imgsped=0.04
								range=48
								sped=0.3
						}else{
							optsavetwo=0
								img=imgsave+1
								imgcap=1
								image_index=img
								imgsped=0.032
								range=48
								sped=0.3

						}
						opt=optsave
						optsped=1
						optspedtwo=0.5
						optrange=132
						check=0
						attdeltwo=49
					
					}
				
					if(opt==0||opt==1){
							if(y>starty-16){
								y-=0.2
							}				
					}
					if(opt==0){
						if(x+optsped<=startx+optrange){
							x+=optsped

						}else{
							opt=2
						}
					}else{
						if(opt==1){
							if(x-optsped>=startx-optrange){
								x-=optsped
							}else{
								opt=3
							}
						}else{
							if(opt==2||opt==3){
								attdeltwo+=1
								if(optsavetwo==0){
									if(attdeltwo mod 55==0){
#region Leaf Attack							
										for(i=0;i<2;i+=1){
											created=instance_create_depth(x-8+i,y-(48+random(10)),depth-1,Abil)
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
												dmg=1
												startx=x
												starty=y
												rangetick=other.i
												range=24
										
												hsp=0
												if(other.i==1){
													vsp=0.1
												}else{
													vsp=0.2
												}
												vsp+=random(0.2)
												imgangle=0
										
												dur=1800
												move=1
												phasecheck=1
												imgangle=choose(0,180)
											}		
										}
#endregion								
									}
							
								}else{
									if(enopt==0||enopt==1){
#region Acorn Attack
					if(attdeltwo mod 65==0){
						audio_play_sound_at(choose(snd_boss_spit_1,snd_boss_spit_2),x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
						
						created=instance_create_depth(x,y+32,depth-1,Abil)
						with(created){
							sprite_index=enemy_abil_spr
							pin=30
							spin=5
							image_speed=0
							imgsped=0
									if(other.enopt==0){
										img=20+choose(0,1)
									}else{
										sprite_index=enemy_abil_two_spr
										img=choose(1,1,1,1,1,3,3,5)
										img+=choose(0,0,1)
									}
							image_index=img
							imgcap=0
							dmg=4
							part=0

							dur=500
							grav=0.02
							vsp=choose(0,1)
							hsp=choose(-0.5,0.2,0.2,0.5)
							imgangle=180
							dir=-1
							yrebound=0.9
							part=1
						
							en=1
							type=1
							move=1
							diddmg=0
							creator=other.id
							phase=0
							phasecheck=1
						}
					}
#endregion		
									}else{
								
									}
								}
								if(opt==2){
									if(x-optspedtwo>=startx-optrange){
										x-=optspedtwo
									}else{
										phase=2
										check=1
									}
								}else{
									if(opt==3){
										if(x+optspedtwo<=startx+optrange){
											x+=optspedtwo
										}else{
											phase=2
											check=1
										}
									}					
								}
							}				
						}				
					}
				}else{

#endregion
#region Phase 4
				if(phase==4){
					if(check==1){
						img=imgsave
						imgcap=1
						image_index=img
						imgsped=0.032
						range=48
						sped=0.3
					
						check=0
						attdeltwo=0
						opty=starty+97
						opttwo=choose(0,1)
						optthree=0
						optrange=148
						if(opttwo==0){
							optx=startx+optrange	
							optxtwo=startx-optrange	
						}else{
							optx=startx
							optxtwo=startx	
						}
					}
			enemy_move_scr(6)
			enemy_move_scr(7)	
				if(optthree<13){
					if(attdeltwo mod 25==0){
						optthree+=1
						if(optthree<11){
							for(i=0;i<2;i+=1){
								if(i==0){
									created=instance_create_depth(optx,opty,depth-1,Abil)
								}else{
									created=instance_create_depth(optxtwo,opty,depth-1,Abil)
								}
								audio_play_sound_at(choose(snd_boss_vine_1,snd_boss_vine_2,snd_boss_vine_3),x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
								with(created){
									sprite_index=enemy_abil_spr
									pin=34
									image_speed=0
									imgsped=0.07
								
									if(other.enopt==0){
										img=11
									}else{
										img=30
									}
									image_index=img
									imgcap=8
									dmg=1
									part=0

									dur=140
									grav=0
									vsp=0
									hsp=0
									en=1
									diddmg=1
									phase=0
								}						
							}
						}
					
						if(opttwo==0){
							optx-=16
							optxtwo+=16
						}else{
							optx+=16
							optxtwo-=16
						}
					}
				}else{
					if(optfour<2){
						check=1
					}else{
						phase=2
						check=1
					}
					optfour+=1
				}
				
				
					attdeltwo+=1
				}else{
#endregion	
				}
				}
			}
		}
		//Always
		eyes.color=color
		eyes.x=x
		eyes.y=y
		if(Me.x<x-32){
			eyes.image_index=13
		}else{
			if(Me.x>x+32){
				eyes.image_index=15
			}else{
				eyes.image_index=14
			}	
		}

	}else{
#endregion
#region Flying enemy
	//____________________________________________________________________________---------------------(Flying Enemy)---------------------____________________________________________________________________________
	if(pin==5){
				if(check==1){
				
					sprite_index=enemy_three_spr
					check=0
					hp=8
					hptotal=hp	
				
					//Regular Bat
					if(enopt==0){
						imgextra=0
						wallsped=-0.5
						sped=0.3
						rangetimertotal=240
						rangetimer=irandom(rangetimertotal)
						jump=-5.2
						jumptimertotal=130
						hp=8
						hptotal=hp	
					}else{
						//Fruit Bat
						if(enopt==1){
						imgextra=5
						wallsped=-0.3
						sped=0.1
						rangetimertotal=240
						rangetimer=irandom(rangetimertotal)
						jump=-4.8
						jumptimertotal=180
						hp=12
						if(enopt==3){
							hp=4
							hptotal=hp						
						}
						}else{
							//Attack Bat
							if(enopt==3){
								imgextra=0
								wallsped=-0.5
								sped=random_range(0.2,0.4)
								rangetimertotal=240
								rangetimer=irandom(rangetimertotal)
								jump=-5.2
								jumptimertotal=130
								hp=1
								hptotal=hp	
								team=3
							
							}else{
								if(enopt==4||enopt==5){
									//Apple
								imgextra=73
								wallsped=-0.3
								sped=0.2
								rangetimertotal=240
								rangetimer=irandom(rangetimertotal)
								jump=-4.8
								jumptimertotal=300
								drop=1
								item=2
								if(enopt==6){
									drop=1	
									item=10
								}
								}else{
									if(enopt==6||enopt==7){
										//Mushroom
									imgextra=44+15
									wallsped=-0.3
									sped=0.2
									rangetimertotal=240
									rangetimer=irandom(rangetimertotal)
									jump=-4.4
									jumptimertotal=180
									if(enopt==3){
										hp=4
										hptotal=hp						
									}
									}else{
						
									}							
								}	
							}			
						}
					}
						img=98+imgextra
						imgcap=3
						image_index=img
						imgsped=0.08
						imgspedsave=imgsped
						imgsave=img
						imgcapsave=imgcap

						startx=x
						range=128
						rangetick=choose(0,1)
						if(rangetick==1){
							dir=-1
						}
				
						wallimg=19+imgextra
						wallimgcap=3
						wallcheck=0
				
						jumptimer=irandom(jumptimertotal)
						jumpimg=17+imgextra
						jumpimgsave=jumpimg
						jumpimghurt=23+imgextra
						jumpimgsped=0.1
						groundcheck=0	
					grav=0
				}

						//Fruit Bat
						if(enopt==1){
							if(hurttick==1||hurtamount>0){
								enopt=0
								hp=8
								sped=0.3
								imgextra=0
								img=98+imgextra
								image_index=img
								item=10
								drop=1
								enemy_drop_scr()
								item=13
								drop=2
							}
						}
				//Grounded
				if(enopt!=3){
					enemy_move_scr(0)
				}else{
#region Attack Bat
					//Attack Bat
					if(Me.x-2>x){
						x+=sped
						dir=1
					}else{
						if(Me.x+2<x){
							x-=sped
							dir=-1
						}else{
				
						}				
					}
					if(Me.y-2>y){
						y+=sped
					}else{
						if(Me.y+2<y){
							y-=sped
						}else{
				
						}				
					}
#endregion
				}

	}else{
#endregion
#endregion
#region NPC
#region Apple Minigame
#region Stump Apple Minigame
	if(pin==100){
		if(phase==1){
			if(check==1){
				sprite_index=enemy_spr
				mask_index=enemy_spr_mask
				check=0
				img=31+Control.lvlArray[1010,23]*18
				imgcap=1
				image_index=img
				imgsped=0.015
				mask_index=dummy_spr
				grav=0
				starty=y
				tick=0
			}
		
			if((Control.lvlArray[1000,8]+40) mod 200 ==0){
				img=27+Control.lvlArray[1010,23]*18
				imgcap=0
				image_index=img
				imgsped=0			
			}else{
				if((Control.lvlArray[1000,8]+30) mod 200 ==0){
					img=28+Control.lvlArray[1010,23]*18
					imgcap=0
					image_index=img
					imgsped=0			
					tick=1
				}else{
					if((Control.lvlArray[1000,8]+16) mod 200 ==0){
						img=29+Control.lvlArray[1010,23]*18
						imgcap=0
						image_index=img
						imgsped=0
						tick=2
					}else{
						if(Control.lvlArray[1000,8] mod 200 ==0){
							img=31+Control.lvlArray[1010,23]*18
							imgcap=1
							image_index=img
							imgsped=0.015		
							tick=0
							Control.screenshake=6
							for(i=0;i<20;i+=1){
								created=instance_create_depth(other.x-26+random(52),other.y+15,Me.depth+1,Part)
								with(created){
									type=1
									pin=1
									depth=other.depth-1
									spin=1
									img=68+irandom(3)
									imgcap=1
									imgsped=0
									image_speed=0
									image_index=img
									dur=15+choose(0,0,0,1,1,2)+irandom(20)
									durtotal=dur
									hsp=0
									vsp=random_range(-0.1,-0.3)
											chance=random_range(0.6,1)
											chance=1
											xscale=chance
											yscale=chance
									image_angle=random(360)
								}		
							}
						}else{
							if(Control.lvlArray[1000,8]>20){
								if((Control.lvlArray[1000,8]-20) mod 200 ==0){
									y=starty
								}
							}
						}		
					}		
				}		
			}
			if(tick==1){
				y-=2
			}else{
				if(tick==2){
					y+=2
				}
			}
	
		}else{
	
		}
	}else{
#endregion
#region Birds Box Apple Minigame
	if(pin==101){
		if(phase==1){
			if(check==1){
				check=0
				sprite_index=enemy_spr
				mask_index=enemy_spr_mask
				check=0
				img=37+Control.lvlArray[1010,23]*4
				imgcap=1
				image_index=img
				imgsped=0.07
				mask_index=dummy_spr
				grav=0
						starty=y
						startx=x
						range=64
						rangetick=choose(0,1)
						rangetimertotal=20
						rangetimer=rangetimertotal/2
						sped=0.05
						if(rangetick==1){
							dir=-1
						}
			
				created=instance_create_depth(x,y,Me.depth-1,Enemy)
				with(created){
					pin=102
					mask_index=enemy_spr_mask
				}	
				createdtwo=instance_create_depth(x,y,Me.depth-1,Block)
				with(createdtwo){
					sprite_index=img_mask_spr
					check=0
					img=1
					imgcap=0
					image_index=img
					imgsped=0
				}	
			}
		
			if(y>starty-48){
				y-=0.3
					with(createdtwo){
						if(instance_place(x,y-1,Me)){
							Me.y-=0.31
						}
					}
			}else{
				phase=2
			}
		
		}else{
			if(phase==2){
						if(rangetick==0){
							if(startx+range>x&&!instance_place(x+1,y,Block)){
								x+=sped
								with(createdtwo){
									if(instance_place(x,y,Me)){
										Me.x+=other.sped+0.1
									}
								
								}
							}else{
								rangetick=1
								dir=-1
							}
						}else{
							if(startx-range<x&&!instance_place(x-1,y,Block)){
								x-=sped
								with(createdtwo){
									if(instance_place(x,y,Me)){
										Me.x-=other.sped+0.1
									}
								}
							}else{
								rangetick=0
								dir=1
							}			
						}
			}	
		}
		//Always
		hp=1000
		created.x=x
		created.y=y
		created.dir=dir
		created.color=color
	
		createdtwo.x=x
		createdtwo.y=y
		createdtwo.dir=dir
		hit=collision_rectangle(x+13-24, y+40-24, x+36-24, y+43-24, Abil, true, true)
		if(hit!=noone){
			with(hit){
				if(pin==100){
					y-=1
							with(other){
								Control.dmgArray[0,0]+=1
								if(other.item<3){
									dmgrecieved=other.item+1
									Control.dmgArray[Control.dmgArray[0,0],5]=100+other.item
									hurtamount=dmgrecieved
								}else{
									hurttimer=90
									hurttimertotal=hurttimer
									color=hurtcolor								
									dmgrecieved=other.item-3+1
									Control.dmgArray[Control.dmgArray[0,0],5]=100+other.item
									hurtamount=dmgrecieved
								}
							
								with(Control){
									dmgArray[dmgArray[0,0],6]=other.effectArray[0,3]
									dmgArray[dmgArray[0,0],7]=0
									dmgArray[dmgArray[0,0],8]=0
									dmgArray[dmgArray[0,0],9]=0
									dmgArray[dmgArray[0,0],10]=0
			
			
									dmgArray[dmgArray[0,0],0]=dmgArray[0,1]
									dmgArray[dmgArray[0,0],1]=other.dmgrecieved
									dmgArray[dmgArray[0,0],2]=other.x
									dmgArray[dmgArray[0,0],3]=other.y+13
								
								}
							}
				
					if(item<3){
						Control.lvlArray[1000,4]+=item+1
						for(i=0;i<20;i+=1){
							created=instance_create_depth(other.x-8+random(16),other.y+15,Me.depth+1,Part)
							with(created){
							type=1
							pin=1
							depth=other.depth+1
							spin=1
							img=57+other.item*2+choose(0,1)
							imgcap=1
							imgsped=0
							image_speed=0
							image_index=img
							dur=40+choose(0,0,0,1,1,2)+irandom(30)
							durtotal=dur
							hsp=0
							vsp=random_range(-0.1,-0.5)
										chance=random_range(0.6,1)
										chance=1
										xscale=chance
										yscale=chance
							}		
						}
					}else{
						chance=item-3+1
						if(Control.lvlArray[1000,4]-chance>0){
							Control.lvlArray[1000,4]-=chance
						}else{
							Control.lvlArray[1000,4]=0
						}
					
						for(i=0;i<10;i+=1){
							created=instance_create_depth(other.x-8+random(16),other.y+15,Me.depth+1,Part)
							with(created){
							type=1
							pin=1
							depth=other.depth+1
							spin=1
							img=63+irandom(3)
							imgcap=1
							imgsped=0.03
							image_speed=0
							image_index=img
							dur=50+choose(0,0,0,1,1,2)+irandom(30)
							durtotal=dur
							hsp=0
							image_angle=random(360)
							vsp=random_range(-0.1,-0.3)
										chance=random_range(0.6,1)
										chance=1
										xscale=chance
										yscale=chance
							}		
						}				
					}
			
				instance_destroy()
				}
			}
		}
	}else{
#endregion
#region Bird Box Back
	if(pin==102){
		if(phase==1){
			if(check==1){
				check=0
				sprite_index=enemy_spr
				mask_index=enemy_spr_mask
				check=0
				img=35+Control.lvlArray[1010,23]*4
				imgcap=1
				image_index=img
				imgsped=0.07
				mask_index=dummy_spr
				grav=0
			}
		}else{
	
		}
	}else{
#endregion
#region Birds eat worms
	if(pin==104){
		if(phase==1){
			if(check==1){
				check=0
				sprite_index=enemy_spr
				check=0
				img=53+Control.lvlArray[1010,23]*2
				imgcap=1
				image_index=img
				imgsped=0.03
				mask_index=dummy_spr
				grav=0	
				attcd=0
				attcdtotal=40
			}
#region Birds eat worms
	if(attcd>0){
	attcd-=1
		if(attcd==attcdtotal-10){
				img=53+5+Control.lvlArray[1010,23]*2
				imgcap=0
				image_index=img
				imgsped=0	
		}else{
			if(attcd==attcdtotal-20){
				img=53+Control.lvlArray[1010,23]*2
				imgcap=1
				image_index=img
				imgsped=0.03	
			}else{

			}
		}
	}else{

		hit=collision_rectangle(x+13-24-2, y+40-24+3, x+36-24+2, y+43-24+3, Abil, true, true)
		if(hit!=noone){
					img=53+4+Control.lvlArray[1010,23]*2
					imgcap=0
					image_index=img
					imgsped=0	
				
					attcd=attcdtotal
			with(hit){
				if(pin==100){
					if(item>=3){
						item-=3
					imgcap=0
					img=61+item
					dur=1500
					image_index=img
						for(i=0;i<5;i+=1){
							created=instance_create_depth(other.x-6+random(12),other.y+15,Me.depth+1,Part)
							with(created){
							type=1
							pin=1
							depth=other.depth+1
							spin=1
							img=63+irandom(3)
							imgcap=1
							imgsped=0.03
							image_speed=0
							image_index=img
							dur=50+choose(0,0,0,1,1,2)+irandom(30)
							durtotal=dur
							hsp=0
							image_angle=random(360)
							vsp=random_range(-0.1,-0.3)
										chance=random_range(0.6,1)
										chance=1
										xscale=chance
										yscale=chance
							}		
						}				
					}
					phase=0
					grav=0.1
					vsp=1
					chance=choose(0,1,2)
					if(chance==0){
						temp=2
					}else{
						if(chance==1){
						temp=3
						}else{
							temp=1
						}		
					}		
					grav=0.1
					gravtwo=0.04
					gravthree=0.01
					imgangle=random(360)		
						if(temp==1){
						imgangle=340
							hsp=2.3
							vsp=-3.2
						}else{
							if(temp==2){
							imgangle=210
								hsp=1.7
								vsp=-4.2		
							}else{
								if(temp==3){
									imgangle=-85
									hsp=2.9
									vsp=-2.2
								}else{
			
								}			
							}		
						}
						imgangle=imgangle*other.dir
						hsp = hsp*other.dir
						if(dur<150){
							dur=150
						}			
				}
			}
		}
		}
#endregion
		}else{
	
		}
	}else{
#endregion
#endregion
#region Witch Minigame/Miniboss
#region Witch
	if(pin==105){
#region Recipe Witch
		if(phase==1){

			if(check==1){
					sprite_index=enemy_spr
					check=0
					//img=74+Control.lvlArray[1000,23]*18
				
					if(enopt==0){
						img=68
					}else{
						img=98
					}
				
					imgsave=img
					imgcap=1
					image_index=img
					imgsped=0.015
					imgspedsave=imgsped
					playerhurt=0
					grav=0
					starty=y
					tick=0
					immune=1
					brew=0
					brewtick=0
					cd=0
					xpdrop=30+irandom(5)
					
					
	if(Control.lvlArray[1000,0]!=2){
					recipe=instance_create_depth(x+2,y-35,24,Part)
					with(recipe){
						pin=9999999999
						sprite_index=enemy_abil_spr
						image_index=97+Control.lvlArray[1010,31]
						grav=0
						hsp=0
						vsp=0
						dur=999999
						imgsped=0
						img=image_index
						imgcap=0
					}
					recipetwo=instance_create_depth(x-1,y-30,24,Part)
					with(recipetwo){
						pin=9999999999
						sprite_index=healthbar_spr
						image_index=5
						grav=0
						hsp=0
						vsp=0
						dur=999999
						imgsped=0
						img=image_index
						imgcap=0
					}

			}
			}
	if(Control.lvlArray[1000,0]!=2){
				with(recipe){
					image_index=97+Control.lvlArray[1010,31]
					dur=999999
					y-=(Control.targetpos/8)
				}
				with(recipetwo){
					y-=(Control.targetpos/8)
				}
	}
		if(cd>0){
			if(brew!=0){
				if(instance_exists(brew)){
					brew.grav=0.1
					brew=0
				}
			}
			cd-=1
			if(cd==100){
				img=imgsave+3+(chancesave*2)
				image_index=img
				imgsped=0
				imgcap=1
			}else{
				if(cd==50){
					image_index+=1
				}else{
					if(cd==0){
						image_index=imgsave
						img=imgsave
						imgsped=imgspedsave
					}
				}
			}
		}else{
			if(brew!=0){
				if(brew==Control.lvlArray[1010,20]||brew==Control.lvlArray[1010,25]||brew==Control.lvlArray[1010,26]){
					brew=0
				}
				if(instance_exists(brew)&&brew!=0){
					if(brewtick==0){
						if(brew.y>y-8||brew.x<x-0.5||brew.x>x+0.5){
							if(brew.y>y+2.5){
								image_index=imgsave+2
								img=imgsave+2
								imgsped=0
							}else{
								if(brew.y>y-5){
									image_index=imgsave+1
									img=imgsave+1
									imgsped=0
								}else{
									image_index=imgsave
									img=imgsave
									imgsped=0
								}
							}
								brew.grav=0
								brew.hsp=0
								brew.vsp=0
							if(brew.y>y-8){
								brew.y-=0.3
							}
							if(brew.x<x-0.3){
								brew.x+=0.3
								brew.imgangle+=5
							}
							if(brew.x>x+0.3){
								brew.x-=0.3
								brew.imgangle-=5
							}	
							if(brew.x>=x-0.5&&brew.x<=x+0.5){
								brew.imgangle+=5
							}
						}else{
								brewtick=1
								brew.grav=0.2
								brew.vsp=0.1
								brew.depth=26
								brew.x=x
								image_index=imgsave+2
								img=imgsave+2
								imgsped=0
						}
					}else{
						if(brew.y>=y+13){
							if(Control.lvlArray[1000,0]!=2){
						
								chancesave=choose(0,1)
								if(brew.item!=Control.lvlArray[1010,31]){
									chancesave=0
								
									Control.lvlArray[1000,4]+=1
									chance=1
									audio_play_sound_at(snd_boss_witch_potion_1,x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
								}else{
									chancesave=1
									Control.lvlArray[1000,4]+=5
									chance=5
									audio_play_sound_at(snd_boss_witch_potion_2,x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
								}
							
								Control.dmgArray[0,0]+=1
									dmgrecieved=chance
									Control.dmgArray[Control.dmgArray[0,0],5]=111
									hurtamount=dmgrecieved
							
								with(Control){
									dmgArray[dmgArray[0,0],6]=other.effectArray[0,3]
									dmgArray[dmgArray[0,0],7]=0
									dmgArray[dmgArray[0,0],8]=0
									dmgArray[dmgArray[0,0],9]=0
									dmgArray[dmgArray[0,0],10]=0
			
			
									dmgArray[dmgArray[0,0],0]=dmgArray[0,1]
									dmgArray[dmgArray[0,0],1]=other.dmgrecieved
									dmgArray[dmgArray[0,0],2]=other.x
									dmgArray[dmgArray[0,0],3]=other.y+13
								
								}
							
							
								Control.lvlArray[1010,31]=Control.lvlArray[1010,32]
								Control.lvlArray[1010,32]=Control.lvlArray[1010,33]
								Control.lvlArray[1010,33]=10+irandom(3)
							
								for(i=0;i<20;i+=1){
									created=instance_create_depth(other.x-5+random(12),other.y+15,Me.depth+1,Part)
									with(created){
									type=1
									pin=1
									depth=other.depth-1
									spin=1
									img=57+irandom(1)+(other.chancesave*2)
									imgcap=1
									imgsped=0
									image_speed=0
									image_index=img
									dur=40+choose(0,0,0,1,1,2)+irandom(30)
									durtotal=dur
									hsp=0
									vsp=random_range(-0.3,-0.9)
												chance=random_range(0.6,1)
												chance=1
												xscale=chance
												yscale=chance
									}		
								}
								if(chancesave==0){
									for(i=0;i<10;i+=1){
										created=instance_create_depth(other.x-5+random(12),other.y+15,Me.depth+1,Part)
										with(created){
										type=1
										pin=1
										depth=other.depth-1
										spin=1
										if(other.chancesave==0){
											chance=1
										}else{
											chance=0
										}
										img=2+irandom(2)+(chance*70)
										imgcap=0
										imgsped=0
										image_speed=0
										image_index=img
										dur=60+choose(0,0,0,1,1,2)+irandom(60)
										durtotal=dur
										hsp=0
										image_angle=random(360)
										vsp=random_range(-0.25,-0.6)
													chance=random_range(0.6,1)
													chance=1
													xscale=chance
													yscale=chance
										}		
									}
								}
							
							with(brew){
								instance_destroy()
							}
								brew=0
								cd=118
						}else{
							phase=2
							check=1
							//Miniboss Mode
					
						}	
						}
					}
				}else{
					brew=0
				}
			}
		}
		}else{
#endregion
#region Fight Witch
			if(phase==2){
#region Phase 1 Brew fighting
#region Check
				if(check==1){
					audio_play_sound_at(snd_boss_witch_transform_1,x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
					check=0
					playerhurt=1
					startx=x
					atttypetwo=0
					atttype=2
					atttick=1
					attcdtotal=200
					attcd=120
					img=106
					imgsave=img
					image_index=img
					imgsped=0.03
					imgspedsave=imgsped
					immune=0
					mask_index=sprite_index
					hurttick=0
					dmgrecieved=0
					hp=300
					hptotal=hp
					starty=y
					sndobjectone=noone
									with(Enemy){
										if(pin==106){
											cd=31
											imgsave=119
											imgsped=0.3
											image_index=img
										}
									}	
				}
#endregion
				if(instance_exists(sndobjectone)){
					with(sndobjectone){
						audio_emitter_position(sndemitone,other.x,other.y,0)	
					}					
				}
				if(attcd>0){
					attcd-=1
					if(attcd==80){
						imgsped=0
						img=108
						image_index=img
					}else{
						if(attcd==45){
							img+=1
							image_index=img
						}else{
							if(attcd==40){
									with(Enemy){
										if(pin==106){
											if(atttick==other.atttick){
													cd=30
													imgsped=0
													img=123
													image_index=img
											}
										}
									}
										if(atttype>0){
											atttype-=1
											if(atttype==0){
											//Teleport
											
											sndobjectone=instance_create_depth(x,y,0,Snd)
											with(sndobjectone){
												dur=100
												sndemitone=audio_emitter_create()				
												audio_play_sound_on(sndemitone,choose(snd_boss_witch_teleport_1,snd_boss_witch_teleport_2),false,8)
												audio_emitter_falloff(sndemitone, 48, Control.falloff_max, Control.falloff_factor)					
											}	

												if(atttick==0){
													atttick=choose(1,2)
												}else{
													if(atttick==1){
														atttick=choose(0,2)
													}else{
														if(atttick==2){
															atttick=choose(0,1)
														}else{
										
														}										
													}										
												}
												with(Enemy){
													if(pin==106){
														if(atttick==other.atttick){
															cd=30
															imgsped=0
															img=123
															image_index=img
														}
													}
												}
											}
										}
							}else{
									if(attcd==25){
									
										if(atttype==0){
											//Teleport
											atttype=2
										
											if(atttick==0){
												x=brewone.x
												y=brewone.y
											}else{
												if(atttick==1){
													x=brewtwo.x
													y=brewtwo.y
												}else{
													if(atttick==2){
														x=brewthree.x
														y=brewthree.y
													}else{
										
													}										
												}										
											}
										}else{
											if(atttypetwo==0){
												atttypetwo=1
												//Spawn Bats
												with(Enemy){
													if(pin==106){
														audio_play_sound_at(choose(snd_pet_bat_attack_1,snd_pet_bat_attack_2),x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
														attcd=1
													}
												}
											}else{
												atttypetwo=0
#region Skull Attack
				audio_play_sound_at(choose(snd_boss_witch_cast_1,snd_boss_witch_cast_2),x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
					for(i=0;i<4;i+=1){
						created=instance_create_depth(x,y,depth-1,Abil)
						with(created){
							sprite_index=enemy_abil_spr
							pin=30
							spin=5
							image_speed=0
							imgsped=0
							img=94
							image_index=img
							imgcap=0
							dmg=2
						
							dur=400
							grav=0.1
							vsp=choose(-2.5,2.5)
							hsp=-0.5

							dur=350
						
							speed=2
						
							if(other.i==0){
								direction=random_range(30,35)
							}else{
								if(other.i==1){
									direction=random_range(60,65)
								}else{
									if(other.i==2){
										direction=random_range(150,145)
									}else{
										if(other.i==3){
											direction=random_range(120,125)
										}else{

										}
									}
								}
							}
							hsp=hspeed
							vsp=vspeed
							speed=0
						
							imgangle=180
							dir=-1
							yrebound=0.9
							part=1
						
							en=1
							type=1
							move=1
							diddmg=0
							creator=other.id
							phase=0
							phasecheck=1
							hsp=hsp*other.dir
						}
					}
#endregion											
											}
										}

									
									}else{
										if(attcd==0){
											img=imgsave
											imgsped=imgspedsave
											image_index=img
										}			
								}
							}			
						}
					}
				}else{
					attcd=attcdtotal
				}
				if(hp<hptotal/2){
					phase=3
					check=1
				}
			}else{
#endregion
#region Phase 2 Witch Flying
				if(phase==3){
					if(check==1){
						check=0
						img=113
						imgsave=img
						image_index=img
						imgsped=0.05
						imgspedsave=imgsped
						phasetick=1
						imgcap=1
						sped=0.9
						range=12
						rangetick=0
						rangetimer=500
						rangetimertotal=rangetimer
						wallcheck=0
							xtarget=irandom_range(startx-200,startx+200)
							ytarget=irandom_range(starty-150,starty+5)
							ytarget=starty-150
											sndobjectone=instance_create_depth(x,y,0,Snd)
											with(sndobjectone){
												dur=700
												sndemitone=audio_emitter_create()				
												audio_play_sound_on(sndemitone,choose(snd_witch_broom_1,snd_witch_broom_2),false,8)
												audio_emitter_falloff(sndemitone, 48, Control.falloff_max, Control.falloff_factor)					
											}	
					}
						if(instance_exists(sndobjectone)){
							with(sndobjectone){
								audio_emitter_position(sndemitone,other.x,other.y,0)	
							}					
						}else{
							sndobjectone=instance_create_depth(x,y,0,Snd)
							with(sndobjectone){
								dur=700
								sndemitone=audio_emitter_create()				
								audio_play_sound_on(sndemitone,choose(snd_witch_broom_1,snd_witch_broom_2),false,8)
								audio_emitter_falloff(sndemitone, 48, Control.falloff_max, Control.falloff_factor)					
							}						
						
						}
					for(i=0;i<1;i+=1){
						created=instance_create_depth(x-6+random(12),y-6+random(12)+18,0,Part)
						with(created){
						type=1
						pin=1
						depth=other.depth+1
						spin=1
						if(choose(0,1)==0){
							img=72
							imgcap=2
						}else{
							img=34
							imgcap=1		
						}
						imgsped=0
						image_speed=0
						image_index=irandom_range(img,img+imgcap)
						dur=8+choose(0,0,0,1,1,2)+irandom(12)
						durtotal=dur
						hsp=0
						vsp=0
						image_angle=random(360)
									chance=random_range(0.6,1)
									chance=1
									xscale=chance
									yscale=chance
						}		
					}				
					if(phasetick==1){
								chance=0
								if(y+sped<ytarget){
									y+=sped
								}else{
									if(y-sped>ytarget){
										y-=sped
									}else{
										y=ytarget
										chance+=1
									}							
								}
								if(x+sped<xtarget){
									x+=sped
									dir=1
								}else{
									if(x-sped>xtarget){
										x-=sped
										dir=-1
									}else{
										x=xtarget
										chance+=1
									}							
								}
								if(rangetimer>0){
									rangetimer-=1
										if(chance==2){
											xtarget=irandom_range(startx-200,startx+200)
											ytarget=irandom_range(starty-150,starty+5)
										}
								}else{
									xtarget=startx
									ytarget=starty-140
									if(chance==2){
										rangetimer=rangetimer
										phasetick=0
										attcd=60
										img=112
										image_index=img
										imgsped=0
										imgcap=0
									}
								}
						
					}else{
						if(phasetick==0){
							if(attcd>0){
								attcd-=1
								y+=0.1
								if(attcd==40){
									img=111
									image_index=img		
									y-=5
									audio_play_sound_at(choose(snd_boss_witch_yell_1,snd_boss_witch_yell_2),x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
								}else{		
									if(attcd==20){
										img=112
										image_index=img	
										y+=3
									}else{
										if(attcd==0){
											check=1
#region Bat AOE
								audio_play_sound_at(choose(snd_witch_bat_1,snd_witch_bat_2),x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
								for(i=0;i<144;i+=1){
										created=instance_create_depth(x-5+random(10),y+5-5+random(10),depth-1,Abil)
										with(created){
											sprite_index=abil_spr
											pin=32
											image_speed=0
											imgsped=0.1
											speed=random_range(0.8,1.2)
												dur=450
												img=choose(14,22)
												imgcap=2	
											image_index=img+irandom(imgcap)
										
											en=1
										
											direction=other.i*2.5
											hsp=hspeed
											vsp=vspeed
											speed=0
								
											move=1
											phasecheck=0
											if(hsp<0){
												dir=-1
											}
										}	
								}
#endregion										
										}
									}
								}
							}
						}
					}
					if(phasetick==2){

					}
				}
#endregion
			}
#endregion
		}
	}else{
#endregion
#region Cauldron
	if(pin==106){
		if(phase==1){
			if(check==1){
				team=3
				check=0
					sprite_index=enemy_spr
					check=0
					//img=74+Control.lvlArray[1000,23]*18
					img=76
					if(enopt==1){
						img=119
						img=125
					}
					cd=0
					imgcap=3
					image_index=img
					immune=1
					imgsped=0.015
					mask_index=dummy_spr
					grav=0
					starty=y
					tick=0
					imgspedsave=imgsped
					imgsave=img
					attcd=0
			}
			if(attcd>0){
			attcd-=1
				created=instance_create_depth(x,y-3,10,Enemy)
				created.pin=5
				created.enopt=3		
			}
			if(cd>0){
				cd-=1
				if(cd==29){
					 imgsped=0
					 img=123
					 image_index=img
				}else{
					if(cd==10){
						imgsped=0
						img=124
						image_index=img	
#region Potion Effect
										chancesave=0
											for(i=0;i<20;i+=1){
												created=instance_create_depth(x-5+random(12),y+8,Me.depth+1,Part)
												with(created){
												type=1
												pin=1
												depth=other.depth-1
												spin=1
												img=57+irandom(1)+(other.chancesave*2)
												imgcap=1
												imgsped=0
												image_speed=0
												image_index=img
												dur=40+choose(0,0,0,1,1,2)+irandom(30)
												durtotal=dur
												hsp=0
												vsp=random_range(-0.3,-0.9)
															chance=random_range(0.6,1)
															chance=1
															xscale=chance
															yscale=chance
												}
											}
									if(chancesave==0){
										for(i=0;i<10;i+=1){
											created=instance_create_depth(x-5+random(12),y+8,Me.depth+1,Part)
											with(created){
											type=1
											pin=1
											depth=other.depth-1
											spin=1
											if(other.chancesave==0){
												chance=1
											}else{
												chance=0
											}
											img=2+irandom(2)+(chance*70)
											imgcap=0
											imgsped=0
											image_speed=0
											image_index=img
											dur=60+choose(0,0,0,1,1,2)+irandom(60)
											durtotal=dur
											hsp=0
											image_angle=random(360)
											vsp=random_range(-0.25,-0.6)
														chance=random_range(0.6,1)
														chance=1
														xscale=chance
														yscale=chance
											}		
										}
									}
#endregion
					}else{
						if(cd==0){
							imgsped=0.03
							img=119
							image_index=img
						}
					}
				}
			}
		
		}else{
	
		}
	}else{
#endregion
#endregion
#region Elmwood Miniboss
#region Elmwood
	if(pin==107){
		if(phase==1){
			if(check==1){
					check=0
				if(enopt==0){
					hp=300
					hptotal=hp
					sprite_index=enemy_spr
					check=0
					img=130
					imgsave=img
					imgcap=1
					image_index=img
					imgsped=0.02
					imgspedsave=imgsped
					grav=0
					starty=y
					tick=0
					starty=y
					attcd=450
					attcdtotal=450
					attopt=0
					intval=16
					hpvalcheck=0
					
					xpdrop=30+irandom(5)
					
				chance=140
				arenax=x-chance
				arenaxtwo=x+chance
				arenay=y-150
				

						remone=instance_create_depth(x-10,y-32,35,Enemy)
						with(remone){
							pin=108
							starty=y
							startx=x
							attcd=500
							extrax=0
							creator=other.id
						}
					
						remtwo=instance_create_depth(x-4,y-29,36,Enemy)
						with(remtwo){
							pin=108
							starty=y
							startx=x
							attcd=900
							extrax=0
							enopt=2
							creator=other.id
						}
						remthree=instance_create_depth(x,y-32,35,Enemy)
						with(remthree){
							pin=108
							starty=y
							startx=x
							attcd=900
							enopt=1
							extrax=0
							creator=other.id
						}
						remfour=instance_create_depth(x+4,y-29,36,Enemy)
						with(remfour){
							pin=108
							starty=y
							startx=x
							attcd=900
							extrax=0
							enopt=3
							creator=other.id
						}
						remfive=instance_create_depth(x+10,y-32,35,Enemy)
						with(remfive){
							pin=108
							starty=y
							startx=x
							attcd=900
							extrax=0
							creator=other.id
						}
				}else{
				
				}
			}
		}
			
			if(hpvalcheck==0){
				if(hp<hptotal/2){
					hpvalcheck=1
					intval=5
				}
			}
#region Attack Sequence
		if(attcd>0){
			attcd-=1
			
		#region Slam Attack
			if(attopt==0){
				if(attcd==90){
					img=imgsave+2
					image_index=img
					imgsped=0
					
							audio_play_sound_at(choose(snd_boss_yell_3,snd_boss_yell_4),x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
				}else{
					if(attcd==70){
						img=imgsave+3
						image_index=img
					}else{
						if(attcd==54){
							img=imgsave+4
							image_index=img
							Control.screenshake=12
							audio_play_sound_at(choose(snd_boss_slam_1,snd_boss_slam_2),x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
							audio_play_sound_at(choose(snd_boss_slam_3,snd_boss_slam_3),x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
								for(i=0;i<20;i+=1){
									created=instance_create_depth(other.x-26+random(52),other.y+13,Me.depth+1,Part)
									with(created){
										type=1
										pin=1
										depth=other.depth-1
										spin=1
										img=68+irandom(3)
										imgcap=1
										imgsped=0
										image_speed=0
										image_index=img
										dur=15+choose(0,0,0,1,1,2)+irandom(20)
										durtotal=dur
										hsp=0
										vsp=random_range(-0.1,-0.3)
												chance=random_range(0.6,1)
												chance=1
												xscale=chance
												yscale=chance
										image_angle=random(360)
									}		
								}
	#region Acorn
					chance=2		
						for(i=0;i<chance;i+=1){
							created=instance_create_depth(random_range(arenax,arenaxtwo),arenay,depth-1,Abil)
							with(created){
								sprite_index=enemy_abil_spr
								pin=30
									spin=choose(2,4,6)
									dir=choose(1,-1)
								image_speed=0
								imgsped=0
									img=choose(3,4)
						
								image_index=img
								imgcap=0
								dmg=1

								dur=400
								grav=0.01
								vsp=0
								hsp=0
								imgangle=180
								dir=-1
								yrebound=0.4
								part=0
						
								en=1
								type=1
								move=1
								diddmg=0
								creator=other.id
								phase=0
								phasecheck=1
							}
						}
						chance=2
						for(i=0;i<chance;i+=1){
							created=instance_create_depth(random_range(x-64,x-32)+(i*16*5),arenay,depth-1,Abil)
							with(created){
								sprite_index=enemy_abil_spr
								pin=30
									spin=choose(2,4,6)
									dir=choose(1,-1)
								image_speed=0
								imgsped=0
									img=choose(3,4)
						
								image_index=img
								imgcap=0
								dmg=1

								dur=300
								grav=0.01
								vsp=0
								hsp=0
								imgangle=180
								dir=-1
								yrebound=0.4
								part=0
						
								en=1
								type=1
								move=1
								diddmg=0
								creator=other.id
								phase=0
								phasecheck=1
							}
						}
	#endregion				
						}else{
							if(attcd==0){
								img=imgsave
								image_index=img
								imgsped=imgspedsave
								y=starty
								attcd=attcdtotal
								attopt=choose(0,1,1)
							}
						}
					}
				}
				if(attcd<=90&&attcd>70){
					y-=2
				}else{
					if(attcd<70&&attcd>54){
						y+=3
					}else{
				
					}	
				}
				
			}else{
		#endregion
		#region Cry Attack
			if(attcd==180){
					img=imgsave+5
					image_index=img
					imgsped=0				
			}else{
				if(attcd==30){
						img=imgsave+7
						image_index=img
						imgsped=0	

				}else{
					if(attcd==0){
						img=imgsave
						image_index=img
						imgsped=imgspedsave
						y=starty
						attcd=attcdtotal
						attopt=choose(0,0,1)
					}			
				}			
			}
			if(attcd>30&&attcd<160){
				if(attcd>30){
					if(attcd mod 20==0){
						if(img==imgsave+5){
							img=imgsave+6
							image_index=img					
						}else{
							img=imgsave+5
							image_index=img							
						}
					}
				}
				if(attcd mod intval==0){
						audio_play_sound_at(choose(snd_enemy_spit_high_1,snd_enemy_spit_high_2),x-2+irandom(4),y-4+irandom(8), 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
								chance=irandom(360)
								for(i=0;i<20;i+=1){
									created=instance_create_depth(x-2+random(4),y-1.5+random(3)+8,0,Part)
									with(created){
									type=1
									pin=1
									depth=other.depth-1
									spin=1
									
									if(choose(0,1)==0){
										img=68
									}else{
										img=22
									}
									
									imgcap=3
									imgsped=0
									image_speed=0
									image_index=irandom_range(img,img+imgcap)
									image_index=img
									dur=6+choose(0,0,0,1,1,2)+irandom(10)
									direction=other.i*18+other.chance
									speed=random_range(0.2,0.3)
									durtotal=dur
									hsp=hspeed
									vsp=vspeed
									chance=random_range(0.7,1)
									chance=1
									xscale=chance
									yscale=chance
									image_angle=random(360)
									}		
								}	
						
						created=instance_create_depth(x-2+irandom(4),y+3+irandom(12),depth-1,Abil)
							
						with(created){
							sprite_index=items_spr
							partmake=1
							pin=32
							image_speed=0
							imgsped=0
							img=78+irandom(4)
							image_index=img
							imgcap=1	
							en=1
							sped=random_range(0.4,1.2)
							if(Me.x<x){
								chance=choose(x+100,x-100,x-100)
							}else{
								chance=choose(x+100,x+100,x-100)
							}
							move_towards_point(chance,y-32+irandom(40),sped)
							imgangle=direction
							hsp=hspeed
							vsp=vspeed
							speed=0
								
							dur=300
							move=1
							phasecheck=0
						}	
				}
			}
		#endregion
		
			}
		}
#endregion
			if(hp<=hptotal-50){
				if(remfive.attcd==900){
					remfive.attcd=500
				}
					if(hp<=hptotal-100){
						if(remthree.attcd==900){
							remthree.attcd=500
						}
							if(hp<=hptotal-150){
								if(remtwo.attcd==900){
									remtwo.attcd=500
								}
									if(hp<=hptotal-200){
										if(remfour.attcd==900){
											remfour.attcd=500
										}
									}
							}
					}
			}

			remy=starty-y
			if(image_index>=imgsave&&image_index<imgsave+1){
				with(remone){
					x=startx+0.3+extrax
					y=starty-0.5
				}
				with(remtwo){
					x=startx+0.15+extrax
					y=starty-1
				}
				with(remthree){
					x=startx+extrax
					y=starty-0.5
				}
				with(remfour){
					x=startx+0.15+extrax
					y=starty-1
				}
				with(remfive){
					x=startx-0.3+extrax
					y=starty-0.5
				}
			}else{
					if(image_index>=imgsave+1&&image_index<imgsave+2){
					with(remone){
						x=startx-0.3+extrax
						y=starty
					}
					with(remtwo){
						x=startx-0.15+extrax
						y=starty+0.5
					}
					with(remthree){
						x=startx+extrax
						y=starty
					}
					with(remfour){
						x=startx+0.15+extrax
						y=starty+0.5
					}
					with(remfive){
						x=startx+0.3+extrax
						y=starty
					}
				}else{
						if(image_index>=imgsave+2&&image_index<imgsave+3){
						with(remone){
							x=startx-0.3+extrax
							y=starty-other.remy+1
						}
						with(remtwo){
							x=startx-0.15+extrax
							y=starty+0.5-other.remy+1
						}
						with(remthree){
							x=startx+extrax
							y=starty-other.remy+1
						}
						with(remfour){
							x=startx+0.15+extrax
							y=starty+0.5-other.remy+1
						}
						with(remfive){
							x=startx+0.3+extrax
							y=starty-other.remy+1
						}
					}else{
							if(image_index>=imgsave+3&&image_index<imgsave+4){
							with(remone){
								x=startx-1+extrax
								y=starty-5-other.remy
							}
							with(remtwo){
								x=startx-0.5+extrax
								y=starty+0.5-3-other.remy
							}
							with(remthree){
								x=startx+extrax
								y=starty-6.5-other.remy
							}
							with(remfour){
								x=startx+0.5+extrax
								y=starty+0.5-3-other.remy
							}
							with(remfive){
								x=startx+1+extrax
								y=starty-5-other.remy
							}
						}else{
								if(image_index>=imgsave+4&&image_index<imgsave+5){
								with(remone){
									x=startx-0.3+extrax
									y=starty-other.remy+3
								}
								with(remtwo){
									x=startx-0.15+extrax
									y=starty+0.5-other.remy+3
								}
								with(remthree){
									x=startx+extrax
									y=starty-other.remy+3
								}
								with(remfour){
									x=startx+0.15+extrax
									y=starty+0.5-other.remy+3
								}
								with(remfive){
									x=startx+0.3+extrax
									y=starty-other.remy+3
								}
							}else{
			
							}				
						}			
					}			
				}
			}
	}else{
#endregion
#region Owls
#region Eggs
	if(pin==108){
		if(phase==1){
			if(check==1){
				team=3
				check=0
				hp=500
				hptotal=hp
				starty=y
				sprite_index=enemy_three_spr
				mask_index=dummy_spr
				check=0
				tick=0
				if(enopt==0){
					img=108
				}else{
					if(enopt==1){
						img=144
					}else{
						if(enopt==2){
							img=112
						}else{
							img=148
						}
					}
				}
				imgcap=1
				image_index=img
				imgsped=0
				grav=0
				starty=y
				tick=0
				imgsave=img
				shake=9999999999
				immune=1
					
			}
			if(instance_exists(creator)){
		
			}else{
				instance_destroy()
			}
			if(attcd>0&&attcd<900){
				attcd-=1
				if(attcd==500){
					shake=70
				}else{
					if(attcd==300){
						shake=65
					}else{
						if(attcd==200){
							shake=60
						}else{
							if(attcd==100){
								shake=55
							}else{
								if(attcd==50){
									shake=50
								}else{

								}
							}
						}
					}
				}
					if(attcd mod shake ==0){
						if(tick==0){
							tick=2
						}else{
							if(tick==1){
								tick=3
							}
						}
					}
					if(tick==2){
						extrax=0.5
						tick=1
					}else{
						if(tick==3){
							extrax=-0.5
							tick=0
						}else{
				
						}				
					}
			
				if(attcd==400){
					img=imgsave+1
					image_index=img
				}else{
					if(attcd==200){
						img=imgsave+2
						image_index=img
					}else{
						if(attcd==0){
							img=imgsave+3
							image_index=img	
							created=instance_create_depth(x,y,10,Enemy)
							with(created){
								pin=109
								enopt=other.enopt
							}
						}			
					}			
				}

			}
		}
	}else{
#endregion	
	#region Actual Owls
	if(pin==109){
		if(phase==1){
			if(check==1){
				team=3
				check=0
				wallcheck=0
				starty=y
				sprite_index=enemy_three_spr
				check=0
				tick=0
				if(enopt==0){
					img=123
					sped=0.3
					hp=12
					hptotal=hp
				}else{
					if(enopt==1){
						img=137
						sped=0.5
						hp=16
						hptotal=hp
					}else{
						if(enopt==2){
							img=116
							sped=0.4
							hp=16
							hptotal=hp
							attcd=400
							attcdtotal=attcd
						}else{
							img=130
							sped=0.5
							hp=24
							hptotal=hp
							attcd=300
							attcdtotal=attcd
						}
					}
				}
				imgcap=2
				image_index=img
				imgsped=0.1
				grav=0
				starty=y
				tick=0
				imgsave=img
				rangetimer=50
				startx=x
				starty=y
				xtarget=x
				ytarget=y
				phasetick=1
				imgsave=img
				imgspedsave=imgsped
					
			}
#region Attack
					if(attcd>0){
						attcd-=1
						if(attcd==40){
							img=imgsave+3
							image_index=img
							imgsped=0
						}else{
							if(attcd==30){
								img=imgsave+4
								image_index=img		
										created=instance_create_depth(x-5+random(10),y+5-5+random(10),depth-1,Abil)
										with(created){
											sprite_index=enemy_abil_spr
											pin=32
											image_speed=0
											imgsped=0
											speed=random_range(0.8,1.2)
												dur=450
														if(other.enopt==2){
															img=choose(117,118)
														}else{
															img=119
														}
											image_index=img
											imgcap=2	
											en=1
												sped=1
											move_towards_point(Me.x-3+random(6),Me.y-3+random(6),sped)
											imgangle=direction
											hsp=hspeed
											vsp=vspeed
											speed=0
								
											move=1
											phasecheck=0
											if(hsp<0){
											//	dir=-1
											}
										}
							}else{
								if(attcd==18){
									img=imgsave+4
									image_index=img		
											created=instance_create_depth(x-5+random(10),y+5-5+random(10),depth-1,Abil)
											with(created){
												sprite_index=enemy_abil_spr
												pin=32
												image_speed=0
												imgsped=0
												speed=random_range(0.8,1.2)
													dur=450
														if(other.enopt==2){
															img=choose(117,118)
														}else{
															img=119
														}
												image_index=img
												imgcap=2	
												en=1
													sped=0.9
												move_towards_point(Me.x-3+random(6),Me.y-3+random(6),sped)
												imgangle=direction
												hsp=hspeed
												vsp=vspeed
												speed=0
								
												move=1
												phasecheck=0
											}
								}else{
									if(attcd==6){
										img=imgsave+4
										image_index=img		
												created=instance_create_depth(x-5+random(10),y+5-5+random(10),depth-1,Abil)
												with(created){
													sprite_index=enemy_abil_spr
													pin=32
													image_speed=0
													imgsped=0
													speed=random_range(0.8,1.2)
														dur=450
														if(other.enopt==2){
															img=choose(117,118)
														}else{
															img=119
														}
													image_index=img
													imgcap=2	
													en=1
														sped=0.8
													move_towards_point(Me.x-3+random(6),Me.y-3+random(6),sped)
													imgangle=direction
													hsp=hspeed
													vsp=vspeed
													speed=0
								
													move=1
													phasecheck=0
												}
									}else{
										if(attcd==0){
											img=imgsave
											image_index=img
											imgsped=imgspedsave
											attcd=attcdtotal
										}
									}
								}
							}
						}
					}
#endregion
					if(phasetick==1){
						enemy_move_scr(8)
								if(rangetimer>0){
									rangetimer-=1
										if(chance==2){
											if(enopt==0||enopt==1){
												xtarget=irandom_range(Me.x-20,Me.x+20)
												ytarget=irandom_range(Me.y,Me.y-20)										
											}else{
												xtarget=irandom_range(startx-100,startx+100)
												xtarget=irandom_range(Me.x-32,Me.x+32)
											
												ytarget=irandom_range(starty-30,starty+5)
											
											}
										}
								}else{
									rangetimer=200
								}
						
					}
		}else{
	
		}
	}else{
		#region Flower Boss
		if(pin==110){

				if(check==1){
					check=0
					phase=0
					
					hp=80
					hptotal=80
					
					sprite_index=arcade_bee_big
					img=1
					imgsave=1
					imgcap=3
					imgsped=0.04
					image_index=img
					image_speed=0
					y-=12

					attcd=20
					
					attcdtwo=600
					attcdtwototal=attcdtwo
					attcdtwo=200
					attack=choose(1,2,3)
					phase=0
					hplow=0
				
				}	
	
				if(hp<=hptotal*0.5){
					if(img<5){
						img=5
						image_index=img
						//hplow=1
					}
				}
				
				//Idle Phase
				if(phase==0){
				
				if(attack==6){
					attack=1
				}else{
					if(attack==4){
						attack=2
					}else{
						if(attack==5){
							attack=3
						}else{
				
						}				
					}				
				}
				
					if(attcdtwo>0){
						attcdtwo-=1
					}else{
						attcdtwo=attcdtwototal
						if(attack==1){
							attack=choose(2,3)
						}else{
							if(attack==2){
								attack=choose(1,3)
							}else{
								if(attack==3){
									attack=choose(2,1)
								}else{
						
								}						
							}						
						}

										
						
						if(hp>=hptotal*0.5){
						//Summon
						if(attack==1){
							img=imgsave+8
						
							image_index=img
							imgcap=3
							imgsped=0
							attcdtwo=190
							attcdtwosav=190
							phase=1
							

						}else{
							//Petal Pop
							if(attack==2){
								img=imgsave+20
								image_index=img
								imgcap=11
								imgsped=0.06
								attcdtwo=9999
								attcdtwosav=450
								phase=1	
								phasetick=0
							}else{
								//Song
								if(attack==3){
									img=imgsave+33
									image_index=img
									imgcap=6
									imgsped=0.06
									attcdtwo=9999
									attcdtwosav=450
									phase=1	
									phasetick=0
									singlast=0
								}else{
							
								}							
							}
						}
						}else{
							
							
							//Summon
							if(attack==1){
								img=imgsave+8
									img=122						
								image_index=img
								imgcap=3
								imgsped=0
								attcdtwo=190
								attcdtwosav=190
								phase=1
								attack=6
							

							}else{
								//Head Pop
								if(attack==2){
									img=imgsave+79
									image_index=img
									imgcap=4
									imgsped=0.12
									attcdtwo=9999
									attcdtwosav=450
									phase=1	
									phasetick=0
									
									attack=4
									
									durtwo=600
								}else{
									//Dance Off
									if(attack==3){
										img=88
										image_index=img
										imgcap=4
										imgsped=0.06
										attcdtwo=50
										tick=0
										attcdtwosav=300
										phase=1	
										phasetick=0
										singlast=0
										
										attack=5
									}else{
							
									}							
								}
							}
						}
					
					}
				}else{
				
					//Summon
					if(attack==1){
					
					if(attcdtwo>0){
						attcdtwo-=1
						
						// Check if we're in low health state
						if(hp<=hptotal*0.5){
							// Low health summon animation (frames 122, 123, 124)
							if(attcdtwo<attcdtwosav-20&&img==122){
								img+=1
								image_index=img
							}else{
								if(attcdtwo<attcdtwosav-30&&img==123){
									img+=1
									image_index=img
									//imgcap=8  // Don't change imgcap mid-animation!
									imgsped=0.08
								}
							}
						}else{
							// High health summon animation (frames imgsave+8, imgsave+9, imgsave+10)
							if(attcdtwo<attcdtwosav-20&&img==imgsave+8){
								img+=1
								image_index=img
							}else{
								if(attcdtwo<attcdtwosav-30&&img==imgsave+9){
									img+=1
									image_index=img
									//imgcap=8  // Don't change imgcap mid-animation!
									imgsped=0.08
								}
							}
						}
						
						//Spawn little daisies
						if(attcdtwo mod 60==0){
									
									for(i=0;i<1;i+=1){
										with(Control){
											chance=xps+120-60+random(120)
											chancetwo=yps+70-60+random(120)
		

			
											//Create Enemy
											created=instance_create_depth(chance,chancetwo,0,Arcade_two)
			
											with(created){
												sprite_index=arcade_bee
												visible=false
												type=choose(1,1,2,3,choose(2,3))
				
												img=168+type*4
												imgsped=0.08
												imgcap=4
												image_index=img
												pin=1
				
				
												sped=0.08
												image_xscale=0.5
												image_yscale=0.5	
				
												attcd=20
				
												hp=1
				
												enpin=0
												xp=choose(1,1,1)
												sped=0.1
				
												//Sunflower
												if(type==0){
													hp=5
					
													sped=0.07
													enpin=2
													xp=choose(3,3,4)
												}else{
													//Daisy
													if(type==1){
														hp=2
						
														sped=0.16
														enpin=1
														xp=choose(2,2,3)
													}
												}
											}		
										}
									}
									
								}
						
					}else{
						attcdtwo=attcdtwototal
						phase=0
						
						if(hp<=hptotal*0.5){
							img=5
						}else{
							img=imgsave
						}
						image_index=img
						imgsped=0.04
						imgcap=3
					
					}			
					
					}else{
					
						//Petal Pop
						if(attack==2){
							
						if(attcdtwo>0){
						attcdtwo-=1
							if(phasetick==0){
								if(image_index>=imgsave+25){
									imgsped=0.15
								}								
								if(image_index>=img+imgcap-1){
									phasetick=1
									
									img=imgsave+29
									image_index=img
									imgsped=0.04
									imgcap=3		
									
								chance=0
								
								for(i=0;i<32;i+=1){
									
									
									created=instance_create_depth(x,y,10,Arcade_five)
									with(created){
										sprite_index=arcade_bee_big
										image_speed=0
										img=47+(other.chance)
										img=47+choose(0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,9,9,10)
										imgsped=0
										imgcap=1
										image_index=img
										pin=1
										creator=other.id
								
										dmgtotal=1
										dmg=dmgtotal
										diddmg=0
				
										sped=0.7
										sped=random_range(0.6,1.2)
										image_xscale=0.5
										image_yscale=0.5	
								
										dur=900
										durtotal=dur
										move=1
										phasecheck=1
								
										hsp=0
										vsp=0
								
										type=0
										
										tick=0
								
										if(type==0){
								
											speed=sped
											direction=random(360)+other.i*51.5
											
											hsp=hspeed
											vsp=vspeed
											image_angle=direction
									
											speed=0			
											
											
										}else{

									
									


										}
										
										x+=hsp*5
										y+=vsp*5
									}	
									chance+=1
									if(chance==7){
										chance=0
									}
								}	
																	
								
								}
								


							}else{
								if(phasetick==1){

								}
							}
						}else{
							attcdtwo=floor(attcdtwototal*0.01)
							phase=0
							phasetick=0
							attcdtwo=60
						
							if(hp<=hptotal*0.5){
								img=5
							}else{
								img=imgsave
							}
							image_index=img
							imgsped=0.04
							imgcap=3						
						}
						}else{
						
							//Song Sing
							if(attack==3){
								if(phasetick==0){
								if(image_index>=img+imgcap-1){
									img=imgsave+38
									image_index=img
									imgsped=0.06
									imgcap=6  // Continue with same imgcap
									
									attcdtwo=600
									phasetick=1
								}
								}else{
									
									if(attcdtwo>0){
										attcdtwo-=1

											chance=floor(image_index)

												//if(attcdtwo mod 50 ==0){
											if(chance==40||chance==41||chance==42||chance==43){
												if(singlast!=floor(image_index)){
													singlast=floor(image_index)
													
													for(i=0;i<2;i+=1){
																	
														created=instance_create_depth(x,y,10,Arcade_five)
														with(created){
															sprite_index=arcade_bee_big
															image_speed=0
															chance=irandom(2)
															chancetwo=choose(0,0,1,1,2)
															img=58+chance*3+chancetwo
															imgsped=0
															imgcap=1
															image_index=img
															pin=1
															creator=other.id
								
															dmgtotal=1
															dmg=dmgtotal
															diddmg=0
				
															sped=0.7
															sped=random_range(0.6,0.9)
															sped=random_range(0.3,0.4)
															image_xscale=0.5
															image_yscale=0.5	
								
															dur=800
															durtotal=dur
															move=1
															phasecheck=1
															destroy_on_hit=1  // Flag to destroy after hitting player
								
															hsp=0
															vsp=0
								
															type=0
										
															tick=2
								
															if(type==0){
								
																speed=sped
																direction=random(360)+other.i*51.5
											
																hsp=hspeed
																vsp=vspeed
									
																speed=0			
											
																if(chancetwo==0){
																	// Sway variables
																	swayAmplitude = 0.2; // Adjust as needed
																	swayFrequency = 0.015; // Adjust as needed
																	swayTimer = random(2 * pi); // Start at a random point in the oscillation cycle	
																}else{
																	if(chancetwo==1){
																		// Sway variables
																		swayAmplitude = 0.5; // Adjust as needed
																		swayFrequency = 0.03; // Adjust as needed
																		swayTimer = random(2 * pi); // Start at a random point in the oscillation cycle	
																	}else{
																		if(chancetwo==2){
																			// Sway variables
																			swayAmplitude = 0.6; // Adjust as needed
																			swayFrequency = 0.05; // Adjust as needed
																			swayTimer = random(2 * pi); // Start at a random point in the oscillation cycle	
																		}else{
																
																		}																
																	}																
																}
											
															}else{

									
									


															}
										
															x+=hsp*10
															y+=vsp*10
															
															// Sway variables for music notes
															swayFrequency = 0.05; // Adjust for speed of sway
															swayAmplitude = 0.02; // Adjust for intensity of sway
															swayTimer = 0;
														}	
													}	
												}
											}
										
									}else{
										attcdtwo=floor(attcdtwototal*0.01)
										phase=0
										phasetick=0
										attcdtwo=60
						
										if(hp<=hptotal*0.5){
											img=5
										}else{
											img=imgsave
										}
										image_index=img
										imgsped=0.04
										imgcap=3										
									}
								}
								

							}else{

							//Head Pop
							if(attack==4){
								
								if(phasetick==0){
									if(image_index+imgsped>img+imgcap-1){
										img=imgsave+82
										imgsped=0.04
										imgcap=4
										phasetick=1
										
										
											created=instance_create_depth(x,y,0,Arcade_five)
											with(created){
												sprite_index=arcade_bee_big
												visible=false
												chance=irandom(2)
												chancetwo=choose(0,0,1,1,2)
												img=97
												imgsped=0.05
												imgcap=4
												image_index=img
												pin=1
												creator=other.id
								
												dmgtotal=1
												dmg=dmgtotal
												diddmg=0
				
												sped=0.7
												sped=random_range(0.6,0.9)
												sped=random_range(0.3,0.4)
												image_xscale=0.5
												image_yscale=0.5	
								
												dur=1600
												durtotal=dur
								
												hsp=0
												vsp=0

												tick=3
								
											}											
									}
								}else{
									
									if(durtwo>0){
										durtwo-=1
									}else{
										durtwo=600
									}
									
									//Petals near stem
									if(durtwo mod 30==0){
										
										for(i=0;i<3;i+=1){
											
												created=instance_create_depth(x,y,0,Arcade_five)
												with(created){
													sprite_index=arcade_bee_big
													visible=false
													img=104+irandom(6)
													img=111+choose(1,1,2,2,3,4,3,4)
													imgsped=0
													imgcap=1
													image_index=img
													pin=1
													creator=other.id
								
													dmgtotal=1
													dmg=dmgtotal
													diddmg=0
				
													sped=0.3
													image_xscale=0.5
													image_yscale=0.5	
								
													dur=250+irandom(100)
													durtotal=dur
								
													hsp=0
													vsp=0
								
													type=0					
													tick=5
								
													if(type==0){
								
														speed=sped
														direction=random(360)+other.i*51.5
											
														hsp=hspeed
														vsp=vspeed
														image_angle=random(360)
									
														speed=0									
													}
										
													x+=hsp*5
													y+=vsp*5
												}	
											
										}
									}

									if(attcdtwo<=0){
										
										attcdtwo=floor(attcdtwototal*0.01)
										phase=0
										phasetick=0
										attcdtwo=60
						
										if(hp<=hptotal*0.5){
											img=5
										}else{
											img=imgsave+4
										}
										image_index=img
										imgsped=0.04
										imgcap=4		
										
										
									}

								}
							}else{

							//Dance Off
							if(attack==5){
								
								if(phasetick==0){
									if(attcdtwo>0){
										attcdtwo-=1
									}else{
										phasetick=1
										attcdtwo=40
									
										img=91
										image_index=img
										imgsped=0	


									}
									
									
								}else{
										
									if(attcdtwo>0){
										attcdtwo-=1
										
										if(attcdtwo==30){
											img=92
											image_index=img
											imgsped=0
											
										
										
											//Create Seed
											
											chance=choose(-1,1)
											imgxscalesave=image_xscale
											image_xscale=image_xscale*chance
											
											
											for(i=0;i<10;i+=1){
												created=instance_create_depth(x+(chance*120)-45+random(90),y-75+random(150)-15,0,Arcade_two)
			
												with(created){
													sprite_index=arcade_bee
													visible=false


														type=0
				
													img=200+choose(0,4)
													imgsped=0.03
													imgcap=4
													image_index=img+irandom(imgcap)
													pin=1
				
				
													sped=0.6
													image_xscale=0.5
													image_yscale=0.5	
				
													attcd=20
													startx=x
													endx=x+((other.chance*120)*2.5)
				
													hp=2
				
													enpin=0
													xp=choose(1,1,2)
				
										
													hp=1
													sped=0.07
													xp=1
										
													enpin=3
													vsp=0.05
													
													if(img==200){
														sped=0.35
													}else{
														sped=0.45
													}

													if(other.chance>0){
														hsp=sped*-1
													
													}else{
														hsp=sped
													}
													
																		// Sway variables
																		swayAmplitude = 0.2; // Adjust as needed
																		swayFrequency = 0.03; // Adjust as needed
																		swayTimer = random(2 * pi); // Start at a random point in the oscillation cycle														
											}
										}
									}
									}else{
	
										image_xscale=imgxscalesave
	
										img=imgsave+87
										image_index=img
										imgcap=4
										imgsped=0.06
										
										
										attcdtwo=40
										phasetick=0
										
										if(tick<4){
											tick+=1
										}else{
											
											attcdtwo=floor(attcdtwototal)
											phase=0
						
											if(hp<=hptotal*0.5){
												img=5
											}else{
												img=imgsave+4
											}
											image_index=img
											imgsped=0.04
											imgcap=4											
										
										}

									
								
								}
								
							}
							}else{
							
								if(attack==6){
					if(attcdtwo>0){
						attcdtwo-=1
						
						if(attcdtwo<attcdtwosav-20&&img==122){
							img+=1
							image_index=img
						}else{
							if(attcdtwo<attcdtwosav-30&&img==123){
								img+=1
								image_index=img
								//imgcap=8  // Don't change imgcap mid-animation!
								imgsped=0.08
							}else{
								
								//Spawn little daisies
								if(attcdtwo mod 60==0){
									
									for(i=0;i<1;i+=1){
										with(Control){
											chance=xps+120-60+random(120)
											chancetwo=yps+70-60+random(120)
			
			
											//Create Enemy
											created=instance_create_depth(chance,chancetwo,0,Arcade_two)
			
											with(created){
												sprite_index=arcade_bee
												visible=false
												type=choose(0,0,1,1,1)
												
												if(type==0){
													img=208
												}else{
													img=212
												}
												
												imgsped=0.08
												imgcap=4
												image_index=img
												pin=1			
				
												sped=0.08
												image_xscale=0.5
												image_yscale=0.5	
				
												attcd=20
				
												hp=1
				
												enpin=0
												xp=choose(1,1,1)
												sped=0.1
												
				
												//Sunflower
												if(type==0){
													hp=2
					
													sped=0.07
													enpin=2
													xp=2
												}else{

												}
											}		
										}
									}
									
								}
							}						
						}
						
					}else{
						
						attcdtwo=attcdtwototal
						phase=0
						
						img=5
						image_index=img
						imgsped=0.04
						imgcap=4
						
					
					}										
								
								}
							
							}
							}
						}
					
					}
				
				}
				
			}	

		//Enemy Projectile
		with(Arcade_five){
					
			if(tick!=2){
				x+=hsp
				y+=vsp
			}
			
			hit=instance_place(x,y,Me)
			if(hit!=noone){
				if(!variable_instance_exists(id, "diddmg") || diddmg==0){
					with(hit){
						hp-=other.dmg
						hurt=8
					}
					diddmg=1
					// Destroy music notes after hitting player
					if(variable_instance_exists(id, "destroy_on_hit") && destroy_on_hit==1){
						instance_destroy()
					}
				}
			}else{
				if(variable_instance_exists(id, "diddmg")){
					diddmg=0
				}
			}
			

			
			if(tick==0){
				image_angle+=2
				
				if(dur<=floor(durtotal*0.5)){
					tick=1
					if(instance_exists(creator)){
						move_towards_point(creator.x, creator.y,sped*0.75)
											
						hsp=hspeed
						vsp=vspeed
									
						speed=0	
						dur+=durtotal*0.5
					}
				}
			}else{
				if(tick==1){
					if(instance_place(x,y,creator)){
						dur=0
					
						if(creator.attcdtwo>100&&creator.attack==2){
							creator.attcdtwo=12
						}
					}
			
					image_angle-=2
				}else{
				
					//Music Note
					if(tick==2){
					
						// Increment the sway timer
						swayTimer += swayFrequency;

						// Calculate sway offset
						var swayOffset = sin(swayTimer) * swayAmplitude;

						// Apply sway to horizontal or vertical speed
						hsp += swayOffset; // or vsp += swayOffset; for vertical sway

						// Update position
						x += hsp;
						y += vsp;

						// Optional: reset the sway effect after applying it
						hsp -= swayOffset; // or vsp -= swayOffset; if applying to vertical speed						
					
					}else{
					
						//Flower Head
						if(tick==3){
							
							image_angle+=3
							
							if(dur>400){
							
								if(dur mod 200==0){
									if(instance_exists(Arcade)){
										target=Arcade
										
										move_towards_point(target.x, target.y,sped*2.5)
											
										hsp=hspeed
										vsp=vspeed
									
										speed=0	
									}								
								}
							
							}else{
								
								
								
								if(instance_exists(creator)){
									move_towards_point(creator.x, creator.y,sped*3)
											
									hsp=hspeed
									vsp=vspeed
									
									speed=0	
									dur+=durtotal*0.5
								}	
								tick=4
							}
						}else{
							
							if(tick==4){
								image_angle+=3						
								dur=10

								//Flower Head Return
								if(tick==4){
									if(instance_exists(creator)){
										if(point_distance(x,y,creator.x,creator.y)<3){
											dur=0
					
											if(creator.attack==4){
												creator.attcdtwo=0
												//game_end()
											
											}									
										}
									}
								}
							}else{
								if(tick==5){
									if(hsp>=0){
										image_angle+=2
									}else{
										image_angle-=2
									
									}
								
								}
							
							}
						
						}
					}
				}
			}
			
			if(dur>0){
				dur-=1
			}else{
				instance_destroy()
			}
		}

	
		}else{
		
		#endregion
		#region Small Flower
		if(pin==111){
		
			if(phase==0){
				if(check==1){
					check=0
				
				}
			}else{
				if(phase==1){
					if(check==1){
						check=0
				
					}
				}else{
			
				}				
			}	
		
		}else{
		
		#endregion

		#region Flower Head
		if(pin==112){
		
			if(phase==0){
				if(check==1){
					check=0
				
				}
			}else{
				if(phase==1){
					if(check==1){
						check=0
				
					}
				}else{
			
				}				
			}			
		
		}else{
		
		#endregion		

#endregion
#endregion
#endregion
#region Free
	if(pin==120){
		if(phase==1){
			if(check==1){
				check=0
			}
		}else{
	
		}
	}else{
#endregion
#endregion
#region Flying Pets
	if(pin==200){
		if(phase==1){
			if(check==1){
				check=0
				wallcheck=0
				starty=y
				sprite_index=enemy_three_spr
				check=0
				tick=0
				attsped=1
				type=0
				effect=0
				hp=12
				hptotal=hp
				
				
				//Bat
				if(Control.invenArray[21,0]==1){
					sndattack1=snd_pet_bat_attack_1
					sndattack2=snd_pet_bat_attack_2
					sndattack3=snd_pet_bat_bite_2
					sndattack4=snd_pet_bat_bite_3				
				}else{
					//Owl
					if(Control.invenArray[21,0]==5){
						sndattack1=snd_pet_owl_attack_1
						sndattack2=snd_pet_owl_attack_2
						sndattack3=snd_pet_bat_bite_2
						sndattack4=snd_pet_bat_bite_3				
					}else{
				
					}				
				}
				
				
				img=Control.itemArray[Control.invenArray[21,0],7]
				if(Control.invenArray[21,2]>=3){
					img=Control.itemArray[Control.invenArray[21,0]+1,7]
				}	
				dmg=Control.itemArray[Control.invenArray[21,0],8]+(Control.itemArray[Control.invenArray[21,0],8]*(Control.invenArray[21,2]*0.2))
				attcd=Control.itemArray[Control.invenArray[21,0],9]
					if(Control.invenArray[21,0]==5||Control.invenArray[21,0]==6){
						sped=Control.itemArray[Control.invenArray[21,0],10]+(Control.itemArray[Control.invenArray[21,0],10]*(Control.invenArray[21,2]*0.2))
					}else{
						sped=Control.itemArray[Control.invenArray[21,0],10]
					}
					if(Control.invenArray[21,0]==5||Control.invenArray[21,0]==6){
						attsped=Control.itemArray[Control.invenArray[21,0],11]+(Control.itemArray[Control.invenArray[21,0],11]*(Control.invenArray[21,2]*0.2))
					}else{
						attsped=Control.itemArray[Control.invenArray[21,0],11]
					}
				imgcap=Control.itemArray[Control.invenArray[21,0],12]
				effect=Control.itemArray[Control.invenArray[21,0],13]
				roll=Control.itemArray[Control.invenArray[21,0],14]+(Control.itemArray[Control.invenArray[21,0],14]*(Control.invenArray[21,2]*0.2))
				

				image_index=img
				imgsped=0.1
				grav=0
				starty=y
				tick=0
				imgsave=img
				rangetimer=50
				startx=x
				starty=y
				xtarget=x
				ytarget=y
				phasetick=1
				imgsave=img
				imgspedsave=imgsped
				attcdtotal=attcd
				atttype=0
				atttick=0
				spedsave=sped
				playerhurt=0
				team=0
				sndobjectone=noone

				targ=0
				//sndcd=100

				if(img==1){
				
				}
			}
				if(instance_exists(sndobjectone)){
					with(sndobjectone){
						audio_emitter_position(sndemitone,other.x,other.y,0)	
					}
				}

			if(targ==0){
				if(instance_exists(Control.target)){
					targ=Control.target
				}else{
					targ=0
				}

			}else{
				if(instance_exists(targ)){
					if(targ.team==0){
						targ=0
					}
				}else{
					targ=0
				}
			}
			if(targ==0){
				with(Enemy){
					if(team!=0){
						if(point_distance(x,y,other.x,other.y)<96){
							if(mask_index!=dummy_spr&&immune==0){
								other.targ=id
							}
						}					
					}
				}
			}
#region Item
			if(effect==1){
				if(img>=imgsave+4){
					hit=instance_place(x,y,Me)
					if(hit!=noone){
						if(Me.hp<Me.hptotal){
							if(Me.hp+1<Me.hptotal){
								Me.hp+=1
							}else{
								Me.hp=Me.hptotal
							}
							img=imgsave
							image_index-=4
							audio_play_sound_at(choose(snd_coin_1,snd_coin_2,snd_coin_3),x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)

						}
					}
				}
			}
#endregion

	if(atttype==0){
			if(attcd>0){
				attcd-=1
			}
			if(attcd==0){
				if(instance_exists(targ)&&targ!=0){
					sped=attsped
					atttick=1
					attcd=attcdtotal
					xtarget=targ.x
					ytarget=targ.y
								sndobjectone=instance_create_depth(x,y,0,Snd)
								with(sndobjectone){
									sndemitone=audio_emitter_create()				
									audio_play_sound_on(sndemitone,choose(other.sndattack1,other.sndattack2),false,8)
									audio_emitter_falloff(sndemitone, 48, Control.falloff_max, Control.falloff_factor)					
								}
				}
			}
			if(atttick==1){
				chance=0
				if(instance_exists(targ)&&targ!=0){
					hit=instance_place(x,y,targ)
					if(hit!=noone){
						audio_play_sound_at(choose(sndattack3,sndattack4),x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
						with(hit){
							hurttick=1
							dmgrecieved+=other.dmg
							Me.damagedone+=dmgrecieved
						}			
						chance=1
						if(effect==1){
							if(irandom(100)<roll){
								img=imgsave+4
								image_index=img
							}
						}
					}
					sped=attsped
					atttick=1
					attcd=attcdtotal
					xtarget=targ.x
					ytarget=targ.y
				}else{
					chance=1
				}
			
				if(targ==0){
					if(point_distance(x,y,Me.x,Me.y)>32){
						sped=spedsave*1.5
					}else{
						sped=spedsave
					}
				}
			
				if(chance==1){
					atttick=0
						xtarget=irandom_range(Me.x-32,Me.x+32)	
						ytarget=irandom_range(Me.y-30,Me.y+5)
						sped=spedsave				
				}
			}


	}else{
#region Attack
					if(attcd>0){
						attcd-=1
						if(attcd==40){
							img=imgsave+3
							image_index=img
							imgsped=0
						}else{
							if(attcd==30){
								img=imgsave+4
								image_index=img		
										created=instance_create_depth(x-5+random(10),y+5-5+random(10),depth-1,Abil)
										with(created){
											sprite_index=enemy_abil_spr
											pin=32
											image_speed=0
											imgsped=0
											speed=random_range(0.8,1.2)
												dur=450
														if(other.enopt==2){
															img=choose(117,118)
														}else{
															img=119
														}
											image_index=img
											imgcap=2	
											en=1
												sped=1
											move_towards_point(Me.x-3+random(6),Me.y-3+random(6),sped)
											imgangle=direction
											hsp=hspeed
											vsp=vspeed
											speed=0
								
											move=1
											phasecheck=0
											if(hsp<0){
											//	dir=-1
											}
										}
							}else{
								if(attcd==18){
									img=imgsave+4
									image_index=img		
											created=instance_create_depth(x-5+random(10),y+5-5+random(10),depth-1,Abil)
											with(created){
												sprite_index=enemy_abil_spr
												pin=32
												image_speed=0
												imgsped=0
												speed=random_range(0.8,1.2)
													dur=450
														if(other.enopt==2){
															img=choose(117,118)
														}else{
															img=119
														}
												image_index=img
												imgcap=2	
												en=1
													sped=0.9
												move_towards_point(Me.x-3+random(6),Me.y-3+random(6),sped)
												imgangle=direction
												hsp=hspeed
												vsp=vspeed
												speed=0
								
												move=1
												phasecheck=0
											}
								}else{
									if(attcd==6){
										img=imgsave+4
										image_index=img		
												created=instance_create_depth(x-5+random(10),y+5-5+random(10),depth-1,Abil)
												with(created){
													sprite_index=enemy_abil_spr
													pin=32
													image_speed=0
													imgsped=0
													speed=random_range(0.8,1.2)
														dur=450
														if(other.enopt==2){
															img=choose(117,118)
														}else{
															img=119
														}
													image_index=img
													imgcap=2	
													en=1
														sped=0.8
													move_towards_point(Me.x-3+random(6),Me.y-3+random(6),sped)
													imgangle=direction
													hsp=hspeed
													vsp=vspeed
													speed=0
								
													move=1
													phasecheck=0
												}
									}else{
										if(attcd==0){
											img=imgsave
											image_index=img
											imgsped=imgspedsave
											attcd=attcdtotal
										}
									}
								}
							}
						}
					}
#endregion
	}
					if(phasetick==1){
						enemy_move_scr(8)
								if(chance==2){
									atttick=0
										xtarget=irandom_range(Me.x-32,Me.x+32)	
										ytarget=irandom_range(Me.y-30,Me.y-5)
										sped=spedsave
								}
						
					}
		}else{
	
		}
	}else{
#endregion
#region Class PAssive enemy
	//Burger Happy Meal
	if(pin==300){
		if(phase==1){
			if(check==1){
					sprite_index=enemy_three_spr
					check=0
					hp=100
					hptotal=hp	
									//Mushroom
								imgextra=0
								wallsped=-0.3
								sped=0.2
								rangetimertotal=0
								rangetimer=irandom(rangetimertotal)
								jump=-4.8
								jumptimertotal=10
						img=225+imgextra
						image_index=img
						imgcap=2
					
						imgsped=0.08
						imgspedsave=imgsped
						imgsave=img
						imgcapsave=imgcap

						startx=x
						range=48
						rangetick=choose(0,1)
						if(rangetick==1){
							dir=-1
						}
				
						wallimg=19+imgextra
						wallimgcap=3
						wallcheck=1
				
						jumptimer=irandom(jumptimertotal)
						jumpimg=17+imgextra
						jumpimgsave=jumpimg
						jumpimghurt=23+imgextra
						jumpimgsped=0.1
						groundcheck=0	
						yelltimer=0
			}
			if(hurttick>0||hurttimer>0){
				phase=2
				timertime=35
				img=228
				image_index=img
				imgsped=0
				grav=0
				audio_play_sound_at(snd_burger_passive_yell_1,x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
			}
			if(yelltimer<=0){
				yelltimer=100
				audio_play_sound_at(choose(snd_burger_passive_yell_2,snd_burger_passive_yell_3),x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
			}else{
				yelltimer-=1
			}
			enemy_move_scr(1)
			
		}else{
			if(timertime>0){
				timertime-=1
				if(timertime==22){
					img=229
					image_index=img		
				}else{
					if(timertime==12){
						img=230
						image_index=img		
					}else{
						if(timertime==0){
							chance=choose(2,2,3,3,4)
								for(i=0;i<chance;i+=1){
									//Tomato create
									created=instance_create_depth(x,y,0,Abil)
									with(created){

											diddmg=0
											dmg=2
					
											dmg+=dmg*(Control.invenArray[25,3]*0.01)

										type=0
										pin=28
										en=0
										creator=other.id
										imgsped=0
										imgangle=0
											img=choose(50,50,60)
										
											temp=1
											move=0
											pintwo=2
		
										imgcap=1
										sprite_index=abil_burger_two_spr
										image_index=img
										depth=Me.depth+1
										image_speed=0
										dur=80+irandom(25)

										durtotal=dur
										grav=0.1
										gravtwo=0.05
										dir=other.dir

										bounce=50

										if(Control.talentmapArray[23,1]>0){
											dur+=dur*(Control.talentmapArray[23,1]*0.2)
										}
										chance=-1
	
										timer=28+irandom(20)
										vsp=0
										hsp=0 

										image_index=img
										hsp=random_range(-1.5,1.5)
										vsp=random_range(-2,-2.5)
										tomtype=15
										imgcap=5
										imgsped=0.15
									
										grav=random_range(0.07,0.12)
										sped=random_range(2.5,3)

										timer=0
										image_index+=3
										img+=3
									}	
								}
							
							audio_play_sound_at(choose(snd_burger_fries_explosion_1,snd_burger_fries_explosion_2),x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
								chance=irandom(360)
								for(i=0;i<10;i+=1){
									created=instance_create_depth(x+chancetwo-2+random(4),y+chancethree-1.5+random(3),0,Part)
									with(created){
									type=1
									pin=1
									depth=other.depth+1
									spin=1
										img=90
					
										imgcap=7
										imgsped=0
										image_speed=0
										image_index=irandom_range(img,img+imgcap)
										dur=8+choose(0,0,0,1,1,2)+irandom(30)
										image_index=irandom_range(img,img+imgcap)
									dur=12+choose(0,0,0,1,1,2)+irandom(15)
									direction=other.i*36+other.chance
									speed=random_range(0.3,0.4)
									durtotal=dur
									hsp=hspeed
									vsp=vspeed
									chance=random_range(0.7,1)
									xscale=chance
									yscale=chance
									}		
								}
								chance=irandom(360)
								for(i=0;i<10;i+=1){
									created=instance_create_depth(x+chancetwo-2+random(4),y+chancethree-1.5+random(3),0,Part)
									with(created){
									type=1
									pin=1
									depth=other.depth+1
									spin=1
										img=90
					
										imgcap=7
										imgsped=0
										image_speed=0
										image_index=irandom_range(img,img+imgcap)
										dur=8+choose(0,0,0,1,1,2)+irandom(30)
										image_index=irandom_range(img,img+imgcap)
									dur=12+choose(0,0,0,1,1,2)+irandom(15)
									direction=other.i*36+other.chance
									speed=random_range(0.2,0.3)
									durtotal=dur
									hsp=hspeed
									vsp=vspeed
									chance=random_range(0.7,1)
									xscale=chance
									yscale=chance
									}		
								}
										for(i=0;i<3;i+=1){
												created=instance_create_depth(x-8+random(16),y+5,0,Part)
											with(created){
												type=2
												pintwo=1
												pin=1
												phase=100
												depth=other.depth-1
												spin=1
												img=107
					
												imgcap=5
												imgsped=0
												image_speed=0
												image_index=irandom_range(img,img+imgcap)
												dur=50+choose(0,0,0,1,1,2)+irandom(5)
												durtotal=dur
												hsp=0-0.5+other.i*0.5
												vsp=random_range(0.08,0.12)
												vsp=-1
												if(other.i==1){
													vsp-=0.5
												}
												grav=0.1
												image_angle-=15
												image_angle+=random(30)

											}		
										}	
							chance=irandom(100)
							if(chance<50){
												for(i=0;i<1;i+=1){
													created=instance_create_depth(other.x-2+random(4),other.y-1.5+random(3),0,Part)
													with(created){
													pin=2
													type=0
													depth=other.depth+1
													spin=0
													img=83
													imgcap=0
													imgsped=0
													image_speed=0
													image_index=img
													dur=1000
													durtotal=dur
													hsp=0
													vsp=random_range(-1,-1.2)
													grav=0.03
													}		
												}					
							}else{
									created=instance_create_depth(other.x-2+random(4),other.y-1.5+random(3),0,Part)
									with(created){
										pin=2
										type=1
										depth=other.depth+1
										spin=0
										img=84
										imgcap=0
										imgsped=0
										image_speed=0
										image_index=img
										dur=1000
										durtotal=dur
										hsp=0
										vsp=random_range(-1,-1.2)
										grav=0.03
									}						
							}		
						
								instance_destroy()
						}
					}
				}
			}
			if(!instance_place(x,y-0.1,Block)){
				y-=0.2
			}
		}
	}else{
#endregion


	}
											}}}}}}}
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

	}
	}

	//____________________________________________________________________________---------------------(ANIMATION)---------------------____________________________________________________________________________
		if(animtick<100){
			animtick+=1
		}else{
			animtick=0
		}
	
		animx=0
		animy=0

		//ALL ANIMATION IMAGE CHECK
		if(image_index+imgsped<img+imgcap+1){
		image_index+=imgsped
		}else{
		image_index=img
		}


#region Tree (Acorn throw)
	//____________________________________________________________________________---------------------(Debuff)---------------------____________________________________________________________________________
//Slow

if(debuffArray[1,0]>0){
	debuffArray[1,0]-=1
	slow=0.5

			if(progtimer mod 5 ==0){
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

}else{
	slow=1
}
#endregion
}
