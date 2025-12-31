// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function arcade_scr(){

xps=camx-camxtwo
yps=camy-camytwo	



	//Fish Marble Game
	if(arcadetype==1){

		if(invenArray[31,15]+1<299){
			invenArray[31,15]+=1
			if(invenArray[31,15]==10){
				invenArray[31,16]=1
			}else{
				if(invenArray[31,15]==20){
					invenArray[31,16]=0
				}else{
					if(invenArray[31,15]==40){
						invenArray[31,16]=2
					}else{
						if(invenArray[31,15]==50){
							invenArray[31,16]=0
						}else{
						
						}						
					}				
				}			
			}
		}else{
			invenArray[31,15]=0
		}

		if(arcade==1){
			
			
					
			
			arcade=0
			arcchance=irandom(3)
			
			tokens = 2
			tokentype=0
			tokenangle=random(360)
			
			event=0
			eventtwo=0
			
			arcadepet=0
			arcadepetrarity=choose(0,1,2,3,4)

			for(i=0;i<100;i+=1){
				created=instance_create_depth(xps+50+10+random(206-50-20),yps+105+random(15),0,Arcade)
				with(created){
					pin=1
					hsp=0
					vsp=0
					grav=0
					hitcheck=1
					hitcd=0
					visible=false
					depth=10
				
					sprite_index=abil_crab_spr
					img=53
					image_index=img
					imgsped=0
					dur=10000
					image_angle=random(360)
					for(i=0;i<10;i+=1){
						if(instance_place(x,y,Arcade)){
							if(x>other.xps+60+1&&x<other.xps+136-1){
								x+=choose(0,1)
							}
							if(y>other.yps+105+1&&y<other.yps+105+15-1){
								y+=choose(0,1)
							}							
						}
					}
					
					bonuscheck=1
					bonuschecktwo=1		
					value=1
				}
			}
			for(i=0;i<5;i+=1){
				created=instance_create_depth(xps+50+10+random(206-50-20),yps+105+random(15),0,Arcade)
				with(created){
					pin=1
					hsp=0
					vsp=0
					grav=0
					hitcheck=1
					hitcd=0
					visible=false
				
					depth=9
				
					sprite_index=abil_crab_spr
					
					chance=choose(0,0,0,1,1,2)
					//chance = 3
					img=185+chance
					value=(chance*5)+5		
					imgsped=0
					image_index=img

					/*
					if(chance==3){
						img=212
						value=50
						imgsped=0.04
						imgcap=12
						image_index=img+random(12)
					}
					*/
					
					dur=10000
					image_angle=random(360)
					
					bonuscheck=1
					bonuschecktwo=1
				}
			}			
			
			acvartimer=0
			
			acvarone=100
			acvartwo=100
			
			//Bonus
			acvarthree=0
			
			//Tickets
			acvarfour=0
			//Bonus Roll
			acvarfive=0
			//Plays
			acvarsix=15
			acvarsix=10
			
			//Insert token 
			acvarsign=0
			acvarsigntwo=0
			
			//Bonus Que
			acvarseven=0
			acvareight=300
			acvarnine=irandom(360)
			acvarten=random_range(4,7)
			acvareleven=0
			acvartwelve=abs(floor((acvarnine-360)/45)+1)
			acvarthirteen=0
			acvarthirteentwo=1
			
			acvarfourteen=0
			acvarfifteen=choose(0,1)
			
			//Cannon Angle
			acvarsixteen=3
			acvarseventeen=0
			
			//Number till spin
			acvareighteen=0
			
			//Hoop highlight
			acvarnineteen=0
			
			//Tickets yet to come out
			acvartwenty=0
			
			//Crab
			crabtype=0
			acvartwentyone=0
			if(crabtype==0){
				acvartwentyonetwo=224
			}else{
				acvartwentyonetwo=252
			}
			
			acvartwentyonestable=acvartwentyonetwo
			acvartwentyonethree=30*3
			acvartwentyonefour=1
			acvartwentyonefive=0
			
			//Background
			acvartwentytwo=0
			acvartwentythree=0
			acvartwentyfour=0
			acvartwentyfive=0
			
			//Bonus Wheel
			acvartwentysix=0
			acvartwentysixtwo=0
			acvartwentyseven=0
			acvartwentyeight=0
			acvartwentynine=0
			acvarthirty=0
			
			//Stop spin
			acvarthirtyone=1
			
			//spin label checker for sound
			acvarthirtytwo=acvartwelve=abs(floor((acvarnine-360)/45)+1)
			
			//Token
			acvarthirtythree=0
			
			//Array
			arcadeArray[0,0]=0
			arcadeArray[0,1]=0
			
			for(a=0;a<10;a+=1){
				for(b=0;b<10;b+=1){
					arcadeArray[a,b]=0
				}			
			}
			
			arcadeArray[20,0]=0
			arcadeArray[20,1]=0
			arcadeArray[20,2]=0
			arcadeArray[20,3]=0
			arcadeArray[20,4]=0
			arcadeArray[20,5]=0
			arcadeArray[20,6]=0
			
			arcadeArray[21,0]=0
			arcadeArray[21,1]=0
			arcadeArray[21,2]=0
			arcadeArray[21,3]=0
			arcadeArray[21,4]=0
			arcadeArray[21,5]=0
			arcadeArray[21,6]=0			
			
			acvardur=0
			arcadeArray[0,0]=0
			
			arcadeprizeArray[0,0]=2
			arcadeprizeArray[0,1]=0

			//Abil wheel tile
			arcadeprizeArray[1,0]=1
			arcadeprizeArray[1,1]=4

			arcadeprizeArray[2,0]=3
			arcadeprizeArray[2,1]=0
			
			arcadeprizeArray[3,0]=5
			arcadeprizeArray[3,1]=1
			
			arcadeprizeArray[4,0]=1
			arcadeprizeArray[4,1]=2
			
			arcadeprizeArray[5,0]=2
			arcadeprizeArray[5,1]=1
			
			arcadeprizeArray[6,0]=3
			arcadeprizeArray[6,1]=0
			
			arcadeprizeArray[7,0]=10
			arcadeprizeArray[7,1]=3	

/*
			arcadeprizeArray[0,0]=10
			arcadeprizeArray[0,1]=3	
			arcadeprizeArray[1,0]=10
			arcadeprizeArray[1,1]=3	
			arcadeprizeArray[2,0]=10
			arcadeprizeArray[2,1]=3	
			arcadeprizeArray[3,0]=10
			arcadeprizeArray[3,1]=3	
			arcadeprizeArray[4,0]=10
			arcadeprizeArray[4,1]=3	
			arcadeprizeArray[5,0]=10
			arcadeprizeArray[5,1]=3	
			arcadeprizeArray[6,0]=10
			arcadeprizeArray[6,1]=3						
*/

			//Bonus Wheel
			arcadeprizeArray[10,0]=10
			arcadeprizeArray[10,1]=1

			arcadeprizeArray[11,0]=10
			arcadeprizeArray[11,1]=1

			//Abil Wheel tile BONUS
			arcadeprizeArray[12,0]=1
			arcadeprizeArray[12,1]=5
			
			arcadeprizeArray[13,0]=1
			arcadeprizeArray[13,1]=6
			
			arcadeprizeArray[14,0]=3
			arcadeprizeArray[14,1]=2
			
			arcadeprizeArray[15,0]=3
			arcadeprizeArray[15,1]=2
			
			arcadeprizeArray[16,0]=15
			arcadeprizeArray[16,1]=1
			
			arcadeprizeArray[17,0]=6
			arcadeprizeArray[17,1]=2	
			
			/*
			for(i=0;i<8;i+=1){
				arcadeprizeArray[i,0]=i
				arcadeprizeArray[i,1]=0
			}
			*/
			
			//Hook Bonus in boxes

			arcadeArray[30,0]=0
			arcadeArray[31,0]=0
			arcadeArray[32,0]=0
			arcadeArray[33,0]=0
			arcadeArray[34,0]=0
			arcadeArray[35,0]=0

			arcadeArray[31,1]=irandom(100)
			arcadeArray[32,1]=irandom(100)
			arcadeArray[33,1]=irandom(100)
			arcadeArray[34,1]=irandom(100)
			arcadeArray[35,1]=irandom(100)

			arcadeArray[31,2]=0
			arcadeArray[32,2]=0
			arcadeArray[33,2]=0
			arcadeArray[34,2]=0
			arcadeArray[35,2]=0
			
			arcadeArray[36,0]=0
			arcadeArray[36,1]=0
			
			//Abil 1
			arcadeArray[40,0]=0
			arcadeArray[40,1]=0
			arcadeArray[40,2]=0

			arcadeArray[40,0]=0
			arcadeArray[40,1]=0
			arcadeArray[40,2]=0

			chance=irandom(4)
			arcadeArray[31+chance,0]=choose(1,1,1,1,1,2,2,2,2,2,3,3,4)

				chance=irandom(4)
					while(other.arcadeArray[31+chance,0]!=0){
						chance=irandom(4)
					}
				arcadeArray[31+chance,0]=choose(1,1,1,1,1,2,2,2,2,2,3,3,4)


			for(a=0;a<10;a+=1){
				for(b=0;b<10;b+=1){
					arcadeArray[100+a,b]=0
				}
			}
		}
		

	//Insert Token
	if(acvarsix<=0){
		if(acvarsign<49){
			acvarsign+=1
		}
	}else{
		if(acvarsign>0){
			acvarsign-=1
		}	
	}

		//Event
		if(event>=3){
			event-=3
			
			arcchance=irandom(2)

			if(arcchance==0){
				

					chance=choose(-1,1)
				
					//Seagull create
					if(chance==1){
						created=instance_create_depth(xps-4,yps+20,0,Arcade)
						createdtwo=instance_create_depth(xps-6,yps+20,0,Arcade)
					}else{
						created=instance_create_depth(xps+255,yps+20,0,Arcade)
						createdtwo=instance_create_depth(xps+255+2,yps+20,0,Arcade)
					}
					with(created){
						
							pin=2
					
						depth=11
						visible=false
						image_speed=0
						sprite_index=arc_fish_spin_spr
						img=57
						imgcap=4
						
						image_index=img+irandom(imgcap)
						imgsped=0.06
					
						spin=0
					
						dur=99999999
						hsp=random_range(0.5,1)*other.chance
						vsp=0
						dir=other.chance
						//image_xscale=other.chance
						beenhit=0

									created=instance_create_depth(x,y,0,Arcade)
									with(created){
									
										pin=1
										hsp=0
										vsp=random_range(0.1,0.3)*-1
										grav=0.1
										hitcheck=0
										hitcd=0
										visible=false
										depth=9			
							
				
										sprite_index=abil_crab_spr
										chance=choose(0,0,0,1,1,2)
										img=185+chance
										value=(chance*5)+5
							
										image_index=img
										imgsped=0
										dur=10000
										image_angle=random(360)
										bonuscheck=1
										bonuschecktwo=1		
							
									}
									
									createdtwo=instance_create_depth(x,y+2,0,Arcade)
									with(createdtwo){
									
									
										pin=1
										hsp=0
										vsp=random_range(0.1,0.3)*-1
										grav=0.1
										hitcheck=0
										hitcd=0
										visible=false
										depth=9			
							
				
										sprite_index=abil_crab_spr
										chance=choose(0,0,0,1,1,2)
										img=185+chance
										value=(chance*5)+5
							
										image_index=img
										imgsped=0
										dur=10000
										image_angle=random(360)
										bonuscheck=1
										bonuschecktwo=1		
							
									}									
					}
			}

		}
		

		
		//Crab anim Yawn
		if(acvarsix==0&&acvarseven==0){
			if(acvartwentyonetwo!=acvartwentyonestable+4&&acvartwentyonetwo!=acvartwentyonestable+6){
				acvartwentyonetwo=acvartwentyonestable+4
				acvartwentyonethree=30*4
				acvartwentyone=0
				acvartwentyonefour=0.5
				image_index=acvartwentyonetwo
				
				acvartwentyonetwo=acvartwentyonestable+6
				acvartwentyonethree=30*3
				acvartwentyone=0	
				acvartwentyonefour=0.3
				image_index=acvartwentyonetwo				
			}
		}else{
			
			if(acvartwentyonetwo!=acvartwentyonestable&&acvarseven==0){
				//Return to default
				acvartwentyone=0
				acvartwentyonetwo=acvartwentyonestable
				acvartwentyonethree=30*3
				acvartwentyonefour=1	
				image_index=acvartwentyonetwo
			}
			
			if(acvartwentyonetwo!=acvartwentyonestable+9){
				if(acvarseven>0){
					if(acvartwentyonefive>=0){
						//Celebrate
						acvartwentyone=0
						acvartwentyonetwo=acvartwentyonestable+9
						acvartwentyonethree=30*4
						acvartwentyonefour=2
						acvartwentyonefive=1
						image_index=acvartwentyonetwo
					}
				}
			}
		
		}
		
			if(arcadeArray[36,0]>0){
				arcadeArray[36,0]-=1				
			}
			if(arcadeArray[36,1]>0){
				arcadeArray[36,1]-=1
			}

		//Crab image_index
		if(acvartwentyone+acvartwentyonefour<acvartwentyonethree){
			acvartwentyone+=acvartwentyonefour
		}else{
			acvartwentyone=0
			
			//Yawn Loop
			if(acvartwentyonetwo==acvartwentyonestable+6){
				acvartwentyonetwo=acvartwentyonestable+6
				acvartwentyonethree=30*3
				acvartwentyone=0	
				acvartwentyonefour=0.3
				image_index=acvartwentyonetwo
			}else{
			
				//Celebrate back
				if(acvartwentyonetwo==acvartwentyonestable+9){
					if(acvartwentyonefive==0){
						acvartwentyone=0
						acvartwentyonetwo=acvartwentyonestable
						acvartwentyonethree=30*3
						acvartwentyonefour=1
						acvartwentyonefive=-1
						image_index=acvartwentyonetwo
					}else{
						acvartwentyonefive-=1
					}
				}else{
			
			
			
				}			
			
			}
		}

//Inifinite wheel
//acvarnine+=0.1
//acvarseven+=0.1

with(Part){
	
	image_angle+=spin
	
	if(image_index+imgsped>img+imgcap){
		image_index=img
	}else{
		image_index+=imgsped
	}
	
	x+=hsp
	y+=vsp

	if(dur>0){
		dur-=1
	}else{
		instance_destroy()
	}

}

		if(acvartwentytwo==0){
			if(acvartwentythree<4){
				acvartwentythree+=0.01
			}else{
				acvartwentytwo=1
			}
		}else{
			if(acvartwentythree>-4){
				acvartwentythree-=0.01
			}else{
				acvartwentytwo=0
			}		
		}
		
		if(acvartwentyfour==0){
			if(acvartwentyfive<2){
				acvartwentyfive+=0.01
			}else{
				acvartwentyfour=1
			}
		}else{
			if(acvartwentyfive>-2){
				acvartwentyfive-=0.01
			}else{
				acvartwentyfour=0
			}		
		}		
		
		acvartimer+=1
	
		if(acvartimer mod 75==0){
			if(acvarsigntwo==0){
				acvarsigntwo=1
			}else{
				acvarsigntwo=0
			}
		}
	
		//Ticket
		if(acvartwenty>0){
			if(arcadeArray[0,1]<4){
				arcadeArray[0,1]+=1
				arcadeArray[arcadeArray[0,1],0]=1
				arcadeArray[arcadeArray[0,1],2]=1
				acvartwenty-=1
				//audio_play_sound_at(choose(snd_ac_tick_1,snd_ac_tick_2,snd_ac_tick_3),xps+30,yps+81, 0, Control.falloff_ref, Control.falloff_max, 2, false, 1)
			}
		}
		
		chance=arcadeArray[0,1]
		for(i=1;i<arcadeArray[0,1]+1;i+=1){
			
			if(arcadeArray[i,1]<100){
				
				if(arcadeArray[i,2]==1){
					acvarfour+=1
					arcadeArray[i,2]=0
				}
				if(i==1){
					if(arcadeArray[i,1]<chance*36){
						arcadeArray[i,1]+=1
					}
				}else{
					chance=(arcadeArray[1,1]-(36*(i-1)))
					
					if(chance<0){
						chance=0
					}
					
					arcadeArray[i,1]=chance
				}
				
			}else{
				
				for(i=1;i<arcadeArray[0,1]+1;i+=1){
					arcadeArray[i,0]=arcadeArray[i+1,0]
					arcadeArray[i,1]=arcadeArray[i+1,1]
					arcadeArray[i,2]=arcadeArray[i+1,2]
				}
				arcadeArray[0,1]-=1
			}
		}

		//Hoop Highlight
		if(acvarnineteen>0){
			acvarnineteen-=1
		}
		

		
		//Spin points till spin
		if(acvareighteen>=3){
			acvareighteen-=3
			acvarseven+=1
			
		}

	if(acvartwentyseven>0){
		
		acvartwentyseven-=2
		
		if(acvartwentyeight==3){
			acvartwentyseven-=3
		}
		
		if(acvartwentyseven==0){
			if(acvartwentyeight==3){
				acvartwentysix=0
				acvartwentysixtwo=0
				acvartwentyeight=0
				acvarnine=acvartwentynine
				acvartwelve=acvarthirty
			}
		}
	
	}else{
		
		//SPIN
		if(acvarseven>0){
			if(acvareight>0||acvarten>0){
				if(acvareight==300){
				
				/*
				//Crab celebrate
				acvartwentyone=0
				acvartwentyonetwo=207
				acvartwentyonethree=30*3
				acvartwentyonefour=1	
				*/
					
					acvarten=random_range(4,7)
					
					if(acvartwentysix>0){
						acvarten=random_range(4,4.5)
					}
					acvareleven=1
					acvarthirtyone=1
					acvareight=299
				}
				
				acvareight-=1
				
				if(acvartwentysix>0){
					
						if(acvartwentysixtwo+0.4<22){
							acvartwentysixtwo+=0.1
						}else{
							acvartwentysixtwo=0
						}
					
						if(acvarthirtyone==1){
							
							if(global.con_p_q||global.con_p_e||global.conp_p_q||global.conp_p_e||global.conp_p_space||mouse_check_button(mb_left)||mouse_check_button(mb_right)){
								if(acvarten>3){
									acvarten=random_range(2.9,3.1)
									acvarthirtyone=0
									acvareight=50
								}	
							}
						}else{
							if(acvarten>0.009){
								acvarten-=0.009
							}else{
								acvarten=0
							}
						}
				}
				
				
				if(acvarnine+acvarten>=360){
					acvarnine-=360
				}
					acvarnine+=acvarten
				
				if(acvarthirteen==0){

					if(acvarten<0.1){
						if(acvarthirteentwo==1){
							acvarthirteentwo=0

							if(acvartwentysix>0){
				
								audio_play_sound_at(choose(snd_ac_win_1,snd_ac_win_2,snd_ac_win_3),xps+125,yps+81, 0, Control.falloff_ref, Control.falloff_max, 2, false, 1)
							}else{
					
								audio_play_sound_at(choose(snd_ac_win_1,snd_ac_win_2,snd_ac_win_3),xps+200,yps+81, 0, Control.falloff_ref, Control.falloff_max, 2, false, 1)
							}

						}
					}

					
					if(acvarten>0.06){
						if(acvartwentysix>0){
							
						}else{
							acvarten-=0.02
						}
					}else{
						acvarten=0
						acvareight=30
						
						
						acvarthirteen=1
						acvarthirteentwo=1
					}
				}
				acvartwelve=abs(floor((acvarnine-360)/45)+1)
				if(acvarthirtytwo!=acvartwelve){
					acvarthirtytwo=acvartwelve
					
					if(acvartwentysix>0){
				
						audio_play_sound_at(choose(snd_ac_ticktwo_1,snd_ac_ticktwo_2,snd_ac_ticktwo_3),xps+125,yps+81, 0, Control.falloff_ref, Control.falloff_max, 2, false, 1)
					}else{
					
						audio_play_sound_at(choose(snd_ac_ticktwo_1,snd_ac_ticktwo_2,snd_ac_ticktwo_3),xps+200,yps+81, 0, Control.falloff_ref, Control.falloff_max, 2, false, 1)
					}
				}
				
				
			}else{
				
				//Celebrate reset
				acvartwentyonefive=0
				
				acvareleven=0
				acvareight=300
				acvarseven-=1
				acvarthirteen=0
				
				chance=acvartwelve
				
				
				
				/*
				if(choose(0,1)==0){
					other.acvarthree+=choose(2,2,3,3,5,5,10,10,50)
				}else{
					other.acvarsix+=choose(2,2,2,3,3,3,5,5,5)
				}
				*/
				chancetwo=0
				if(acvartwentysix>0){
					chance+=10
					
					if(acvartwentyeight==1){
						acvartwentyeight=3
						acvartwentyseven=150
					}					
					
				}
	
	//arcadeprizeArray[chance,1]=5
	
				//arcadeprizeArray[chance,1]=6
	
				if(arcadeprizeArray[chance,1]==0){
					acvarsix+=arcadeprizeArray[chance,0]
				}else{
					if(arcadeprizeArray[chance,1]==1){
						acvarthree+=arcadeprizeArray[chance,0]
					}else{
						if(arcadeprizeArray[chance,1]==2){
							
							//Card Drop
							for(i=0;i<arcadeprizeArray[chance,0];i+=1){

								created=instance_create_depth(xps+69+random(185-69),yps-10,0,Arcade)
								with(created){
									
									audio_play_sound_at(choose(snd_ac_cutealt_4,snd_ac_cutealt_5),x,y, 0, Control.falloff_ref, Control.falloff_max, 2, false, 1)
									
									pin=1
									hsp=0
									vsp=random_range(0.1,0.3)*-1
									grav=0.1
									hitcheck=0
									hitcd=0
									visible=false
									depth=9			
							
				
									sprite_index=abil_crab_spr
									chance=choose(0,0,0,1,1,2)
									img=185+chance
									value=(chance*5)+5
							
									image_index=img
									imgsped=0
									dur=10000
									image_angle=random(360)
									for(i=0;i<10;i+=1){
										if(instance_place(x,y,Arcade)){
											x+=choose(0,1)
											y+=choose(0,1)
										}
									}
									bonuscheck=1
									bonuschecktwo=1		
							
								}
							}
						}else{
						
							//Bonus Treasure wheel
							if(arcadeprizeArray[chance,1]==3){
								acvartwentysix=1
								acvartwentyseven=150
								acvartwentyeight=1
								acvarseven+=1
								acvartwentynine=acvarnine
								acvarthirty=acvartwelve
							}else{
								
								//Abil 1
								if(arcadeprizeArray[chance,1]==4){
									
									//CRAB
									if(crabtype==0){
									//Card Drop Crab
										for(i=0;i<arcadeprizeArray[chance,0];i+=1){

											created=instance_create_depth(xps+choose(72,100,127,154,182),yps-10,0,Arcade)
											with(created){
									
												audio_play_sound_at(choose(snd_ac_cutealt_4,snd_ac_cutealt_5),x,y, 0, Control.falloff_ref, Control.falloff_max, 2, false, 1)
									
												pin=1
												hsp=0
												vsp=random_range(0.1,0.3)*-1
												grav=0.1
												hitcheck=0
												hitcd=0
												visible=false
												depth=9			
							
												sprite_index=abil_crab_spr
												chance=2
												img=224
												value=(chance*5)+5
							
												image_index=img
												imgsped=0.015
												imgcap=3
												dur=10000
												image_angle=0
												bonuscheck=1
												bonuschecktwo=1		
												chance=100
											
							
											}
										}
									}else{
										//Squid
										if(crabtype==1){
											//Card Drop Squid
												for(i=0;i<2;i+=1){

													created=instance_create_depth(xps+choose(72,100,127,154,182),yps-10,0,Arcade)
													with(created){
									
														audio_play_sound_at(choose(snd_ac_cutealt_4,snd_ac_cutealt_5),x,y, 0, Control.falloff_ref, Control.falloff_max, 2, false, 1)
									
														pin=1
														hsp=0
														vsp=random_range(0.1,0.3)*-1
														grav=0.1
														hitcheck=0
														hitcd=0
														visible=false
														depth=9			
							
														sprite_index=abil_crab_spr
														chance=2
														img=224
														value=(chance*5)+5
							
														image_index=img
														imgsped=0.015
														imgcap=3
														dur=10000
														image_angle=0
														bonuscheck=1
														bonuschecktwo=1		
														chance=100
											
							
													}
												}											
										}
									}

								}else{
									
									
										//Abil 1 bonus wheel crab
										if(arcadeprizeArray[chance,1]==5){
											
											//CRAB BIG BONUS
											if(crabtype==0){
											chancetwo=choose(72,100,127)
											
											for(iii=0;iii<3;iii+=1){
											
												//Card Drop Crab

												created=instance_create_depth(xps+chancetwo,yps-10,0,Arcade)
												with(created){
									
													audio_play_sound_at(choose(snd_ac_cutealt_4,snd_ac_cutealt_5),x,y, 0, Control.falloff_ref, Control.falloff_max, 2, false, 1)
									
													pin=1
													hsp=0
													vsp=random_range(0.1,0.3)*-1
													grav=0.1
													hitcheck=0
													hitcd=0
													visible=false
													depth=9			
							
													sprite_index=abil_crab_spr
													chance=2
													img=224
													value=(chance*5)+5
							
													image_index=img
													imgsped=0.015
													imgcap=3
													dur=10000
													image_angle=0
													bonuscheck=1
													bonuschecktwo=1		
													chance=100
											
							
													}
													
													chancetwo+=28
												
											}
											
											arcadeArray[40,0]=200
											arcadeArray[40,1]=0
											arcadeArray[40,2]=irandom_range(69-10,185+10)
											arcadeArray[40,3]=0
											}else{
												
												//SQUID BIG BONUS
												if(crabtype==1){
					
													created=instance_create_depth(xps+random_range(50,205),yps-20,0,Arcade)
				
													with(created){
						
															pin=3
					
														depth=11
														visible=false
														image_speed=0
														sprite_index=abil_crab_spr
														img=149
														imgsave=img
														imgcap=2
						
														image_index=img+irandom(imgcap)
														imgsped=0.03
					
														spin=0
					
														dur=99999999
														hsp=random_range(0.5,1)
														vsp=0
														dir=1
														//image_xscale=other.chance
														beenhit=0
														move=0
														
														hp=0
														immune=1
														hurt=0
														audio_play_sound_at(choose(snd_crab_squid_throw_2,snd_crab_squid_throw_3),x,y, 0, Control.falloff_ref, Control.falloff_max, 2, false, 1)
							
													}															
												}else{
												
												}
											}
											
											
										}else{

										//Teasure Bonus
										if(arcadeprizeArray[chance,1]==6){			
											
											acvarthree+=30
											
												
												created=instance_create_depth(xps+choose(72,100,127,154,182),yps-10,0,Arcade)
												with(created){
									
													audio_play_sound_at(choose(snd_ac_cutealt_4,snd_ac_cutealt_5),x,y, 0, Control.falloff_ref, Control.falloff_max, 2, false, 1)
									
													pin=1
													hsp=0
													vsp=random_range(0.1,0.3)*-1
													grav=0.1
													hitcheck=0
													hitcd=0
													visible=false
													depth=9										
													sprite_index=abil_crab_spr
							
													image_index=img
													imgsped=0.01
													imgcap=3
													dur=10000
													image_angle=0
													bonuscheck=1
													bonuschecktwo=1		
													chance=100

															img=212
															value=100
															imgsped=0.04
															imgcap=12
															image_index=img+random(imgcap)
														
														chance=100
							
													}												
										
											}
										}	
								}
							//	}							
							}
						}
					//	}
							/*
								acvartwentysix=1
								if(acvartwentyeight!=3){
									acvartwentyseven=100
								}
								acvartwentyeight=1
								acvarseven+=1		
							*/
						
					}
				}



			}
		}
	}


	

if(acvartwentysix==0){

		//Crab Claw
		if(crabtype==0){
			if(arcadeArray[40,0]>0){
				arcadeArray[40,0]-=1
			
			
				if(arcadeArray[40,0]>150){
					arcadeArray[40,1]+=1
				}else{
					if(arcadeArray[40,0]>105){
						if(arcadeArray[40,3]<2){
							if(arcadeArray[40,0] mod 15 == 0){
								arcadeArray[40,3]+=1
							}
						
						}
					}else{
						if(arcadeArray[40,0]>0){
						
							with(Arcade){
								if(pin==1){
									//if(point_distance(x,y,other.xps-0.5+other.arcadeArray[40,2],other.yps-0.5+142+-other.arcadeArray[40,1]*0.5)<8){
									chance=other.xps-0.5+other.arcadeArray[40,2]
									chancetwo=other.yps-0.5+142-other.arcadeArray[40,1]*0.5
									if(x>=chance-8&&x<=chance+5&&y>=chancetwo-7&&y<=chancetwo+12){
										y+=1
									}
								}
							}
						
							arcadeArray[40,0]-=1
							arcadeArray[40,1]-=1
						}else{
			
						}				
					}			
				}
			}
		}else{

			//Squid Lightning
			if(arcadeArray[40,0]>0){
				arcadeArray[40,0]-=1
			
			
				if(arcadeArray[40,0]>150){
					arcadeArray[40,1]+=1
				}else{
					if(arcadeArray[40,0]>105){
						if(arcadeArray[40,3]<2){
							if(arcadeArray[40,0] mod 15 == 0){
								arcadeArray[40,3]+=1
							}
						
						}
					}else{
						if(arcadeArray[40,0]>0){
						
							with(Arcade){
								if(pin==1){
									//if(point_distance(x,y,other.xps-0.5+other.arcadeArray[40,2],other.yps-0.5+142+-other.arcadeArray[40,1]*0.5)<8){
									chance=other.xps-0.5+other.arcadeArray[40,2]
									chancetwo=other.yps-0.5+142-other.arcadeArray[40,1]*0.5
									if(x>=chance-8&&x<=chance+5&&y>=chancetwo-7&&y<=chancetwo+12){
										y+=1
									}
								}
							}
						
							arcadeArray[40,0]-=1
							arcadeArray[40,1]-=1
						}else{
			
						}				
					}			
				}
			}

		}


		chance=16*2
		//Hoop
		if(acvarfifteen==0){
			if(acvarfourteen<chance){
				acvarfourteen+=0.5
			}else{
				acvarfifteen=1
			}
		}else{
			if(acvarfourteen>(chance)*-1){
				acvarfourteen-=0.5
			}else{
				acvarfifteen=0
			}		
		}	
	
		/*
		//Cannon Angle
		if(global.con_h_w||global.conp_h_w){
			if(acvarseventeen==0){
				if(acvarsixteen<16){
					acvarsixteen+=0.5
				}else{
					acvarseventeen=1
				}
			}else{
				if(acvarsixteen>-4){
					acvarsixteen-=0.5
				}else{
					acvarseventeen=0
				}			
			}
		}
		*/
		
		if(global.con_h_up||global.conp_h_up){
				if(acvarsixteen<18){
					acvarsixteen+=0.5
				}			
		}
		if(mouse_wheel_up()){
				if(acvarsixteen<18){
					acvarsixteen+=1
				}			
		}

		if(global.con_h_down||global.conp_h_down){
				if(acvarsixteen>-7){
					acvarsixteen-=0.5
				}			
		}

		if(mouse_wheel_down()){
				if(acvarsixteen>-7){
					acvarsixteen-=1
				}				
		}
		

		chance=0
		
		//Token
		if(tokens>0&&acvarthirtythree<=0){
			if(global.con_p_r||global.conp_p_w){
				tokens-=1
				tokenangle=random(360)
				tokentype=choose(0,1,1,1)
				tokentype=0
				acvarthirtythree=45
			}
		}
		
		if(acvarthirtythree>0){
			
			acvarthirtythree-=0.25
			
			if(acvarthirtythree>18){
				acvarthirtythree-=0.75

			}else{
			
				if(acvarthirtythree<5){
					acvarthirtythree=0
				}
			
			}
				if(acvarthirtythree==0){
					acvarsix+=5
				}			
		}
		
		if(acvarsix>0){
			if(global.con_p_q||global.conp_p_shl||global.conp_p_r||global.conp_p_l){
				chance=1
				chancex=32-8
			}
			if(global.con_p_e||global.conp_p_shr||global.conp_p_q||global.conp_p_e){
				chance=2
				chancex=222+8
			}
			
			
			if(mouse_check_button_pressed(mb_left)){
				chance=1
				chancex=32-8
			}
			if(mouse_check_button_pressed(mb_right)){
				chance=2
				chancex=222+8
			}				
			
		}



			if(global.con_h_w&&mouse_check_button_pressed(mb_left)){
				
				
				created=instance_create_depth(mouse_x,mouse_y,0,Arcade)
				with(created){
					pin=1
					hsp=0
					vsp=0
					grav=0.03
					hitcheck=0
					hitcd=0
					visible=false
					depth=10
				
					sprite_index=abil_crab_spr
					img=54
					canhit=1
					image_index=img
					imgsped=0
					dur=10000
				
					image_angle=random(360)
				
					bonuscheck=1
					bonuschecktwo=1
					value=1
					
				}		
				
			}


		if(chance>0){
			
			event+=1
			
			//Squid life
			with(Arcade){
				if(pin==3){
					
					if(immune==0){
						hp+=1
					}
				}
			}
			
			if(chance==1){
				arcadeArray[36,0]=7
				
				vibratetick=1
				vibrateamountl=0.05
				vibrateamountr=0
				vibrate=10
			}else{
			
				if(chance==2){
					arcadeArray[36,1]=7
					
					vibratetick=1
					vibrateamountl=0
					vibrateamountr=0.05
					vibrate=10
				}
			}
			
			//Cannon
			audio_play_sound_at(choose(snd_ac_cannon_1,snd_ac_cannon_2),xps+chancex,yps+81, 0, Control.falloff_ref, Control.falloff_max, 2, false, 1)	
			
				acvarsix-=1
				
				
				for(i=0;i<3;i+=1){
					created=instance_create_depth(xps+chancex-3+random(6),yps+82-6-3+random(6),0,Part)
					with(created){
						
						image_speed=0
						sprite_index=part_spr
						img=2
						imgcap=3
						
						image_index=img+irandom(imgcap)
						
						imgsped=random_range(0.075,0.15)
					
						spin=3*choose(1,-1)
					
						dur=30+irandom(30)
						hsp=0
						vsp=random_range(0.15,0.2)*-1
					}
				}
				
				//Fire the Fish
				created=instance_create_depth(xps+chancex,yps+81,0,Arcade)
				with(created){
					pin=1
					hsp=0
					vsp=0
					grav=0.035
					hitcheck=-1
					hitcd=0
					visible=false
					depth=10
				
					sprite_index=abil_crab_spr
					img=54
					canhit=1
					image_index=img
					imgsped=0
					dur=10000
				
					image_angle=random(360)
				
					vsp=-2.2
				
					chance=1.8+random_range(-0.15,0.15)
					
					if(other.chance==1){
						hsp=chance
					}else{
						hsp=chance*-1
					}
					bonuscheck=1
					bonuschecktwo=1
					
					speed=3
					if(other.chance==1){
						direction=45+other.acvarsixteen+random_range(-1.5,1.5)
					}else{
						direction=135-other.acvarsixteen+random_range(-1.5,1.5)
					}
					
					hsp=hspeed
					vsp=vspeed
					speed=0
					value=1
					
				}	
		}
		
		

		
		acvardur+=1
			
			//Dispense bonus fish
			if(acvardur mod 20==0){
				if(acvarthree>0){
					acvarthree-=1
					//for(i=0;i<chance;i+=1){
				
				if(irandom(19)!=1){
						//Normal
						created=instance_create_depth(xps+69+random(185-69),yps,0,Arcade)
						with(created){
							
							audio_play_sound_at(choose(snd_ac_tick_1,snd_ac_tick_2,snd_ac_tick_3),x,y, 0, Control.falloff_ref, Control.falloff_max, 2, false, 1)
							
							pin=1
							hsp=0
							vsp=random_range(0.1,0.3)*-1
							grav=0.1
							hitcheck=0
							hitcd=0
							visible=false
							depth=10
				
							sprite_index=abil_crab_spr
							img=53
							image_index=img
							imgsped=0
							dur=10000
							image_angle=random(360)
							for(i=0;i<10;i+=1){
								if(instance_place(x,y,Arcade)){
									x+=choose(0,1)
									y+=choose(0,1)
								}
							}
							bonuscheck=1
							bonuschecktwo=1			
							value=1
						}
				}else{
								created=instance_create_depth(xps+69+random(185-69),yps-10,0,Arcade)
								with(created){
									
									audio_play_sound_at(choose(snd_ac_cutealt_4,snd_ac_cutealt_5),x,y, 0, Control.falloff_ref, Control.falloff_max, 2, false, 1)
									
									pin=1
									hsp=0
									vsp=random_range(0.1,0.3)*-1
									grav=0.1
									hitcheck=0
									hitcd=0
									visible=false
									depth=9			
							
				
									sprite_index=abil_crab_spr
									chance=choose(0,0,0,1,1,2)
									img=185+chance
									value=(chance*5)+5
							
									image_index=img
									imgsped=0
									dur=10000
									image_angle=random(360)
									for(i=0;i<10;i+=1){
										if(instance_place(x,y,Arcade)){
											x+=choose(0,1)
											y+=choose(0,1)
										}
									}
									bonuscheck=1
									bonuschecktwo=1		
							
								}				
				}
					//}				
				}
			}
	//}
			
				if(acvarone>0){
					acvarone-=1
				}else{
					
					with(Arcade){
						if(pin==1){
							chance=other.yps
							if(hitcheck!=-1){
								if(y>=chance+60&&y<=chance+70||y>=chance+95&&y<=chance+104){
									vsp=0.8
								}
							}
						}
					}
					
					acvarone=acvartwo
				}			
			
						//Small hoop light
						for(i=0;i<5;i+=1){
							
							if(arcadeArray[20,i]>0){
								arcadeArray[20,i]-=1
								
							}
								if(arcadeArray[20,i]==0){
									arcadeArray[21,i]=0
								}							
						}
		
			with(Arcade){	
						
//Treasure Glow
if(img==212){
	
		if(dur mod 10 == 0){
			created=instance_create_depth(x+1-3+random(6),y-1+random(7),0,Part)
			with(created){
						
												image_speed=0
												sprite_index=part_spr
												img=44
												imgcap=2
						
												image_index=img+irandom(imgcap)
						
												imgsped=random_range(0.075,0.15)
												imgsped=0
					
												spin=0
					
												dur=10+irandom(10)
												hsp=0
												vsp=random_range(0.2,0.25)*-1
			}
	}
}

				if(pin==1){
					
					x+=hsp
					y+=vsp


					if(vsp<3){
						vsp+=grav
					}
					
					image_angle+=hsp*3
					
					if(imgsped>0){
						if(image_index+imgsped<=img+imgcap){
							image_index+=imgsped
						}else{
							image_index=img
						}
					}

					if(hitcheck==-1){
						if(vsp>0){
							hitcheck=0
						}
					}

					//Hoop
					if(bonuscheck==1){
						//xps-0.5+126+acvarfourteen,yps-0.5+55
						if(img==54){
							if(x>=other.xps-0.5+126+other.acvarfourteen-12&&x<=other.xps-0.5+126+other.acvarfourteen+12){
								if(y>=other.yps-0.5+55-8-3&&y<=other.yps-0.5+55-8+3){
									bonuscheck=0
									
									audio_play_sound_at(choose(snd_ac_chime_1,snd_ac_chime_2,snd_ac_chime_3),x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)								
									
									if(other.acvarseven<5){
										//other.acvarseven+=1
									}
									if(other.acvareighteen<3){
										other.acvareighteen+=1
									}									
									//game_end()
									other.acvarnineteen=15
									
										for(i=0;i<3;i+=1){
											created=instance_create_depth(x-3+random(6),y-3+random(6),0,Part)
											with(created){
						
												image_speed=0
												sprite_index=part_spr
												img=44
												imgcap=2
						
												image_index=img+irandom(imgcap)
						
												imgsped=random_range(0.075,0.15)
												imgsped=0
					
												spin=0
					
												dur=15+irandom(20)
												hsp=0
												vsp=random_range(0.2,0.25)*-1
											}
										}
								}
							}
						}
					}

					if(hitcheck>0||hitcheck==-1){
						
						
						if(hitcheck>0){
							if(hitcd==0){
								if(y>other.yps+95){
								if(vsp!=0||hsp!=0){
									hit=instance_place(x+hsp,y+vsp,Arcade)
									if(hit!=noone){
										
										with(Arcade){
											if(pin==1){
												if(instance_place(x,y,other)){
													vsp=other.vsp*0.9
												
													vsp=other.vsp*0.8
													hitcd=10
								
													other.vsp=other.vsp*0.5
												
													other.vsp=other.vsp*0.4
													other.hitcd=15
												}
											}
										}
									}
								}
							}else{
							
									hit=instance_place(x,y,Arcade)
									if(hit!=noone){
										chance=choose(-1,0,1)
										chancetwo=choose(-1,0,1)
										
										if(y+chancetwo<=other.yps+63||hit.y+(chancetwo*-1)<=other.yps+63){
											chancetwo=choose(0)
										}
										
										x+=chance
										hit.x+=chance*-1
										
										y+=chancetwo
										hit.y+=chancetwo*-1										
										
									}
							}
							}else{
								hitcd-=1
							}
								
									if(vsp!=0){
										if(y>other.yps+95){
											hit=instance_place(x+hsp,y+vsp,Arcade)
											if(hit!=noone){
												hit.y+=0.1
											}
										}
									}
						}
						
						
					
						
						chance=0.02
						
						if(hitcheck>0){
							if(abs(vsp)>0){
								if(vsp-chance>=0){
									vsp-=chance
								}else{
									if(vsp+chance<=0){
										vsp+=chance
									}else{
										vsp=0
									}
								}
							}
						}
						if(abs(hsp)>0){
							if(hsp-chance>=0){
								hsp-=chance
							}else{
								if(hsp+chance<=0){
									hsp+=chance
								}else{
									hsp=0
								}
							}
						}						
					
					}
					
					//Seagull/SQUID
					if(img==54){
						if(canhit==1){
						if(y<other.yps+56){
								hit=instance_place(x+hsp,y+vsp,Arcade)
								if(hit!=noone){
									if(hit.pin==2||hit.pin==3){
										if(hit.beenhit==0){
											hit.beenhit=1
											hsp=hsp*-0.1
											vsp=vsp*-0.1
											
											//Squidhit
											if(hit.pin==3){
													created=instance_create_depth(other.xps+69+random(185-69),other.yps-10,0,Arcade)
													with(created){
									
														audio_play_sound_at(choose(snd_ac_cutealt_4,snd_ac_cutealt_5),x,y, 0, Control.falloff_ref, Control.falloff_max, 2, false, 1)
									
														pin=1
														hsp=0
														vsp=random_range(0.1,0.3)*-1
														grav=0.1
														hitcheck=0
														hitcd=0
														visible=false
														depth=9			
							
				
														sprite_index=abil_crab_spr
														chance=choose(0,0,0,1,1,2)
														img=143
														value=10
							
														image_index=img
														imgsped=0
														dur=10000
														image_angle=random(360)
														for(i=0;i<10;i+=1){
															if(instance_place(x,y,Arcade)){
																x+=choose(0,1)
																y+=choose(0,1)
															}
														}
														bonuscheck=1
														bonuschecktwo=1		
														hsp=random_range(0.3,0.5)*choose(1,-1)
														vsp=-2
							
													}	

											}
										}
										canhit=0
									}	
								}						
						}
						}
					}

					
					//On board slow
					if(hitcheck==0){
						if(x>=other.xps+69-5&&x<=other.xps+185+5){
							if(y>=other.yps+60){
						
								hitcheck=1
								grav=0
								vsp=random_range(0.1,0.5)
								hsp=hsp*choose(0.4,0.5,0.6)
							}
						}
						if(x>=other.xps+69-5-20&&x<=other.xps+185+5+20){
							if(y>=other.yps+84){
						
								hitcheck=1
								grav=0
								vsp=random_range(0.1,0.5)
								hsp=hsp*choose(0.4,0.5,0.6)
							}
						}						
					}		


						

					//Small square bonus
					if(bonuschecktwo==1){
						chance=0
						chancetwo=0
						
						for(i=0;i<5;i+=1){
							
							if(x>=other.xps+70+chancetwo&&x<=74+other.xps+i*28&&y>=other.yps+90&&y<=94+other.yps){
								chance=1

								other.arcadeArray[20,i]=15
								other.arcadeArray[21,i]=1

										for(ii=0;ii<3;ii+=1){
											created=instance_create_depth(x-3+random(6),y-3+random(6),0,Part)
											with(created){
						
												image_speed=0
												sprite_index=part_spr
												img=44
												imgcap=2
						
												image_index=img+irandom(imgcap)
						
												imgsped=random_range(0.075,0.15)
												imgsped=0
					
												spin=0
					
												dur=15+irandom(20)
												hsp=0
												vsp=random_range(0.2,0.25)*-1
											}
										}

								if(other.acvarseven<5){
									other.acvareighteen+=1
								}
								bonuschecktwo=0
								audio_play_sound_at(choose(snd_ac_chimetwo_1,snd_ac_chimetwo_2,snd_ac_chimetwo_3),x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)	
									
									//Hit square extra bonus
									if(other.arcadeArray[31+i,0]!=0){
										
										chancefour=other.arcadeArray[31+i,0]
										
										
										chance=irandom(4)
										while(other.arcadeArray[31+chance,0]!=0||other.arcadeArray[31+chance,0]==31+i){
											chance=irandom(4)
										}
										
										other.arcadeArray[31+i,0]=0
										
										other.arcadeArray[31+chance,0]=choose(1,1,1,1,1,2,2,2,2,2,3,3,4)
										
										other.arcadeArray[30,0]+=1
										audio_play_sound_at(choose(snd_ac_chime_1,snd_ac_chime_2,snd_ac_chime_3),x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)	
										
										//Normal
										created=instance_create_depth(x,y,0,Arcade)
										with(created){
							
											audio_play_sound_at(choose(snd_ac_tick_1,snd_ac_tick_2,snd_ac_tick_3),x,y, 0, Control.falloff_ref, Control.falloff_max, 2, false, 1)
							
											pin=1
											hsp=0
											vsp=random_range(0.1,0.3)*-1
											grav=0.1
											hitcheck=0
											hitcd=0
											visible=false
											depth=10
				
											sprite_index=abil_crab_spr
											img=183+other.chancefour
											image_index=img
											imgsped=0
											dur=10000
											image_angle=random(360)
											bonuscheck=0
											bonuschecktwo=0	
											if(other.chancetwo==1){
												value=1
											}else{
												value=(other.chancefour-1)*5
											}
										}	
										
										
										
									}
							}
							if(i==1||i==4||i==5){
								chancetwo+=28
							}else{
								chancetwo+=27
							}
							//other.arcadeArray[21,i]=1
						}
					}
					

					
					
					if(hitcheck!=-1){
					
						if(y>=other.yps+69&&y<=other.yps+96){			
							grav=0.03
						}
						if(y>other.yps+96&&y<=other.yps+123){	
							grav=0
						}
					
						if(y>other.yps+123){
							grav=0.1
						}
						if(y>other.yps+142){
							
							other.acvartwenty+=value
							
							//Ticket count for coins collected
							other.arcadeArray[100,0]+=1
							other.arcadeArray[100+other.arcadeArray[100,0],0]=60
							other.arcadeArray[100+other.arcadeArray[100,0],1]=value
							other.arcadeArray[100+other.arcadeArray[100,0],2]=x
							other.arcadeArray[100+other.arcadeArray[100,0],3]=0
							
							audio_play_sound_at(choose(snd_ac_cute_1,snd_ac_cute_2,snd_ac_cute_3,snd_ac_cute_4),x,y, 0, Control.falloff_ref, Control.falloff_max, 2, false, 1)
							
							instance_destroy()
						}
						
					}
					
					
				}else{

					//Seagull Active
						if(pin==2){
							if(beenhit==0){
								if(dir==1){
									if(x<other.xps+255){
										x+=hsp
									}else{
										instance_destroy()
									}
					
									if(image_index<img+2){
										y+=0.3
									}else{
										y-=0.3
									}
								}else{
									if(x>other.xps-5){
										x+=hsp
									}else{
										instance_destroy()
									}
					
									if(image_index<img+2){
										y+=0.3
									}else{
										y-=0.3
									}								
								}
					
								created.x=x-(dir*4)
								created.y=y+2
								created.hsp=0
								created.vsp=0
								
								createdtwo.x=x-(dir*7)
								createdtwo.y=y+4
								createdtwo.hsp=0
								createdtwo.vsp=0								
							}else{
				
								if(beenhit==1){
									audio_play_sound_at(choose(snd_enemy_yell_4,snd_enemy_yell_5,snd_enemy_yell_6),x,y, 0, Control.falloff_ref, Control.falloff_max, 2, false, 1)
								}
								if(beenhit<20){
						
									beenhit+=1
						
									y+=0.2
									img=58
									image_index=img+imgcap-1
						
									if(beenhit==20){
										img=57
										image_index=img
									}
					
								}else{
									if(y>other.yps-10){
										if(image_index<img+2){
											y-=0.1
										}else{
											y-=0.3
										}
									}else{
						
										instance_destroy()
									}				
								}
							}
				
				
						}else{
							
							
							//Big Squid Active
							if(pin==3){
								immune=0
								if(image_index<=img+1&&move==0){
									
									if(hp<4){
										if(x>other.xps+75&&x<other.xps+255-75){
											hsp=random_range(0.5,1)*choose(1,-1)
										}else{
											if(x<other.xps+75){
												hsp=random_range(0.5,1)
											}else{
												hsp=random_range(0.5,1)*-1
											}
										}

										if(y>other.yps+15+10&&y<other.yps+50-10){
											
											vsp=random_range(0.5,1)*choose(1,-1)
										}else{
											if(y<other.yps+15+10){
												vsp=random_range(0.5,1)
											}else{
												vsp=random_range(0.5,1)*-1
											}
										}	
									}else{
										
										if(hp<100){
											audio_play_sound_at(choose(snd_crab_squid_throw_2,snd_crab_squid_throw_3),x,y, 0, Control.falloff_ref, Control.falloff_max, 2, false, 1)
											hp=100
										}
										hsp=0
										vsp=2*-1
										
										if(y<other.yps-30){
											instance_destroy()
										}
									}
									move=1
								}
								if(image_index>=img+1){
									move=0
								}
								
								hsp=hsp*0.95
								vsp=vsp*0.95
								
								x+=hsp
								y+=vsp

								
								if(beenhit>=1){
									audio_play_sound_at(choose(snd_crab_squid_shock_1,snd_crab_squid_shock_2),x,y, 0, Control.falloff_ref, Control.falloff_max, 2, false, 1)
									beenhit=0
									
									if(hurt<=0){
										img=imgsave+9
										image_index+=9									
									}
									hurt=30
								}
								
								if(hurt>0){
									hurt-=1
								
									if(hurt==0){
										img=imgsave
										image_index-=9
									}
								}
							
							}
						
						}				
				}
			}

					//Square Bonus Fish
						for(ii=0;ii<5;ii+=1){
							
							//Square bonus fish move
							if(arcadeArray[31+ii,2]==0){
								
								if(arcadeArray[31+ii,1]<100){
									arcadeArray[31+ii,1]+=1
								}else{
									arcadeArray[31+ii,2]=1
								}
							}else{
								if(arcadeArray[31+ii,1]>0){
									arcadeArray[31+ii,1]-=1
								}else{
									arcadeArray[31+ii,2]=0
								}							
							}
						}

//Ticket count for coins collected
if(arcadeArray[100,0]>0){
    var a = 1;
    while(a <= arcadeArray[100,0]){
        if(arcadeArray[100+a,0]>1){
            arcadeArray[100+a,0]-=1;
            a += 1;
        }else{
            if(a<arcadeArray[100,0]){
                for(var b=0;b<3;b+=1){
                    arcadeArray[100+a,b]=arcadeArray[100+a+1,b];
                    arcadeArray[100+a+1,b]=0;
                }
            }else{
                for(var b=0;b<3;b+=1){
                    arcadeArray[100+a,b]=0;
                }                       
            }
            arcadeArray[100,0]-=1;
            if(a != arcadeArray[100,0]){
                a += 1;
            }
        }
    }
}
		
		}

	}else{
	

	//Bee Hive Game
	if(arcadetype==2){


		if(arcade==1){
			arcade=0

			// Save Me position if Me exists, otherwise use defaults
			if(instance_exists(Me)){
				arcmexsave=Me.x
				arcmeysave=Me.y
			}else{
				arcmexsave=0
				arcmeysave=0
			}
			
			playerbee=instance_create_depth(xps+120,yps+70,0,Arcade)
			with(playerbee){
				sprite_index=arcade_bee
				visible=false
				img=148
				imgsped=0.08
				imgcap=3
				image_index=img
				image_xscale=0.5
				image_yscale=0.5
				
				attcd=0
				attcdtotal=100
				
				dir=1
				
				hp=10
				hptotal=hp
				
				statatt=0
				statsped=0
				statattsped=0
				statpower=0
				sped=0.5
				
				statattdraw=0
				statspeddraw=0
				statattspeddraw=100	
				statattspeddrawtwo=attcdtotal-(attcdtotal*(5*0.01))
				
			}
			
			levelupselecttotal=4
			
			arcselect=0
					
			
			acvartimer=0
			arcwave=0
			arcwavetimer=0
			arcwavetick=0
			
			acvarone=100
			acvartwo=100
			
			//Bonus
			acvarthree=0
			
			//Tickets
			acvarfour=0
			//Level
			acvarfive=1
			//Plays
			acvarsix=15
			//Bonus Que
			acvarseven=0
			acvareight=300
			
			arcadegrid=16
			arcadegridsize=50
			arcsped=0.5
			
			arcpause=0
			arcmenutick=0
			arcmenutickamount=0
			
			
			for(a=0;a<arcadegridsize;a+=1){
				for(b=0;b<arcadegridsize;b+=1){
					arcadeterrArray[a,b]=1
				}
			}
			
			arcx=floor(arcadegridsize/2)
			arcy=floor(arcadegridsize/2)
			
		}
		
		
		if(arcpause!=0){
		
			if(arcmenutick==0){
				if(arcmenutickamount<0.5){
					arcmenutickamount+=0.01
				}else{
					arcmenutick=1
				}
			}else{
				if(arcmenutick==1){
					if(arcmenutickamount>0-0.5){
						arcmenutickamount-=0.01
					}else{
						arcmenutick=0
					}
				}else{
			
				}			
			}
		
			//Level up select
			if(arcpause==1){
				
				if(global.con_p_right||global.conp_p_right){
					if(arcselect<levelupselecttotal-1){
						arcselect+=1
					}else{
						arcselect=0
					}
				}
				if(global.con_p_left||global.conp_p_left){
					if(arcselect>0){
						arcselect-=1
					}else{
						arcselect=levelupselecttotal-1
					}
				}				
				

				if(global.con_p_e||global.conp_p_e||global.con_p_space||global.conp_p_space){
					//Attack
					if(arcadeArray[1,arcselect+1]==0){
						playerbee.statatt+=1
					}else{
						//Attack Speed
						if(arcadeArray[1,arcselect+1]==1){
							playerbee.attcdtotal-=(playerbee.attcdtotal*(5*0.01))
							playerbee.statattsped+=1
							
							playerbee.statattspeddraw=playerbee.attcdtotal
							
							playerbee.statattspeddrawtwo-=(playerbee.attcdtotal*(5*0.01))
						}else{
							//Speed
							if(arcadeArray[1,arcselect+1]==2){
								playerbee.statsped+=1
							}else{
								//Power
								if(arcadeArray[1,arcselect+1]==3){
									playerbee.statpower+=1
								}else{
					
								}					
							}					
						}					
					}
					
					arcpause=0
				}
			}
		
		}else{
			


		//Wave/Difficulty/Game progression
	//	arcwavetimer=1000
	//	arcwave=9
		if(arcwave!=10){
			if(arcwavetimer<1000){
				arcwavetimer+=1
			}else{
				arcwave+=1
				arcwavetimer=0
				
				if(arcwave==10&&arcwavetick==0){
					
					arcwavetick=1
				//Create Boss
				created=instance_create_depth(xps+120,yps+70,0,Arcade_two)
			
				//Daisy Boss
				with(created){
					sprite_index=arcade_bee
					visible=false
					type=0	
					
					pin=1
					enpin=100
					hp=90
					hptotal=hp
				
					sprite_index=arcade_bee_big
					imgcap=4
					img=1
					imgsave=img
					image_index=img
					imgsped=0.04
							
					sped=0
					image_xscale=0.5
					image_yscale=0.5	
				
					attcd=20
					
					attcdtwo=600
					attcdtwototal=attcdtwo
					attcdtwo=200
					attack=choose(1,2,3)
					phase=0
					hplow=0
				
					xp=choose(15,15,16,17)
				
				}						
				}
			}
		}
			
		//Level Up
		chance=1
		if(acvarfour>=chance*acvarfive){
			acvarfour-=chance*acvarfive
			acvarfive+=1
			
			arcpause=1

			for(i=0;i<levelupselecttotal;i+=1){
				arcadeArray[1,1+i]=irandom(2)
				arcadeArray[2,1+i]="NONE"

			}


			for(i=0;i<levelupselecttotal;i+=1){
				if(arcadeArray[1,1+i]==0){
					arcadeArray[2,1+i]="Attack"
				}else{
					if(arcadeArray[1,1+i]==1){
						arcadeArray[2,1+i]="Att Speed"
					}else{
						if(arcadeArray[1,1+i]==2){
							arcadeArray[2,1+i]="Speed"
						}else{
							if(arcadeArray[1,1+i]==3){
								arcadeArray[2,1+i]="Health"
							}else{
				
							}				
						}				
					}				
				}
				
			}
			
			
			

		}
		
		
		if(arcwave!=10){
		//Enemy Spawn
		if(acvartimer<200-floor(arcwave*4)){
			acvartimer+=1
		}else{
			
				acvartimer=0
			
			
				chance=xps+120-60+random(120)
				chancetwo=yps+70-60+random(120)
			
				while(point_distance(chance,chancetwo,playerbee.x,playerbee.y)<48){
				
					chance=xps+120-60+random(120)
					chancetwo=yps+70-60+random(120)
				
				}
			
				//Create Enemy
				created=instance_create_depth(chance,chancetwo,0,Arcade_two)
			
				with(created){
					sprite_index=arcade_bee
					visible=false
					type=irandom(5)
					if(Control.arcwave<5){
						type=choose(2,2,4,5)
				
					}else{
						if(Control.arcwave<10){
							type=choose(2,2,2,4,4,5,5,3,1)
				
						}else{
							if(Control.arcwave<15){
								type=choose(2,2,2,4,4,5,5,3,1,1,1)
				
							}else{
								if(Control.arcwave<20){
									type=choose(2,2,2,4,4,5,5,3,1,1,1,1,0,0)
				
								}else{
									if(Control.arcwave<25){
										type=choose(2,4,5,3,1,1,1,0,0)
				
									}else{
										if(Control.arcwave<30){
											type=choose(2,4,5,3,1,1,1,0,0)
				
										}else{
											type=choose(2,4,5,3,1,1,1,0,0)
										}					
									}					
								}					
							}					
						}				
					}
				
				
					img=168+type*4
					imgsped=0.08
					imgcap=4
					image_index=img
					pin=1
				
				
					sped=0.08
					image_xscale=0.5
					image_yscale=0.5	
				
					attcd=20
				
					hp=2
				
					enpin=0
					xp=choose(1,1,2)
				
					//Sunflower
					if(type==0){
						hp=5
					
						sped=0.07
						enpin=2
						xp=choose(3,3,4)
					}else{
						//Daisy
						if(type==1){
							hp=3
						
							sped=0.14
							enpin=1
							xp=choose(2,2,3)
						}
					}
				}		
			
		}	
		}
		
		
		
		//Control Player
		if(instance_exists(playerbee)){
			with(playerbee){
				
				//Beestat
				chance=statsped
				statspeddraw=sped+(sped*(chance*0.05))
				statspeddrawtwo=sped+(sped*((statsped+1)*0.05))
				//statattspeddraw=attcdtotal-(attcdtotal*(statattsped*0.01))
				dmgtotal=1
				statattdraw=dmgtotal+(dmgtotal*(statatt*0.05))
				statattdrawtwo=dmgtotal+(dmgtotal*(statatt+1)*0.05)

				chance=statspeddraw

				if(global.con_h_up||global.conp_h_up){
					y-=chance
					dir=3
				}else{
					if(global.con_h_down||global.conp_h_down){
						y+=chance
						dir=1
					}		
				}
				if(global.con_h_left||global.conp_h_left){
					x-=chance
					dir=2
				}else{
					if(global.con_h_right||global.conp_h_right){
						x+=chance
						dir=0
					}		
				}	

				//Pickup Pollen
				hit=instance_place(x,y,Arcade_four)
				if(hit!=noone){
					Control.acvarfour+=1
					with(hit){
						instance_destroy()
					}
				}

				if(attcd>0){
					attcd-=1
				}else{
					attcd=attcdtotal
					
							created=instance_create_depth(x,y,0,Arcade_three)
							with(created){
								sprite_index=arcade_bee
								visible=false
								img=50
								imgsped=0.1
								imgcap=2
								image_index=img
								pin=1
								
								dmgtotal=1
								dmg=dmgtotal+(dmgtotal*(other.statatt*0.01))
				
								sped=0.6
								image_xscale=0.5
								image_yscale=0.5	
								
								dur=150
								
								hsp=0
								vsp=0
								
								type=0
								
								if(type==0){
								
								if(instance_exists(Arcade_two)){
										target=instance_nearest(x,y,Arcade_two)
										move_towards_point(target.x,target.y, sped)
								}else{
										move_towards_point(x,y+20, sped)
								}
									hsp=hspeed
									vsp=vspeed
									image_angle=direction
									
									speed=0								
								}else{

									
									


								//Stinger
								if(type==1){
									if(other.dir==0){
										hsp=sped
									}else{
										if(other.dir==1){
											vsp=sped
											image_angle=270
										}else{
											if(other.dir==2){
												hsp=sped*-1
												image_angle=180
											}else{
												if(other.dir==3){
													vsp=sped*-1
													image_angle=90
												}else{
								
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
		
		//Enemy
		with(Arcade_two){
		
			//Daisy Boss
			if(enpin==100){
				
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
						//attack=3
						//attack=1
						
						//attack=choose(2,3)
						if(hp>=hptotal*0.5){
							//hp-=hptotal*0.5
							//hp-=1
							//hplow=1
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
						
						if(attcdtwo<attcdtwosav-20&&img==imgsave+8){
							img+=1
							image_index=img
						}else{
							if(attcdtwo<attcdtwosav-30&&img==imgsave+9){
								img+=1
								image_index=img
								imgcap=8
								imgsped=0.08
							}else{
								
								//Spawn little daisies
								if(attcdtwo mod 60==0){
									
									for(i=0;i<1;i+=1){
										with(Control){
											chance=xps+120-60+random(120)
											chancetwo=yps+70-60+random(120)
			
											while(point_distance(chance,chancetwo,playerbee.x,playerbee.y)<48){
				
												chance=xps+120-60+random(120)
												chancetwo=yps+70-60+random(120)
				
											}
			
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
							}						
						}
						
					}else{
						attcdtwo=attcdtwototal
						phase=0
						
						img=imgsave
						image_index=img
						imgsped=0.04
						imgcap=4
					
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
									imgcap=4		
									
								chance=0
								
								for(i=0;i<32;i+=1){
									
									
									created=instance_create_depth(x,y,0,Arcade_five)
									with(created){
										sprite_index=arcade_bee_big
										visible=false
										img=47+(other.chance)
										img=47+choose(0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,9,9,10)
										imgsped=0
										imgcap=1
										image_index=img
										pin=1
										creator=other.id
								
										dmgtotal=1
										dmg=dmgtotal
				
										sped=0.7
										sped=random_range(0.6,1.2)
										image_xscale=0.5
										image_yscale=0.5	
								
										dur=900
										durtotal=dur
								
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
						
							img=imgsave
							image_index=img
							imgsped=0.04
							imgcap=4						
						}
						}else{
						
							//Song Sing
							if(attack==3){
								if(phasetick==0){
								if(image_index>=img+imgcap-1){
									img=imgsave+38
									image_index=img
									imgsped=0.06
									
									attcdtwo=600
									phasetick=1
								}
								}else{
									
									if(attcdtwo>0){
										attcdtwo-=1

											chance=floor(image_index)

												//if(attcdtwo mod 50 ==0){
											if(chance==40||chance=41||chance==42||chance==43){
												if(singlast!=floor(image_index)){
													singlast=floor(image_index)
													
													for(i=0;i<2;i+=1){
																	
														created=instance_create_depth(x,y,0,Arcade_five)
														with(created){
															sprite_index=arcade_bee_big
															visible=false
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
				
															sped=0.7
															sped=random_range(0.6,0.9)
															sped=random_range(0.3,0.4)
															image_xscale=0.5
															image_yscale=0.5	
								
															dur=800
															durtotal=dur
								
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
														}	
													}	
												}
											}
										
									}else{
										attcdtwo=floor(attcdtwototal*0.01)
										phase=0
										phasetick=0
										attcdtwo=60
						
										img=imgsave
										image_index=img
										imgsped=0.04
										imgcap=4										
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
						
										img=imgsave+4
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
						
											img=imgsave+4
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
								imgcap=8
								imgsped=0.08
							}else{
								
								//Spawn little daisies
								if(attcdtwo mod 60==0){
									
									for(i=0;i<1;i+=1){
										with(Control){
											chance=xps+120-60+random(120)
											chancetwo=yps+70-60+random(120)
			
											while(point_distance(chance,chancetwo,playerbee.x,playerbee.y)<48){
				
												chance=xps+120-60+random(120)
												chancetwo=yps+70-60+random(120)
				
											}
			
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
				

			}else{

				//Seed
				if(enpin==3){
						// Increment the sway timer
						swayTimer += swayFrequency;

						// Calculate sway offset
						var swayOffset = sin(swayTimer) * swayAmplitude;

						// Apply sway to horizontal or vertical speed
						vsp += swayOffset; // or vsp += swayOffset; for vertical sway
						hsp += swayOffset*0.5;

						// Update position
						x += hsp;
						y += vsp;

						// Optional: reset the sway effect after applying it
						vsp -= swayOffset; // or vsp -= swayOffset; if applying to vertical speed			
						hsp -= swayOffset*0.5;
						
						if(endx<startx){
							if(x<endx){
								instance_destroy()
							}
						}else{
							if(endx>startx){
								if(x>endx){
									instance_destroy()
								}
							}						
						}
					
				}else{
	
					if(x>other.playerbee.x+sped+2){
				
						hit=collision_rectangle(x-2-sped,y,x+2-sped,y+4,Arcade_two,false,true)
						//if(hit==noone||hit.x>x||enpin!=hit.enpin){
						if(hit==noone||hit.x>=x){
							x-=sped
						}
					}else{
				
				
						if(x<other.playerbee.x-sped-2){
							hit=collision_rectangle(x-2+sped,y,x+2+sped,y+4,Arcade_two,false,true)
							if(hit==noone||hit.x<=x){
								x+=sped
							}
						}else{
					
						}			
			
					}
					if(y>other.playerbee.y+sped+2){
						hit=collision_rectangle(x-2,y-sped,x+2,y+4-sped,Arcade_two,false,true)
						if(hit==noone||hit.y>=y){
							y-=sped
						}
					}else{
						if(y<other.playerbee.y-sped-2){
							hit=collision_rectangle(x-2,y+sped,x+2,y+4+sped,Arcade_two,false,true)
							if(hit==noone||hit.y<=y){
								y+=sped
							}
						}else{
					
						}			
			
					}
				}

			}
			
			if(attcd<=0){
				
				hit=instance_place(x,y,Arcade)
				if(hit!=noone){
					attcd=30
					
					hit.hp-=1
					hit.hurt=8
				
					if(hit.hp<=0){
						hit.x=Control.xps+120
						hit.y=Control.yps+70
						hit.hp=hit.hptotal
					}
				}
			}else{
				attcd-=1
			}

		}
		
		//Projectile
		with(Arcade_three){
			x+=hsp
			y+=vsp
			
			hit=instance_place(x,y,Arcade_two)
			if(hit!=noone){
				with(hit){
					hp-=other.dmg
					hurt=8
					if(hp<=0){
						
						for(i=0;i<xp;i+=1){
							created=instance_create_depth(x-3+random(6),y-3+random(6),0,Arcade_four)
							with(created){
								sprite_index=arcade_bee
								visible=false
								img=161
								imgsped=0.01
								imgcap=3
								image_index=img
								pin=1
								
								image_xscale=0.5
								image_yscale=0.5									
								
								dur=200
							}
						}
						
						instance_destroy()
					}
				}
				dur=0
			}
			
			if(dur>0){
				dur-=1
			}else{
				instance_destroy()
			}
		}

		//Enemy Projectile
		with(Arcade_five){
					
			if(tick!=2){
				x+=hsp
				y+=vsp
			}
			
			hit=instance_place(x,y,Arcade)
			if(hit!=noone){
				with(hit){
					hp-=other.dmg
					hurt=8

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
						
						// Calculate perpendicular direction for sway
						var moveDir = point_direction(0, 0, hsp, vsp);
						var perpDir = moveDir + 90; // Perpendicular direction
						
						// Apply sway perpendicular to movement
						var swayX = lengthdir_x(swayOffset, perpDir);
						var swayY = lengthdir_y(swayOffset, perpDir);

						// Update position with base movement plus sway
						x += hsp + swayX;
						y += vsp + swayY;
					
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
			

		}
	}
	
	

	}
}