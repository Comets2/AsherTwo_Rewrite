function abil_run_scr() {

	if(instance_exists(Abil)){
		with(Abil){

//#region Me 
		if(en==0){
			//____________________________________________________________________________---------------------(Basic)---------------------____________________________________________________________________________		
			if(pin==32||pin==33){	
				if(pin==32){
					if(spin!=0){
						imgangle+=spin
					}
			
						if(vsp<4){
							vsp+=grav
						}

						abil_dmg_scr()

							if(hit!=noone){
								if(hit.team!=0){
									with(hit){
											hurttick=1
											dmgrecieved+=other.dmg
											Me.damagedone+=dmgrecieved
											Control.target=id
									}
									phase=0					
									dur=0
								}
							}	
				}else{
					if(pin==33){
						move=0
						x+=hsp
						y+=vsp
						phase=1
						if(dur<=0){
							instance_destroy()
						}
						if(instance_place(x+hsp,y,Block)){
							hsp=hsp*-bounce
						}
						if(instance_place(x,y+vsp,Block)){
							vsp=vsp*-bounce
						}
						if(spin!=0){
							imgangle+=hsp*spin
						}
						if(drag!=0){
							if(hsp-drag>0){
								hsp-=drag
							}else{
								if(hsp>0){
									hsp=0
								}
							}
							if(hsp+drag<0){
								hsp+=drag
							}else{
								if(hsp<0){
									hsp=0
								}
							}
						}
			
							if(vsp<4){
								vsp+=grav
							}
							abil_dmg_scr()
				
						if(hit!=noone){
							if(hit.team!=0){
								with(hit){
										hurttick=1
										dmgrecieved+=other.dmg
										Me.damagedone+=dmgrecieved
										Control.target=id
								}
								phase=0					
								dur=0
							}
						}	
							
					}
				}
			}else{
				
#region Witch
#region Abil 1 Spell Witch
			//____________________________________________________________________________---------------------(Witch Spell abil1)---------------------____________________________________________________________________________
			if(pin==1){
				
				with(sndobjectone){
					audio_emitter_position(sndemitone,other.x,other.y,0)	
				}
					//Skull
					if(Control.talentmapArray[3,1]>0){
						for(i=0;i<5;i+=1){
							created=instance_create_depth(x-3+random(6),y-5+random(10),0,Part)
							with(created){
							type=1
							pin=1
							depth=other.depth+1
							spin=1
							img=145
							imgcap=3
							imgsped=0.6
							image_speed=0
							image_index=irandom_range(img,img+imgcap)
							dur=2+choose(0,0,0,1,1,2)+irandom(6)
							durtotal=dur
							hsp=0
							vsp=0

							}		
						}					
					}else{
						for(i=0;i<5;i+=1){
							created=instance_create_depth(x-2+random(4),y-1.5+random(3),0,Part)
							with(created){
							type=1
							pin=1
							depth=other.depth+1
							spin=1
							img=6
							img=145
							imgcap=3
							imgsped=0.6
							image_speed=0
							image_index=irandom_range(img,img+imgcap)
							dur=2+choose(0,0,0,1,1,2)+irandom(6)
							durtotal=dur
							hsp=0
							vsp=0

							}		
						}
					}
			
					if(phase==1){
						if(dur<=0){
							if(Control.talentmapArray[3,1]>0){
								if(extra==0){
									extra=1
									img=img+2
									image_index=img
									imgsped=0.15
									hsp=0
									vsp=0
									dur=30
									imgangle=0
									image_angle=0
									x-=1
									image_xscale=1
									image_yscale=1
									y-=2
									dir=1
								
								}else{
									phase=0 
									dur=10
									visible=false
									hsp=0
									vsp=0
									phasecheck=1								
								}
							}else{
								phase=0 
								dur=10
								visible=false
								hsp=0
								vsp=0
								phasecheck=1
							}
						}
					abil_dmg_scr()
						if(hit!=noone){
							if(hit.team!=0){
								with(hit){
										hurttick=1
										dmgrecieved+=other.dmg
										Me.damagedone+=dmgrecieved
										Control.target=id
								}
								phase=0					
								dur=3
							}
						}
					}else{
						if(phase==0){
							if(dur<3){
								chance=irandom(360)
								for(i=0;i<10;i+=1){
									
									if(Control.talentmapArray[3,1]>0){
										created=instance_create_depth(x-2+random(4),y-3+random(6),0,Part)
										with(created){
											type=1
											pin=1
											depth=other.depth+1
											spin=1
											img=145
											imgcap=3
											imgsped=0.1
											image_speed=0
											image_index=irandom_range(img,img+imgcap)
											image_index=img
											dur=10+choose(0,0,0,1,1,2)+irandom(20)
											direction=other.i*36+other.chance
											speed=random_range(0.05,0.1)
											speed=0.1
											durtotal=dur
											hsp=hspeed
											vsp=vspeed
											chance=random_range(0.7,1)
											xscale=chance
											yscale=chance
										}	
									}else{
										created=instance_create_depth(x-2+random(4),y-1.5+random(3),0,Part)
										with(created){
											type=1
											pin=1
											depth=other.depth+1
											spin=1
											//img=7
											img=145
											imgcap=choose(1,1,2)
											imgsped=0.1
											image_speed=0
											image_index=irandom_range(img,img+imgcap)
											image_index=img
											dur=6+choose(0,0,0,1,1,2)+irandom(20)
											direction=other.i*36+other.chance
											speed=random_range(0.05,0.1)
											speed=0.1
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
			}else{
#endregion
#region Witch Broom Abil 2
			//____________________________________________________________________________---------------------(Witch Broom abil1)---------------------____________________________________________________________________________
			if(pin==2){

				with(Me){
					abilArray[1,1]=abilArray[1,2]
					for(i=0;i<2;i+=1){
						created=instance_create_depth(x-3+random(6),y-3+random(6)+6,0,Part)
						with(created){
						type=1
						pin=1
						depth=other.depth+1
						spin=1
						img=6
						imgcap=3
						imgsped=0.6
						image_speed=0
						image_index=irandom_range(img,img+imgcap)
						dur=4+choose(0,0,0,1,1,2)+irandom(6)
						durtotal=dur
						hsp=0
						vsp=0
									chance=random_range(0.6,1)
									xscale=chance
									yscale=chance
						}		
					}
				
					animx=0
					animy=0
					animstop=1
					//gravcd=2
					wepx=1
					wepy=4
					img=28
					imgcap=0
					image_index=img	
					stun=2
					vsp-=0.24
							
			
					chance=2.5
				
					if(jumps>0){
						if(global.con_p_space){
							jumps-=1
							vsp=-3
						}
					}
					if(global.con_p_q||grounded==1){
						other.dur=0
						abilArray[1,1]=99999
						abilArray[1,4]=3
						
						audio_stop_sound(snd)
						
					}else{
						other.dur=2
					}

					if(instance_place(x+hsp,y,Block)){
						other.dur=0
						abilArray[1,1]=99999
						abilArray[1,4]=3
						audio_stop_sound(snd)
					}
				
				if(global.con_h_left||global.conp_h_left){
					if(dir==1){
						dir=-1
						hsp=hsp*-1
					}else{
						if(other.temp==2){
								chance=2.5
								chancetwo=0.03	
								
								chance=2
								chancetwo=0.025
								
								chance+=Control.talentmapArray[5,1]*0.01
								chancetwo+=Control.talentmapArray[5,1]*0.001
								
								if(Control.talentmapArray[6,1]>0){
									chance+=0.5
									chancetwo+=0.005
								}
								
							if(hsp-chancetwo>=-chance){
								hsp-=chancetwo
							}else{
								hsp=-chance
							}	
								if(dir==1){
									wepangle=330						
								}else{
									wepangle=30
								}	
						}else{
							if(other.temp==1){
								chance=1
								chancetwo=0.005
								if(hsp+chancetwo<=-0.8){
									hsp+=chancetwo
								}else{
									hsp=-0.8
								}	
								if(dir==1){
									wepangle=30
								}else{
									wepangle=330
								}	
							}else{
									chance=1.8
									chancetwo=0.015
								if(hsp-chancetwo>=-chance){
									hsp-=chancetwo
								}else{
									hsp=-chance
								}							
							}
						}
					}
				}
				if(global.con_h_right||global.con_h_right){
					if(dir==-1){
						dir=1
						hsp=hsp*-1
					}else{
						if(other.temp==2){
								chance=2.5
								chancetwo=0.03	
								
								chance=2
								chancetwo=0.025
								
								chance+=Control.talentmapArray[5,1]*0.01
								chancetwo+=Control.talentmapArray[5,1]*0.001
								
								if(Control.talentmapArray[6,1]>0){
									chance+=0.5
									chancetwo+=0.005
								}
								
								
							if(hsp+chancetwo<=chance){
								hsp+=chancetwo
							}else{
								hsp=chance
							}	
								if(dir==1){
									wepangle=330						
								}else{
									wepangle=30
								}	
						}else{
							if(other.temp==1){
								chance=1
								chancetwo=0.005
								if(hsp-chancetwo>=0.8){
									hsp-=chancetwo
								}else{
									hsp=0.8
								}	
								if(dir==1){
									wepangle=30
								}else{
									wepangle=330
								}	
							}else{
									chance=1.8
									chancetwo=0.015	
								if(hsp+chancetwo<=chance){
									hsp+=chancetwo
								}else{
									hsp=chance
								}							
							}
						}
					}
				}
				vsp-=0.0003
				if(global.con_h_up||global.conp_h_up){
						other.temp=1
						vsp-=0.0025
				}else{
					if(global.con_h_down||global.conp_h_down){
						other.temp=2
					}	
				}	
			}

			}else{
#endregion 
#region Witch Bats Abil 3
			//____________________________________________________________________________---------------------(Witch Bats abil2)---------------------____________________________________________________________________________
			if(pin==3){
				if(first==1){
					with(sndobjectone){
						audio_emitter_position(sndemitone,other.x,other.y,0)
					}
				}
				if(check>0){
				
						if(check mod 5 ==0){
							xpos=startx
							chance=15
							ypos=starty-chance+irandom(chance)
								for(i=0;i<4;i+=1){
									created=instance_create_depth(xpos-2.5+random(5),ypos-2.5+random(5),0,Part)
									with(created){
									type=1
									pin=1
									depth=other.depth+1
									spin=1
									img=39
									imgcap=3
									imgsped=0
									image_speed=0
									image_index=irandom_range(img,img+imgcap)
									dur=18+choose(0,0,0,1,1,2)+irandom(12)
									durtotal=dur
									speed=0.1
									direction=other.i*90
									hsp=hspeed
									vsp=vspeed
									speed=0
												chance=random_range(0.6,1)
												xscale=chance
												yscale=chance
									}		
								}

						created=instance_create_depth(xpos,ypos,0,Abil)
							with(created){							
								check=0
							first=2
							type=1
							pin=3
							move=1
							diddmg=0
							dmg=1
							dmg+=dmg*(Control.invenArray[25,3]*0.01)
							creator=other.id
							sprite_index=abil_spr
							depth=other.depth-1
							spin=1
							img=14+choose(0,4,8)
							imgcap=2
							imgsped=0.12
							image_speed=0
							image_index=img
							dur=other.durtotal
							durtotal=dur
							phase=1
							speed=0.8
								if(other.temp==-1){
								direction=180
								}else{
									if(other.temp==2){
										direction=20
									}else{
										if(other.temp==-2){
										 direction=180-20
										}else{
											if(other.temp==3){
											 direction=0-20
											}else{
												if(other.temp==-3){
												 direction=180+20
												}							
											}					
										}
									}			
								}
							hsp=hspeed
							vsp=vspeed
							speed=0
							hsp=hsp*other.dir
								if(hsp>0){
			
								}else{
								dir=-1
								}
							}	
					}
					check-=1
				}
				if(dur mod 15 ==0){
									created=instance_create_depth(x-2.5+random(5),y-2.5+random(5),0,Part)
									with(created){
									type=1
									pin=1
									depth=other.depth+1
									spin=1
									img=39
									imgcap=3
									imgsped=0
									image_speed=0
									image_index=irandom_range(img,img+imgcap)
									dur=18+choose(0,0,0,1,1,2)+irandom(12)
									durtotal=dur
									speed=0.1
									direction=random(360)
									hsp=hspeed
									vsp=vspeed
									speed=0
												chance=random_range(0.6,1)
												xscale=chance
												yscale=chance
									}			
				}
				if(diddmg==0){
					abil_dmg_scr()
						if(hit!=noone){
							if(hit.team!=0){
								with(hit){
								hurttick=1
								dmgrecieved+=other.dmg
								Me.damagedone+=dmgrecieved
								Control.target=id
								}
								phase=0					
								diddmg=1
								if(check>0){
									visible=false
									hsp=0
									vsp=0
								}else{
									dur=0
								}
							}
						}				
				}
			
				if(dur<=0&&check<=0){
								for(i=0;i<3;i+=1){
									created=instance_create_depth(x-2.5+random(5),y-2.5+random(5),0,Part)
									with(created){
									type=1
									pin=1
									depth=other.depth+1
									spin=1
									img=39
									imgcap=3
									imgsped=0
									image_speed=0
									image_index=irandom_range(img,img+imgcap)
									dur=18+choose(0,0,0,1,1,2)+irandom(12)
									durtotal=dur
									speed=0.1
									direction=other.i*90
									hsp=hspeed
									vsp=vspeed
									speed=0
												chance=random_range(0.6,1)
												xscale=chance
												yscale=chance
									}		
								}
							if(audio_exists(sndemitone)){
								audio_emitter_free(sndemitone)
							}
					instance_destroy()
				}


			}else{
#endregion
#region Witch Bats Abil 3
			//____________________________________________________________________________---------------------(Witch Scarecrow abil2)---------------------____________________________________________________________________________
			if(pin==4){
				if(phase>=0){		
					
					
					for(i=0;i<1;i+=1){
						created=instance_create_depth(x-6+random(13),y+7+irandom(3),0,Part)
						with(created){
							type=1
							pin=1
						
							depth=choose(other.depth-1,other.depth+1,other.depth+1,other.depth+1)
							spin=1
							img=6
							imgcap=3
							imgsped=0.2
							image_index=irandom_range(img,img+imgcap)
						
							img=choose(39,41)
							img=choose(other.partone,other.parttwo,other.partthree)
							imgcap=1
							imgsped=0
							image_index=img
						
							image_speed=0
						
							dur=6+choose(0,0,0,1,1,2)+irandom(10)
							durtotal=dur
							hsp=0
							vsp=random_range(-0.3,-0.8)

						}		
					}

					if(dur mod 15==0){
						for(i=0;i<1;i+=1){
							created=instance_create_depth(x-6+random(13),y+7+irandom(3),0,Part)
							with(created){
							type=1
							pin=1
						
							sprite_index=abil_witch_spr
							depth=choose(other.depth-1,other.depth+1,other.depth+1)
							spin=1
							img=choose(55,55,58,61,64)
							img=choose(55,55,58)
							imgcap=2
							imgsped=0.15
							image_speed=0
							image_index=irandom_range(img,img+imgcap)
							dur=50+choose(0,0,0,1,1,2)+irandom(10)
							durtotal=dur
							hsp=0
							vsp=random_range(-0.3,-0.5)
							
								chance=random_range(0.8,1)
								xscale=chance
								yscale=chance
							}		
						}
					}
/*
					for(i=0;i<5;i+=1){
						created=instance_create_depth(x-2+random(4),y-1.5+random(3),0,Part)
						with(created){
						type=1
						pin=1
						depth=other.depth+1
						spin=1
						img=6
						imgcap=3
						imgsped=0.6
						image_speed=0
						image_index=irandom_range(img,img+imgcap)
						dur=2+choose(0,0,0,1,1,2)+irandom(6)
						durtotal=dur
						hsp=0
						vsp=0

						}		
					}
*/

				if(Control.talentmapArray[9,1]==0){
					if(instance_place(x,y,Enemy)){
						dur=0
						Me.abilArray[1,1]=Me.abilArray[1,2]
					}
				}
				
				if(!instance_place(x+hsp,y,Block)){
					x+=hsp
				}
				if(!instance_place(x,y+vsp,Block)){
					y+=vsp
				}
				if(vsp<3){
					vsp+=grav
				}
				if(dir==1){
					if(hsp-gravtwo>=0){
						hsp-=gravtwo
					}else{
						hsp=0
					}
				}else{
					if(hsp+gravtwo<=0){
						hsp+=gravtwo
					}else{
						hsp=0
					}				
				}
				
					if(dur<=0){
								for(i=0;i<4;i+=1){
									created=instance_create_depth(x-6+random(12),y-8+irandom(16),0,Part)
									with(created){
										type=1
										pin=1
						
										sprite_index=abil_witch_spr
										depth=choose(other.depth-1,other.depth+1,other.depth+1)
										spin=1
										img=choose(55,55,58,61,64)
										img=choose(55,55,58)
										imgcap=2
										imgsped=0.15
										image_speed=0
										image_index=irandom_range(img,img+imgcap)
										dur=50+choose(0,0,0,1,1,2)+irandom(10)
										durtotal=dur
										hsp=0
										vsp=random_range(-0.3,-0.5)
							
										chance=random_range(0.8,1)
										xscale=chance
										yscale=chance
									}		
								}
					for(i=0;i<10;i+=1){
						created=instance_create_depth(x-6+random(12),y-6+irandom(12),0,Part)
						with(created){
						type=1
						pin=1
						
						depth=choose(other.depth-1,other.depth+1,other.depth+1,other.depth+1)
						spin=1
						img=6
						imgcap=3
						imgsped=0.2
						image_index=irandom_range(img,img+imgcap)
						
						img=choose(39,41)
						img=choose(other.partone,other.parttwo,other.partthree)
						imgcap=1
						imgsped=0
						image_index=img
						
						image_speed=0
						
						dur=50+choose(0,0,0,1,1,2)+irandom(10)
						durtotal=dur
						hsp=0
						vsp=random_range(-0.3,-0.5)

						}		
					}
							Me.abilArray[1,4]=0
							if(Control.talentmapArray[9,1]>20){
								Me.abilArray[1,1]=Me.abilArray[1,2]
							}
						instance_destroy()
					}
				
					if(phase==1){
				
				
					}
				}else{
					if(dur<=0){
						Me.abilArray[1,1]=Me.abilArray[1,2]
						instance_destroy()
					}
				}
			}else{
#endregion		
#region Witch Bats Abil 3
			//____________________________________________________________________________---------------------(Witch Cauldron)---------------------____________________________________________________________________________
			if(pin==5){
			
				//Cauldron
				if(phase<10){

				if(global.con_h_w){
					hsp=0.15*dir
				}else{
					hsp=abs(spedsave)*dir
				}
								chance=0.1
								chancetwo=3
							if(tick==0){
								if(y>starty-chancetwo){
									if(!instance_place(x,y-chance,Block)){
										y-=chance
									}
								}else{
									tick=1
								}
							}else{
								if(y<starty+chancetwo){
									if(!instance_place(x,y+chance,Block)){
										y+=chance
									}
								}else{
									tick=0
								}
							}
							
						if(!instance_place(x+hsp,y,Block)){
							x+=hsp
						}
							
							if(phase==2||phase==3){
								hit=instance_place(x,y,Me)
								if(hit!=noone){
									with(Me){
										if(y<other.y+3){
											if(!instance_place(x,other.y-3,Block)){
												y=other.y-2
											}
												vsp=0
												grounded=1
												wall=0
												jumps=jumptotal
												abilArray[1,1]=0
											
												if(other.vsp<0.3){
													other.vsp=0.3
												}
												if(other.xlast!=other.x){
													if(!instance_place(x+other.hsp,y,Block)){
														x+=other.hsp
													}
												}
							

											if(global.conp_p_space||global.con_p_space){
												y-=2
												other.vsp+=1
											}
										}
									}
									if(phase==3){
										if(image_index+imgsped>=img+2){
											if(snd==1){
												Me.vsp=-6
											}
										}
									}
								}		
								xlast=x
									if(dur mod 10==0){
										created=instance_create_depth(x-5+random(12),y+4+choose(-1,0,1),Me.depth+1,Part)
										with(created){
										type=1
										pin=1
										depth=other.depth-1
										spin=1
										
										if(Control.talentmapArray[15,1]>0){
											img=42+irandom(3)
										}else{
											img=125+irandom(3)
										}
										imgcap=1
										imgsped=0
										image_speed=0
										image_index=img
										dur=45+choose(0,0,0,1,1,2)+irandom(15)
										durtotal=dur
										hsp=0
										vsp=random_range(-0.2,-0.5)
													chance=random_range(0.6,1)
													chance=1
													xscale=chance
													yscale=chance
										}		
									}
									if(attacks>1){
										hit=instance_place(x,y,Enemy)
										if(hit!=noone){
											attacks=0
											attcd=0
											audio_play_sound_at(snd_pumpkin_small_blast_1,x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
											with(hit){
												hurttick=1
												dmgrecieved+=other.dmg
												Me.damagedone+=dmgrecieved
												Control.target=id
												
											}
										}
									}else{
										attcd=0
									}
							}


					if(phase==1){
						if(!instance_place(x,y+vsp,Block)){
							y+=vsp
						}
						if(image_index+imgsped>=img+5){
							img+=6
							phase=2
							imgsped=0.08
							imgcap=3
							starty=y
						}
				
					}else{
						//Main Phase
						if(phase==2){

							if(attacks>0){
								if(attcd>0){
									attcd-=1
							
								}else{
									attacks-=1
									phase=3
									attcd=attcdtotal
									img+=4
									image_index=img
									imgcap=2
									imgsped=0.1
									vsp=0
								}
							}else{
								
								//done phase
								phase=4
								dur=24
								img=35
								imgcap=1
								imgsped=0
								image_index=img
								hsp=0
								vsp=1

									for(i=0;i<20;i+=1){
										//Green part
										created=instance_create_depth(x-6+random(12),y+3+random(6),Me.depth+1,Part)
										with(created){
											type=1
											pin=1
											depth=other.depth-1
											spin=1
											if(choose(0,1,2,3)==0){
												img=72+irandom(2)
											}else{
												//img=125+irandom(3)
												if(Control.talentmapArray[15,1]>0){
													img=42+irandom(2)
												}else{
													img=135+choose(0,1)
												}
											}
											imgcap=1
											imgsped=0
											image_speed=0
											image_index=img
											dur=23+irandom(8)
											durtotal=dur
												direction=(other.i*18)-5+random(10)
												speed=random_range(0.1,0.3)
												hsp=hspeed
												vsp=vspeed
												speed=0
											
													chance=random_range(0.6,1)
													chance=1
													xscale=chance
													yscale=chance
										}		
									}
							}
						
									if(!instance_place(x,y+vsp,Block)){
										y+=vsp
									}
									if(vsp-0.5>=0){
										vsp-=0.5
									}else{
										vsp=0
									}
						}else{
							//Attack
							if(phase==3){
							
								chance=15
							
								if(image_index+imgsped>=img+2){
									if(snd==1){
										snd=0
										audio_play_sound_at(choose(snd_witch_cauldron_1,snd_witch_cauldron_2),x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
										
										//Frog
											created=instance_create_depth(x-3+irandom(6),y+5+choose(-1,0,0,1),7,Abil)
											with(created){
												pin=5
												diddmg=0
												dmg=5
												dmg+=dmg*(Control.invenArray[25,3]*0.01)
												creator=other.id
												phasetwo=0

													sprite_index=abil_witch_spr
													img=choose(20,20,20,84)
												
												mask_index=abil_witch_frog_mask_spr
												depth=other.depth-1
												spin=1
											
												imgcap=8
												imgsped=0.1
												image_speed=0
												image_index=img
												attcd=1000
												if(Control.talentmapArray[15,1]>0){
													dur=300
													attcd=60
												}else{
													dur=150
												}
												snd=irandom_range(45,70)
												durtotal=dur
												phase=10
												tick=0
											
													hsp=random_range(-1,1)
													hsp=hsp*other.dir
												
													vsp=-random_range(1.5,2)
													grav=0.05
													gravtwo=0.02
												
													imgangle+=random_range(-100,100)
													
													attmask=instance_create_depth(x,y,depth+2,Abil)
													with(attmask){
														phase=11
														sprite_index=abil_witch_spr
														dmg=other.dmg
														dur=1
														visible=false
														creator=other.id
													}
											}
									}
									vsp=1.5
									/*
										//Ingrediant Attack projectiles
										if(dur mod 2==0){
											created=instance_create_depth(x-3+irandom(6),y+5+choose(-1,0,0,1),7,Abil)
											with(created){
												pin=5
												diddmg=0
												dmg=1
												dmg+=dmg*(Control.invenArray[25,3]*0.01)
												creator=other.id
												//if(choose(0,1)==0){
													sprite_index=items_spr
													img=139+choose(0,1,2)
											
												depth=other.depth-1
												spin=1
											
												imgcap=1
												imgsped=0
												image_speed=0
												image_index=img
												dur=100
												durtotal=dur
												phase=10
												tick=0
											
													hsp=random_range(-1,1)
													hsp=hsp*other.dir
												
													vsp=-random_range(1.5,2)
													grav=0.05
													gravtwo=0.02
												
													imgangle=random(360)
											
											}	
										}
										*/
		
									for(i=0;i<1;i+=1){
										//Green part
										created=instance_create_depth(x-6+random(12),y+5+choose(-1,0,1),Me.depth+1,Part)
										with(created){
											type=1
											pin=1
											depth=other.depth-1
											spin=1
												if(Control.talentmapArray[15,1]>0){
													img=42+irandom(3)
												}else{
													img=125+irandom(3)
												}
											imgcap=1
											imgsped=0
											image_speed=0
											image_index=img
											dur=45+choose(0,0,0,1,1,2)+irandom(15)
											durtotal=dur
											hsp=0
											vsp=random_range(-0.2,-0.5)
													chance=random_range(0.6,1)
													chance=1
													xscale=chance
													yscale=chance
										}		
									}
										if(dur mod 2 ==0){
											created=instance_create_depth(x-6+random(12),y+5+choose(-1,0,1),Me.depth+1,Part)
											with(created){
											type=1
											pin=1
											depth=other.depth-1
											spin=1
											img=72+irandom(2)
											imgcap=1
											imgsped=0
											image_speed=0
											image_index=img
											dur=45+choose(0,0,0,1,1,2)+irandom(15)
											durtotal=dur
											hsp=0
											vsp=random_range(-0.2,-0.5)
														chance=random_range(0.6,1)
														chance=1
														xscale=chance
														yscale=chance
											}
										}

								}
									if(!instance_place(x,y+vsp,Block)){
										y+=vsp
									}
									if(vsp-0.5>=0){
										vsp-=0.5
									}else{
										vsp=0
									}
							
								if(image_index+imgsped>=img+3){
									phase=2
									img-=4
									image_index=img
									imgcap=3
									imgsped=0.08
									imgangle=0
									snd=1
								}
							}else{
								//Done
								if(phase==4){
									if(dur mod 3==0){
										img-=1
										image_index-=1
										if(image_index<30){
											instance_destroy()
										}
									}
								}
							
							}
						}
					}
				}else{
				
					//Frog
					if(phase==10){
						

						with(attmask){
							x=other.x
							y=other.y
							image_index=other.image_index
							abil_dmg_scr()
								if(hit!=noone){
									if(hit.team!=0){
										with(hit){
												hurttick=1
												dmgrecieved+=other.dmg
												Me.damagedone+=dmgrecieved
												Control.target=id
										}
										dur=0
										if(instance_exists(creator)){
											creator.dur=0
										}
									}
								}
						}

						if(dur mod snd==0){
							audio_play_sound_at(choose(snd_witch_frog_1,snd_witch_frog_2),x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
						}
						
						if(phasetwo==0){
							if(!instance_place(x,y,Block)){
								if(image_index+imgsped>=img+5){
									chance=img
									img=chance+5
									imgcap=1
									phasetwo=1
									image_index=img
									imgsped=0.01
								}
							}else{
									chance=img
									img=chance+5
									imgcap=1
									phasetwo=1
									image_index=img
									imgsped=0.01							
							}
						}else{
						
						}
						if(phasetwo!=2){
							if(instance_place(x,y+3.1,Block)){
								phasetwo=2
								chance=img
								img=chance+2
								image_index=img
								imgcap=2
								imgangle=0
								imgsped=0.05
								while(!instance_place(x,y+0.1,Block)){
									y+=0.1
								}
							}
							
							if(phasetwo==0){
								if(abs(hsp*15)>5){
									imgangle+=hsp*20
								}
						
								if(imgangle-5>=0&&imgangle<180){
									imgangle -= 5
								}else{
									if(imgangle+5<=360){
										imgangle += 5
									
									}else{
										imgangle=0
									}
								}
								}else{
									imgangle=0
								}
							}else{
								imgangle=0
								attcd-=1
								
								
								if(attcd<=0){
									
									y-=8
									if(instance_place(x,y,Block)){
										y-=1
									}
									vsp=-2.2
									imgcap=6
									
									chance=img
									img=chance-7
									image_index=img
									attcd=1000
									phasetwo=0
									imgsped=0.1
								}
							}
		
						
						if(vsp<3){
							vsp+=grav
						}
						if(hsp!=0){
							if(hsp<0){
								if(hsp+gravtwo<=0){
									hsp+=gravtwo
								}else{
									hsp=0
								}
							}else{
								if(hsp-gravtwo>=0){
									hsp-=gravtwo
								}else{
									hsp=0
								}
							}
						}
						
						


							if(!instance_place(x+hsp,y,Block)){
								x+=hsp
							}
							if(!instance_place(x,y+vsp,Block)){
								y+=vsp
							}
							if(dur<=0){
									for(i=0;i<20;i+=1){
										//Green part
										created=instance_create_depth(x-5+random(10),y-5+random(10),Me.depth+1,Part)
										with(created){
											type=1
											pin=1
											depth=other.depth-1
											spin=1
											if(choose(0,1,2,3)==0){
												img=72+irandom(2)
											}else{
												//img=125+irandom(3)
												img=135+choose(0,1)
											}
											img=125+choose(0,1,3)
											imgcap=1
											imgsped=0
											image_speed=0
											image_index=img
											dur=23+irandom(8)
											durtotal=dur
												direction=(other.i*18)-5+random(10)
												speed=random_range(0.1,0.3)
												hsp=hspeed
												vsp=vspeed
												speed=0
											
													chance=random_range(0.6,1)
													chance=1
													xscale=chance
													yscale=chance
										}		
									}
								instance_destroy()
							}
					
					}else{
						if(phase==11){
							
						}
					
					}
				}
				
			}else{
#endregion	
#region Witch Bats Abil 3
			//____________________________________________________________________________---------------------(Witch Bats abil2)---------------------____________________________________________________________________________
			if(pin==6){
			
			}else{
#endregion	
#region Witch Bats Abil 3
			//____________________________________________________________________________---------------------(Witch Passives)---------------------____________________________________________________________________________
			if(pin==9){
				
				//Spirit orbs
				if(phase==0){
					
						//imgangle+=dir*0.5
					chance=Me.x-spotx
					chancetwo=Me.y-spoty
					
					if(x+sped*0.9<chance){
						x+=sped*0.9
						dir=1
					}else{
						if(x-sped*0.8>chance){
							x-=sped*0.8
							dir=-1
						}
					}

					if(y+sped*1.2<chancetwo){
						y+=sped*1.2
					}else{
						if(y-sped*1.2>chancetwo){
							y-=sped*1.2
						}
					}

						//x=Me.x-spotx
						//y=Me.y-spoty
						
						if(tick==0){
							if(spoty<spotytwo+1){
								spoty+=0.03
							}else{
								tick=1
							}
						}else{
							if(tick==1){
								if(spoty>spotytwo-1){
									spoty-=0.03
								}else{
									tick=0
								}	
							}
						}
						
					if(Me.abilArray[16,2]==1){
							phase=1
							dur=40
							hsp=1
							vsp=0

							if(Me.abilArray[16,3]==0){
								dir=1
							}else{
								dir=-1
							}

						if(global.con_h_up||global.conp_h_up){
							temp=2
						}else{
							if(global.con_h_down||global.conp_h_down){
								temp=3
							}else{
								temp=1
							}		
						}

						dur=32
						durtotal=dur
						phase=1
						speed=3

							if(temp==-1){
							direction=180
							}else{
								if(temp==2){
									direction=20
								}else{
									if(temp==-2){
									 direction=180-20
									}else{
										if(temp==3){
										 direction=0-20
										}else{
											if(temp==-3){
											 direction=180+20
											}							
										}					
									}
								}			
							}						
						hsp=hspeed
						vsp=vspeed
						speed=0
						hsp=hsp*Me.dir
						dir=Me.dir
						
						
						//img+=75
						//image_index=img
						check=1


					}
				}else{
					
					abil_dmg_scr()
						if(hit!=noone){
							if(hit.team!=0){
								with(hit){
										hurttick=1
										dmgrecieved+=other.dmg
										Me.damagedone+=dmgrecieved
										Control.target=id
								}
								phase=0					
								dur=0
							}
						}
						if(instance_place(x,y,Block)){
							dur=0
						}
					
					//image_angle+=hsp*5
					//imgangle+=hsp*5
						if(hsp<0){
							if(chance==1){
								chance=0
								direction+=180
								image_angle+=180
								imgangle+=180
								image_xscale=1
							}
						}
					
					x+=hsp
					y+=vsp

							if(dur==0){
								chance=irandom(360)
								for(i=0;i<10;i+=1){
									
										created=instance_create_depth(x-2+random(4),y-1.5+random(3),0,Part)
										with(created){
											type=1
											pin=1
											depth=other.depth+1
											spin=1
											//img=7
											img=145
											imgcap=choose(1,1,2)
											imgsped=0.1
											image_speed=0
											image_index=irandom_range(img,img+imgcap)
											image_index=img
											dur=6+choose(0,0,0,1,1,2)+irandom(10)
											direction=other.i*36+other.chance
											speed=random_range(0.02,0.05)
											speed=0.1
											durtotal=dur
											hsp=hspeed
											vsp=vspeed
											chance=random_range(0.7,1)
											xscale=chance
											yscale=chance
										}											
								}	
							}

					if(dur<=0){
						instance_destroy()
					}
				}
			}else{
#endregion	
#endregion	
#region Pumpkin
#region Pump Abil 1

		//____________________________________________________________________________---------------------(PUMPKIN pump)---------------------____________________________________________________________________________
				if(pin==10){
					if(phase==2||phase==0){
							with(Enemy){
								hit=instance_place(x,y,other)	
								if(hit!=noone){
									if(team!=0){
										chance=0
										for(i=0;i<other.hurtnum;i+=1){
											if(other.hurtArray[i]==id){
											chance=1
											}
										}
										if(chance==0){
										hurttick=1
										dmgrecieved+=other.dmg
										Me.damagedone+=dmgrecieved
										Control.target=id
										other.hurtArray[other.hurtnum]=id
										other.hurtnum+=1
											if(Control.talentmapArray[19,1]>0){
												Me.talentfivecd-=60
												Me.talentfivecdcount+=60
											}
											if(Control.talentmapArray[16,1]>0){
												Me.passivefourArray[1000,0]-=60
											}
										}
									}
								}
							}	
							with(Abil){
								abilhit=instance_place(x,y,other)	
								if(abilhit!=noone){
									if(pin==14||pin==15||pin==17){
										if((pin==14&&phase==1)||(pin==15&&phase==2)||pin==17){
										hitx=other.x
										hity=other.y
										hittrigger=1
										}
									}
								}
							}
					}
					if(phase==2){

						sprite_index=abil_pump_exp_spr
						if(Control.talentmapArray[2,1]==1){
							 sprite_index=abil_pump_exp_zaoe1_spr
						}else{
							if(Control.talentmapArray[2,1]==2){
								 sprite_index=abil_pump_exp_zaoe2_spr
							}else{
								if(Control.talentmapArray[2,1]==3){
									 sprite_index=abil_pump_exp_zaoe3_spr
								}else{
									if(Control.talentmapArray[2,1]==4){
										 sprite_index=abil_pump_exp_zaoe4_spr
									}else{
										if(Control.talentmapArray[2,1]==5){
											 sprite_index=abil_pump_exp_zaoe5_spr
										}else{
						
										}						
									}						
								}						
							}						
						}
						mask_index=sprite_index

									chance=10
									creator.abilArray[0,1]=0
									creator.abilArray[0,3]=0
									
						
							if(cdcheck==1){
								with(Me){
									if(abilArray[0,1]<globalcdtotal){
										abilArray[0,1]=globalcdtotal
										abilArray[0,4]=1
									}
								}
							}
						

								if(Me.ghostpassive!=0){
									if(instance_exists(Me.ghostpassive)){
										Me.ghosttrigger=1
										with(Me.ghostpassive){
											xtargetsave=other.x
											ytargetsave=other.y
										}
									}
								}
								
								
								audio_play_sound_at(choose(snd_pumpkin_pump_1,snd_pumpkin_pump_2),x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
								audio_play_sound_at(choose(snd_pumpkin_pump_cry_1,snd_pumpkin_pump_cry_2),x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
								//Shell
								for(i=0;i<4;i+=1){
									created=instance_create_depth(x,y,0,Part)
									with(created){
									type=2
									pin=1
									pintwo=1
									depth=other.depth+1
									spin=1
									if(other.img==6){
									img=18
									}else{
									img=14
									}
									imgcap=3
									imgsped=0
									image_speed=0
									image_index=img+other.i
									image_angle=other.imgangle
									dur=70+irandom(70)
									direction=other.i*90+other.imgangle+45
									speed=1.2
									durtotal=dur
									hsp=hspeed
									vsp=vspeed
									//hsp+=other.hsp
									//vsp+=other.vsp
									grav=0.07
									gravtwo=0.03
									chance=1
									xscale=chance
									yscale=chance
									phase=1
									mask_index=mask_pump_part_spr
									speed=0
									}		
								}
								//Guts
								chance=random(360)
								for(i=0;i<20;i+=1){
									created=instance_create_depth(x,y,0,Part)
									with(created){
									type=2
									pin=1
									pintwo=0
									depth=other.depth+1
									spin=1
									img=10
									imgcap=3
									imgsped=0
									grav=random_range(0.02,0.025)
									gravtwo=random_range(0.005,0.007)
									phase=1
									image_speed=0
									image_index=irandom_range(img,img+imgcap)
									image_angle=random(360)
									mask_index=dotmask_mask
									dur=25+irandom(50)
									direction=(other.i*36)+(other.chance)
									if(other.i<10){
									speed=random_range(0.3,0.5)							
									}else{
									speed=0.5
									}
									durtotal=dur
									hsp=hspeed
									vsp=vspeed
									chance=1
									xscale=chance
									yscale=chance
									speed=0
										if(vsp<-0.3){
										vsp=-0.3
										}
										if(vsp>0.2){
										vsp=-0.2
										}
									}		
								}	
								//Guts
								chance=random(360)
								for(i=0;i<20;i+=1){
									created=instance_create_depth(x-3+random(6),y-3+random(6),0,Part)
									with(created){
									type=2
									pin=1
									pintwo=0
									depth=other.depth+1
									spin=1
									img=10
									imgcap=3
									imgsped=0
									grav=random_range(0.02,0.025)
									gravtwo=random_range(0.005,0.007)
									phase=1
									image_speed=0
									image_index=irandom_range(img,img+imgcap)
									image_angle=random(360)
									mask_index=dotmask_mask
									dur=25+irandom(50)
									direction=(other.i*36)+(other.chance)
									if(other.i<10){
									speed=random_range(0.3,0.5)							
									}else{
									speed=0.5
									}
									durtotal=dur
									hsp=hspeed
									vsp=vspeed
									chance=1
									xscale=chance
									yscale=chance
									speed=0
										if(vsp<-0.5){
										vsp=-0.5
										}
										if(vsp>0.2){
										vsp=-0.2
										}
									}		
								}	
								grav=0
								hsp=0
								vsp=0
								depth=created.depth
						img=0
						imgcap=11
						image_index=0
						dur=15
						phase=0
						imgsped=0.6
						
						if(Control.talentmapArray[3,1]==1){
							dur=40
							imgsped=0.25
							
							dur=30
							imgsped=0.6
							imgcap=18
							 sprite_index=choose(abil_pump_exp_zaoe6_spr,abil_pump_exp_zaoe6_spr,abil_pump_exp_zaoe6_spr,abil_pump_exp_zaoe7_spr)
							 image_angle=0
							 imgangle=0
							 Me.abilArray[0,3]=noone
									Me.abilArray[0,1]=0
									Me.abilArray[0,4]=1
									cdcheck=0
									Me.abil1safety=30
						}

					}else{
						if(dur==19){
		
						}
					creator.abilArray[0,1]=2
						
						if(cdcheck==1){
							with(Me){
								if(abilArray[0,1]<globalcdtotal){
									abilArray[0,1]=globalcdtotal
									abilArray[0,4]=1
								}
							}
						}else{

						}
						
					}
				vsp = vsp + grav
				grounded=0
				if(place_meeting(x,y+1,Block)){
					grounded=1
				}
				if(hsp>0){
					if(hsp-gravtwo>=0){
						if(grounded==1){
						hsp-=gravtwo
						}else{
							if(hsp+gravthree>=0){
							hsp-=gravthree
							}else{
							hsp=0
							}
						}
					imgangle-=hsp*3
					}else{
					hsp=0
					}
				}else{
					if(hsp+gravtwo<=0){
						if(grounded==1){
						hsp+=gravtwo
						}else{
							if(hsp+gravthree<=0){
							hsp+=gravthree
							}else{
							hsp=0
							}
						}
					imgangle-=hsp*3
					}else{
					hsp=0
					}		
				}
				if(place_meeting(x+hsp,y,Block)){
					yplus=0
					while(place_meeting(x+hsp,y-yplus,Block)&& yplus <= abs(3*hsp)){
						yplus += 1
					}
					if(place_meeting(x+hsp,y-yplus,Block)){
						while(!place_meeting(x+sign(hsp),y,Block)){
							x = x + sign(hsp)
						}
					}else{
						y -= yplus
						hsp=hsp * 0.99
					}
				}
				if(place_meeting(x+hsp,y,Block)){
					while(!place_meeting(x+sign(hsp),y,Block)){
						x = x + sign(hsp)
					}
					if(hsp>0){
						if(hsp>0.1){
						hsp=hsp*-0.55
						audio_play_sound_at(choose(snd_pumpkin_thud_4,snd_pumpkin_thud_5,snd_pumpkin_thud_6),x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
						}else{
						hsp=0
						}
					}else{
						if(hsp<0){
							if(hsp<-0.1){
							hsp=hsp*-0.55
							audio_play_sound_at(choose(snd_pumpkin_thud_4,snd_pumpkin_thud_5,snd_pumpkin_thud_6),x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
							}else{
							hsp=0
							}
						}else{
			
						}			
					}
				}
		
				if(place_meeting(x,y+vsp,Block)){
					while(!place_meeting(x,y+sign(vsp),Block)){
						y = y + sign(vsp)
					}
					if(vsp>1.5){
					vsp=vsp*-0.5
					audio_play_sound_at(choose(snd_pumpkin_thud_4,snd_pumpkin_thud_5,snd_pumpkin_thud_6),x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
					}else{
					vsp=0
					}
				}

				x=x+hsp
				y=y+vsp
						if(phase==1){
							abil_dmg_scr()
							if(hit!=noone){
								if(hit.team!=0){
								phase=2
								}
							}
						}
				}else{
#endregion
#region Small Pump Abil 2
		//____________________________________________________________________________---------------------(PUMPKIN Small Pump)---------------------____________________________________________________________________________
				if(pin==11){
					if(talent==1&&Control.talentmapArray[6,1]>0){
						talent=0
						chance=dur
						dur=floor(chance+(chance*0.4))
					}
					if(dur==0){
						if(phase==1){
							phase=2
						}
					}
					with(sndobjectone){
						audio_emitter_position(sndemitone,other.x,other.y,0)
					}
					if(phase==2||phase==0){
							with(Enemy){
								if(team!=0){
									hit=instance_place(x,y,other)	
									if(hit!=noone){
										chance=0
										for(i=0;i<other.hurtnum;i+=1){
											if(other.hurtArray[i]==id){
											chance=1
											}
										}
										if(chance==0){
											
										hurttick=1
										dmgrecieved+=other.dmg
										Me.damagedone+=dmgrecieved
										Control.target=id
										other.hurtArray[other.hurtnum]=id
										other.hurtnum+=1
											if(Control.talentmapArray[19,1]>0){
												Me.talentfivecd-=60
												Me.talentfivecdcount+=60
											}
											if(Control.talentmapArray[16,1]>0){
												Me.passivefourArray[1000,0]-=60
											}
											if(Control.talentmapArray[6,1]>0){
												if(hp-dmgrecieved<=0&&immune==0){
													Me.abilArray[1,1]=Me.abilArray[1,1]-(Me.abilArray[1,2]*0.5)
												}
											}
										}
									}
								}
							}	
							with(Abil){
								abilhit=instance_place(x,y,other)	
								if(abilhit!=noone){
									if(pin==14||pin==15||pin==17){
										if((pin==14&&phase==1)||(pin==15&&phase==2)||pin==17){
										hitx=other.x
										hity=other.y
										hittrigger=1
										}
									}
								}
							}
					}
					if(phase==2){
						audio_play_sound_at(choose(snd_pumpkin_small_blast_1,snd_pumpkin_small_blast_2,snd_pumpkin_small_blast_3),x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
						sprite_index=abil_smallpump_exp_spr
						mask_index=sprite_index

									chance=10	

								chance=Me.ghostpassive
								if(chance!=0){
									if(instance_exists(chance)){
										Me.ghosttrigger=1
										with(chance){
											xtargetsave=other.x
											ytargetsave=other.y
										}
									}
								}

								//Shell
								for(i=0;i<4;i+=1){
									created=instance_create_depth(x,y,0,Part)
									with(created){
									type=2
									pin=1
									pintwo=1
									depth=other.depth+1
									spin=1
										if(other.img==11){
										img=30
										}else{
										img=26
										}
									imgcap=3
									imgsped=0
									image_speed=0
									image_index=img+other.i
									image_angle=other.imgangle
									dur=15+irandom(15)
									direction=other.i*90+other.imgangle+45
									speed=0.7
									durtotal=dur
									hsp=hspeed
									vsp=vspeed
									//hsp+=other.hsp
									//vsp+=other.vsp
									grav=0.04
									gravtwo=0.02
									chance=1
									xscale=chance
									yscale=chance
									phase=1
									mask_index=mask_pump_part_spr
									speed=0
									}		
								}
						
								grav=0
								hsp=0
								vsp=0
								depth=created.depth
						img=0
						imgcap=11
						image_index=0
						dur=15
						phase=0
						imgsped=0.6
					}else{
						imgangle+=spin
					}
				vsp = vsp + grav
				grounded=0
				if(place_meeting(x,y+1,Block)){
					grounded=1
				}
				if(hsp>0){
					if(hsp-gravtwo>=0){
						if(grounded==1){
						hsp-=gravtwo
						}else{
							if(hsp+gravthree>=0){
							hsp-=gravthree
							}else{
							hsp=0
							}
						}
					}else{
					hsp=0
					}
				}else{
					if(hsp+gravtwo<=0){
						if(grounded==1){
						hsp+=gravtwo
						}else{
							if(hsp+gravthree<=0){
							hsp+=gravthree
							}else{
							hsp=0
							}
						}
					}else{
					hsp=0
					}		
				}

				if(place_meeting(x+hsp,y,Block)){
					while(!place_meeting(x+sign(hsp),y,Block)){
						x = x + sign(hsp)
					}
					if(hsp>0){
						if(hsp>0.1){
							hsp=hsp*-0.7
						}else{
							hsp=0
						}
					}else{
						if(hsp<0){
							if(hsp<-0.1){
								hsp=hsp*-0.7
							}else{
								hsp=0
							}
						}else{
			
						}			
					}
				}
			
				if(place_meeting(x,y+vsp,Block)){
					while(!place_meeting(x,y+sign(vsp),Block)){
						y = y + sign(vsp)
					}
					if(vsp>1.5){
						vsp=vsp*-0.7
					}else{
						vsp=0
					}
				}
				if(gravtwo!=0){
					if(hsp-gravtwo>=gravtwo){
						hsp-=gravtwo
					}else{
						if(hsp+gravtwo<=-gravtwo){
							hsp+=gravtwo
						}else{
							hsp=0
						}					
					}
				}

				x=x+hsp
				y=y+vsp
						if(phase==1){
							abil_dmg_scr()
							if(hit!=noone){
								if(hit.team!=0){
									phase=2
								}
							}
						}
				}else{
					if(pin==12){
						x=Me.x
						y=Me.y
					}else{
#endregion
#region  Big Pump Abil 3
	//____________________________________________________________________________---------------------(PUMPKIN Big Pump)---------------------____________________________________________________________________________
						if(pin==13){
					if(dur==0){
						if(phase==1){
							phase=2
						}
					}
					if(phase==1&&dur>2){
						
						if(Control.talentmapArray[6,1]>0){
							if(dur mod 80 ==0){
								//Generate Small
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

									dur=30+80
								
								durtotal=dur
								phase=1
								speed=0
								imgangle=random(360)
									chancethree=1
									chance=-0.4
									spinamt=1.5
									spin=choose(-0.2,0.2)
										spin=spinamt
										snd=snd_pumpkin_small_blast_1
									
									grav=0.1
									gravtwo=0.1
										hsp=0
										vsp=-2.8
										imgangle=180
				//					imgangle=imgangle*other.dir

								}		
						}
						
						}

						if(global.con_p_w){
							dur=0
						}
					if(global.con_h_w){
							if(meon==1){
								with(Me){
									x=other.x
									y=other.y
									hsp=0
									vsp=0
									passive=2
								}
									mask_index=Me.mask_index
							}else{
						
							}
						if(dir==1){
							if(global.con_h_left||global.conp_h_left){
								dir=-1
								hsp=hsp*-1
							}
						}else{
							if(global.con_h_right||global.conp_h_right){
								dir=1
								hsp=hsp*-1
							}					
						}
					}else{
						meon=0
						mask_index=sprite_index
					}
					}
					if(phase==2||phase==0){
							with(Enemy){
								hit=instance_place(x,y,other)	
								if(hit!=noone){
										if(team!=0){
										chance=0
										for(i=0;i<other.hurtnum;i+=1){
											if(other.hurtArray[i]==id){
											chance=1
											}
										}
										if(chance==0){
										hurttick=1
										dmgrecieved+=other.dmg
										Me.damagedone+=dmgrecieved
										Control.target=id
										other.hurtArray[other.hurtnum]=id
										other.hurtnum+=1
											if(Control.talentmapArray[19,1]>0){
												Me.talentfivecd-=200
												Me.talentfivecdcount+=200
											}
											if(Control.talentmapArray[16,1]>0){
												Me.passivefourArray[1000,0]-=200
											}
										}
									}
								}
							}	
							with(Abil){
								abilhit=instance_place(x,y,other)	
								if(abilhit!=noone){
									if(pin==14||pin==15||pin==17){
										if((pin==14&&phase==1)||(pin==15&&phase==2)||pin==17){
										hitx=other.x
										hity=other.y
										hittrigger=1
										}
									}
								}
							}
					}else{
						if(image_index>=imgsave+6){
							dmg=dmgtwo
							if(image_index>=imgsave+9){
								dmg=dmgthree
								if(sndplay==0){
									sndplay=1
								
									sndobjectone=instance_create_depth(x,y,0,Snd)
									with(sndobjectone){
										sndemitone=audio_emitter_create()				
										audio_play_sound_on(sndemitone,choose(snd_pumpkin_big_scream_1,snd_pumpkin_big_cry_2,snd_pumpkin_big_scream_2),false,8)
										audio_emitter_falloff(sndemitone, 48, Control.falloff_max, Control.falloff_factor)					
									}		
									//game_end()
								}
								with(sndobjectone){
									audio_emitter_position(sndemitone,other.x,other.y,0)
								}
							}
						}
					}
					if(phase==2){
						audio_play_sound_at(choose(snd_pumpkin_big_explosion_2,snd_pumpkin_big_explosion_3),x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
						if(Control.talentmapArray[12,1]>0){
							sprite_index=abil_bigpump_two_exp_spr
						}else{
							sprite_index=abil_bigpump_exp_spr
						}
						mask_index=sprite_index

									chance=10	
								Control.screenshake = 3
								chance=Me.ghostpassive
								if(chance!=0){
									if(instance_exists(chance)){
										Me.ghosttrigger=1
										with(chance){
											xtargetsave=other.x
											ytargetsave=other.y
										}
									}
								}
								
								//Shell
								for(i=0;i<4;i+=1){
									created=instance_create_depth(x,y,0,Part)
									with(created){
									type=2
									pin=1
									pintwo=1
									depth=other.depth+1
									spin=1
										if(other.img==other.imgsave+11){
										img=30
										}else{
										img=26
										}
									imgcap=3
									imgsped=0
									image_speed=0
									image_index=img+other.i
									image_angle=other.imgangle
									dur=30+irandom(15)
									direction=other.i*90+other.imgangle+45
									speed=1.2
									durtotal=dur
									hsp=hspeed
									vsp=vspeed
									//hsp+=other.hsp
									//vsp+=other.vsp
									grav=0.04
									gravtwo=0.02
									chance=1
									xscale=chance
									yscale=chance
									phase=1
									mask_index=mask_pump_part_spr
									speed=0
									}		
								}
								//Shell
								for(i=0;i<16;i+=1){
									created=instance_create_depth(x,y,0,Part)
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
									image_angle=other.imgangle
									dur=30+irandom(15)
									hspeed=random_range(-1,1)
									vspeed=random_range(0.11,-0.3)
									durtotal=dur
									hsp=hspeed
									vsp=vspeed
									//hsp+=other.hsp
									//vsp+=other.vsp
									grav=0.04
									gravtwo=0.02
									chance=1
									xscale=chance
									yscale=chance
									phase=1
									mask_index=mask_pump_part_spr
									speed=0
									}		
								}
						
								grav=0
								hsp=0
								vsp=0
								depth=created.depth
						img=0
						imgcap=11
						image_index=0
						dur=15
						phase=0
						imgsped=0.6
					}
				vsp = vsp + grav
				grounded=0
				if(place_meeting(x,y+1,Block)){
					grounded=1
				}
				if(hsp>0){
					if(hsp-gravtwo>=0){
						if(grounded==1){
						hsp-=gravtwo
						}else{
							if(hsp+gravthree>=0){
							hsp-=gravthree
							}else{
							hsp=0
							}
						}
					}else{
					hsp=0
					}
				}else{
					if(hsp+gravtwo<=0){
						if(grounded==1){
						hsp+=gravtwo
						}else{
							if(hsp+gravthree<=0){
							hsp+=gravthree
							}else{
							hsp=0
							}
						}
					}else{
					hsp=0
					}		
				}

				if(place_meeting(x+hsp,y,Block)){
					while(!place_meeting(x+sign(hsp),y,Block)){
						x = x + sign(hsp)
					}
					if(hsp>0){
						if(hsp>0.1){
							hsp=hsp*-0.95
								if(dir==1){
									dir=-1
								}else{
									dir=1
								}	
								audio_play_sound_at(choose(snd_pumpkin_thud_1,snd_pumpkin_thud_2,snd_pumpkin_thud_3),x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
						}else{
							hsp=0
						}
					}else{
						if(hsp<0){
							if(hsp<-0.1){
								hsp=hsp*-0.95
								if(dir==1){
									dir=-1
								}else{
									dir=1
								}	
							}else{
								hsp=0
							}
						}else{
			
						}			
					}
				}
		
				if(place_meeting(x,y+vsp,Block)){
					while(!place_meeting(x,y+sign(vsp),Block)){
						y = y + sign(vsp)
					}
					if(vsp>0.1){
						vsp=vsp*-0.95
						audio_play_sound_at(choose(snd_pumpkin_thud_1,snd_pumpkin_thud_2,snd_pumpkin_thud_3),x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
					}else{
						vsp=0
					}
				}

				x=x+hsp
				y=y+vsp
						if(phase==1){
							abil_dmg_scr()
							if(hit!=noone){
								if(hit.team!=0){
								phase=2
								}
							}
						}					
						}else{

#endregion
#region Pumpkin Sprout
		//____________________________________________________________________________---------------------(PUMPKIN Sprout)---------------------____________________________________________________________________________
				if(pin==14){
					
					if(phase==0){
						if(check==1){
							check=0
							
							hold=0
							grounded=0
							imgsped=0.05
							imgspedtwo=0.03
							imgcap=48
							dur=90000
							grav=0.2
							timer=300
							timertotal=timer
							tick=0
							spedtotal=0.5
							sped=spedtotal
							gravtotal=4
							stun=0
							jumptotal=3
							jumps=3
							wallsped=spedtotal
							hittrigger=0
							wait=0
							waitx=x
							waittwo=0
							
							
							//Initial Launch
								//Normal
								if(temp==1){
									vsp=-3
									hsp=1.75
								}else{
									//Down
									if(temp==2){
										vsp=-1.5
										hsp=2.5
									}else{
										//Up
										if(temp==0){
											vsp=-4.5
											hsp=1
										}						
									}							
								}
								stun=2
							
								spin=8
							if(dir==-1){
								sped=sped*-1
								hsp=hsp*-1
								spin=-8
							}
							imgsave=img
							timertwo=300
							mask_index=mask_pumpkin_sprout_mask_two
						}
						if(abs(hsp)>0.01&&grounded==0){
							hsp=hsp*0.98
						}else{
							hsp=0
						}
						
						if(grounded==0){
							imgsped=0
							spin=hsp*10
							if(image_index==img){
								imgangle+=spin
							}
						}else{
							imgsped=0.05
						}
						if(image_index<img+5){
							if(grounded==1){
								image_index+=imgsped
								if(mask_index==mask_pumpkin_sprout_mask_two){
									imgangle=0
									mask_index=mask_pumpkin_sprout_mask
									y-=8
									image_index+=1
									wallsped=spedtotal/2
								}
							}
						}else{
							if(image_index<img+8){
								image_index+=imgspedtwo
							}else{
								phase=1
								hittrigger=0
								img=imgsave+8
								imgcap=5
								imgsped=0.1
							//0=TRUE/False,1=Target,2=X,3=Y,4=Img,5=ImgCap,6=Amount,7=Delay,8=DelayAmount,9=Dur,10=hsp,11=vsp,12=DurExtra,13=XscaleYscale,14=XscaleMaxYscaleMax,15=ImgSped
							//part_gen_scr(1,0,12,12,34,3,2,0,2,14,0,0,10,0.6,1,0)
							}						
						}
					}else{
						if(phase==1){
							
							if(x==waitx){
								wait+=1
								if(wait>50){
									dir=dir*-1
								}
							}else{
								wait=0
							}
							waitx=x
							
							//Jump
							//if(global.con_r_q||global.conp_r_q){
							if(global.con_p_q||global.conp_p_q){
								if(jumps>0&&waittwo==0){
									jumps-=1
									vsp=-3
								}
							}							
							if(global.con_h_q||global.conp_h_q){
								hold+=1
								if(hold>=25&&waittwo==0){
									dir=dir*-1
									hold=0
									waittwo=1
								}
							}else{
								hold=0
								waittwo=0
							}
							//Grounded
							if(timer>0){
								timer-=1
								if(timer==0){
									timer=timertotal
									if(dir==1){
										dir=-1
										sped=spedtotal*-1
									}else{
										dir=1
										sped=spedtotal
									}
								}
							}
							if(dir==1){
								hsp=spedtotal
								/*
								if(instance_place(x+sped*4,y,Block)){
										dir=-1
										sped=spedtotal*-1									
								}
								*/
							}else{
								/*
								if(instance_place(x-sped*4,y,Block)){
										dir=1
										sped=spedtotal								
								}	
								*/
								hsp=spedtotal*-1
							}
							
							hit=instance_place(x,y,Enemy)
							if(hit!=noone){
								if(hit.team!=0){
									timertwo=1
								}
							}
								timertwo-=1
								if(timertwo==0||hittrigger==1){
									phase=3
									img=imgsave+14
									imgcap=40
									image_index=img	
									imgsped=0.4
									dir=dir*-1
									grav=-0
									vsp=0
									diddmg=0
								}
						}else{
						
							if(phase==3){
									hsp=0
									vsp=0
								if(image_index<img+12){
									if(image_index>=img+6){
										if(diddmg==0){
											diddmg=1
											audio_play_sound_at(choose(snd_pumpkin_big_explosion_2,snd_pumpkin_big_explosion_3),x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
											sprite_index=abil_bigpump_exp_spr
											mask_index=sprite_index

								chance=Me.ghostpassive
								if(chance!=0){
									if(instance_exists(chance)){
										Me.ghosttrigger=1
										with(chance){
											xtargetsave=other.x
											ytargetsave=other.y
										}
									}
								}

														chance=10	
													Control.screenshake = 3
													//Shell
													for(i=0;i<4;i+=1){
														created=instance_create_depth(x,y,0,Part)
														with(created){
														type=2
														pin=1
														pintwo=1
														depth=other.depth+1
														spin=1
															if(other.img==11){
															img=30
															}else{
															img=26
															}
														imgcap=3
														imgsped=0
														image_speed=0
														image_index=img+other.i
														image_angle=other.imgangle
														dur=30+irandom(15)
														direction=other.i*90+other.imgangle+45
														speed=1.2
														durtotal=dur
														hsp=hspeed
														vsp=vspeed
														//hsp+=other.hsp
														//vsp+=other.vsp
														grav=0.04
														gravtwo=0.02
														chance=1
														xscale=chance
														yscale=chance
														phase=1
														mask_index=mask_pump_part_spr
														speed=0
														}		
													}
													//Shell
													for(i=0;i<24;i+=1){
														created=instance_create_depth(x,y,0,Part)
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
														image_angle=other.imgangle
														dur=30+irandom(15)
														hspeed=random_range(-1,1)
														vspeed=random_range(-0.2,-1.1)
														durtotal=dur
														hsp=hspeed
														vsp=vspeed
														//hsp+=other.hsp
														//vsp+=other.vsp
														grav=0.04
														gravtwo=0.02
														chance=1
														xscale=chance
														yscale=chance
														phase=1
														mask_index=mask_pump_part_spr
														speed=0
														}		
													}
						
													grav=0
													hsp=0
													vsp=0
													depth=created.depth
											img=0
											imgcap=11
											image_index=0
											dur=15
											phase=4
											imgsped=0.6
										}						
										
									}
								}
							}else{
								if(phase==4){
									with(Enemy){
										hit=instance_place(x,y,other)	
										if(hit!=noone){
												if(team!=0){
												chance=0
												for(i=0;i<other.hurtnum;i+=1){
													if(other.hurtArray[i]==id){
													chance=1
													}
												}
												if(chance==0){
												hurttick=1
												dmgrecieved+=other.dmg
												Me.damagedone+=dmgrecieved
												Control.target=id
												other.hurtArray[other.hurtnum]=id
												other.hurtnum+=1
													if(Control.talentmapArray[19,1]>0){
														Me.talentfivecd-=200
														Me.talentfivecdcount+=200
													}
													if(Control.talentmapArray[16,1]>0){
														Me.passivefourArray[1000,0]-=200
													}
												}
											}
										}
									}	
									with(Abil){
										abilhit=instance_place(x,y,other)	
										if(abilhit!=noone){
											if(pin==14||pin==15||pin==17){
												if((pin==14&&phase==1)||(pin==15&&phase==2)||pin==17){
												hitx=other.x
												hity=other.y
												hittrigger=1
												}
											}
										}
									}
									if(dur==0){
										instance_destroy()
									}	
								}
							}

							
						
						}
					}
					gravity_scr()
				}else{
#endregion
#region Pumpkin Slam
		//____________________________________________________________________________---------------------(PUMPKIN HUGE Slam)---------------------____________________________________________________________________________
				if(pin==15){

					if(phase==1){
						if(check==1){
							check=0
							grav=0.1
							gravtwo=0.008
						
							imgsped=0.1
							hsp=0
							hittrigger=0
							gravtotal=4
							diddmg=3
							mask_index=mask_pumpkin_huge_mask
							startx=x
							starty=y
							chance=0
							test=0
							audiocd=0
							audiocdtotal=10
							charged=0
							
							if(Control.talentmapArray[15,1]>0){
								talent=Me.talentfour
							}else{
								talent=0
							}
							
							attcd=0
							attcdtotal=30
							dur=450
							jumpcd=200
							jumpcdtotal=600
							dmg=5
							
								dmg+=5*(Control.talentmapArray[15,1]*0.25)
								dmg+=5*(Control.talentmapArray[14,1]*0.05)
							
							dmgsave=dmg
							dmgsavetwo=dmg*2
							

							
							mask_obj=instance_create_depth(x,y,3,Dummy)
							with(mask_obj){
								mask_index=mask_pumpkin_huge_mask
								image_index=97
								image_speed=0
								visible=false
							}
							
							vsp=-3
							if(temp==1){
								vsp=-4
							}else{
								if(temp==2){
									vsp=4
								}	
							}
							if(temptwo==1){
								if(talent==0){
									hsp=1
								}else{
									hsp=1.5
								}
							}else{
								if(temptwo==2){
									if(talent==0){
										hsp=-1
									}else{
										hsp=-1.5
									}
								}	
							}
							
								while(instance_place(x,y,Block)&&chance!=100){
									chance+=1
									if(chance<10){
										y+=1
										if(chance==9){
											y=starty
										}
									}else{
										if(chance<20){
											y-=1
											if(chance==19){
												y=starty
											}
										}else{
											if(chance<30){
												x+=1
												if(chance==29){
													x=startx
												}
											}else{
												if(chance<40){
													x-=1
													if(chance==39){
														chance=100
													}
												}										
											}	
										}
									}
								}
						}						
						
						
						if(image_index>=img+imgcap){
							phase=2
							img=img+4
							image_index=img
							imgsave=img
							imgsavetwo=img
							imgsped=0.1
						}
					}else{
					
						//Fight Phase
						if(phase==2){	
							if(dur==0){
								phase=3
							}		
							chance=0.5
							
							if(attcd>0){
								attcd-=1
								imgcap=1
							}else{
								imgcap=4
							}
							if(talent==1){
								chance=0.3
								chancetwo=0.8							
							}else{
								chance=0.2
								chancetwo=0.54					
							}

							//Right
							if(hsp>=chance&&hsp<chancetwo){
									if(test==0){
										image_index+=5
									}else{
										if(test==1){
									
										}else{
											if(test==2){
												image_index-=5
											}								
										}									
									}
								test=1
									dir=1
									img=imgsave+5
									
							}else{
								//Far Right
								if(hsp>=chancetwo){
										if(test==0){
											image_index+=10
										}else{
											if(test==1){
												image_index+=5
											}else{
												if(test==2){

												}								
											}									
										}
									test=2
										dir=1
										img=imgsave+10
									}else{						
										if(hsp<=-chance&&hsp>-chancetwo){
												if(test==0){
													image_index+=5
												}else{
													if(test==1){
									
													}else{
														if(test==2){
															image_index-=5
														}								
													}									
												}
											test=1
												dir=-1
												img=imgsave+5
										}else{
											if(hsp<=-chancetwo){
													if(test==0){
														image_index+=10
													}else{
														if(test==1){
															image_index+=5
														}else{
															if(test==2){

															}								
														}									
													}
												test=2
													dir=-1
													img=imgsave+10

											}else{
													dir=1
													img=imgsave
														if(test==0){

														}else{
															if(test==1){
																image_index-=5
															}else{
																if(test==2){
																	image_index-=10
																}								
															}									
														}
													test=0
												if(image_index>=img+imgcap+1){
													image_index=img
												}
											}
										
									}
								}							
							}
							

						}else{
							
								if(phase==3){
										check=0
										imgsped=0
										img=imgsavethree
										imgsave=imgsavethree
										image_index=img+3
										dur=49
										phase=4
										imgcap=20
										hsp=hsp*0.5
										vsp=vsp*0.5
								}else{
									if(phase==4){
										if(dur mod 7 ==0){
												image_index-=1
											if(image_index<imgsave){	
													img=imgsavefour
												
												image_index=img
											}else{
												if(img==imgsavefour){
												instance_destroy()
												}
											}
										}
									}
								
								}					
						}			
					}
					
					//Always
					
							if(diddmg>0&&attcd<=0){
								chance=0
								chancetwo=0
									hit=instance_place(x,y+vsp,Enemy)
									if(hit!=noone){
										chance=1
									}
								if(hit==noone){
									hit=instance_place(x+hsp,y,Enemy)
									if(hit!=noone){
										chancetwo=1
									}
								}
						
									if(hit!=noone){
										if(hit.team!=0){
											with(hit){
													hurttick=1
													dmgrecieved+=other.dmg
													Me.damagedone+=dmgrecieved
													Control.target=id
													
													other.hitx=x*10
													other.hity=y*10
													
													if(Control.talentmapArray[19,1]>0){
														Me.talentfivecd-=75
														Me.talentfivecdcount+=75
													}	
												if(Control.talentmapArray[16,1]>0){
													Me.passivefourArray[1000,0]-=75
												}
												
											}
											attcd=attcdtotal
											diddmg-=1
											if(charged==1){
												img=img-16
												imgsave=imgsavetwo
												image_index-=16
											}
											dmg=dmgsave
											if(diddmg<=0){
												phase=3
												check=1
												dur=0
											}
											//hittrigger=1
											if(chance==1){
												vsp=vsp*-0.95
											}
											if(chancetwo==1){
												hsp=hsp*-0.95
											}	
													//Shell
													for(i=0;i<24;i+=1){
														created=instance_create_depth(x,y,0,Part)
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
														image_angle=other.imgangle
														dur=30+irandom(15)
														hspeed=random_range(-1,1)
														vspeed=random_range(-0.2,-1.1)
														durtotal=dur
														hsp=hspeed
														vsp=vspeed
														//hsp+=other.hsp
														//vsp+=other.vsp
														grav=0.04
														gravtwo=0.02
														chance=1
														xscale=chance
														yscale=chance
														phase=1
														mask_index=mask_pump_part_spr
														speed=0
														}		
													}
													if(charged==1){
														charged=0
														//Shell
														for(i=0;i<10;i+=1){
															created=instance_create_depth(x,y,0,Part)
															with(created){
															type=2
															pin=1
															pintwo=1
															depth=other.depth+1
															spin=1
																img=131
																imgcap=1
															imgsped=0
															image_speed=0
															image_index=img+irandom(imgcap)
															image_angle=other.imgangle
															dur=30+irandom(15)
															hspeed=random_range(-1,1)
															vspeed=random_range(-0.2,-1.1)
															durtotal=dur
															hsp=hspeed
															vsp=vspeed
															//hsp+=other.hsp
															//vsp+=other.vsp
															grav=0.04
															gravtwo=0.02
															chance=1
															xscale=chance
															yscale=chance
															phase=1
															mask_index=mask_pump_part_spr
															speed=0
															}		
														}
													}
													
								chance=Me.ghostpassive
								if(chance!=0){
									if(instance_exists(chance)){
										Me.ghosttrigger=1
										with(chance){
											xtargetsave=other.x
											ytargetsave=other.y
										}
									}
								}
													//Candy Corn
													for(i=0;i<5;i+=1){	
														created=instance_create_depth(x-8+random(16),y-8+random(16),0,Part)
														with(created){
															type=2
															pin=1
															pintwo=1
															depth=other.depth-1
															sprite_index=mask_pump_other_spr
															spin=1
																img=8
																imgcap=1
																imgsped=0
															image_speed=0
															image_index=img+irandom(imgcap)
															image_angle=random(360)
															direction=random(360)
															dur=20+irandom(20)
																speed=random_range(0.5,1)
																hsp=hspeed
																vsp=vspeed
																speed=0
															durtotal=dur
															grav=0.04
															gravtwo=0.02
															chance=1
															xscale=chance
															yscale=chance
															phase=1
														}													
													}
										}
									}							
							}
							
							if(charged==1){
									created=instance_create_depth(x-8+random(16),y-8+random(16),0,Part)
									with(created){
										type=1
										pin=1
										depth=other.depth+1
										spin=0
										img=129
										imgcap=3
										imgsped=0
										image_speed=0
										image_index=irandom_range(img,img+imgcap)
										dur=8+choose(0,0,0,1,1,2)+irandom(7)
										durtotal=dur
										hsp=0
										vsp=0
												chance=random_range(0.6,1)
												xscale=chance
												yscale=chance
									}							
							}
					
					chancethree=vsp
					if(hittrigger==1){
						hittrigger=0
						if(charged==0){
							charged=1
							img=img+16
							imgsave=imgsavetwo+16
							image_index+=16
							dmg=dmgsavetwo
						}
							if(talent==1){
								chance=0.1
								chancetwo=0.03
							}else{
								chance=0.067
								chancetwo=0.02				
							}
						hsp+=clamp((x-hitx)*0.3,-chance,chance)
						vsp+=clamp((y-hity)*0.3,-chance*2,chance*2)
						
						clamp(hsp,-chancetwo,chancetwo)
						clamp(vsp,-chancetwo,gravtotal)
					}
					vsp=(chancethree-vsp)+chancethree
					
					if(vsp<gravtotal){
						vsp+=grav
					}
					if(hsp+gravtwo<0){
						hsp+=gravtwo
					}
					if(hsp-gravtwo>0){
						hsp-=gravtwo
					}
					if(!instance_place(x+hsp,y,Block)){
						x+=hsp
					}else{
						hsp=hsp*-0.9
						if(audiocd<=0){
							audio_play_sound_at(choose(snd_pumpkin_thud_1,snd_pumpkin_thud_2,snd_pumpkin_thud_3),x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
							audiocd=audiocdtotal
						}
					}
					if(!instance_place(x,y+vsp,Block)){
						y+=vsp
					}else{
						vsp=vsp*-0.9
						if(audiocd<=0){
							audio_play_sound_at(choose(snd_pumpkin_thud_1,snd_pumpkin_thud_2,snd_pumpkin_thud_3),x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
							audiocd=audiocdtotal
						}
						if(jumpcd<=0){
							vsp=-3.5
							jumpcd=jumpcdtotal
						}
					}
						if(jumpcd>0){
								jumpcd-=1
							if(vsp>-0.4&&vsp<0.4){
								jumpcd-=3.5
							}
						}	
						with(mask_obj){
							x=other.x
							y=other.y
							other.hit=instance_place(x,y,Me)
						}
						if(hit!=noone){
							with(Me){
								if(y<other.y-5){
									if(!instance_place(x,other.y-15,Block)){
										y=other.y-15
									}
										vsp=0
										grounded=1
										wall=0
										jumps=jumptotal
									

									if(global.conp_p_space||global.con_p_space){
										y-=2
										other.vsp+=2
									}
								}
							}
						}
						if(audiocd>0){
							audiocd-=1
						}

				}else{
#region Pumpkin Shield
		//____________________________________________________________________________---------------------(PUMPKIN Shell Shield)---------------------____________________________________________________________________________
				if(pin==16){
					if(phase==1){
						
						x=Me.x
						y=Me.y-starty
							if(image_index+imgsped>=img+imgcap+1){
								instance_destroy()
							}
						
						if(dur==0){
							phase=0
						}
					}else{
					
					}
					
				}else{
#endregion
#region Sugar Rush
		//____________________________________________________________________________---------------------(PUMPKIN Sugar Rush)---------------------____________________________________________________________________________
				if(pin==17){
					if(phase==1){
						//Me.x=x
						//Me.y=y
						if(tick==0){
							if(y>starty-rangetwo){
								y-=spedtwo
							}else{
							 tick=1
							}
						}else{
							if(y<starty+rangetwo){
								y+=spedtwo
							}else{
							 tick=0
							}							
						}
						
						if(dir==1){
							if(x<Control.mapxspottotal+(Control.border*8)+32){
								x+=sped
							}else{
								phase=2
							}
						}else{
							if(x>Control.mapx-16){
								x-=sped
							}else{
								phase=2
							}						
						}
						
						if(hittrigger==1&&attcd>31){
							attcd=31
							hittrigger=0
							hittriggertwo=1
						}else{
							hittrigger=0
						}
						if(x<=Control.mapxspottotal-8&&x>=Control.mapx+8&&!instance_place(x,y,Block)){
							if(attcd>0){
								attcd-=1
								if(attcd==30){
									image_index+=1
								}else{
									if(attcd==15){
										image_index+=1
										attcd-=7
										
										chance=3
										if(hittriggertwo==1){
											chance=choose(1,1,1,1,1,2,2,2,2,3)
											hittriggertwo=0
											
										}
										for(i=0;i<chance;i+=1){
											created=instance_create_depth(x,y,0,Part)
											with(created){
												pin=2
												type=3
												tick=0
												ticktwo=0
												spin=10
												sprite_index=mask_pump_other_spr
												depth=other.depth+1
												img=1
												imgcap=12
												imgsped=0
												image_speed=0
												image_index=img+irandom(imgcap)
												dur=1000+irandom(300)
												durtotal=dur
													hsp=-0.5+0.5*other.i
														vsp=-2.5
													if(other.i==1){
														vsp=-3
													}
													if(other.chance!=3){
														hsp=random(0.5)*choose(1,-1)
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
													xscale=1
												}
									
											}	
										}
										
									}else{
										if(attcd==0){
											image_index=img
											attcd=attcdtotal
										}else{
							
										}							
									}							
								}
							}
						}else{
							image_index=img
						}
						
					}else{
					
					}
					
					
				}else{
#endregion
#region Sugar Rush
		//____________________________________________________________________________---------------------(PUMPKIN Sugar Rush Ghost)---------------------____________________________________________________________________________
				//Ghost
				if(pin==18){
						if(Me.passivefourArray[0,3]<=0){
							Me.talentfivethree=0
							instance_destroy()
						}
						if(attcd<=0){
							if(Me.ghosttrigger!=0){
								Me.ghosttrigger=0
								attack=1

								range=4
								target=0
								imgsave=212
								img=imgsave
								image_index=img
								sped=3
								attacktrigger=1
								imgsped=0.12
								attcdtwo=0
								attcd=50
									phase=2
									atttimer=60
								xtarget=xtargetsave
								ytarget=ytargetsave
							}
						}else{
							Me.ghosttrigger=0
							if(attcdtwo>0){
								attcdtwo-=1
							}
								attcd-=1
						}

					if(phase==1){


							xtarget=Me.x
							ytarget=Me.y
							

						if(x<xtarget-range){
							x+=sped
							dir=1
						}else{
							if(x>xtarget+range){
								x-=sped
								dir=-1
							}else{
						
							}						
						}
						if(yspot<ytarget-range){
							yspot+=sped
							y+=sped
						}else{
							if(yspot>ytarget+range){
								yspot-=sped
								y-=sped
							}else{
						
							}						
						}
						if(tick==0){
							if(y<yspot+2){
								y+=0.07
							}else{
								tick=1
							}
						}else{
							if(y>yspot-2){
								y-=0.07
							}else{
								tick=0
							}						
						}

					}else{
						
						if(phase==2){
							if(atttimer==60){
								imgcap=8
								imgsped=0
								imgsave=212
								img=imgsave
								image_index=img
								
							}
							if(atttimer>0){
								atttimer-=1
								if(atttimer==52||atttimer==44){
									img+=1
									image_index+=1
									if(atttimer==44){
											chance=y-yspot
											
											x=xtarget
											y=ytarget
											yspot=ytarget+chance
											img=215
											image_index=215	
											atttimer=24

									}
								}else{

									if(atttimer==36||atttimer==28){
									}else{
										if(atttimer==20||atttimer==16||atttimer==12){
											img+=1
											image_index+=1
											if(atttimer==12){
													//Candy Corn
													for(i=0;i<0;i+=1){	
														created=instance_create_depth(x-8+random(16),y-8+random(16),0,Part)
														with(created){
															type=2
															pin=1
															pintwo=1
															depth=other.depth-1
															sprite_index=mask_pump_other_spr
															spin=1
																img=8
																imgcap=1
																imgsped=0
															image_speed=0
															image_index=img+irandom(imgcap)
															image_angle=random(360)
															direction=random(360)
															dur=20+irandom(20)
																speed=random_range(0.5,1)
																hsp=hspeed
																vsp=vspeed
																speed=0
															durtotal=dur
															grav=0.04
															gravtwo=0.02
															chance=1
															xscale=chance
															yscale=chance
															phase=1

														}													
													}		
													
													//AOE
													created = instance_create_depth(x,y,9,Abil)
													with(created){
														sprite_index=abil_pump_exp_ghost_spr
															img=0
															imgcap=11
															image_index=0
															dur=20
															phase=0
															imgsped=0.2
															pin=19
															phase=1
															hurtnum=0
															hurtArray[0]=0
															dmg=3
															chance=dmg
															dmg+=dmg*(Control.invenArray[25,3]*0.01)
															dmg+=chance*(Control.invenArray[20,3]*0.01)
															dmg+=chance*(Control.invenArray[21,3]*0.25)
													}

													//Whisps
													if(Control.talentmapArray[21,1]>0){
														for(i=0;i<5;i+=1){
														created = instance_create_depth(x,y,9,Abil)
															with(created){
																sprite_index=mask_pump_other_spr
																	img=219
																	imgcap=6
																	image_index=img
																	dur=40
																	phase=0
																	imgsped=0.005
																	pin=19
																	dmg=0.25
																	dmg+=dmg*(Control.invenArray[25,3]*0.01)
																	direction=72*other.i
																	direction+=18
																	image_angle=direction
																	imgangle=direction
																	speed=1
																	hsp=hspeed
																	vsp=vspeed
																	speed=0
																	attack=1
															}
														}
													}


													audio_play_sound_at(choose(snd_pumpkin_pump_1,snd_pumpkin_pump_2),x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
													audio_play_sound_at(choose(snd_pumpkin_pump_cry_1,snd_pumpkin_pump_cry_2),x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
											}
										}else{
										
										}
									}							
								}

							}else{
								timer=0
								phase=1
								range=16
								target=Me
								imgsave=208
								img=imgsave
								image_index=img
								sped=0.5
								imgsped=0.08		
								attack=0
								imgcap=3
								attacktrigger=1	
								xtarget=Me.x
								ytarget=Me.y
								img=imgsave
							}
					
						}
					}
					
				}else{
					
//____________________________________________________________________________---------------------(PUMPKIN Ghost Explosion)---------------------____________________________________________________________________________					
					if(pin==19){
							//Whisp
							if(phase==0){
								x+=hsp
								y+=vsp
								if(attack==1){
									with(Enemy){
										hit=instance_place(x,y,other)	
										if(hit!=noone){
											if(team!=0){
												hurttick=1
												dmgrecieved+=other.dmg
												Me.damagedone+=dmgrecieved
												Control.target=id
												other.dur=0
												other.attack=0
											}
										}
									
									}	
								}
								if(dur>=1&&!instance_place(x,y,Block)){
							
								}else{
									instance_destroy()
								}							
							}else{
								//AOE
								if(phase==1){
									with(Enemy){
										hit=instance_place(x,y,other)	
										if(hit!=noone){
											if(team!=0){
												chance=0
												for(i=0;i<other.hurtnum;i+=1){
													if(other.hurtArray[i]==id){
													chance=1
													}
												}
												if(chance==0){
												hurttick=1
												dmgrecieved+=other.dmg
												Me.damagedone+=dmgrecieved
												Control.target=id
												other.hurtArray[other.hurtnum]=id
												other.hurtnum+=1
												}
											}
										}
									}	
									if(dur>=1){
							
									}else{
										instance_destroy()
									}
								}
							}
					}
#endregion
#endregion	
#region Bee
#region  Stinger Bee Abil 1
	//____________________________________________________________________________---------------------(Bee Stinger)---------------------____________________________________________________________________________
						if(pin==20){
					if(phase==1){
						with(sndobjectone){
							audio_emitter_position(sndemitone,other.x,other.y,0)
						}
						//Hover stinger particle
						if(pintwo==1){
							for(i=0;i<0;i+=1){
								created=instance_create_depth(x-4+random(8),y-1.5+random(3),0,Part)
								with(created){
								type=1
								pin=1
								depth=other.depth+1
								spin=1
								img=6
								img=160+irandom(5)
								imgcap=1
								imgsped=0
								image_speed=0
								image_index=irandom_range(img,img+imgcap)
								dur=3+choose(0,0,0,1,1,2)+irandom(8)
								durtotal=dur
								hsp=other.hsp*0.02
								vsp=0
								depth=other.depth+1

								}		
							}
						}
						
						chance=instance_nearest(x,y,Enemy)
						if(chance!=noone){
							if(point_distance(x,y,chance.x,chance.y)<48){
								chancethree=0
								if(dirtwo==1){
									if(x<=chance.x+5){
										chancethree=1						
									}
								}else{
									if(x>=chance.x-5){
										chancethree=1						
									}								
								}
								if(chancethree==1){
								
									chancetwo=0.3+(Control.talentmapArray[2,1]*0.025)
									if(Control.talentmapArray[3,1]==0){
										chancetwo=0.5+(Control.talentmapArray[2,1]*0.06)
									}else{
										chancetwo=0.8+(Control.talentmapArray[2,1]*0.06)
									}
									
								if(x<chance.x-3){
									x+=chancetwo
								}else{
									if(x>chance.x+3){
										x-=chancetwo
									}						
								}
									if(Control.talentmapArray[3,1]!=0){
										chancefour=3
									}else{
										chancefour=1
									}
								if(y<chance.y-3){
									y+=chancetwo

										if(dirtwo==-1){
											imgangle+=chancefour
										}else{
											imgangle-=chancefour
										}
									
								}else{
									if(y>chance.y+3){
										y-=chancetwo
											if(dirtwo==1){
												imgangle+=chancefour
											}else{
												imgangle-=chancefour
											}
									}						
								}
								}
							}
						}
					
						if(dur<=0){
						phase=0 
						dur=10
						visible=false
						hsp=0
						vsp=0
						phasecheck=1
						}
					abil_dmg_scr()
						if(hit!=noone){
							if(hit.team!=0){
								with(hit){
								hurttick=1
								dmgrecieved+=other.dmg
								Me.damagedone+=dmgrecieved
								Control.target=id
								effectArray[0,0]=effectArray[0,1]*6
									if(effectArray[0,3]<3+Control.talentmapArray[18,1]){
										effectArray[0,3]+=1
									}
								}
								phase=0					
								dur=0
										if(pinfour==1){
											//Heal bee
											created=instance_create_depth(x,y,0,Abil)
											with(created){
													diddmg=0
													dmg=1
					
													dmg+=dmg*(Control.invenArray[25,3]*0.01)
								
													type=0
													pin=24
													pintwo=0
													pinthree=0
													phase=1
													en=0
													creator=other.id
													imgsped=0.1
														if(Control.talentmapArray[21,1]>0){
															img=112
														}else{
															img=112+8
														}
														temp=1
														tick=0
														range=16
														ticktwo=0
														startx=x
														starty=y
		
													imgcap=7
													sprite_index=mask_bee_spr
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
													durextra=irandom(20)
								
													xspot=random_range(-3,3)
													yspot=random_range(-3,3)
											}
										}								
								
							}
						}
					}else{
						if(phase==0){
							if(dur<3){
								chance=irandom(360)
								for(i=0;i<10;i+=1){
									created=instance_create_depth(x-2+random(4),y-1.5+random(3),0,Part)
									with(created){
									type=1
									pin=1
									depth=other.depth+1
									spin=1
									img=43
									imgcap=3
									imgsped=0.3
									image_speed=0
									image_index=irandom_range(img,img+imgcap)
									image_index=img
									dur=6+choose(0,0,0,1,1,2)+irandom(20)
									direction=other.i*36+other.chance
									speed=random_range(0.05,0.1)
									speed=0.1
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
						}else{
#endregion
#region  Honey Bee Abil 2
	//____________________________________________________________________________---------------------(Bee Honey)---------------------____________________________________________________________________________
						if(pin==21){
							
if(pintwo==2){
					
#region Honey GROUND
			//____________________________________________________________________________---------------------(Honey Ground)---------------------____________________________________________________________________________
		//visible=false
			if(phase==0){
				depth=12
				if(dur mod 20 ==0){
					if(image_index>img-7){
						image_index-=1
					}else{
						phase=1
						dur=300
					}
				}
			}else{
				if(phase==1){
					if(dur==1){
						dur=120000
						phase=2
					}
				}else{
					if(phase==2){
						if(dur mod 20 ==0){
							if(image_index<img){
								image_index+=1
							}else{
								block.type=0
								instance_destroy()
							}
						}
					}
				}
			}
							with(Enemy){
								hit=instance_place(x,y,other)	
								if(hit!=noone){
									if(team!=0){
										debuffArray[1,0]=150
									}
								}
							}	
							
		
#endregion					
}else{
						//____________________________________________________________________________---------------------(Honey Glob)---------------------____________________________________________________________________________
							if(Control.talentmapArray[4,1]>0&&pintwo!=1){
								vsp+=grav

								if(dur==300){
									if(Control.talentmapArray[6,1]>0){
										img=79
									}else{
										img=46
									}
									
									imgsped=0
									image_index=img
								}else{
									if(dur==200){
										if(Control.talentmapArray[6,1]>0){
											img=80
										}else{
											img=47
										}
										imgsped=0
										image_index=img
									}else{
									if(dur==100){
										if(Control.talentmapArray[6,1]>0){
											img=81
										}else{
											img=48
										}
										imgsped=0
										image_index=img
									}else{
						
									}						
									}						
								}
									if(didhoney==0){
											block=instance_place(x,y,Block)
											if(block!=noone){
												
												didhoney=1
												
											//larger honey
												for(i=0;i<1;i+=1){
								
													created=instance_create_depth(x,y-4,0,Part)
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
						if(phase==1){
							if(instance_place(x,y,Block)){
								if(phasecheck==1){
									if(grav!=0){
										audio_play_sound_at(choose(snd_bee_honey_1,snd_bee_honey_2),x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
									}
								//dur=0
								hsp=0 
								vsp=0
								grav=0
								imgsped=0
								}

							}
							if(dur<=0){
								phase=0 
								dur=10
								visible=false
								hsp=0
								vsp=0
								phasecheck=1
							}
						abil_dmg_scr()
							if(diddmg==0){
								if(hit!=noone){
									if(hit.team!=0){
										
									if(didhoney==0){
												
												didhoney=1

											//larger honey
											for(i=0;i<1;i+=1){
								
												created=instance_create_depth(hit.x,hit.y-3,0,Part)
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
										
										audio_play_sound_at(choose(snd_bee_honey_1,snd_bee_honey_2),x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
										diddmg=1
										phase=2		
										imgsped=0
										hsp=0
										vsp=0
										grav=0
										Me.passiveArray[2,10]=hit
										Me.passiveArray[2,11]=0
										hittwo=hit
										if(pinfour==1){
											//Heal bee
											created=instance_create_depth(x,y,0,Abil)
											with(created){
													diddmg=0
													dmg=1
					
													dmg+=dmg*(Control.invenArray[25,3]*0.01)
								
													type=0
													pin=24
													pintwo=0
													pinthree=1
													phase=1
													en=0
													creator=other.id
													imgsped=0.1
														if(Control.talentmapArray[21,1]>0){
															img=112
														}else{
															img=112+8
														}
														temp=1
														tick=0
														range=16
														ticktwo=0
														startx=x
														starty=y
		
													imgcap=7
													sprite_index=mask_bee_spr
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
													durextra=irandom(20)
								
													xspot=random_range(-3,3)
													yspot=random_range(-3,3)
											}
										}

									}
								}
							}
						}else{
							if(phase==0){
								if(dur<3){
									chance=irandom(360)
									for(i=0;i<10;i+=1){
										created=instance_create_depth(x-2+random(4),y-1.5+random(3),0,Part)
										with(created){
										type=1
										pin=1
										depth=other.depth+1
										spin=1
										img=43
										imgcap=3
										imgsped=0.3
										image_speed=0
										image_index=irandom_range(img,img+imgcap)
										image_index=img
										dur=6+choose(0,0,0,1,1,2)+irandom(20)
										direction=other.i*36+other.chance
										speed=random_range(0.05,0.1)
										speed=0.1
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
					
								if(phase==2){
									if(instance_exists(hit)){
										x=hit.x
										y=hit.y
										if(dur<=0){
										phase=0 
										dur=10
										visible=false
										phasecheck=1
										}
									}
								}
							}
						}		
						if(dur<=0){
						//	instance_destroy()
						}
						
							}else{
#region  Bee Hive Q2
	//____________________________________________________________________________---------------------(Bee Hive Q2)---------------------____________________________________________________________________________
	if(Control.talentmapArray[7,1]>0||pintwo==1){
		if(pintwo==0){
		
			x+=hsp
			y+=vsp
			
			if(vsp<3){
				vsp+=grav
			}
			if(hsp-gravtwo>=0||hsp+gravtwo<=0){
				if(hsp-gravtwo>=0){
					hsp-=gravtwo
				}else{
					hsp+=gravtwo
				}
			}else{
				hsp=0
			}

			if(global.con_p_q||global.con_p_q){
				dur=0
			}

			imgangle+=hsp*5
					
					if(sndcd>0){
						sndcd-=1
					}

							with(Enemy){
								hit=instance_place(x,y,other)	
								
								if(hit!=noone){
									if(team!=0){
										chance=0
										for(i=0;i<other.hurtnum;i+=1){
											if(other.hurtArray[i]==id){
											chance=1
											}
										}
										if(chance==0){
										hurttick=1
										dmgrecieved+=other.dmg
										Me.damagedone+=dmgrecieved
										Control.target=id
										other.hurtArray[other.hurtnum]=id
										other.hurtnum+=1
											if(Control.talentmapArray[19,1]>0){
												Me.talentfivecd-=60
												Me.talentfivecdcount+=60
											}
											if(Control.talentmapArray[19,1]>0){
												Me.passivefourArray[1000,0]-=60
											}
											other.dur=0
										}
									}
								}
							}
							
						//	hit=collision_circle(Me.passiveArray[1,1],Me.passiveArray[1,2],8,Enemy,true,true)
							with(Abil){
								if(pin==23){
									if(attcd<=0){
										hit=instance_place(x,y,Enemy)
										if(hit!=noone){
											with(hit){
												if(team!=0){

													hurttick=1
													dmgrecieved+=other.dmg*0.1
													Me.damagedone+=dmgrecieved
													Control.target=id
													other.attcd=30
												}
											}
										}
									}
								}
							}
					
					if(instance_place(x+hsp,y,Block)!=noone){
						hsp=hsp*-0.8
						if(sndcd<=0&&abs(hsp)>0.5){
							sndcd=20
							
							audio_play_sound_at(choose(snd_bee_honey_1,snd_bee_honey_2),x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
						}
					}
					if(instance_place(x,y+vsp,Block)!=noone){
						vsp=vsp*-0.8
						hsp=hsp*0.8
						if(sndcd<=0&&abs(vsp)>0.5){
							sndcd=20
							
							audio_play_sound_at(choose(snd_bee_honey_1,snd_bee_honey_2),x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
						}
					}
					
					if(diddmg>0){
						diddmg-=1
					}else{
						if(abs(hsp)>0.02){
						hit=instance_place(x+hsp,y,Enemy)
								if(hit!=noone){
									if(hit.team!=0){
										audio_play_sound_at(choose(snd_bee_honey_1,snd_bee_honey_2),x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
										diddmg=15
										//phase=2		
										//imgsped=0
										hsp=hsp*-0.9
										vsp=0

										hittwo=hit
												with(hit){

													hurttick=1
													dmgrecieved+=other.dmg
													Me.damagedone+=dmgrecieved
													Control.target=id
													other.attcd=30
													other.dur=0
												}
										if(pinfour==1){
											for(i=0;i<3;i+=1){
												//Heal bee
												created=instance_create_depth(x-5+i*5,y,0,Abil)
												with(created){
														if(other.i==0||other.i==2){
															y-=6
														}else{
															y+=6
														}
														diddmg=0
														dmg=1
					
														dmg+=dmg*(Control.invenArray[25,3]*0.01)
								
														type=0
														pin=24
														pintwo=0
														pinthree=0
														phase=1
														en=0
														creator=other.id
														imgsped=0.1
															if(Control.talentmapArray[21,1]>0){
																img=112
															}else{
																img=112+8
															}
															temp=1
															tick=0
															range=16
															ticktwo=0
															startx=x
															starty=y
		
														imgcap=7
														sprite_index=mask_bee_spr
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
														durextra=irandom(20)
								
														xspot=random_range(-3,3)
														yspot=random_range(-3,3)
												}
											}
										}											
									}
								}else{

								}	
						}else{
							hsp=0
						}
						if(abs(vsp)>0.02){
						hit=instance_place(x,y+vsp,Enemy)
								if(hit!=noone){
									if(hit.team!=0){
										audio_play_sound_at(choose(snd_bee_honey_1,snd_bee_honey_2),x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
										diddmg=15
										//phase=2		
										//imgsped=0
										vsp=vsp*-0.9

										hittwo=hit
												with(hit){

													hurttick=1
													dmgrecieved+=other.dmg
													Me.damagedone+=dmgrecieved
													Control.target=id
													other.attcd=30
													other.dur=0
												}
										if(pinfour==1){
											for(i=0;i<3;i+=1){
												//Heal bee
												created=instance_create_depth(x-5+i*5,y,0,Abil)
												with(created){
														if(other.i==0||other.i==2){
															y-=6
														}else{
															y+=6
														}
														diddmg=0
														dmg=1
					
														dmg+=dmg*(Control.invenArray[25,3]*0.01)
								
														type=0
														pin=24
														pintwo=0
														pinthree=0
														phase=1
														en=0
														creator=other.id
														imgsped=0.1
															if(Control.talentmapArray[18,1]>0){
																img=112
															}else{
																img=112+8
															}
															temp=1
															tick=0
															range=16
															ticktwo=0
															startx=x
															starty=y
		
														imgcap=7
														sprite_index=mask_bee_spr
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
														durextra=irandom(20)
								
														xspot=random_range(-3,3)
														yspot=random_range(-3,3)
												}
											}
										}
									}
									
								}else{  

								}	
						}else{
							vsp=0
						}
					}
					
					if(timer>0){
						timer-=1
					}else{
						timer=60
						

					
						//Small bee
						created=instance_create_depth(x-4+irandom(8),y-4+irandom(8),0,Abil)
						with(created){
								poison=0
								diddmg=0
								dmg=1
					
								dmg+=dmg*(Control.invenArray[25,3]*0.01)
								
								type=0
								pin=21
								pintwo=1
								pinthree=0
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
								durextra=irandom(20)
								
								xspot=random_range(-3,3)
								yspot=random_range(-3,3)
						}
					}
					
					if(dur<=0){
					
						if(Control.talentmapArray[19,1]>0){
							//Honey Particle
							for(i=0;i<5;i+=1){
								
								created=instance_create_depth(x-3+random(6),y+5,0,Part)
								with(created){
									type=2
									pintwo=1
									pin=1
									phase=101
									depth=other.depth-1
									spin=1
									img=154
					
									imgcap=5
									imgsped=0
									image_speed=0
									image_index=irandom_range(img,img+imgcap)
									dur=50+choose(0,0,0,1,1,2)+irandom(15)
									durtotal=dur
									hsp=random_range(-0.6,0.6)
									vsp=random_range(-1,-2)
									grav=0.1
									image_angle-=15
									image_angle+=random(30)

								}		
							}
							//larger honey
							for(i=0;i<5;i+=1){
								
								created=instance_create_depth(x-3+random(6),y+5,0,Part)
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
									grav=0.1
									image_angle-=15
									image_angle+=random(30)

								}		
							}
					}
					if(Control.talentmapArray[9,1]>0){
						for(i=0;i<2;i+=1){
							//Small bee Med bee
							created=instance_create_depth(x-4+irandom(8),y-4+irandom(8),0,Abil)
							with(created){
								poison=1
									diddmg=0
									dmg=1
					
									dmg+=dmg*(Control.invenArray[25,3]*0.01)
								
									type=0
									pin=21
									pintwo=1
									pinthree=0
									phase=1
									en=0
									creator=other.id
									imgsped=0.1
										img=29
										temp=1
										tick=0
										range=16
										ticktwo=0
										startx=x
										starty=y
		
									imgcap=3
									sprite_index=abil_spr
									image_index=img
									depth=Me.depth+1
									image_speed=0
									dur=500+irandom(200)
									dur+=(dur*(Control.talentmapArray[8,1]*0.1))
									durtotal=dur
									sped=0.02+choose(-0.002,-0.004,-0.006,0.002,0.004,0.006)
									attcd=50
									phasetwo=0
									tick=choose(0,1)
									ticktwo=choose(0,1)
									sped=0.1+choose(0.03,0.015,0,-0.015,-0.03)
									spedtwo=0.3+choose(0.03,0.015,0,-0.015,-0.03)
									durextra=irandom(10)

									xspot=random_range(-3,3)
									yspot=random_range(-3,3)
							}
						}						
					}
						
					
					
					for(i=0;i<7;i+=1){
						//Small bee
						created=instance_create_depth(x-4+irandom(8),y-4+irandom(8),0,Abil)
						with(created){
								poison=0
							
								diddmg=0
								dmg=1
					
								dmg+=dmg*(Control.invenArray[25,3]*0.01)
								
								type=0
								pin=21
								pintwo=1
								pinthree=0
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
								sped=0.02+choose(-0.002,-0.004,-0.006,0.002,0.004,0.006)
								attcd=50
								phasetwo=0
								tick=choose(0,1)
								ticktwo=choose(0,1)
								sped=0.1+choose(0.03,0.015,0,-0.015,-0.03)
								spedtwo=0.3+choose(0.03,0.015,0,-0.015,-0.03)
								durextra=irandom(10)

								xspot=random_range(-3,3)
								yspot=random_range(-3,3)
						}
					}
						
						instance_destroy()
					}

	
		}else{
			if(pintwo==1){
				
				//Small Bee Run
				if(phasetwo==0){
					
					if(dur<=0){
						instance_destroy()
					}
					
					
					if(pinthree==1){
						startx=Me.x+xoffset
						starty=Me.y+yoffset
						rangeattack=48
					}else{
						rangeattack=38
					}
					
					
					chance=noone
					if(dur<=durtotal-10-durextra){
						hit=instance_place(x,y,Enemy)
								if(hit!=noone){
									if(hit.team!=0){
										audio_play_sound_at(choose(snd_bee_honey_1,snd_bee_honey_2),x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)

										hittwo=hit
												with(hit){

													hurttick=1
													dmgrecieved+=other.dmg
													Me.damagedone+=dmgrecieved
													Control.target=id
													other.attcd=30
													
													//poison effect
													if(other.poison==1){
														effectArray[0,0]=effectArray[0,1]*6
														
														if(effectArray[0,3]<3+Control.talentmapArray[18,1]){
															effectArray[0,3]+=1
														}
													}
												}
												
										instance_destroy()
									}
								}

						chance=instance_nearest(x,y,Enemy)
						if(chance!=noone){
							if(point_distance(x,y,chance.x+xspot,chance.y+yspot)<rangeattack){
								if(pinthree==1){
									chancetwo=0.6						
								}else{
									chancetwo=0.2
									chancetwo=0.3
								}
								if(x<chance.x+xspot-3){
									x+=chancetwo
									dir=1
								}else{
									if(x>chance.x+xspot+3){
										x-=chancetwo
										dir=-1
									}						
								}
								if(y<chance.y+yspot-3){
									y+=chancetwo
								}else{
									if(y>chance.y+yspot+3){
										y-=chancetwo
									}						
								}
							}else{
								chance=noone
							}
						}
					}
						if(chance==noone){
							if(tick==0){
								if(x<=startx+range){
									x+=sped
									dir=1
								}else{
									tick=1
								}
							}else{
								if(x>=startx-range){
									x-=sped
									dir=-1
								}else{
									tick=0
								}					
							}
							if(ticktwo==0){
								if(y<=starty+range){
									y+=spedtwo
								}else{
									ticktwo=1
								}
							}else{
								if(y>=starty-range){
									y-=spedtwo
								}else{
									ticktwo=0
								}					
							}							
						}
				}
			}	
		}
	}
}
#endregion
							}
						}else{
#endregion
#region  Swarm Bee Abil 3
	//____________________________________________________________________________---------------------(Bee Swarm)---------------------____________________________________________________________________________
						if(pin==22){
					if(phase==1){
						if(dur<=0){
						phase=0 
						dur=10
						visible=false
						hsp=0
						vsp=0
						phasecheck=1
						}
					abil_dmg_scr()
						if(hit!=noone){
							if(hit.team!=0){
								with(hit){
								hurttick=1
								dmgrecieved+=other.dmg
								Me.damagedone+=dmgrecieved
								Control.target=id
								}
								phase=0					
								dur=0
							}
						}
					}else{
						if(phase==0){
							if(dur<3){
								chance=irandom(360)
								for(i=0;i<10;i+=1){
									created=instance_create_depth(x-2+random(4),y-1.5+random(3),0,Part)
									with(created){
									type=1
									pin=1
									depth=other.depth+1
									spin=1
									img=47
									imgcap=3
									imgsped=0.3
									image_speed=0
									image_index=irandom_range(img,img+imgcap)
									image_index=img
									dur=6+choose(0,0,0,1,1,2)+irandom(20)
									direction=other.i*36+other.chance
									speed=random_range(0.05,0.1)
									speed=0.1
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
						}else{
#endregion
#endregion
#region  Passive Bee Passive
	//____________________________________________________________________________---------------------(Bee Passive)---------------------____________________________________________________________________________
						if(pin==23){
							
								if(attcd>0){
									attcd-=1
								}
								if(sndgen==1){
									with(sndobjectone){
										dur=50
										audio_emitter_position(sndemitone,other.x,other.y,0)
									}
								}
							if(Me.class!=3){
								if(audio_exists(sndemitone)){
									audio_emitter_free(sndemitone)
								}
								instance_destroy()
							}
							if(Me.passiveArray[2,0]==2||Me.passiveArray[2,0]==4||Me.passiveArray[2,0]==5){
								sped=spedsavetwo
								ticksped=0.2+randomsped
								if(Me.passiveArray[2,0]==4||Me.passiveArray[2,0]==5){
									sped+=sped*0.5
									ticksped=0.3+randomsped
								}
								if(Me.passiveArray[2,0]==5){
									ticksped=1+randomsped	
								}
							}else{
								//Attack Honey
								if(Me.passiveArray[2,0]==1){
									sped=spedsave
									ticksped=0.8+randomsped
									
									if(sndgen==1){
										if(Me.sndplaying==1){
											Me.sndplaying=0
											with(sndobjectone){
												if(!audio_emitter_exists(sndemitone)){
													sndemitone=audio_emitter_create()
												}
																//choose(snd_bee_swarm_2,snd_bee_swarm_3)
												audio_play_sound_on(sndemitone,choose(snd_bee_swarm_1,snd_bee_swarm_2),false,8)
												audio_emitter_falloff(sndemitone, 48, Control.falloff_max, Control.falloff_factor)		
											}
										}
									}
								}else{
									if(Me.passiveArray[2,0]==3){
										if(Me.passiveArray[2,9]>80){
											ticksped=0.1+randomsped
										}else{
											if(Me.passiveArray[2,9]>30){
												ticksped=0.15+randomsped
											}else{
												ticksped=0.5+randomsped	
											}
										}
									}else{
											sped=spedsave
											ticksped=0.05+randomsped
									}
								}
							}
							if(tick==0||tick==1){
									if(tick==0){
										if(tickx+ticksped<=rangex){
											tickx+=ticksped
										}else{
											tickx=rangex
											tick=2
										}
									}else{
										if(tickx-ticksped>=0-rangex){
											tickx-=ticksped
										}else{
											tickx=0-rangex
											tick=3
										}								
									}
							}else{
								if(tick==2||tick==3){
									if(tick==3){
										if(tickx+ticksped<=rangex){
											tickx+=ticksped
										}else{
											tickx=rangex
											tick=0
										}
									}else{
											if(tickx-ticksped>=0-rangex){
												tickx-=ticksped
											}else{
												tickx=0-rangex
												tick=1
											}								
										}
								}
							}
							if(ticktwo==0||ticktwo==1){
									if(ticktwo==0){
										if(ticky+ticksped<=rangey){
											ticky+=ticksped
										}else{
										ticky=rangey
										ticktwo=2
										}
									}else{
										if(ticky-ticksped>=0-rangey){
											ticky-=ticksped
										}else{
										ticky=0-rangey
										ticktwo=3
										}								
									}
							}else{
								if(ticktwo==2||ticktwo==3){
									if(ticktwo==3){
										if(ticky+ticksped<=rangey){
											ticky+=ticksped
										}else{
										ticky=rangey
										ticktwo=0
										}
									}else{
											if(ticky-ticksped>=0-rangey){
												ticky-=ticksped
											}else{
											ticky=0-rangey
											ticktwo=1
											}								
									}
								
								}
							}
						
							Me.passiveArray[2,3]=0
							Me.passiveArray[2,4]=0
							if(phase==1){
								targetx=Me.passiveArray[1,1]+xpos-3
								if(Me.dir==-1){
									if(Me.passiveArray[2,0]==0){	
									targetx-=3
									}
								}
								targety=Me.passiveArray[1,2]+ypos
								if(xspot+sped<targetx-1){
									xspot+=sped
									dir=1
								}else{
									if(xspot-sped>targetx+1){
										xspot-=sped
										dir=-1
									}else{
										xspot=targetx
										Me.passiveArray[2,3]=1
										if(Me.passiveArray[2,0]==0){	
											dir=Me.dir
										}
									}						
								}
								if(yspot+sped<targety-1){
									yspot+=sped
								}else{
									if(yspot-sped>targety+1){
										yspot-=sped
									}else{
										yspot=targety
										Me.passiveArray[2,4]=1
										if(Me.passiveArray[2,0]==0){
											dir=Me.dir
										}
									}						
								}
							}
							x=xspot+tickx
							y=yspot+ticky
					/*
					if(phase==1){
						if(dur<=0){
						phase=0 
						dur=10
						visible=false
						hsp=0
						vsp=0
						phasecheck=1
						}
					
					}else{
						if(phase==0){
							if(dur<3){
								chance=irandom(360)
								for(i=0;i<10;i+=1){
									created=instance_create_depth(x-2+random(4),y-1.5+random(3),0,Part)
									with(created){
									type=1
									pin=1
									depth=other.depth+1
									spin=1
									img=47
									imgcap=3
									imgsped=0.3
									image_speed=0
									image_index=irandom_range(img,img+imgcap)
									image_index=img
									dur=6+choose(0,0,0,1,1,2)+irandom(20)
									direction=other.i*36+other.chance
									speed=random_range(0.05,0.1)
									speed=0.1
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
					*/
						if(num==5){
							if(lastx!=x){
								Me.passiveArray[10,0]+=x-lastx
							}
							if(lastx!=y){
								Me.passiveArray[10,1]+=y-lastx
							}
						}
							lastx=x
							lasty=y
						}else{
#region Bee heal


	//____________________________________________________________________________---------------------(Bee Heal)---------------------____________________________________________________________________________							
							if(pin==24){
								if(pintwo==0){
									
									if(sped!=0.5){
										audio_play_sound_at(choose(snd_bee_healcreate_1,snd_bee_healcreate_2),x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
									}
									
									tox=Me.x
									toy=Me.y
									sped=0.5
									
									/*
									if(dur mod 10 ==0){
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
											dur=5+choose(0,0,0,1,1,2)+irandom(13)
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
									*/
									
									if(x<tox-4-sped){
										x+=sped
										dir=1
									}else{
										if(x>tox+4+sped){
											x-=sped
											dir=-1
										}else{
									
										}									
									}
									if(y<toy-4-sped){
										y+=sped
									}else{
										if(y>toy+4+sped){
											y-=sped
										}else{
									
										}									
									}
									
									if(tick==0){
										if(yspot<0.6){
											yspot+=0.05
										}else{
											tick=1
										}
									}else{
										if(yspot>-00.6){
											yspot-=0.05
										}else{
											tick=0
										}									
									}
									
									y+=yspot
									
									if(instance_place(x,y,Me)){
										Me.healtick=1
										
											audio_play_sound_at(choose(snd_bee_heal_1,snd_bee_heal_2,snd_bee_heal_3),x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
										if(img<116){
											Me.healrecieved+=0.02*(Control.talentmapArray[20,1])*2
										}else{
											Me.healrecieved+=0.02*(Control.talentmapArray[20,1])
										}
											dur=0
									}
									
									if(dur==0){
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
										instance_destroy()
									}
								}else{
									if(pintwo==1){
								
									}else{
								
									}								
								}
							
							}else{
								
#endregion
#endregion
#endregion
#region Burger
#region Burger Charge Attack
	//____________________________________________________________________________---------------------(Burger)---------------------____________________________________________________________________________
	if(pin==25){
		if(image_index>=img+1){
			if(sndgen==1){
				sndgen=0
				audio_play_sound_at(choose(snd_burger_burger_chomp_1,snd_burger_burger_chomp_2),x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
			}
		}else{
			sndgen=1
		}
		chance=0.1+(Control.talentmapArray[1,1]*0.01)
		//chance=0.15
		if(temp!=1){
			
			if(global.con_h_left||global.conp_h_left){
				Me.hsp-=chance
			}
			if(global.con_h_right||global.conp_h_right){
				Me.hsp+=chance
			}
		}else{
			if(Me.dir==1){
				if(global.con_h_left||global.conp_h_left){
					dur=0
					Me.stun=0
				}
			}else{
				if(global.con_h_right||global.conp_h_right){
					dur=0
					Me.stun=0
				}	
			}
			if(global.con_h_up||global.conp_h_up){
				Me.vsp-=chance
			}
			if(global.con_h_down||global.conp_h_down){
				Me.vsp+=chance
			}	
		}
		if(global.con_h_space||global.conp_h_space){
			dur=0
			Me.vsp=-4.8
			Me.jumps=0
		}
			dir=Me.dir
			if(temp==1){
				Me.vsp-=0.15
			}
			if(Me.dir==1){
				x=Me.x-2
			}else{
				x=Me.x+2
			}
			x=Me.x+Me.hsp
			y=Me.y
			Me.passive=2
	if(diddmg==0){		
		if(Control.talentmapArray[13,1]>0){		
			if(holding==0){
				chance=instance_place(x,y,Abil)
				if(chance!=noone){
					if(chance.pin==28){
						if(chance.pintwo!=2){
							holding=chance
							holding.depth=depth-1
						}
					}
				}
			}else{
				if(instance_exists(holding)){
					with(holding){
						x=Me.x
						y=Me.y
						if(dur>50){
							dur=50
						}
					}
				}
			}
			
		}
		
		
		//Burger Slam
		if(slam==1){
			chance=0
			chancetwo=3
			if(abs(Me.hsp)>chancetwo-1){
				if(instance_place(x+Me.hsp,y,Block)){
					if(instance_place(x,y+2,Block)){
						chance=1
						hit=instance_place(x+Me.hsp,y,Block)
					}
				}
			}else{
				if(abs(Me.hsp)>chancetwo-1){
					if(instance_place(x-Me.hsp,y,Block)){
						if(instance_place(x,y+2,Block)){
							chance=1
							hit=instance_place(x-Me.hsp,y,Block)
						}
					}
				}
			}
			if(abs(Me.vsp)>chancetwo){
				if(instance_place(x,y+Me.vsp,Block)){
					chance=2
					hit=instance_place(x,y+Me.vsp,Block)
				}
			}else{
				if(abs(Me.vsp)>chancetwo){
					if(instance_place(x,y-Me.vsp,Block)){
						chance=2
						hit=instance_place(x,y=Me.vsp,Block)
					}
				}
			}
				if(chance==1||chance==2){
					slam=0
					Control.screenshake=3
					
					if(chance==1){
						Me.hsp=Me.hsp*-0.7
						chance=6
					}else{
						Me.vsp=Me.vsp*-0.8
						chance=8
					}

						for(i=0;i<6;i+=1){
							if(chance==6){
								created=instance_create_depth(hit.x-8,Me.y-12+random(24),0,Part)
							}else{
								created=instance_create_depth(Me.x-12+random(24),hit.y-6,0,Part)
							}
							with(created){
								type=1
								pin=1
								depth=other.depth+1
								spin=1
									img=167
									imgcap=3
									
									if(other.chance==6){
										hsp=random_range(-0.1,-0.4)
										vsp=random_range(-0.2,0.2)
										img+=4
										
									}else{
										
										hsp=random_range(-0.2,0.2)
										vsp=random_range(-0.1,-0.4)
										
									}
									
									imgsped=0
									image_speed=0
									image_index=irandom_range(img,img+imgcap)
									
									imgangle=random(360)
								dur=10+irandom(10)
								durtotal=dur
								chance=1
								xscale=chance
								yscale=chance
								grav=0
							}		
						}						
					
					
					dur=chance
					Me.stun=chance
					audio_play_sound_at(choose(snd_burger_burger_hit_1,snd_burger_burger_hit_2),x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
					
					for(i=0;i<4;i+=1){
						//Burger Proj
						if(chance==6){
							created=instance_create_depth(Me.x,Me.y-12+i*6,0,Abil)
						}else{
							created=instance_create_depth(Me.x-12+i*6,Me.y,0,Abil)
						}
						with(created){
								if(other.chance==6){
									if(instance_place(x,y,Block)){
										x+=Me.hsp*2
									}
								}
								diddmg=0
								version=0
								dmg=1
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
									img=104+irandom(2)
										
									temp=1
									move=0
									pintwo=3

								if(Me.passivethree>0){
									version=1
									img+=3
									dmg=5
								}

								imgcap=1
								sprite_index=abil_burger_spr
								image_index=img
								depth=Me.depth+1
								image_speed=0
								dur=120+irandom(35)

								durtotal=dur
								grav=0.1
								gravtwo=0.05
							
								dir=other.dir

								bounce=50
								chance=-1
	
								timer=28+irandom(20)
								vsp=0
								hsp=0 
						
							thro=5
							tomtype=5
							image_index=img
							grav=random_range(0.07,0.12)
							sped=random_range(2.5,3)

							hsp=0
						
						
							if(other.chance==6){
								hsp=random_range(1.25,1.75)
								vsp=random_range(-0.5,-0.9)
							}else{
								vsp=random_range(-2.5,-2.75)
							}
						
						
							hsp=hsp*Me.dir*-1						

							timer=0
						}	
					}
				}
			}
	
				chance=instance_place(x,y,Abil)
				if(chance!=noone){
					if(chance.pin==28){
						if(chance.pintwo==2){
							chance.hsp=Me.hsp*1.5
							chance.vsp=Me.vsp
						}else{
							if(chance.pintwo==3){
								if(chance.diddmg==0){
									if(Control.talentmapArray[21,1]>0){
										if((chance.sprite_index==abil_burger_two_spr&&chance.img==70)||(chance.sprite_index==abil_burger_two_spr&&chance.img==73)){
											chance.dmg=chance.dmg*2
											chance.diddmg=1
										}
									}
								}
								if(chance.thro<=0){
									chance.hsp=Me.hsp*1.5
									chance.vsp=Me.vsp		
								}
							}
						}
					}
				}
			
				
				chance=instance_place(x+Me.hsp,y+Me.vsp,Enemy)
			with(Me){
				if(other.chance==noone){
					//chance=instance_place(x+hsp+hsp*0.3,y+vsp+vsp*0.3,Enemy)
					chance=instance_place(x+hsp,y+vsp,Enemy)
				}else{
					chance=other.chance
				}
				if(chance!=noone){
					if(chance.team!=0){
					audio_play_sound_at(choose(snd_burger_burger_hit_1,snd_burger_burger_hit_2),x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
					other.chancetwo=hsp
					other.chancethree=vsp
					hsp=hsp*-0.6
					vsp=vsp*-0.6
					if(abs(vsp)>abs(hsp)&&vsp<0){
						vsp=vsp*2
					}
					stun=7
					
						//Tomatot
						if(Control.talentmapArray[23,1]>0){
							chancethree=6-Control.talentmapArray[23,1]
							if(Me.passivefourArray[100,10]<chancethree){
								Me.passivefourArray[100,10]+=1
							}else{
								
								Me.passivefourArray[100,10]=0
									//Tomato create
									created=instance_create_depth(x,y,0,Abil)
									with(created){

											diddmg=0
											dmg=2
					
											dmg+=dmg*(Control.invenArray[25,3]*0.01)

										type=0
										pin=28
										isfry=0
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
										hsp=other.hsp*0.5
										vsp=random_range(-1.5,-2)
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
						}
					}
				}
			}
				if(Me.passivetwo!=0){
					if(instance_exists(Me.passivetwo)){
						chancetwo=instance_place(x+Me.hsp,y+Me.vsp,Abil)
						if(chancetwo!=Me.passivetwo){
							with(Me){
								other.chancetwo=instance_place(x+hsp,y+vsp+2,Abil)
							}
						}
						if(chancetwo==Me.passivetwo){
							passivetwo=Me.passivetwo
							if(passivetwo.phase==0){
							chancetwo=Me.hsp
							chancethree=Me.vsp
	//						Me.hsp=Me.hsp*-0.6
	//						Me.vsp=Me.vsp*-0.6	
								with(Me.passivetwo){
									phase=1
									vsp=-2.5
								}
								Me.abilArray[0,1]=0
								if(Me.vsp>-3){
									Me.vsp=-3
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
									dur=15+choose(0,0,0,1,1,2)+irandom(30)
									direction=other.i*36+other.chance
									speed=random_range(0.05,0.1)
									speed=0.1
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
			hit=Me.chance
			if(hit!=noone){			
				if(hit!=noone){
					if(hit.team!=0){
						dur=7
						with(hit){
							hurttick=1
							dmgrecieved+=other.dmg
							Me.damagedone+=dmgrecieved
							Control.target=id
								if(hp-dmgrecieved>=0){
									Me.passivefourArray[100,0]=id
									Me.passivefourArray[100,1]=1000
								}
						}
							diddmg=1
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
									dur=15+choose(0,0,0,1,1,2)+irandom(30)
									direction=other.i*36+other.chance
									speed=random_range(0.05,0.1)
									speed=0.1
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
		
					if(dur mod 2 ==0){
						for(i=0;i<1;i+=1){
							created=instance_create_depth(x-9+random(18),y-5+random(10),0,Part)
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
							durtotal=dur
							hsp=0
							vsp=0.3
							image_angle-=15
							image_angle+=random(30)

								if(Me.dir==-1){
									xscale=-1
									hsp=random_range(0.3,0.6)	
								}else{	
									hsp=random_range(-0.3,-0.6)	
								}
							}		
						}
					}
				if(version==1){
					if(dur mod 3==0){
					created=instance_create_depth(x-8+random(16),y-3+random(12),0,Part)
					with(created){
						pin=1
						type=1
						depth=other.depth-1
						spin=1
						img=110
					
						imgcap=2
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
#endregion		
#region Burger Fries
	//____________________________________________________________________________---------------------(Burger Fries)---------------------____________________________________________________________________________
	if(pin==26){
		if(Control.talentmapArray[7,1]>0){	
				if(instance_exists(sndobjectone)){
					with(sndobjectone){
						audio_emitter_position(sndemitone,other.x,other.y,0)	
					}
				}
			if(hsp>0){
				if(hsp+gravtwo>0){
					hsp-=gravtwo
				}else{
					hsp=0
				}
			}
		
			if(hsp<0){
				if(hsp+gravtwo<0){
					hsp+=gravtwo
				}else{
					hsp=0
				}
			}
	

			vsp+=grav
			if(instance_place(x+hsp,y,Block)){
				if(hsp>0.4){
					hsp=hsp*-0.4
				}else{
					hsp=0
				}
			}
			if(instance_place(x,y+vsp,Block)){
				if(vsp>0.4){
					vsp=vsp*-0.4
				}else{
					vsp=0
				}
			}
			x+=hsp
			y+=vsp
		if(phase==0){

			if(hsp==0&&vsp==0){
				imgsped=0
				image_index=img
			}else{
				imgsped=0.05
					if(abs(hsp)>1.5||abs(vsp)>1.5){
						for(i=0;i<1;i+=1){
								created=instance_create_depth(x-5+random(10),y-5+random(5),0,Part)
							with(created){
								type=1
								pin=1
								depth=other.depth+1
								spin=1
								img=98
					
								imgcap=4
								imgsped=0
								image_speed=0
								image_index=irandom_range(img,img+imgcap)
								dur=6+choose(0,0,0,1,1,2)+irandom(15)
								durtotal=dur
								hsp=0
								vsp=0.3
								image_angle-=15
								image_angle+=random(30)
							}		
						}
					}
			}
	
			if(dur==10){
				phase=1
			}
						abil_dmg_scr()
						if(hit!=noone){
							if(hit.team!=0){
	#region On hit enemy particles
							audio_play_sound_at(choose(snd_burger_fries_explosion_1,snd_burger_fries_explosion_2),x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
									chance=irandom(360)
									for(i=0;i<10;i+=1){
										created=instance_create_depth(x-2+random(4),y-1.5+random(3),0,Part)
										with(created){
										type=1
										pin=1
										depth=other.depth+1
										spin=1
										img=98
										imgcap=4
										imgsped=0
										image_speed=0
										image_index=irandom_range(img,img+imgcap)
										dur=20+choose(0,0,0,1,1,2)+irandom(20)
										direction=other.i*36+other.chance
										speed=random_range(0.01,0.2)
										image_angle=random(360)
										imgangle=image_angle
										durtotal=dur
										hsp=hspeed
										vsp=vspeed
										}		
									}	
									chance=irandom(360)
									for(i=0;i<10;i+=1){
										created=instance_create_depth(x-2+random(4),y-1.5+random(3),0,Part)
										with(created){
										type=1
										pin=1
										depth=other.depth+1
										spin=1
										img=103
										imgcap=3
										imgsped=0
										image_speed=0
										image_index=irandom_range(img,img+imgcap)
										dur=15+choose(0,0,0,1,1,2)+irandom(30)
										direction=other.i*36+other.chance
										speed=random_range(0.001,0.1)
										image_angle=random(360)
										imgangle=image_angle
										durtotal=dur
										hsp=hspeed
										vsp=vspeed
										}		
									}
									chance=irandom(360)
									for(i=0;i<10;i+=1){
										created=instance_create_depth(x-2+random(4),y-1.5+random(3),0,Part)
										with(created){
										type=1
										pin=1
										depth=other.depth+1
										spin=1
										img=103
										imgcap=3
										imgsped=0
										image_speed=0
										image_index=irandom_range(img,img+imgcap)
										dur=15+choose(0,0,0,1,1,2)+irandom(20)
										direction=other.i*36+other.chance
										speed=random_range(0.001,0.3)
										image_angle=random(360)
										imgangle=image_angle
										durtotal=dur
										hsp=hspeed
										vsp=vspeed
										}		
									}
						for(i=0;i<6;i+=1){
						//Fry Damage
						created=instance_create_depth(x-5+random(10),y-1.5+random(3),0,Abil)
						with(created){
								diddmg=0
								version=0
								dmg=1
			
								dmg+=dmg*(Control.talentmapArray[8,1]*0.05)
								dmg+=dmg*(Control.talentmapArray[9,1]*0.25)
								dmg+=dmg*(Control.invenArray[25,3]*0.01)	

								type=0
								pin=28
								isfry=1
								en=0
								creator=other.id
								imgsped=0
								imgangle=random(360)
										
									temp=1
									move=0
									pintwo=3

									img=25
									if(other.version==1){
										img+=50
										dmg+=0.5
									}

								imgcap=1
								sprite_index=abil_burger_spr
								image_index=img
								depth=Me.depth+1
								image_speed=0
								dur=120+irandom(35)

								durtotal=dur
								grav=0.1
								gravtwo=0.05
							
								dir=other.dir

								bounce=50
								chance=-1
	
								timer=28+irandom(20)
								vsp=0
								hsp=0 
						
							thro=5
							tomtype=5
							image_index=img
							grav=random_range(0.07,0.12)
							sped=random_range(2.5,3)

								grav=0.1
								vsp=-1.5+random(0.5)
								hsp=random_range(-0.75,0.75)				

							timer=0
						}
					}
/*
									for(i=0;i<6;i+=1){
										created=instance_create_depth(x-5+random(10),y-1.5+random(3),0,Part)
										with(created){
											sprite_index=abil_burger_spr
											type=1
											pin=2
											depth=other.depth+1
											spin=1
											img=25
											if(other.version==1){
												img+=50
											}
											imgcap=4
											imgsped=0
											image_speed=0
											image_index=irandom_range(img,img+imgcap)
											dur=30+choose(0,0,0,1,1,2)+irandom(20)
											imgangle=random(360)
											image_angle=imgangle
											speed=random_range(0.001,0.3)
											durtotal=dur
											grav=0.1
											vsp=-1.5+random(0.5)
											hsp=random_range(-0.75,0.75)
										}		
									}
									*/
	#endregion
							
							/*
								with(hit){
										hurttick=1
										dmgrecieved+=other.dmg
										Me.damagedone+=dmgrecieved
										Control.target=id
								}
								*/
									phase=0					
									dur=0
							}
						}
		}else{
			if(phase==1){
				phase=2
				image_index=19
					if(version==1){
						//image_index+=56
					}
				img=image_index
				imgcap=0
				imgsped=0
				dur=75
				tick=0
				
					fries=instance_create_depth(x,y,0,Part)
					with(fries){
						depth=other.depth-1
						img=7
						version=0
						if(other.version==1){
							img=63
							version=1
						}
						sprite_index=other.sprite_index
						imgcap=20
						imgsped=0
						image_speed=0
						image_index=img
						dur=2
						durtotal=dur
					}		
			}else{
				if(phase==2){
					grav=0.05
					if(dur==0){
						instance_destroy()
					}
					if(instance_exists(fries)){
						with(fries){
							x=other.x
							y=other.y
						}
					}
					if(dur>20){
						if(instance_exists(fries)){
						fries.dur=2
						}
						if(dur mod 5==0){
							if(tick==0){
								tick=1
								img=19
								if(instance_exists(fries)){
									with(fries){
										image_index=img+6
									}
								}
					
							}else{
								if(instance_exists(fries)){
									with(fries){
										img+=1
										image_index=img
										if(version==0){
											if(img>12){
											
												instance_destroy()
											}								
										}else{
											if(img>68){
												instance_destroy()
											}
										}
									}
								}
					
								//Fry Rockets
								audio_play_sound_at(choose(snd_burger_fries_rocket_1,snd_burger_fries_rocket_2,snd_burger_fries_rocket_3),x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
								created=instance_create_depth(x-5+random(10),y,0,Abil)
								with(created){
									sprite_index=other.sprite_index
									depth=other.depth-1
									pin=27
									img=25
										version=0
										dmg=2.5
										if(other.version==1){
											version=1
											img+=50
											dmg=3.5
										}
								
										dmg+=dmg*(Control.invenArray[25,3]*0.01)
									imgcap=4
									image_index=irandom_range(img,img+imgcap)
									image_speed=0
									imgsped=0
										dur=70
										durtotal=dur
									hsp=0
									vsp=-4
									grav=0.1
									image_angle=90
									imgangle=90
									diddmg=0
								}
								tick=0
								img=20
								for(i=0;i<5;i+=1){
										created=instance_create_depth(x-5+random(10),y-5+random(5),0,Part)
									with(created){
										type=1
										pin=1
										depth=other.depth-1
										spin=1
										img=98
					
										imgcap=4
										imgsped=0
										image_speed=0
										image_index=irandom_range(img,img+imgcap)
										dur=10+choose(0,0,0,1,1,2)+irandom(30)
										durtotal=dur
										hsp=0
										vsp=random_range(-0.6,-1)
										image_angle-=15
										image_angle+=random(30)

									}		
								}
							}
							image_index=img
						}
					}
				}else{
	
				}	
			}
		}
	}else{
		
		//____________________________________________________________________________---------------------(Fries Two Melee)---------------------____________________________________________________________________________
		if(Control.talentmapArray[4,1]>0){	


			if(phase==0){
				
				if(global.con_p_q||global.conp_p_q){
					if(global.con_h_up||global.conp_h_up){
						Me.passiveArray[0,1]=1
					}else{
						if(global.con_h_down||global.conp_h_down){
							Me.passiveArray[0,1]=2
						}else{
							Me.passiveArray[0,1]=0
						}		
					}
					shootidtwo=irandom(5)+1
					audio_play_sound(choose(snd_burger_burger_sizzle_1,snd_burger_burger_sizzle_2),8,false)
				}

						if(Me.passivethree>0&&ketchupcheck==0){
							ketchupcheck=1
							img+=8
							image_index+=8
							version=1
							dmg=dmgtwo
							dmg+=dmg*(Control.invenArray[25,3]*0.01)
						}
				
				if(shootidtwo>1){
					shootidtwo-=1
				}
				if(shootidtwo==1){
					//Fire Trigger
						hsp=4
						dur=10
						chance=0
						with(Abil){
							if(pin==25){
								other.chance=1
							}
						}
						if(chance==1){
							dur=15
						}
						if(Control.talentmapArray[6,1]>0){	
							dur+=5
						}
						
						hsp=hsp*Me.dir
						vsp=0
						phase=1		
						
						if(Me.passiveArray[0,1]==1){
							vsp=-1
						}else{
							if(Me.passiveArray[0,1]==2){
								vsp=1
							}
						}
						if(Me.passivefourArray[100,0]!=0){
							if(Me.passivefourArray[100,0]!=Me){
								if(instance_exists(Me.passivefourArray[100,0])){
									if(Me.passivefourArray[100,0]!=0){
										speed=4.5
										chance=Me.passivefourArray[100,0]
										move_towards_point(chance.x-2+random(4),chance.y-2+random(4),speed)
										imgangle=direction
										hsp=hspeed
										vsp=vspeed
										speed=0
									}
								}
							}
						}
					
				}
				
				x=Me.x+xspot+xspottwo
				y=Me.y+yspot+yspottwo+yspotthree-yspotfour
				
				if(dur<50){
					yspotthree+=.2
				}
			
				chance=0.15
				chancetwo=6
				chancethree=0.5
			
				if(tick==0){
					if(xspottwo<chancetwo){
						xspottwo+=chance
					}else{
						tick=1
					}
				}else{
					if(tick==1){
						if(xspottwo>0-chancetwo){
							xspottwo-=chance
						}else{
							tick=0
						}
					}		
				}
			}else{
				
				
				//Shoot Phase
				x+=hsp
				y+=vsp
				y+=yspottwo*0.2
				imgangle+=spinamount

					abil_dmg_scr()
					if(hit!=noone){
						if(hit.team!=0){
							audio_play_sound_at(choose(snd_burger_fries_hit_1,snd_burger_fries_hit_2),x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
							with(hit){
									hurttick=1
									dmgrecieved+=other.dmg
									Me.damagedone+=dmgrecieved
									Control.target=id
							}			
								dur=0
								returns=0
						}
					}
					
					//Fries boomerang
					if(dur==0&&returns==1){
						audio_play_sound(choose(snd_burger_burger_sizzle_1,snd_burger_burger_sizzle_2),8,false)
						returns=0
						dur=38
										speed=2
										move_towards_point(Me.x-2+random(4),Me.y-2+random(4),speed)
										imgangle=direction
										hsp=hspeed
										vsp=vspeed
										speed=0						
					}
				if(dur==0||instance_place(x,y,Block)){
					
								chance=irandom(360)
								for(i=0;i<6;i+=1){
									created=instance_create_depth(x-2+random(4),y-1.5+random(3),0,Part)
									with(created){
									type=1
									pin=1
									depth=other.depth+1
									spin=1
									img=98
									imgcap=4
									imgsped=0
									image_speed=0
									image_index=irandom_range(img,img+imgcap)
									dur=6+choose(0,0,0,1,1,2)+irandom(20)
									direction=other.i*36+other.chance
									speed=random_range(0.05,0.1)
									speed=0.1
									image_angle=random(360)
									imgangle=image_angle
									durtotal=dur
									hsp=hspeed
									vsp=vspeed
									chance=random_range(0.7,1)
									xscale=chance
									yscale=chance
									}		
								}
								if(version==1){
									chance=irandom(360)
									for(i=0;i<2;i+=1){
										created=instance_create_depth(x-2+random(4),y-1.5+random(3),0,Part)
										with(created){
										type=1
										pin=1
										depth=other.depth+1
										spin=1
										img=110
										imgcap=3
										imgsped=0
										image_speed=0
										image_index=irandom_range(img,img+imgcap)
										dur=30+choose(0,0,0,1,1,2)+irandom(30)
										direction=other.i*72+other.chance
										speed=random_range(0.05,0.1)
										speed=0.1
										image_angle=random(360)
										imgangle=image_angle
										durtotal=dur
										hsp=hspeed
										vsp=vspeed
										chance=random_range(0.7,1)
										xscale=chance
										yscale=chance
										}		
									}
								}
								if(instance_place(x,y,Block)){
									audio_play_sound_at(choose(snd_burger_fries_hit_1,snd_burger_fries_hit_2),x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
								}
				instance_destroy()
				}
			}		

			chance=0.1
			chancetwo=1
			if(ticktwo==0){
				if(yspottwo<chancetwo){
					yspottwo+=chance
					imgangle+=spinamount
				}else{
					ticktwo=1
				}
			}else{
				if(ticktwo==1){
					if(yspottwo>0-chancetwo){
						yspottwo-=chance
						imgangle-=spinamount
					}else{
						ticktwo=0
					}
				}		
			}
		}
	}
	}else{
#endregion
#region Burger Fries
	//____________________________________________________________________________---------------------(Fry rockets)---------------------____________________________________________________________________________
	if(pin==27){
			target=Me.passivefourArray[100,0]

			if(phase==0){
				if(dur<=15||instance_place(x,y+vsp,Block)){
					dur=80
					phase=1
					move_towards_point(target.x-30+random(60),target.y-30+random(60),2.8)
					image_angle=direction
					imgangle=direction
					hsp=hspeed
					vsp=vspeed
					speed=0
					grav=0
				}
			}else{
						if(dur mod 8 == 0){
							for(i=0;i<1;i+=1){
									created=instance_create_depth(x-3+random(6),y-3+random(6),0,Part)
								with(created){
									type=1
									pin=1
									depth=other.depth-1
									spin=1
									img=101
					
									imgcap=1
									imgsped=0
									image_speed=0
									image_index=irandom_range(img,img+imgcap)
									dur=5+choose(0,0,0,1,1,2)+irandom(5)
									durtotal=dur
									hsp=other.hsp/3
									vsp=(other.vsp/3)+random_range(0.05,01)
									image_angle-=15
									image_angle+=random(30)
										chance=random_range(0.6,1)
										chance=1
										xscale=chance
										yscale=chance

								}		
							}	

					created=instance_create_depth(x-8+random(16),y-3+random(12),0,Part)
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
				if(dur<70&&instance_place(x,y,Block)){
					dur=0
				}
				if(instance_exists(target)){
					move_towards_point(target.x,target.y,0.5)
				}
			}
		
			if(vsp<4){
				vsp+=grav
			}
			x+=hsp
			y+=vsp
		
					abil_dmg_scr()
					if(hit!=noone){
						if(hit.team!=0){
							
								chance=irandom(360)
								for(i=0;i<10;i+=1){
									created=instance_create_depth(x-2+random(4),y-1.5+random(3),0,Part)
									with(created){
									type=1
									pin=1
									depth=other.depth+1
									spin=1
									img=98
									imgcap=4
									imgsped=0
									image_speed=0
									image_index=irandom_range(img,img+imgcap)
									dur=30+choose(0,0,0,1,1,2)+irandom(30)
									direction=other.i*36+other.chance
									speed=random_range(0.05,0.1)
									speed=0.1
									image_angle=random(360)
									imgangle=image_angle
									durtotal=dur
									hsp=hspeed
									vsp=vspeed
									chance=random_range(0.7,1)
									xscale=chance
									yscale=chance
									}		
								}	
								if(version==1){
								chance=irandom(360)
									for(i=0;i<5;i+=1){
										created=instance_create_depth(x-2+random(4),y-1.5+random(3),0,Part)
										with(created){
										type=1
										pin=1
										depth=other.depth+1
										spin=1
										img=110
										imgcap=3
										imgsped=0
										image_speed=0
										image_index=irandom_range(img,img+imgcap)
										dur=30+choose(0,0,0,1,1,2)+irandom(30)
										direction=other.i*72+other.chance
										speed=random_range(0.05,0.1)
										speed=0.1
										image_angle=random(360)
										imgangle=image_angle
										durtotal=dur
										hsp=hspeed
										vsp=vspeed
										chance=random_range(0.7,1)
										xscale=chance
										yscale=chance
										}		
									}	
								}
							with(hit){
									hurttick=1
									dmgrecieved+=other.dmg
									Me.damagedone+=dmgrecieved
									Control.target=id
							}
								phase=0					
								dur=0
						}
					}
		
			if(dur==0){
								chance=irandom(360)
								for(i=0;i<10;i+=1){
									created=instance_create_depth(x-2+random(4),y-1.5+random(3),0,Part)
									with(created){
									type=1
									pin=1
									depth=other.depth+1
									spin=1
									img=98
									imgcap=4
									imgsped=0
									image_speed=0
									image_index=irandom_range(img,img+imgcap)
									dur=6+choose(0,0,0,1,1,2)+irandom(20)
									direction=other.i*36+other.chance
									speed=random_range(0.05,0.1)
									speed=0.1
									image_angle=random(360)
									imgangle=image_angle
									durtotal=dur
									hsp=hspeed
									vsp=vspeed
									chance=random_range(0.7,1)
									xscale=chance
									yscale=chance
									}		
								}
								if(version==1){
									chance=irandom(360)
									for(i=0;i<5;i+=1){
										created=instance_create_depth(x-2+random(4),y-1.5+random(3),0,Part)
										with(created){
										type=1
										pin=1
										depth=other.depth+1
										spin=1
										img=110
										imgcap=3
										imgsped=0
										image_speed=0
										image_index=irandom_range(img,img+imgcap)
										dur=30+choose(0,0,0,1,1,2)+irandom(30)
										direction=other.i*72+other.chance
										speed=random_range(0.05,0.1)
										speed=0.1
										image_angle=random(360)
										imgangle=image_angle
										durtotal=dur
										hsp=hspeed
										vsp=vspeed
										chance=random_range(0.7,1)
										xscale=chance
										yscale=chance
										}		
									}
								}
								audio_play_sound_at(choose(snd_burger_fries_hit_1,snd_burger_fries_hit_2),x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
				instance_destroy()
			}
		
		
				
	}else{
#endregion
#region Burger Abil 3 Ketchup
			//____________________________________________________________________________---------------------(Burger Ketchup)---------------------____________________________________________________________________________
	if(pin==28){
		if(Control.talentmapArray[10,1]>0){	
			Me.passivethree=120
			dir=Me.dir
			if(dir==1){
				x=Me.x-3
			}else{
				x=Me.x+3
			}
			y=Me.y
		
		
						if(dur mod 7 ==0){
							if(dur mod 14 ==0){
								audio_play_sound_at(choose(snd_burger_ketchup_drip_1,snd_burger_ketchup_drip_2,snd_burger_ketchup_drip_3),x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
							}
							for(i=0;i<1;i+=1){
								
									created=instance_create_depth(x-3+random(6),y+5,0,Part)
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
									hsp=0
									vsp=random_range(0.08,0.12)
									grav=0.1
									image_angle-=15
									image_angle+=random(30)

								}		
							}	
						}
		}else{
			//Tomato Boom
			if(Control.talentmapArray[13,1]>0){	
				//Ketchup boom
				if(pintwo==0){
					if(dur<=50){
						if(dur mod 15==0){
							img+=1
							image_index+=1
						}
					}



					imgangle+=hsp*10
				
					if(vsp<4){
						vsp+=grav
					}

					if(hsp<0){
						if(hsp<=-gravtwo){
							hsp+=gravtwo
						}else{
							hsp=0
						}
					}else{
						if(hsp>0){
							if(hsp>=gravtwo){
								hsp-=gravtwo
							}else{
								hsp=0
							}
						}				
					}

					if(diddmg==0){
						hit=instance_place(x,y,Enemy)
						if(hit!=noone||global.con_p_w||global.conp_p_w){
								dur=10
								diddmg=2
						}
					}

					if(instance_place(x+hsp,y,Block)){
						hsp=hsp*-0.6
					}
					if(instance_place(x,y+vsp,Block)){
						vsp=vsp*-0.6
					}
				

					x+=hsp
					y+=vsp
				
				
					if((dur<=10 && diddmg==0)||(dur<=10 && diddmg==2)){
								audio_play_sound_at(choose(snd_pumpkin_pump_1,snd_pumpkin_pump_2),x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
								//audio_play_sound_at(choose(snd_pumpkin_pump_cry_1,snd_pumpkin_pump_cry_2),x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)						
						
						diddmg=1
						img=12
						image_index=img
						hsp=0
						vsp=0
						grav=0
						gravtwo=0

								//Ketchup Particle
								for(i=0;i<5;i+=1){
								
									created=instance_create_depth(x-3+random(6),y-5,0,Part)
									with(created){
										type=2
										pintwo=1
										pin=1
										phase=100
										depth=other.depth-1
										spin=1
										img=18
										sprite_index=abil_burger_two_spr
					
										imgcap=5
										imgsped=0
										image_speed=0
										image_index=irandom_range(img,img+imgcap)
										dur=50+choose(0,0,0,1,1,2)+irandom(15)
										durtotal=dur
										hsp=random_range(-0.6,0.6)
										vsp=random_range(0.5,-2)
										grav=0.1
										image_angle-=15
										image_angle+=random(30)

									}		
								}
								//Large Ketchup
								for(i=0;i<5;i+=1){
								
									created=instance_create_depth(x-3+random(6),y-5,0,Part)
									with(created){
										type=2
										pintwo=1
										pin=1
										phase=100
										depth=other.depth-1
										spin=1
										img=14
										sprite_index=abil_burger_two_spr
					
										imgcap=3
										imgsped=0
										image_speed=0
										image_index=irandom_range(img,img+imgcap)
										dur=50+choose(0,0,0,1,1,2)+irandom(15)
										durtotal=dur
										hsp=random_range(-0.6,0.6)
										vsp=random_range(0.5,-2)
										grav=0.1
										image_angle-=15
										image_angle+=random(30)

									}		
								}

								//Shell
								for(i=0;i<4;i+=1){
									created=instance_create_depth(x,y,0,Part)
									with(created){
									type=2
									pin=1
									pintwo=1
									depth=other.depth+1
									spin=1
									img=45

									imgcap=3
									imgsped=0
									sprite_index=abil_burger_two_spr
									image_speed=0
									image_index=img+other.i
									image_angle=other.imgangle
									dur=70+irandom(70)
									direction=other.i*90+other.imgangle+45
									speed=1.2
									durtotal=dur
									hsp=hspeed
									vsp=vspeed
									//hsp+=other.hsp
									//vsp+=other.vsp
									grav=0.07
									gravtwo=0.03
									chance=1
									xscale=chance
									yscale=chance
									phase=1
									speed=0
									}		
								}

								//Explosion AOE
								created=instance_create_depth(x,y+5,0,Abil)
								with(created){
										diddmg=0
										dmg=4
					
										dmg+=dmg*(Control.invenArray[25,3]*0.01)
										Me.passive=1
									type=0
									pin=28
									isfry=0
									dmg=other.dmg
									en=0
									creator=other.id
									imgsped=0.3
									imgangle=0
										img=0
										temp=1
										move=0
		
									imgcap=12
									sprite_index=abil_burger_ketchup_exp_spr
									image_index=0
									depth=Me.depth+1
									image_speed=0
									dur=100
									durtotal=dur
									pintwo=1
									grav=0.1
									gravtwo=0.05
									dir=other.dir
									
									hurtArray[0]=0
									hurtnum=0
					
									chance=-1
									if(other.temp==0){
										hsp=2
										vsp=chance-0.2
									}else{
										if(other.temp==1){
											hsp=0.8
											vsp=chance-1.5
										}else{
											if(other.temp==2){
												hsp=2
												vsp=chance+1
											}
										}			
									}
								
									hsp=hsp*dir
								
								}
								
							for(i=0;i<3;i+=1){ 
								//Tomato create
								created=instance_create_depth(x-10+i*10,y,0,Abil)
								with(created){

										diddmg=0
										dmg=2
					
										dmg+=dmg*(Control.invenArray[25,3]*0.01)

									type=0
									pin=28
									isfry=0
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

									if(Control.talentmapArray[15,1]>0){	
										bounce=3
										dur+=70
									}else{
										bounce=0
									}
									bounce=50

									if(Control.talentmapArray[23,1]>0){
										dur+=dur*(Control.talentmapArray[23,1]*0.2)
									}
									chance=-1
	
									timer=28+irandom(20)+other.i*5
									vsp=0
									hsp=0 
									tomtype=0

									image_index=53
									chance=10
									while(!instance_place(x,y-6,Block)){
										chance-=1
										y-=6
										if(chance-1==0){
											break
										}
									}
									if(!instance_place(x,y-10,Block)){
										y-=random(10)
									}
									image_index=img
								}	
						}
						//Last talent Extras
						if(Control.talentmapArray[15,1]>0){
							for(i=0;i<3;i+=1){ 
								//Tomato create
								created=instance_create_depth(x-5+i*10,y,0,Abil)
								with(created){

										diddmg=0
										dmg=2
					
										dmg+=dmg*(Control.invenArray[25,3]*0.01)

									type=0
									pin=28
									isfry=0
									en=0
									creator=other.id
									imgsped=0
									imgangle=0
										img=choose(50,50,60)
										temp=1
										move=0
										pintwo=2
									dur=80+irandom(25)
									durtotal=dur
									
									if(Control.talentmapArray[15,1]>0){	
										bounce=3
										dur+=70
									}else{
										bounce=0
									}
									bounce=50
									
									if(Control.talentmapArray[23,1]>0){
										dur+=dur*(Control.talentmapArray[23,1]*0.2)
									}
									imgcap=1
									sprite_index=abil_burger_two_spr
									image_index=img
									depth=Me.depth+1
									image_speed=0

									grav=0.1
									gravtwo=0.05
									dir=other.dir
					
									chance=-1
	
									timer=32+irandom(20)+other.i*5
									vsp=0
									hsp=0 
									
									tomtype=0
									
									image_index=53
									chance=12
									while(!instance_place(x,y-6,Block)){
										chance-=1
										y-=6
										if(chance-1==0){
											break
										}
									}
									if(other.i<2){
										if(!instance_place(x,y-10,Block)){
											y-=random(10)
										}
									}else{
										x-=10
										if(!instance_place(x,y+10,Block)){
											y+=random(10)
										}									
									}
									image_index=img
								}	
						}		
												
						}
					}else{
					
						if(dur==0){
							instance_destroy()
						}
					}
				
				}else{

				}
			}

					//Ketchup Explosion
					if(pintwo==1){

							with(Enemy){
								hit=instance_place(x,y,other)	
								if(hit!=noone){
										if(team!=0){
										chance=0
										for(i=0;i<other.hurtnum;i+=1){
											if(other.hurtArray[i]==id){
											chance=1
											}
										}
										if(chance==0){
										hurttick=1
										dmgrecieved+=other.dmg
										Me.damagedone+=dmgrecieved
										Control.target=id
										other.hurtArray[other.hurtnum]=id
										other.hurtnum+=1
										}
									}
								}
							}	

						if(dur==0||image_index>=10){
							instance_destroy()
						}
					}else{
						
					
						//Tomato Tomato
						if(pintwo==2){
							timer-=1
							if(timer>0){
								if(timer<28){
									if(timer mod 7==0){
										img+=1
										image_index+=1
									}
								}
								
								if(timer==1){
									imgcap=5
									imgsped=0.15
									
									grav=random_range(0.07,0.12)
									sped=random_range(2.5,3)
									
								}
							}else{
								imgsped=abs(vsp*0.1)
								//imgangle=hsp*15
								imgangle+=hsp*3
								
								if(tomtype<=0){
									hit=instance_place(x,y,Enemy)
									if(hit!=noone){
										if(hit.team!=0){
											dur=0
										}
									}
								}else{
									tomtype-=1
								}
								if(vsp<sped){
									vsp+=grav
								}
								if(hsp<0){
									if(hsp+gravtwo<=0){
										hsp+=gravtwo
									}else{
										hsp=0
									}
								}else{
									if(hsp-gravtwo>=0){
										hsp-=gravtwo
									}else{
										hsp=0
									}								
								}
								
								
								if(instance_place(x+hsp,y,Block)){
									hsp=hsp*-0.85
								}
								
								if(instance_place(x,y+vsp-0.5,Block)){
									if(bounce==0){
										dur=0
									}else{
										bounce-=1
										vsp=vsp*-0.85
										//y-=1
									}
								}
								
								y+=vsp
								x+=hsp
							}
							if(dur==0){
								
								audio_play_sound_at(choose(snd_pumpkin_small_blast_1,snd_pumpkin_small_blast_2,snd_pumpkin_small_blast_3),x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
									//Explosion AOE
									created=instance_create_depth(x,y,0,Abil)
									with(created){
											diddmg=0
											dmg=2
					
											dmg+=dmg*(Control.invenArray[25,3]*0.01)
											Me.passive=1
										type=0
										pin=28
										isfry=0
										dmg=other.dmg
										en=0
										creator=other.id
										imgsped=0.3
										imgangle=0
											img=0
											temp=1
											move=0
		
										imgcap=12
										sprite_index=abil_burger_ketchup_exptwo_spr
										image_index=0
										depth=Me.depth+1
										image_speed=0
										dur=100
										durtotal=dur
										pintwo=1
										grav=0.1
										gravtwo=0.05
										dir=other.dir
									
										hurtArray[0]=0
										hurtnum=0
					
										chance=-1
										if(other.temp==0){
											hsp=2
											vsp=chance-0.2
										}else{
											if(other.temp==1){
												hsp=0.8
												vsp=chance-1.5
											}else{
												if(other.temp==2){
													hsp=2
													vsp=chance+1
												}
											}			
										}
								
										hsp=hsp*dir
								
									}								
								instance_destroy()
							}
						}else{
							
						//Burger Proj Slam
						if(pintwo==3){
								
								if((sprite_index==abil_burger_two_spr&&img==70)||(sprite_index==abil_burger_two_spr&&img==73)){
									if(image_index<img+imgcap){
										image_index+=0.1
									}
								}
								
								if(thro>0){
									if(!instance_place(x,y,Me)){
										thro-=1
									}
								}

								//imgangle=hsp*15
								//imgangle+=hsp*3
								
								if(tomtype<=0){
									hit=instance_place(x,y,Enemy)
									if(hit!=noone){
										if(hit.team!=0){
											dur=0
										}
									}
								}else{
									tomtype-=1
								}
								if(vsp<sped){
									vsp+=grav
								}
								if(hsp<0){
									if(hsp+gravtwo<=0){
										hsp+=gravtwo
									}else{
										hsp=0
									}
								}else{
									if(hsp-gravtwo>=0){
										hsp-=gravtwo
									}else{
										hsp=0
									}								
								}
								
								
								if(instance_place(x+hsp,y,Block)){
									hsp=hsp*-0.7
								}
								
								if(instance_place(x,y+vsp-0.5,Block)){
									if(abs(vsp>1)){
										if(bounce==0){
											dur=0
										}else{
										//	bounce-=1
											vsp=vsp*-0.6
											//y-=1
										}
									}else{
										vsp=0
									}
								}
								
								y+=vsp
								x+=hsp
								
							abil_dmg_scr()
							if(hit!=noone){
								if(hit.team!=0){
									with(hit){
											hurttick=1
											dmgrecieved+=other.dmg
											Me.damagedone+=dmgrecieved
											Control.target=id
									}
									phase=0					
									dur=0
								}
							}
								
							if(dur==0){
								chance=irandom(360)
								for(i=0;i<5;i+=1){
									created=instance_create_depth(x+4-2+random(4),y+3-1.5+random(3),0,Part)
									with(created){
									type=1
									pin=1
									depth=other.depth+1
									spin=1
										if(other.isfry==0){
											img=90		
											imgcap=7
										}else{
											img=98
											imgcap=4									
										}
										imgsped=0
										image_speed=0
										image_index=irandom_range(img,img+imgcap)
										dur=8+choose(0,0,0,1,1,2)+irandom(30)
										image_index=irandom_range(img,img+imgcap)
									dur=10+irandom(10)+irandom(30)
									direction=other.i*36*2+other.chance
									speed=random_range(0.05,0.1)
									speed=0.1
									durtotal=dur
									hsp=hspeed
									vsp=vspeed
									chance=random_range(0.7,1)
									xscale=chance
									yscale=chance
									}		
								}
								instance_destroy()
							}
						}else{
							
							//Burger Stand
							if(pintwo==4){
								
							}
						}						
						}
					}
			
		}
	}else{
#endregion
#region Ketchup GROUND
			//____________________________________________________________________________---------------------(Ketchup Ground)---------------------____________________________________________________________________________
	if(pin==29){
		visible=false
			if(phase==0){
				pinthree=1
				if(dur mod 20 ==0){
					if(image_index>img-7){
						image_index-=1
					}else{
						phase=1
						dur=300
					}
				}
			}else{
				if(phase==1){
					if(dur==1){
						dur=120000
						phase=2
					}
				}else{
					if(phase==2){
						if(dur mod 20 ==0){
							if(image_index<img){
								image_index+=1
							}else{
								block.type=0
								instance_destroy()
							}
						}
					}
				}
			}
							with(Enemy){
								hit=instance_place(x,y,other)	
								if(hit!=noone){
									if(team!=0){
										debuffArray[1,0]=150
									}
								}
							}	
		
	}else{
#endregion
#endregion
#region Crab
#region Crab Ability 1
			//____________________________________________________________________________---------------------(Crab Abil One Fish)---------------------____________________________________________________________________________
	if(pin==40){
				with(sndobjectone){
					audio_emitter_position(sndemitone,other.x,other.y,0)	
				}		
			if(!instance_place(x+hsp*1.2,y,Block)){
				x+=hsp
			}else{
				audio_play_sound_at(choose(snd_crab_fish_bounce_1,snd_crab_fish_bounce_2,snd_crab_fish_bounce_3),x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
				inside+=1
				hsp=hsp*-0.9
				if(dir==1){
					dir=-1
				}else{
					dir=1
				}

			}
			if(!instance_place(x,y+vsp*1.2,Block)){
				y+=vsp
			}else{
				audio_play_sound_at(choose(snd_crab_fish_bounce_1,snd_crab_fish_bounce_2,snd_crab_fish_bounce_3),x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
				inside+=1
				vsp=vsp*-0.9
				if(vsp>0){
						for(i=0;i<50;i+=1){
							if(instance_place(x,y,Block)){
								y-=0.2
							}
						}
				}else{
					if(vsp<0){
						for(i=0;i<50;i+=1){
							if(instance_place(x,y,Block)){
								y+=0.2
							}
						}
					}
				}
			}
				if(vsp>0){
					if(dir==1){
						imgangle=340
					}else{
						imgangle=20
					}
				}else{
					if(vsp<0){
						if(dir==1){
							imgangle=20
						}else{
							imgangle=340
						}
					}
				}
			if(inside>=12){
				dur=0
				phase=0
			}
			
			chance=0.6
		if(tick==0){
			if(ticky>-1){
				ticky-=0.1
				if(!instance_place(x,y-chance,Block)){
					y-=chance
				}
			}else{
				tick=1
			}
		}else{
			if(ticky<1){
				ticky+=0.1
				if(!instance_place(x,y+chance,Block)){
					y+=chance
				}
			}else{
				tick=0
			}		
		}
	if(img!=55){
		if(dur mod 3==0){
						for(i=0;i<1;i+=1){
							created=instance_create_depth(x-2+random(4),y-4+random(8),0,Part)
							with(created){
								type=1
								pin=1
								sprite_index=abil_crab_spr
								depth=other.depth+1
								spin=1
								if(irandom(2)==0){
									img=32+choose(0,0,1)
									vsp=-random_range(0.03,0.09)
								}else{
									img=29+irandom(2)
									vsp=random_range(0.09,0.15)
								}
								imgcap=2
								imgsped=0
								image_speed=0
								image_index=img
								dur=15+choose(0,0,0,1,1,2)+irandom(6)
								durtotal=dur
								hsp=0
										chance=random_range(0.7,1)
										xscale=chance
										yscale=chance
							}		
						}
		}
	}
			
					if(phase==1){
						if(dur<=0){
						phase=0 
						dur=10
						visible=false
						hsp=0
						vsp=0
						phasecheck=1
						}
					abil_dmg_scr()
						if(hit!=noone){
							if(hit.team!=0){
								with(hit){
										hurttick=1
										dmgrecieved+=other.dmg
										Me.damagedone+=dmgrecieved
										Control.target=id
								}
								phase=0					
								dur=3
									if(irandom(3)<10&&img<55){
										created=instance_create_depth(x,y,0,Part)
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
											hsp=other.hsp*-0.3
											vsp=-2.5
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
							}
						}
					}else{
						if(phase==0){
							if(dur<3){
								if(img!=55){
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
													vsp=-random_range(0.03,0.09)
												}else{
													img=29+irandom(2)
													vsp=random_range(0.09,0.15)
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
											hsp=0-0.25+other.i*0.05
										}		
									}	
								}else{
									for(i=0;i<4;i+=1){
										created=instance_create_depth(x-2+random(4),y-1.5+random(3),0,Part)
										with(created){
											type=1
											pin=1
											sprite_index=abil_crab_spr
											depth=other.depth+1
											spin=1
												if(irandom(2)==0){
													img=32+choose(0,0,1)
													vsp=-random_range(0.03,0.09)
												}else{
													img=29+irandom(2)
													vsp=random_range(0.09,0.15)
												}
											imgcap=1
											imgsped=0
											image_speed=0
											image_index=img
											dur=10+choose(0,0,0,1,1,2)+irandom(10)
											durtotal=dur
											chance=random_range(0.7,1)
											xscale=chance
											yscale=chance
											hsp=0-0.25+other.i*0.1
										}		
									}								
								}
							}
						}
					}	
					hit=instance_place(x,y,Abil)
					if(hit!=noone){
						with(hit){
							if(pin==44){
								//phase=0
								//dur=3
								if(abs(other.hsp)<0.2){
									if(x<other.x){
										hsp=-0.2
									}else{
										hsp=0.2
									}
								}else{
									hsp=clamp(other.hsp,-0.7,0.7)
								}
								if(abs(other.vsp)<0.2){
									if(y<other.y){
										vsp=-0.2
									}else{
										vsp=0.2
									}
								}else{
									vsp=clamp(other.vsp,-0.7,0.7)
								}
							}
						}
					}
	}else{
#endregion
#region Crab Ability 2 Jellyfish
			//____________________________________________________________________________---------------------(Crab Abil Two Jelly Fish)---------------------____________________________________________________________________________
	if(pin==41){
#region Attack
						with(sndobjectone){
							audio_emitter_position(sndemitone,other.x,other.y,0)
						}	
					hit=instance_place(x,y,Abil)
					if(hit!=noone){
						with(hit){
							if(pin==44){
								//phase=0
								//dur=3
								if(abs(other.hsp)<0.2){
									if(x<other.x){
										hsp=-0.2
									}else{
										hsp=0.2
									}
								}else{
									hsp=clamp(other.hsp,-0.7,0.7)
								}
								if(abs(other.vsp)<0.2){
									if(y<other.y){
										vsp=-0.2
									}else{
										vsp=0.2
									}
								}else{
									vsp=clamp(other.vsp,-0.7,0.7)
								}
							}
						}
					}
if(global.con_h_w||global.conp_h_w){
	if(delay<=0){
		if(instance_place(x,y,Me)){
			Me.vsp=vsp-0.35
			Me.hsp=hsp+hsp*0.01
			Me.stun=2
			releasew=1
		}
	}else{
		delay-=1
	}
}else{
	if(releasew==1){
		releasew=0
		Me.vsp=-1.5
		Me.stun=0
	}
}
	if(attcd==0){
		chance=0
		hit=instance_place(x,y,Enemy)
		if(hit!=noone){
			audio_play_sound_at(choose(snd_crab_squid_shock_1,snd_crab_squid_shock_2),x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
			attcd=attcdtotal
			chance=1
		}
		if(chance==1){
			chance=0
			img=imgsave+9
			image_index+=9
			attcd=attcdtotal
		}
	}
	if(attcd>0){
		attcd-=1
		if(attcd>=3){
			chance=0
				with(Enemy){
					if(team!=0){
	
						if(instance_place(x,y,other)){
							chance=1
							if(other.dmgArray[0]!=0){
								for(i=0;i<other.dmgArray[0];i+=1){
									if(other.dmgArray[i+1]==id){
										chance=0
									}
								}
							}
							if(chance==1){
								hurttick=1
								dmgrecieved+=other.dmg
								other.dmgtotal+=other.dmg
								Me.damagedone+=dmgrecieved
								other.dmgArray[0]+=1
								other.dmgArray[other.dmgArray[0]]=id
								other.chance=1
													created=instance_create_depth(x,y,0,Part)
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
														hsp=0
														hsp-=0.1+random(0.2)
														vsp=-1.8
														if(other.i==1){
															vsp-=0.4
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
															while(instance_place(x,y,other)){
																y-=1
															}
													}	
								
							}
						}
						
					}
				}
				
				if(chance==1){
					if(Control.talentmapArray[12,1]>0){
												//Lightning
													created=instance_create_depth(x,y,0,Abil)
													with(created){
														pin=49
														phase=2
														type=0
														tick=0
														ticktwo=0
														spin=0
														sprite_index=abil_crab_sting_spr
														depth=other.depth+1
														num=other.num
														imgcap=5
														
														img=num*6+1
														
														imgsped=0.2
														image_speed=0
														image_index=img
														dur=1000
														durtotal=dur
														
														dmg=0.25+num*0.25
														dmg+=dmg*(Control.invenArray[25,3]*0.01)	
														imgangle=random(360)
														creator=other.id

													}		
					}
				}
		}else{
			if(attcd==0){
				img=imgsave
				image_index-=9
				dmgArray[0]=0
			}
		}
	}
#endregion
#region Swim
		if(image_index>=img+2){

			hsp=hsptwo
			vsp=vsptwo

					for(i=0;i<1;i+=1){
						
						created=instance_create_depth(x-4-num*1+random(8+num*1),y-4-num*1+random(8+num*1),0,Part)
						with(created){
							type=1
							pin=1
							sprite_index=abil_crab_spr
							depth=other.depth+1
							spin=1
							if(irandom(2)==0){
								img=32+choose(0,0,1)
								vsp=-random_range(0.03,0.09)
							}else{
								img=29+irandom(2)
								vsp=random_range(0.09,0.15)
							}
							imgcap=2
							imgsped=0
							image_speed=0
							image_index=img
							dur=20+choose(0,0,0,1,1,2)+irandom(6)
							durtotal=dur
							hsp=0
									chance=random_range(0.7,1)
									xscale=chance
									yscale=chance
									hsp=other.hsp*-0.1
									vsp=other.vsp*-0.1
						}		
					}
		}
		if(hsp!=0){
			if(hsp<0){
				if(hsp-grav<=0){
					hsp+=grav
				}else{
					hsp=0
				}
			}else{
				if(hsp+grav>=0){
					hsp-=grav
				}else{
					hsp=0
				}		
			}
		}
		if(vsp!=0){
			if(vsp<0){
				if(vsp-gravtwo<=0){
					vsp+=gravtwo
				}else{
					vsp=0
				}
			}else{
				if(vsp+gravtwo>=0){
					vsp-=gravtwo
				}else{
					vsp=0
				}		
			}
		}
		x+=hsp
		y+=vsp
#endregion
if(Me.passive<2||Me.passivefour<11){
	if(Control.talentmapArray[19,1]>0||Me.passive<2||Me.passive==2&&Me.passivefour<9){
		hit=instance_place(x,y,Part)
		if(hit!=noone){
			if(hit.pin==2){
				chance=choose(snd_crab_fish_pickup_1,snd_crab_fish_pickup_2,snd_crab_fish_pickup_3)
				audio_play_sound_at(chance,x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
				audio_play_sound(chance, 8, false)
				with(hit){
					instance_destroy()
				}
				with(Me){
					passivefourArray[0,0]+=1
					passivefourArray[passivefourArray[0,0],0]=30
					passivefourArray[passivefourArray[0,0],1]=1
				}
			}
		}
}}
	if(dur mod 6==0){
					for(i=0;i<1;i+=1){
						
						created=instance_create_depth(x-4-num*1+random(8+num*1),y-4-num*1+random(8+num*1),0,Part)
						with(created){
							type=1
							pin=1
							sprite_index=abil_crab_spr
							depth=other.depth+1
							spin=1
							if(irandom(2)==0){
								img=32+choose(0,0,1)
								vsp=-random_range(0.03,0.09)
							}else{
								img=29+irandom(2)
								vsp=random_range(0.09,0.15)
							}
							imgcap=2
							imgsped=0
							image_speed=0
							image_index=img
							dur=20+choose(0,0,0,1,1,2)+irandom(6)
							durtotal=dur
							hsp=0
									chance=random_range(0.7,1)
									xscale=chance
									yscale=chance
									hsp=other.hsp*-0.1
									vsp=other.vsp*-0.1
						}		
					}
	}
		if(phase==1){
			if(dmgtotal>=15){
				phase=0
				dur=3
			}
			if(instance_place(x+hsp,y,Block)){
				hsp=hsp*-0.8
				hsptwo=hsptwo*-1
			}
			if(instance_place(x+hsp,y+vsp,Block)){
				vsp=vsp*-0.8
				vsptwo=vsptwo*-1
			}	
			if(dur<=0){
				phase=0
				dur=3
			}

		}else{
						if(phase==0){
							if(dur<3){
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
												vsp=-random_range(0.03,0.09)
											}else{
												img=29+irandom(2)
												vsp=random_range(0.09,0.15)
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
										hsp=0-0.25+other.i*0.05
									}		
								}	
							}else{
								if(dur==0){
									instance_destroy()
								}
							}
						}
		}
		if(abs(hsp)>0.1||abs(vsp)>0.1){
		hspeed=hsp
		vspeed=vsp
		imgangle=direction-90
		}
		speed=0
	}else{
#endregion
#region Crab Ability 3
			//____________________________________________________________________________---------------------(Crab Abil Three)---------------------____________________________________________________________________________
	if(pin==42){
				
	}else{
#endregion
#region Crab Ability 4
	if(pin==43){
			//____________________________________________________________________________---------------------(Crab Passive)---------------------____________________________________________________________________________

#region Carry
		if(phase==0){
			dir=Me.dir
			if(dir==1){
				x=Me.x-5
			}else{
				x=Me.x+5
			}
			y=Me.y	
			if(Me.abilArray[1,1]==0){
				img=1+(Me.passive*3)
				imgsped=0.05
			}else{
				img=74+(Me.passive*3)
				imgsped=0.02
				if(image_index<74){
					image_index=img
				}
			}
		}else{
#endregion
#region Throw
			if(phase==1){
				if(Me.passive<2||Me.passivefour<11){
					sndobjectone=instance_create_depth(x,y,0,Snd)
					with(sndobjectone){
						sndemitone=audio_emitter_create()				
						audio_play_sound_on(sndemitone,choose(snd_crab_crab_1,snd_crab_crab_2,snd_crab_crab_3),false,8)
						audio_emitter_falloff(sndemitone, 48, Control.falloff_max, Control.falloff_factor)					
					}	
					ticktwo=30
					grounded=0
						hsp=2*Me.dir
						hsptwo=hsp*-1
						//vsp=-2
						vsp=0
						vsptwo=vsp
						grav=0.06
						gravtwo=0.03
						grav=0
						gravtwo=0.03
						timer=30
						phase=2
						move=0
						img+=60
						image_index=img
						imgsped=0.1
						diddmg=0
						dir=-1
						
						
							dmg=6
							dmg+=dmg*(Control.invenArray[25,3]*0.01)
						
							respawn=instance_create_depth(x,y,10,Abil)
							with(respawn){
								dmg=1
								dmg+=dmg*(Control.invenArray[25,3]*0.01)
								dur=900
								sprite_index=abil_crab_spr
								image_speed=0
								pin=45
								img=27
								image_index=img
								hsp=0
								if(other.phase==0){
									vsp=random_range(-0.2,-0.5)
								}else{
									vsp=random_range(-0.3,-0.6)
									hsp=random_range(-0.3,0.3)
								}
					
								imgsped=0
								phase=1
								dir=1
								imgangle=0
						
							}
					if(Me.grounded==1){
						if(global.conp_h_down||global.con_h_down){
							phase=4
					
							vsp=1
							with(respawn){
								instance_destroy()
							}
						}
					}
				}else{
#region Fish Barrel
				Me.passivefour-=11
					phase=0
					if(global.con_h_up||global.conp_h_up){
						temp=2
					}else{
						if(global.con_h_down||global.conp_h_down){
						temp=3
						}else{
						temp=1
						}		
					}

					created=instance_create_depth(Me.x,Me.y,0,Abil)
					//Fish Barrel
					with(created){
						sndobjectone=instance_create_depth(x,y,0,Snd)
						with(sndobjectone){
							sndemitone=audio_emitter_create()				
							audio_play_sound_on(sndemitone,choose(snd_enemy_spit_low_1,snd_enemy_spit_low_2),false,8)
							audio_emitter_falloff(sndemitone, 48, Control.falloff_max, Control.falloff_factor)					
						}
						type=1
						pin=47
						move=0
						tick=0
						ticky=0
						creator=other.id
						sprite_index=abil_crab_spr
						mask_index=abil_crab_mask_spr
						depth=other.depth-1
						spin=1
						num=choose(0,1,2)
						num=1
						num=Me.passive
							dmgtotal=0
							diddmg=0
							dmg=4+num
							dmg+=dmg*(Control.invenArray[25,3]*0.01)
						img=141
						imgcap=0
						imgsped=0
						image_speed=0
						image_index=img
						dur=100
						durtotal=dur
						phase=1
						if(other.temp==1){
							vsp=-2
							hsp=1.5
						}else{
							if(other.temp==2){
								vsp=-2.5
								hsp=1
							}else{
								if(other.temp==3){
									vsp=-1.5
									hsp=2
								}else{
						
								}						
							}						
						}
						hsp=hsp*Me.dir
						grav=0.1
						gravtwo=0.005
					}	
#endregion
				}
			}else{
				if(phase==2){
						if(instance_exists(sndobjectone)){
							with(sndobjectone){
								audio_emitter_position(sndemitone,other.x,other.y,0)	
							}
						}
						if(instance_exists(respawn)){
											for(i=0;i<1;i+=1){
						
												created=instance_create_depth(x-4+random(8),y-4+random(8),0,Part)
												with(created){
													type=1
													pin=1
													sprite_index=abil_crab_spr
													depth=other.depth+1
													spin=1
													if(irandom(2)==0){
														img=32+choose(0,0,1)
														vsp=-random_range(0.03,0.09)
													}else{
														img=29+irandom(2)
														vsp=random_range(0.09,0.15)
													}
													imgcap=2
													imgsped=0
													image_speed=0
													image_index=img
													dur=20+choose(0,0,0,1,1,2)+irandom(6)
													durtotal=dur
													hsp=0
															chance=random_range(0.7,1)
															xscale=chance
															yscale=chance
															hsp=other.hsp*-0.1
															vsp=other.vsp*-0.1
												}		
											}						
							with(respawn){
								x=other.x
								y=other.y
							}
						}
					if(ticktwo>0){
						ticktwo-=1
					}else{
						if(ticktwo==0){
							hsp=hsptwo
						}
						ticktwo-=1
						if(ticktwo==-30){
							
								
									grav=0.04
									vsp=1
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
																		vsp=-random_range(0.03,0.09)
																	}else{
																		img=29+irandom(2)
																		vsp=random_range(0.09,0.15)
																	}
																imgcap=1
																imgsped=0
																image_speed=0
																image_index=img
																dur=24+choose(0,0,0,1,1,2)+irandom(20)
																durtotal=dur
																chance=random_range(0.7,1)
																xscale=chance
																yscale=chance
																hsp=(0-0.25+other.i*0.05)*1.5
															}		
														}	
									with(respawn){
										instance_destroy()
									}

						}
					}
						if(ticktwo>-30){
								if(diddmg==0){
									hit=instance_place(x+hsp,y,Enemy)
									if(hit==noone){
										hit=instance_place(x,y+vsp,Enemy)
									}
									if(hit!=noone){
										if(hit.team!=0){
											audio_play_sound_at(choose(snd_burger_burger_hit_1,snd_burger_burger_hit_2),x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
												
												chance=0
												if(Control.talentmapArray[6,1]>0){
													chance=2
												}
												for(i=0;i<3+chance;i+=1){
									
													created=instance_create_depth(x,y,0,Part)
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
														hsp=0-0.6+other.i*0.6
														hsp-=0.1+random(0.2)
														vsp=-1.8
														if(other.i==1){
															vsp-=0.35
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
											hsp=hsp*-0.9
											diddmg=1
												grav=0.04
												vsp=1
												ticktwo=-30
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
																vsp=-random_range(0.03,0.09)
															}else{
																img=29+irandom(2)
																vsp=random_range(0.09,0.15)
															}
														imgcap=1
														imgsped=0
														image_speed=0
														image_index=img
														dur=24+choose(0,0,0,1,1,2)+irandom(20)
														durtotal=dur
														chance=random_range(0.7,1)
														xscale=chance
														yscale=chance
														hsp=(0-0.25+other.i*0.05)*1.5
													}		
												}	
												with(respawn){
													instance_destroy()
												}		
												
												with(hit){
													if(team!=0){
														hurttick=1
														dmgrecieved+=other.dmg
														Me.damagedone+=dmgrecieved
													}
												}
										}
									}
								}							
							}
						imgangle-=hsp*5
						hsp-=gravtwo*sign(hsp)
						vsp+=grav
						
					if(!instance_place(x+hsp,y,Block)){
						x+=hsp
					}else{
						hsp=hsp*-0.8
					}
					if(!instance_place(x,y+vsp,Block)){
						y+=vsp
					}else{
						vsp=vsp*-0.3
						imgangle=0
						imgsped=0.05
					}

					if(timer<=0){
						if(instance_place(x,y,Me)){
							audio_play_sound_at(choose(snd_crab_bubble_pop_1,snd_crab_bubble_pop_2,snd_crab_bubble_pop_3),x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
							phase=0
							img-=60
							image_index=img
							imgangle=0
							imgsped=0.05
							if(instance_exists(respawn)){
								with(respawn){
									with(Me){
										if(jumps<=0&&vsp>=-1&&y<other.y-6){
											if(con_h_space){
												vsp=-5.2
												other.dur=3
												other.phase=0
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
											}
										}
									}
									instance_destroy()
								}
							}
							if(grounded==0){
								Me.abilArray[1,1]-=Me.abilArray[1,2]*0.1
							}
						}
					}else{
						timer-=1
					}
					if(Me.abilArray[1,1]==0){
						audio_play_sound_at(choose(snd_crab_bubble_1,snd_crab_bubble_2,snd_crab_bubble_3),x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
						phase=3
						respawn=instance_create_depth(x,y,10,Abil)
						with(respawn){
							dmg=1
							dmg+=dmg*(Control.invenArray[25,3]*0.01)
							dur=900
							sprite_index=abil_crab_spr
							image_speed=0
							pin=45
							img=27
							image_index=img
							hsp=0
							if(other.phase==0){
								vsp=random_range(-0.2,-0.5)
							}else{
								vsp=random_range(-0.3,-0.6)
								hsp=random_range(-0.3,0.3)
							}
					
							imgsped=0
							phase=1
							dir=1
							imgangle=0
						
						}
					}
					if(abs(hsp)<0.03&&abs(vsp)<0.03){
						diddmg=1
						if(grounded==0&&instance_place(x,y+1,Block)){
							grounded=1
							hsp=0
							vsp=0
						}
					}
				}else{
					//Bubble Return
					if(phase==3){

						chance=0.5
						if(x<Me.x-2){
							x+=chance
						}else{
							if(x>Me.x+2){
								x-=chance
							}else{

							}					
						}
						if(y<Me.y-2){
							y+=chance
						}else{
							if(y>Me.y+2){
								y-=chance
							}else{

							}					
						}
						if(instance_place(x,y,Me)){
							with(respawn){
									with(Me){
										audio_play_sound_at(choose(snd_crab_bubble_pop_1,snd_crab_bubble_pop_2,snd_crab_bubble_pop_3),x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
										if(jumps<=0&&vsp>=-1&&y<other.y-6){
											if(con_h_space){
												vsp=-5.2
												other.dur=3
												other.phase=0
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
											}
										}
									}
								instance_destroy()
							}
							phase=0
							img-=60
							image_index=img
							imgangle=0
							imgsped=0.05
						}
						with(respawn){
							x=other.x
							y=other.y
							dur=2
						}
					}else{
	
					//Phase 4 SandCastle
					if(phase==4){

						
							if(Me.abilArray[1,1]==0){
								phase=3
								grav=0.04
								respawn=instance_create_depth(x,y,10,Abil)
								with(respawn){
									dmg=1
									dmg+=dmg*(Control.invenArray[25,3]*0.01)
									dur=900
									sprite_index=abil_crab_spr
									image_speed=0
									pin=45
									img=27
									image_index=img
									hsp=0
									if(other.phase==0){
										vsp=random_range(-0.2,-0.5)
									}else{
										vsp=random_range(-0.3,-0.6)
										hsp=random_range(-0.3,0.3)
									}
					
									imgsped=0
									phase=1
									dir=1
									imgangle=0
						
								}
							}
							if(grounded==0){
								if(instance_place(x,y+vsp,Block)){
									grounded=1
								}else{
									y+=vsp
								}
							}else{
								if(grounded>145&&grounded<200){
										while(!instance_place(x,y-1,Block)){
											y+=0.5
											grounded=200
										}	
								}
							}
						if(grounded==1){
							grounded=2
							vsp=-1.3
									for(i=0;i<10;i+=1){
										created=instance_create_depth(x-2+random(4),y-1.5+random(3),0,Part)
										with(created){
										type=1
										pin=1
										sprite_index=part_spr
										depth=other.depth+1
										spin=1
												img=119
												vsp=random_range(-0.1,-0.25)
										imgcap=2
										imgsped=0
										image_speed=0
										image_index=img+irandom(imgcap)
										dur=22+choose(0,0,0,1,1,2)+irandom(20)
										durtotal=dur
										chance=random_range(0.7,1)
										xscale=chance
										yscale=chance
										hsp=(0-0.25+other.i*0.05)*1.5
										}		
									}
							created=instance_create_depth(x,y-3.8,0,Abil)
							with(created){
									diddmg=0
									dmg=4
									dmg+=dmg*(Control.invenArray[25,3]*0.01)
								type=0
								pin=46
								en=0
								creator=other.id
								imgsped=0
									temp=1
									attcd=0
								img=84+Me.passive*6
								//img+=6
								imgcap=2
								sprite_index=abil_crab_spr
								image_index=img
								depth=Me.depth+1
								image_speed=0
								dur=1000
								durtotal=dur
								phase=0
								//while(!instance_place(x,y+1,Block)){
								//	y+=1
								//}
							}		
						}else{

							if(grounded>=2){
								grounded+=1
								if(grounded<160){
									grav=0.06
									vsp+=grav
									if(!instance_place(x,y+vsp,Block)){
										y+=vsp
									}								
								}
								if(grounded==45||grounded==95||grounded==145){
									vsp=-1.3
									for(i=0;i<10;i+=1){
										created=instance_create_depth(x-2+random(4),y-1.5+random(3),0,Part)
										with(created){
										type=1
										pin=1
										sprite_index=part_spr
										depth=other.depth+1
										spin=1
												img=119
												vsp=random_range(-0.1,-0.25)
										imgcap=2
										imgsped=0
										image_speed=0
										image_index=img+irandom(imgcap)
										dur=22+choose(0,0,0,1,1,2)+irandom(20)
										durtotal=dur
										chance=random_range(0.7,1)
										xscale=chance
										yscale=chance
										hsp=(0-0.25+other.i*0.05)*1.5
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

#endregion
			//Box
			with(box){
				dur=2
				dir=Me.dir
				if(dir==1){
					x=Me.x-5
				}else{
					x=Me.x+5
				}
				y=Me.y				
			}
			//Fishbarrel
			with(fishbarrel){
				if(Me.passive>=2&&Me.passivefour>=11){
					visible=true
				}else{
					visible=false
				}
				dur=2
				dir=Me.dir
				if(dir==1){
					x=Me.x-5
				}else{
					x=Me.x+5
				}
				y=Me.y+5				
			}
			if(attcd>0){
				attcd-=1
					created=instance_create_depth(x,y,2,Abil)
					with(created){
						dmg=1
						dmg+=dmg*(Control.invenArray[25,3]*0.01)
						dur=900
						sprite_index=abil_crab_spr
						image_speed=0
						pin=44
						img=17
						image_index=img
						hsp=0
						if(other.phase==0){
							vsp=random_range(-0.2,-0.5)
						}else{
							vsp=random_range(-0.3,-0.6)
							hsp=random_range(-0.3,0.3)
						}
					
						imgsped=0
						phase=1
						if(Me.dir==1){
							//x=Me.x-6
						}else{
							//x=Me.x+6
						}
					}
			}
	}else{
#endregion
#region Crab Ability 3
			//____________________________________________________________________________---------------------(Crab Bubbles)---------------------____________________________________________________________________________
	if(pin==44){
		if(phase>=0){
		
		chance=0.005
		if(hsp-chance>0){
			hsp-=chance
		}else{
			if(hsp+chance<0){
				hsp+=chance
			}else{
				hsp=0
			}	
		}
		if(vsp-chance>0){
			vsp-=chance
		}else{
			if(vsp+chance<0){
				vsp+=chance
			}else{
				vsp=0
			}	
		}
		x+=hsp
		y+=vsp
		if(img+0.03<23){
			img+=0.03
			image_index=img
		}else{
			img=23
			image_index=img	
		}
					
						if(img<=21){
							dmg=1
						}else{
							if(img==22){
								dmg=2
							}else{
								dmg=3
							}
						}
						dmg+=dmg*(Control.invenArray[25,3]*0.01)
			if(phase==1){
				if(instance_place(x,y,Block)){
					phase=0
					dur=3
				}
				if(instance_place(x,y,Me)){
					if(img>=21){
						with(Me){
							if(jumps<=0&&vsp>=-1){
								if(con_h_space){
									if(y>other.y-5){
										vsp=-5.2
										other.dur=3
										other.phase=0
									}
								}
							}
						}
					}
					if(phase!=0){
						if(abs(Me.remhsp)<0.1){
							if(x<Me.x){
								hsp=-0.1
							}else{
								hsp=0.1
							}
						}else{
							hsp=clamp(Me.remhsp,-0.4,0.4)
						}
						if(abs(Me.vsp)<0.15){
							if(y<Me.y){
								vsp=-0.1
							}else{
								vsp=0.1
							}
						}else{
							vsp=clamp(Me.vsp,-0.4,0.4)
						}
					}

				}
				if(dur==0){
					dur=1
					phase=0
					
				}
							abil_dmg_scr()
								if(hit!=noone){
									if(hit.team!=0){
										phase=0					
										dur=3
									}
								}
			}else{
						if(phase==0){
							if(dur<3){
								if(dur==0){
									with(Enemy){
										if(instance_place(x,y,other)){
											if(team!=0){
												hurttick=1
												dmgrecieved+=other.dmg
												Me.damagedone+=dmgrecieved
											}
										}
									}
								}
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
							}
						}
			}
		}else{
			
			//BubbleShield
			if(phase==-1){
								
			
							
								if(Me.dir==1){
									x=Me.x-6
								}else{
									x=Me.x+5
								}

								y=Me.y+5
								
								lastx=x
								lasty=y								
			}
		}

	}else{
#endregion
#region Crab Ability 4
			//____________________________________________________________________________---------------------(Crab Sand Castle)---------------------____________________________________________________________________________
	if(pin==46){
		if(phase==0){
			timer=150
			phase=1
		}else{
			if(phase==1){
				if(timer>0){
					timer-=1
					if(timer==100||timer==50){
						img+=1
						image_index=img	
					}else{
						if(timer==0){
							img+=1
							image_index=img	
							phase=2
							timer=200
							timertotal=timer
						}
					}
				}
			}else{
				if(phase==2){
					if(timer>0){
						timer-=1
						if(timer==20||timer==10){
							img+=1
							image_index=img		
						
						}else{
							if(timer mod 2 == 0&&timer<=10){
								img-=2
								image_index=img	
								timer=timertotal
								for(i=0;i<1;i+=1){
									created=instance_create_depth(x-5+random(10),y+-3.8+random(6),0,Abil)
									with(created){
											diddmg=0
											dmg=1
										type=0
										pin=32
										en=0
										creator=other.id
										imgsped=0
											temp=1
											attcd=0
										img=103
										img+=irandom(5)
										imgcap=0
										sprite_index=abil_crab_spr
										image_index=img
										depth=Me.depth+1
										image_speed=0
										dur=60
										durtotal=dur
										phase=0
									
										if(instance_exists(Enemy)){
											chance=instance_nearest(x,y,Enemy)
											enx=chance.x-2+random(4)
											eny=chance.y-2+random(4)
											if(!collision_line(x, y, chance.x, chance.y, Block, true, true)){
												move_towards_point(enx,eny,1.7)
											}else{
												hsp=random_range(-0.3,0.3)
												vsp=-1.7
												chance=-1
											}
										}else{
												hsp=random_range(-0.3,0.3)
												vsp=-1.7
												chance=-1									
										}

										if(chance!=-1){
										hsp=hspeed
										vsp=vspeed
										}
										speed=0
										spin=5
										grav=0.001
										move=1
											//0=TRUE/False,1=Target,2=X,3=Y,4=Img,5=ImgCap,6=Amount,7=Delay,8=DelayAmount,9=Dur,10=hsp,11=vsp,12=DurExtra,13=XscaleYscale,14=XscaleMaxYscaleMax,15=ImgSped
											part_gen_scr(1,0,6,6,119,2,1,0,0,12,0,0,5,0.6,1,0)
										//while(!instance_place(x,y+1,Block)){
										//	y+=1
										//}
									}	
								}
							}
						}
					}
					if(dur==0){
						phase=3
							img-=1
							image_index=img	
							timer=45
					}
				}else{
					if(phase==3){
						if(timer>0){
							timer-=1
							if(timer==30||timer==15){
								img-=1
								image_index=img	
							}else{
								if(timer==0){
									instance_destroy()
								}
							}
						}				
					}
				}
			}
		}

	}else{
#region Crab Fish Barrel
			//____________________________________________________________________________---------------------(Fish Barrel)---------------------____________________________________________________________________________
	if(pin==47){
		if(phase==0){
			
		}else{
			if(phase==1){
					if(global.con_p_q){
						dur=0
					}
					if(instance_exists(sndobjectone)){
						with(sndobjectone){
							audio_emitter_position(sndemitone,other.x,other.y,0)	
						}
					}
					if(diddmg==0){
						with(Enemy){
							if(instance_place(x,y,other)){
								other.diddmg=1
								other.dur=0
								if(team!=0){
									hurttick=1
									dmgrecieved+=other.dmg
									Me.damagedone+=dmgrecieved
								}
							}
						}
					}
				if(vsp<5){
					vsp+=grav
				}
				hsp+=gravtwo*(sign(hsp)*-1)
				if(!instance_place(x+hsp,y,Block)){
					x+=hsp
				}else{
					hsp=hsp*-0.8
				}
				if(!instance_place(x,y+vsp,Block)){
					y+=vsp
				}else{
					if(vsp>0.01){
						vsp=vsp*-0.8
					}
				}
				imgangle+=hsp*5
					if(dur mod 6==0){
						for(i=0;i<1;i+=1){						
							created=instance_create_depth(x-4-num*1+random(8+num*1),y-4-num*1+random(8+num*1),0,Part)
							with(created){
								type=1
								pin=1
								sprite_index=abil_crab_spr
								depth=other.depth+1
								spin=1
									img=53
									vsp=random_range(0.09,0.15)
								imgcap=2
								imgsped=0
								image_speed=0
								image_index=img
								imgangle=random(360)
								image_angle=imgangle
								dur=12+choose(0,0,0,1,1,2)+irandom(10)
								durtotal=dur
								hsp=0
								vsp=random_range(0.8,1.2)
							}		
						}
					}
					if(dur<=0){
									chance=irandom(360)
									for(i=0;i<12;i+=1){
										created=instance_create_depth(x-2+random(4),y-1.5+random(3),0,Part)
										with(created){
										type=1
										pin=1
										sprite_index=abil_crab_spr
										depth=other.depth+1
										spin=1
										img=53

										imgcap=1
										imgsped=0
										image_speed=0
										image_index=img
										dur=6+choose(0,0,0,1,1,2)+irandom(20)
										durtotal=dur
										speed=random_range(0.15,0.7)
										direction=other.chance+other.i*30
										hsp=hspeed
										vsp=vspeed
										speed=0
										imgangle=random(360)
										image_angle=imgangle
										}		
									}
					
					created=instance_create_depth(x,y+100,0,Abil)
					//Shark
					with(created){
						sndobjectone=instance_create_depth(x,y,0,Snd)
						with(sndobjectone){
							sndemitone=audio_emitter_create()				
							audio_play_sound_on(sndemitone,choose(snd_crab_shark_2,snd_crab_shark_3),false,8)
							audio_emitter_falloff(sndemitone, 48, Control.falloff_max, Control.falloff_factor)					
						}	
						type=1
						pin=48
						move=0
						tick=0
						ticky=0
						creator=other.id
						sprite_index=abil_crab_two_spr
						depth=15
						spin=1
							dmgtotal=0
							diddmg=0
							
							//Normal
							if(Control.talentmapArray[21,1]==0){
								img=3
								dmg=2
							}else{
							
								//Great White
								img=33
								dmg=3
							}
							
							dmg+=dmg*(Control.invenArray[25,3]*0.01)
							
						imgcap=5
						imgsped=0.1
						image_speed=0
						image_index=img
						dur=100
						durtotal=dur
						phase=1
						hsp=0
						vsp=-5
						grav=0.1
						gravtwo=0.005
						starty=other.y
						dmgArray[0]=0
					}	
					
						instance_destroy()
					}
				}
		}
#endregion
	}else{
#region Crab Shark
			//____________________________________________________________________________---------------------(Crab Shark)---------------------____________________________________________________________________________
	if(pin==48){
		
		vsp+=grav
					if(instance_exists(sndobjectone)){
						with(sndobjectone){
							audio_emitter_position(sndemitone,other.x,other.y,0)	
						}
					}
											for(i=0;i<1;i+=1){
												created=instance_create_depth(x-8+random(16),y-8+random(16),0,Part)
												with(created){
													type=1
													pin=1
													sprite_index=abil_crab_spr
													depth=other.depth+1
													spin=1
													if(irandom(2)==0){
														img=32+choose(0,0,1)
														vsp=-random_range(0.03,0.09)
													}else{
														img=29+irandom(2)
														vsp=random_range(0.09,0.15)
													}
													imgcap=2
													imgsped=0
													image_speed=0
													image_index=img
													dur=25+choose(0,0,0,1,1,2)+irandom(6)
													durtotal=dur
													hsp=0
															chance=random_range(0.7,1)
															xscale=chance
															yscale=chance
															hsp=other.hsp*-0.1
															vsp=other.vsp*-0.1
												}		
											}

				if(dur mod 6==0){
					with(Enemy){
						if(instance_place(x,y,other)){
							if(team!=0){
								chance=0
								for(i=0;i<other.dmgArray[0];i+=1){
									if(other.dmgArray[i]==id){
										chance=1
										i=other.dmgArray[0]
									}
								}
								if(chance==0){
								hurttick=1
								dmgrecieved+=other.dmg
								Me.damagedone+=dmgrecieved
								other.dmgArray[0]+=1
								other.dmgArray[other.dmgArray[0]]=id
								}
							}
						}
					}
				}
if(phase==1){

			if(y+vsp*4>=starty){
				y+=vsp
			}else{
				imgsave=img
				img=img+6
				image_index=img
				imgsped=0.1
				imgcap=10
				phase=2
				attcd=12
				vsp=vsp/2
									chance=irandom(360)
									for(i=0;i<12;i+=1){
										created=instance_create_depth(x-4+random(8),y-4+random(8),0,Part)
										with(created){
										type=1
										pin=1
										sprite_index=abil_crab_spr
										depth=other.depth+1
										spin=1
										img=53
										img=choose(28,31,32,33)

										imgcap=1
										imgsped=0
										image_speed=0
										image_index=img
										dur=32+choose(0,0,0,1,1,2)+irandom(3)
										durtotal=dur
										speed=random_range(0.05,0.6)
										direction=other.chance+other.i*30
										hsp=hspeed
										vsp=vspeed
										speed=0
										imgangle=random(360)
										image_angle=imgangle
										}		
									}
						audio_play_sound_at(snd_crab_shark_1,x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
						Control.screenshake=24
						
						
						//Sharkbite
						chance=instance_create_depth(x,y,0,Abil)
						with(chance){
							pin=49
							creator=other.id
							sprite_index=abil_crab_three_spr
							depth=other.depth-2
								dmgtotal=0
								diddmg=0
							//Normal
							if(Control.talentmapArray[21,1]==0){
								img=1
								dmg=16
								y-=5
								starty=0-5
								
							}else{
							
								//Great White
								img=9
								dmg=16
								y-=12
								starty=0-8
								
							}
							dmg+=dmg*(Control.invenArray[25,3]*0.01)
							dmg+=dmg*(Control.talentmapArray[20,1]*0.05)
							
							dmg+=dmg*(Control.talentmapArray[21,1]*0.25)

							imgcap=7
							imgsped=0.5
							image_speed=0
							image_index=img
							dur=1000
							durtotal=dur
							phase=1
							hsp=0
							vsp=0
							diddmg=0
						}
						
			}
		}else{
			if(phase==2){
				if(y+vsp>=starty){
					y+=vsp
				}else{
					y=starty					
				}	
				if(attcd mod 3==0){
					if(image_index<img+8){

					}else{
						phase=3
							//img=imgsave+14
						imgcap=5
						imgsped=0.01
						image_speed=0
						//image_index=img
						vsp=1
					}
				}
				
			}else{
				if(phase==3){
					vsp+=grav
					y+=vsp	
					if(y>starty+250){
						instance_destroy()
					}
				}
			}
			
			
		}
	}else{
#endregion
#region Crab Sharkbite
			//____________________________________________________________________________---------------------(Crab Sharkbite)---------------------____________________________________________________________________________
	if(pin==49){
		if(phase==1){
			if(diddmg==0){
				with(Enemy){
					if(instance_place(x,y,other)){
						if(team!=0){
							hurttick=1
							dmgrecieved+=other.dmg
							Me.damagedone+=dmgrecieved
							other.diddmg=1
						}
					}
				}			
			}		
			if(instance_exists(creator)){
				if(creator.y+starty<y){
					y=creator.y+starty
				}
			}
			
			if(image_index>img+imgcap-1){
				instance_destroy()
			}
		}else{
			
			
			
			//________________________________________________________________________Jellyfish Lightning________________________________________________________________________
			if(phase==2){
				if(instance_exists(creator)){
					x=creator.x
					y=creator.y
				}
				
				if(dur mod 15==0){
					with(Enemy){
						if(instance_place(x,y,other)){
							if(team!=0){
								hurttick=1
								dmgrecieved+=other.dmg
								Me.damagedone+=dmgrecieved
								other.diddmg=1
							}
						}
					}					
				}
				if(image_index>=img+imgcap-1){
					instance_destroy()
				}
			}
		
		}
			
	}else{
#endregion
#endregion

#region Super
#region Super Ability 1
			//____________________________________________________________________________---------------------(Super Abil One Punch)---------------------____________________________________________________________________________
	if(pin==50){
	
		chancethree=-3
		chancefour=2.25
		
		pushamount+=pushsped
	

			if(imgopt==0){
				if(opt==1){
						x=Me.x+18+2+xshift+pushamount
						y=Me.y+4+yshift
						
				}else{
					if(opt==-1){
						x=Me.x-18-2+xshift-pushamount
						y=Me.y+4+yshift	
					}else{
						if(opt==2){
							x=Me.x+(dir*3)+xshift
							y=Me.y+18+8+yshift+pushamount
							
						}else{
							if(opt==3){
								x=Me.x+(dir*3)+xshift
								y=Me.y-18-6+yshift-pushamount
								
							}else{
					
							}					
						}					
					}
				}
			}else{
				if(opt==1){
						x=startx+18+2+xshift+pushamount
						y=starty+4+yshift
						
				}else{
					if(opt==-1){
						x=startx-18-2+xshift-pushamount
						y=starty+4+yshift	
					}else{
						if(opt==2){
							x=startx+(dir*3)+xshift+Me.hsp
							y=starty+18+8+yshift+pushamount
							
						}else{
							if(opt==3){
								x=startx+(dir*3)+xshift+Me.hsp
								y=starty-18-6+yshift-pushamount
								
							}else{
					
							}					
						}					
					}
				}			
			}
				
				
				//punch waff
				hit=instance_place(x,y,Abil)
				if(hit!=noone){
					//Hit Waff
					if(hit.pin==51){
						chance=hit.sped*2
						if(opt==1){
							hit.hsp=chance
							hit.vsp=0					
						}else{
							if(opt==-1){
								hit.hsp=-chance
								hit.vsp=0					
							}else{
								if(opt==2){
									hit.hsp=0
									hit.vsp=chance
									Me.vsp=chancethree
								}else{
									if(opt==3){
										hit.hsp=0
										hit.vsp=-chance	
										Me.vsp=chancefour
									}else{
					
									}					
								}					
							}					
						}
					}else{
						//Hit Dough
						if(hit.pin==52){	
							if(hit.phase==1){
								chance=hit.sped*2
								hit.dur+=10
								if(opt==1){
									hit.hsp=chance
									hit.vsp=-1					
								}else{
									if(opt==-1){
										hit.hsp=-chance
										hit.vsp=-1				
									}else{
										if(opt==2){
											hit.hsp=0
											hit.vsp=chance
											
											Me.vsp=chancethree
										}else{
											if(opt==3){
												hit.hsp=0
												hit.vsp=-chance	
												Me.vsp=chancefour
											}else{
					
											}					
										}					
									}					
								}								
							}	
						}
					}
				}
				
				
					chancefour=0
					
					with(Enemy){
						if(team!=0){
							if(instance_place(x,y,other)){
									chancethree=0
										for(i=0;i<other.hurtnum;i+=1){
											if(other.hurtArray[i]==id){
											chancethree=1
											}
										}								
								if(chancethree==0){
										hurttick=1
										dmgrecieved+=other.dmg
										Me.damagedone+=dmgrecieved
										Control.target=id
												other.hurtArray[other.hurtnum]=id
												other.hurtnum+=1	
												other.chancefour=1
								}
							}
							
						}
					}
					
					
								
								if(chancefour==1){
									phase=0					
									diddmg=1

								if(Control.talentmapArray[19,1]>0){
										if(Me.passivefourArray[1,11]==0&&Me.passivefourArray[1,12]==0){
											Me.passivefourArray[1,12]=1
										}else{
											if(Me.passivefourArray[1,13]==0&&Me.passivefourArray[1,14]==0){
												Me.passivefourArray[1,14]=1
											}else{
												if(Me.passivefourArray[1,15]==0&&Me.passivefourArray[1,16]==0){
													Me.passivefourArray[1,16]=1
												}	
											}
										}
								}

								//Milk Particle
								for(i=0;i<5;i+=1){
									if(partdir==1){
										created=instance_create_depth(x-2+random(4)-3,y-2+random(4),0,Part)
									}else{
										created=instance_create_depth(x-2+random(4)+3,y-2+random(4),0,Part)
									}
										with(created){
													type=2
													pin=1
													pintwo=1
													depth=choose(other.depth+1,other.depth-1,other.depth+1)
													spin=1
													
														if(other.imgopt==1){
															img=334+irandom(3)
														}else{
															img=172+irandom(3)
														}
													imgcap=1
													imgsped=0
													image_speed=0
													image_index=img
													imgsped=0
													sprite_index=abil_super_two_spr
													image_speed=0
													image_index=img+other.i
													image_angle=other.imgangle
													dur=20+irandom(10)
													
													direction=random_range(60,120)
													speed=random_range(0.5,0.8)
													durtotal=dur
													hsp=hspeed
													vsp=vspeed
													//hsp+=other.hsp
													//vsp+=other.vsp
													grav=0.04
													gravtwo=0.015
													chance=1
													xscale=chance
													yscale=chance
												phase=1
												speed=0
									}	
								}
									if(opt==2){
										Me.vsp=chancethree
									}else{
										if(opt==3){
											Me.vsp=chancefour
										}
									}
								}
								
							


		if(dur<=0||image_index>=img+imgcap-1){


			instance_destroy()
		}
	
	}else{
#endregion

#region Super Ability 2 Waffle
			//____________________________________________________________________________---------------------(Super Abil Two Waffle)---------------------____________________________________________________________________________
	if(pin==51){
		
		//Waffle Charge
		if(Control.talentmapArray[10,1]>0){
		if(phase==0){
			
			count+=1
			chance=floor((durtotal-(durtotal/4))/3)
			opt=floor(count/chance)
			
			if(Control.talentmapArray[12,1]>=1){
				chance=3
			}else{
				chance=2
			}
			
			if(opt>chance){
				opt=chance
			}
			img=65+opt
			image_index=img
			
			
			x=Me.x
			y=Me.y+3
			
			if(Me.dir==1){
				x+=3
			}else{
				x-=3
			}
			
				chance=1
				chancetwo=0.03
				if(tick==0){
					if(tickamount>-chance&&!instance_place(x,y-chancetwo,Block)){
						Me.y-=chancetwo
						tickamount-=chancetwo

						if(tickamount<0.5){
							Me.img=53
						}else{
							Me.img=54
						}
						with(Me){
							anim=12
							imgcap=1
							image_index=img	
						}
					}else{
						tick=1
					}
				}else{
					if(tick==1){
						if(tickamount<chance&&!instance_place(x,y+chancetwo,Block)){
							Me.y+=chancetwo
							tickamount+=chancetwo
						
						if(tickamount<0.5){
							Me.img=52
						}else{
							Me.img=53
						}
						with(Me){
							imgcap=1
							image_index=img+1
						}
						}else{
							tick=0
						}
					}				
				}		

								if(dur mod 5 ==0){
									//Syrup Part
									created=instance_create_depth(x-3+random(6),y-3+random(6),0,Part)
									with(created){
										type=2
										pin=1
										pintwo=1
										depth=choose(other.depth-1,other.depth+1)
										spin=1
										img=177
										imgcap=3
										imgsped=0
										sprite_index=part_spr
										image_speed=0
										image_index=img+irandom(imgcap)
										image_angle=other.imgangle
										dur=15+irandom(10)
										durtotal=dur
										hsp=0
										vsp=-0.5
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

			with(Me){

				

					chance=other.img
					chancetwo=other.opt
					vsp=-grav
					//vsp=-grav+0.03
					hsp=0
					stun+=1

						if(abilArray[1,1]<globalcdtotal){
							abilArray[1,1]=globalcdtotal
							abilArray[1,4]=1
						}
						if(abilArray[0,1]<globalcdtotal){
							abilArray[0,1]=globalcdtotal
							abilArray[0,4]=1
						}

				if(global.con_r_w||global.conp_r_w||other.dur<=1){
					
					Me.vsp=-2
					
					if(global.con_h_up||global.conp_h_up){
						temp=2
					}else{
						if(global.con_h_down||global.conp_h_down){
							temp=3
						}else{
							temp=1
						}		
					}
					temp = temp *dir
					
					hsp=dir*-(other.opt*1)
					stun=5
					

							for(i=0;i<12;i+=1){
									//Syrup Part
									created=instance_create_depth(x-3+random(6),y-3+random(6),0,Part)
									with(created){
										type=2
										pin=1
										pintwo=1
										depth=choose(other.depth-1,other.depth+1)
										spin=1
										img=177
										imgcap=3
										imgsped=0
										sprite_index=part_spr
										image_speed=0
										image_index=img+irandom(imgcap)
										dur=30+irandom(15)
										durtotal=dur
										hsp=0
										vsp=-0.5
										//hsp+=other.hsp
										//vsp+=other.vsp
										grav=0
										gravtwo=0
										chance=1
										xscale=chance
										yscale=chance
										phase=1
										speed=random_range(0.05,0.4)
										
										if(other.dir==1){
											direction=random_range(158,202)	
										}else{
											direction=random_range(22,-22)	
										}
										hsp=hspeed
										vsp=vspeed
										speed=0
										
									}
							}


					created=instance_create_depth(x,y+2,0,Abil)
					with(created){

						sndobjectone=instance_create_depth(x,y,0,Snd)
						with(sndobjectone){
							sndemitone=audio_emitter_create()				
							audio_play_sound_on(sndemitone,choose(snd_toast_wafflefire_1,snd_toast_wafflefire_2),false,8)
							audio_emitter_falloff(sndemitone, 48, Control.falloff_max, Control.falloff_factor)					
						}

						opt=other.chancetwo
						type=1
						pin=51
						move=0
						diddmg=0
						dmg=6+(opt*3)
			
						chance=dmg
			
						dmg+=dmg*(Control.talentmapArray[12,1]*0.25)
			
						//dmg+=chance*(Control.talentmapArray[3,1]*0.25)
						dmg+=chance*(Control.invenArray[25,3]*0.01)
		
			
						creator=other.id
			
						depth=other.depth-1
						spin=1
						extra=0
							sprite_index=abil_super_two_spr
							img=other.chance+4
							imgcap=1
			
						image_speed=0
						image_index=img
						dur=120+(40*opt)
						durtotal=dur
						phase=1
						speed=0.6
						sped=speed
						if(other.temp==-1){
						direction=180
						}else{
							if(other.temp==2){
								direction=20
							}else{
								if(other.temp==-2){
								 direction=180-20
								}else{
									if(other.temp==3){
									 direction=0-20
									}else{
										if(other.temp==-3){
										 direction=180+20
										}							
									}					
								}
							}			
						}
						hsp=hspeed
						vsp=vspeed
				
						//hsp=hsp*Me.dir
						speed=0
						
						chance=0
						with(Me){
							if(instance_place(x,y+2,Block==1)){
								other.chance=1
							}else{
								if(instance_place(x,y-2,Block==1)){
									other.chance=2
								}else{
					
								}					
							}
						}
						if(chance==1){
							for(i=0;i<5;i+=1){
								if(instance_place(x,y,Block)){
									y-=4
								}else{
									break
								}				
							}
						}
							
							if(instance_place(x,y,Block)){
									y-=3
								for(i=0;i<5;i+=1){
									if(instance_place(x,y,Block)){
										y-=3
									}else{
										i=5
									}
								}
							}
					}	
					
					
					other.dur=0
				}
			}
			if(dur<=-100){
				instance_destroy()
			}
		}else{
			
			//Waffle Proj
			if(phase==1){

				with(sndobjectone){
					audio_emitter_position(sndemitone,other.x,other.y,0)	
				}

				imgangle+=hsp*3
	
				x+=hsp
				y+=vsp

				

						abil_dmg_scr()
				
							if(hit!=noone){
								if(hit.team!=0){
									with(hit){
											hurttick=1
											dmgrecieved+=other.dmg
											Me.damagedone+=dmgrecieved
											Control.target=id
											debuffArray[1,0]=250
									}				
									dur=0
									if(Control.talentmapArray[19,1]>0){
										Me.passivefourArray[1,16]=1
									}									
								}
							}	

								if(dur mod 5 ==0){
									//Syrup Part
									created=instance_create_depth(x-6+random(12),y-6+random(12),0,Part)
									with(created){
										type=2
										pin=1
										pintwo=1
										depth=choose(other.depth-1,other.depth+1)
										spin=1
										img=177
										imgcap=3
										imgsped=0
										sprite_index=part_spr
										image_speed=0
										image_index=img+irandom(imgcap)
										image_angle=other.imgangle
										dur=20+irandom(20)
										durtotal=dur
										hsp=0
										vsp=0
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

				if(dur<=0||instance_place(x,y,Block)){
									
									//Syrup Parts
									for(i=0;i<5;i+=1){
										created=instance_create_depth(x-6+random(12),y-6+random(12),0,Part)
										with(created){
											type=2
											pin=1
											pintwo=1
											depth=choose(other.depth-1,other.depth+1)
											spin=1
											img=177
											imgcap=3
											imgsped=0
											sprite_index=part_spr
											image_speed=0
											image_index=img+irandom(imgcap)
											image_angle=other.imgangle
											dur=40+irandom(20)
											durtotal=dur
											hsp=0
											vsp=random_range(0,-1)
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

								//Waff Parts
								for(i=0;i<4;i+=1){
									created=instance_create_depth(x,y,0,Part)
									with(created){
									type=2
									pin=1
									pintwo=1
									depth=other.depth+1
									spin=1
									img=73+(other.opt*5)
									imgcap=3
									imgsped=0
									sprite_index=abil_super_two_spr
									image_speed=0
									image_index=img+other.i
									image_angle=other.imgangle
									dur=70+irandom(70)
									direction=other.i*90+other.imgangle+45
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
									//Butter
									created=instance_create_depth(x,y,0,Part)
									with(created){
									type=2
									pin=1
									pintwo=1
									depth=other.depth-1
									spin=1
									img=77+(other.opt*5)
									imgcap=3
									imgsped=0
									sprite_index=abil_super_two_spr
									image_speed=0
									image_index=img
									image_angle=other.imgangle
									dur=70+irandom(70)
									direction=90
									speed=0.6
									durtotal=dur
									hsp=hspeed
									vsp=vspeed
									//hsp+=other.hsp
									//vsp+=other.vsp
									grav=0.04
									gravtwo=0.03
									chance=1
									xscale=chance
									yscale=chance
									phase=1
									speed=0
									}		
																
					audio_play_sound_at(choose(snd_pumpkin_thud_4,snd_pumpkin_thud_5,snd_pumpkin_thud_6),x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
					audio_stop_sound(sndobjectone)
					
					instance_destroy()
				}				
			
			}		
		}
		}else{
			//____________________________________________________________________________---------------------(Super Abil Two Cereals)---------------------____________________________________________________________________________
			phase=0
			if(phase==0){

			if(delay>0){

			

			with(Me){
			//Cereal Part
				if(passivetimer mod 10==0){
				
				chance=other.imgnum
						created=instance_create_depth(x-4+random(8),y-2+random(4),0,Part)
						with(created){
									type=2
									pin=1
									pintwo=1
									depth=choose(other.depth+1,other.depth-1)
									spin=1
									img=150+(other.chance*7)+irandom(6)

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
			//Cereal Part
				if(dur mod 7==0){
						created=instance_create_depth(x-9+random(18),y-2+random(4)+12,0,Part)
						with(created){
									type=2
									pin=1
									pintwo=1
									depth=choose(other.depth+1,other.depth-1)
									spin=1
									img=150+(other.imgnum*7)+irandom(6)

									imgcap=1
									imgsped=0
									image_speed=0
									image_index=img
									imgsped=0
									sprite_index=abil_super_two_spr
									image_speed=0
									image_angle=random(360)
									dur=10+irandom(8)
													
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


				chance=1
				chancetwo=0.03
				if(tick==0){
					if(tickamount>-chance&&!instance_place(x,y-chancetwo,Block)){
						Me.y-=chancetwo
						tickamount-=chancetwo
						
					}else{
						tick=1
					}
				}else{
					if(tick==1){
						if(tickamount<chance&&!instance_place(x,y+chancetwo,Block)){
							Me.y+=chancetwo
							tickamount+=chancetwo
						}else{
							tick=0
						}
					}				
				}					
				
				if(delay mod 12==0){
					if(image_index<img+imgcap){
						image_index+=1
					
						if(image_index>=img+2){
							depth=other.depth+3
						}
						if(image_index>=img+imgcap){
							bk1.visible=true
						}
					}
				}
			
				if(delay mod 10 ==0){
				
					meimg+=1
				}
				Me.img=40+meimg
				Me.image_index=Me.img
				Me.maskdraw=0
				Me.anim=2
				Me.animsave=Me.img
			
			}else{
				Me.maskdraw=1
			}

			
			dmg=floor((dmgsave*(vsp+1.5))/8)
			if(dmg>dmgcap){
				dmg=dmgcap
			}

			if(vsp>=1&&delay<=0){
				//Cereal particles
						created=instance_create_depth(x-9+random(18),y-13-2+random(4),0,Part)
						with(created){
									type=2
									pin=1
									pintwo=1
									depth=other.depth+1
									spin=1
									img=150+(other.imgnum*7)+irandom(6)

									imgcap=1
									imgsped=0
									image_speed=0
									image_index=img
									imgsped=0
									sprite_index=abil_super_two_spr
									image_speed=0
									image_angle=random(360)
									dur=30+irandom(20)
													
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
						abil_dmg_scr()
						if(diddmg==0){
							if(hit!=noone){
								if(hit.team!=0){
									chance=1
									for(i=dmgedArray[0];i>0;i-=1){
										if(hit==dmgedArray[i]){
											chance=0
										}
									}
									
									if(chance==1){
										//diddmg=1
										dmgedArray[0]+=1
										dmgedArray[dmgedArray[0]]=hit
										with(hit){
												hurttick=1
												dmgrecieved+=other.dmg
												Me.damagedone+=dmgrecieved
												Control.target=id
										}				
										vsp=vsp*-0.5
										if(dur>5){
											//dur=5
										}
									}
									if(dmg>0){
										dmg-=2
									}
									if(Control.talentmapArray[19,1]>0){
										Me.passivefourArray[1,16]=1
									}									
								}
							}	
						}
			}
				


			if(delay<=0){
				if(instance_place(x+hsp,y,Block)){
					hsp=hsp*-0.1
				}				
				
					if(instance_place(x,y+vsp,Block)){
						if(vsp>1){
							vsp=vsp*-0.1
						}else{
							
							vsp=0
							if(instance_place(x,y+1,Block)){
								if(dur>0){
									dur=0
								}
							}
						}
					}				
				
				x+=hsp
				y+=vsp

				if(vsp<8){
					vsp+=grav
				}
				
			}else{
				delay-=1
				
				if(delay>45){
					vsp=-1
				}else{
					vsp=0
				}
				vsp=-0.5

					sped=0.7
					if(global.con_h_left||global.conp_h_left){
						hsp=-sped
					}else{
						if(global.con_h_right||global.conp_h_right){
							hsp=sped
						}else{
							hsp=0
						}
					}

				with(Me){
					stun=1
					vsp=-grav
					hsp=0
				}
				
				if(global.con_p_w||global.conp_p_w){
					chance=floor(Me.abilArray[2,1]/2)
					Me.abilArray[2,1]=chance
					Me.stun=0
					dur=0
					delay=0
				}
				
				
				if(!instance_place(x+hsp,y,Block)){
					x+=hsp
				}
				if(!instance_place(x,y+vsp,Block)){
					y+=vsp
				}				
				if(delay==0){
					hsp=0
					Me.vsp=-3
				}
			}
				
			
				if(hsp<0){
					if(hsp+gravtwo<=0){
						hsp+=gravtwo
					}else{
						hsp=0
					}
				}else{
					if(hsp>0){
						if(hsp-gravtwo>=0){
							hsp-=gravtwo
						}else{
							hsp=0
						}
					}			
				}

				if(instance_exists(bk1)){
					with(bk1){
						dur=999999
						x=other.x
						y=other.y
					}
				}

				if(dur==0){
					
								chance=img-1
								//Cereal Parts
								for(i=0;i<4;i+=1){
									created=instance_create_depth(x,y,0,Part)
									with(created){
										type=2
										pin=1
										pintwo=1
										depth=other.depth+other.i
										spin=1
										img=other.img+5
										imgcap=3
										imgsped=0
										sprite_index=abil_super_spr
										image_speed=0
										image_index=img+other.i
										image_angle=other.imgangle
										dur=50+irandom(50)
										direction=other.i*90+other.imgangle+45
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

				//Cereal particles
					for(i=0;i<20;i+=1){
							created=instance_create_depth(x-9+random(18),y-13-2+random(20),0,Part)
							with(created){
										type=2
										pin=1
										pintwo=1
										depth=other.depth+1
										spin=1
										img=150+(other.imgnum*7)+irandom(6)

										imgcap=1
										imgsped=0
										image_speed=0
										image_index=img
										imgsped=0
										sprite_index=abil_super_two_spr
										image_speed=0
										image_angle=random(360)
										dur=50+irandom(50)
													
										direction=random_range(60,120)
										speed=random_range(0.4,1.4)
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

					if(instance_exists(bk1)){
						with(bk1){
							instance_destroy()
						}
					}
					instance_destroy()
				}

				
			}
		}
	}else{
	
	
#endregion
#region Super Ability 3
			//____________________________________________________________________________---------------------(Super Abil Three Doughnut Fly Charge)---------------------____________________________________________________________________________
	if(pin==52){
		if(Control.talentmapArray[4,1]>0){
		imgangle+=hsp*3
		chancefour=0
						abil_dmg_scr()
				
							if(hit!=noone){
								if(hit.team!=0){
									with(hit){
											hurttick=1
											dmgrecieved+=other.dmg
											Me.damagedone+=dmgrecieved
											Control.target=id
									}				
									dur=0
									if(phase==0){
										Me.hsp=Me.hsp*-0.9
										stun=5
									}
									if(Control.talentmapArray[19,1]>0){
										Me.passivefourArray[1,14]=1
									}									
								}
							}
		
		if(phase==0&&dur>0){
			if(anim+animsped+Me.imgsped<2){
				anim+=animsped
			}else{
				anim=0
			}		
			
			
			hsp=Me.hsp
			x=Me.x+(10*Me.dir)+Me.hsp
			y=Me.y+2+Me.vsp
		
								if(dur mod 5 ==0){
									//Doughnut Part
									created=instance_create_depth(x-6+random(12),y-6+random(12),0,Part)
									with(created){
										type=2
										pin=1
										pintwo=1
										depth=choose(other.depth-1,other.depth+1)
										spin=10
										img=95+(irandom(4)*2)
										imgcap=2
										imgsped=0.035
										sprite_index=abil_super_two_spr
										image_speed=0
										image_index=img
										image_angle=other.imgangle
										dur=30
										durtotal=dur
										hsp=0
										vsp=random_range(-0.7,-0.9)
										//hsp+=other.hsp
										//vsp+=other.vsp
										grav=0.05
										gravtwo=0.02
										chance=1
										xscale=chance
										yscale=chance
										phase=1
										speed=0
									}
								}	
		
		with(Me){
			vsp=-grav
			stun=2
			anim=1
			
					img=34+other.anim
					animsave=img
					imgcap=0
					image_index=img	
					anim=1
					
					animx=1*dir		
					animysave=2

						if(abilArray[2,1]<globalcdtotal){
							abilArray[2,1]=globalcdtotal
							abilArray[2,4]=1
						}
						if(abilArray[0,1]<globalcdtotal){
							abilArray[0,1]=globalcdtotal
							abilArray[0,4]=1
						}

					chance=1.5
					if(global.con_h_up||global.conp_h_up){
						vsp=-chance
						other.y-=6
					}else{
						if(global.con_h_down||global.conp_h_down){
						vsp=chance
						other.y+=6
						}	
					}
					
		}

		if(Control.talentmapArray[6,1]>0){
			if(global.con_p_q||global.conp_p_q||dur==1){
				grav=0.2
				gravtwo=0.05
				hsp=Me.hsp*0.7
				vsp=Me.vsp
				dur=80
				dmg=dmg*0.8
				phase=1	
				Me.animysave=0
				Me.abilArray[0,1]=0		
			}
		}else{
			if(global.con_p_q||global.conp_p_q||instance_place(x,y,Block)){
				dur=0
				phase=1	
				Me.animysave=0
				Me.abilArray[0,1]=0		
			}		
		}

		
		
		}else{
			
			//Throw doughnut
			if(phase==1){
			
				if(hsp<0){
					if(hsp+gravtwo<=0){
						hsp+=gravtwo
					}else{
						hsp=0
					}
				}else{
					if(hsp>0){
						if(hsp-gravtwo>=0){
							hsp-=gravtwo
						}else{
							hsp=0
						}
					}			
				}
				if(vsp<4){
					vsp+=grav
				}
				
				if(instance_place(x,y+vsp,Block)){
					if(abs(vsp)>1.5){
						vsp=vsp*-0.5
					}else{
						vsp=0
					}
				}
				if(instance_place(x,y+hsp,Block)){
					hsp=hsp*-0.5
				}

				x+=hsp
				y+=vsp
			}
		}
		if(dur==0){
			
									chance=img-107
								//Doughnut Parts
								for(i=0;i<4;i+=1){
									created=instance_create_depth(x,y,0,Part)
									with(created){
									type=2
									pin=1
									pintwo=1
									depth=other.depth+1
									spin=1
									img=128+(other.chance*4)
									imgcap=3
									imgsped=0
									sprite_index=abil_super_two_spr
									image_speed=0
									image_index=img+other.i
									image_angle=other.imgangle
									dur=70+irandom(70)
									direction=other.i*90+other.imgangle+45
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
			
			Me.animysave=0
			if(phase==0){
				Me.abilArray[0,1]=0
			}
			instance_destroy()
		}
		}else{
			//____________________________________________________________________________---------------------(Super Abil Three Toaster)---------------------____________________________________________________________________________			
			if(Control.talentmapArray[7,1]>0){
				//Toaster
				if(phase==0){

					if(grav==0){
						with(Me){
							stun=1
							visible=false
							vsp=-grav
						}
	
						if(dur mod 25==0){
								opt+=1
								toast.img+=3
								toast.image_index+=3
								toast.opt=opt
								
						}
	
					if(opt==3){
						if(dur>1){
							dur=1
						}
					}
	
					if(global.con_r_q||global.conp_r_q){
						dur=30
						grav=0.05
						if(opt<3){
							Me.vsp=-6-opt*0.6
						}
						if(Me.grounded==1){
							if(!instance_place(x,y-3,Block)){
								Me.y-=3
								Me.grounded=0
							}
						}
						toast.phasetwo=1
						toast.depth=Me.depth-2
						toast.imgsped=0.085
						toast.opt=opt
						
						with(toast){
							dmg=5+opt*2
			
							chance=dmg
			
							dmg+=dmg*(Control.talentmapArray[9,1]*0.25)
			
							dmg+=chance*(Control.invenArray[25,3]*0.01)						
						}
					}
					
					}else{
						//Toaster done fall
						if(grav>0){
							abil_dmg_scr()
				
								if(hit!=noone){
									if(hit.team!=0){
										with(hit){
												hurttick=1
												dmgrecieved+=other.dmg
												Me.damagedone+=dmgrecieved
												Control.target=id
										}				
										dur=0
									}
								}							
							
							if(!instance_place(x,y+vsp,Block)){
								vsp+=grav
								y+=vsp
							}
						}
					}
					
					if(dur==0){
						with(Me){
							//stun=0
							//visible=true
						}	
						
								//Toaster Parts
								for(i=0;i<4;i+=1){
									created=instance_create_depth(x,y,0,Part)
									with(created){
									type=2
									pin=1
									pintwo=1
									depth=other.depth+1
									spin=1
									img=237
									imgcap=3
									imgsped=0
									sprite_index=abil_super_two_spr
									image_speed=0
									image_index=img+other.i
									image_angle=other.imgangle
									dur=70+irandom(70)
									direction=other.i*90+other.imgangle+45
									if(other.opt==4){
										speed=-random_range(1,2)
									}else{
										speed=-random_range(0.4,1)
									}
									
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
					
				}else{
					
					//Toast Toast
					if(phase==1){
						
						if(phasetwo==1){
							
							chance=1.25+(Control.talentmapArray[23,1]*0.025)
							if(global.con_h_right||global.conp_h_right){
								Me.hsp=chance
								Me.dir=1
								imgangle+=5
							}else{
								if(global.con_h_left||global.conp_h_left){
									Me.hsp=-chance
									Me.dir=-1
									imgangle-=5
								}else{
									
							
								}							
							
							}
							dir=Me.dir

							x=Me.x+Me.hsp
							y=Me.y+Me.vsp+2
							

							Me.stun=1
							
							
							if(Me.grounded==1){
									dur=0
									Control.screenshake=5								
							}

						abil_dmg_scr()
				
							if(hit!=noone){
								if(hit.team!=0){
									with(hit){
											hurttick=1
											dmgrecieved+=other.dmg
											Me.damagedone+=dmgrecieved
											Control.target=id
									}			
										if(bounce>0){
											bounce-=1
										}else{
											dur=0
										}
										dmg=dmg *0.5
										Me.hsp=Me.hsp*-0.9
										Me.vsp=Me.vsp*-0.9
										if(Me.vsp>3){
											Me.vsp=3
										}
										stun=5
									if(Control.talentmapArray[19,1]>0){
										Me.passivefourArray[1,14]=1
									}											
								}
							}
						
						}else{
							
							//Burnt
							if(opt==4){
								Control.screenshake=8
								opt=5
								vsp=0
								grav=0.02
								dmg=2
								dur=0
								Me.vsp=-6
								
								//Explosion AOE
								created=instance_create_depth(x,y+5,0,Abil)
								with(created){
										diddmg=0
										dmg=8

										dmg+=dmg*(Control.talentmapArray[9,1]*0.25)
										dmg+=dmg*(Control.invenArray[25,3]*0.01)
										Me.passive=1
									type=0
									pin=52
									phase=2
									isfry=0
									en=0
									creator=other.id
									imgsped=0.3
									imgangle=0
										img=0
										temp=1
										move=0
		
									imgcap=10
									sprite_index=abil_super_exp_spr
									image_index=0
									depth=other.depth+3
									image_speed=0
									dur=100
									durtotal=dur
									pintwo=1
									grav=0.1
									gravtwo=0.05
									dir=other.dir
									
									hurtArray[0]=0
									hurtnum=0
					
									chance=-1
							
								
								}								
							}else{
							
								if(opt==5){
									if(!instance_place(x,y,Block)){
										if(vsp<3){
											vsp+=grav
										}
										y+=vsp
									}
							
									abil_dmg_scr()
				
										if(hit!=noone){
											if(hit.team!=0){
												with(hit){
														hurttick=1
														dmgrecieved+=other.dmg
														Me.damagedone+=dmgrecieved
														Control.target=id
												}				
												dur=0
											}
											if(Control.talentmapArray[19,1]>0){
												Me.passivefourArray[1,14]=1
											}												
										}	
								}
							}
						}
						
						if(dur==0){
							
							with(Me){
								stun=0
								visible=true
							}	

								//Toast Parts
								for(i=0;i<4;i+=1){
									created=instance_create_depth(x,y,0,Part)
									with(created){
									type=2
									pin=1
									pintwo=1
									depth=other.depth+1
									spin=1
										if(Control.talentmapArray[9,1]>0){
											if(Control.talentmapArray[9,1]>0){
												if(other.opt==5){
													img=271
													speed=-random_range(0.75,1.6)
												}else{
													img=259+(4*other.opt)
													speed=-random_range(0.4,1)
												}
											}else{
										
											}												
										}else{
											if(other.opt==5){
												img=205
												speed=-random_range(0.75,1.6)
											}else{
												img=193+(4*other.opt)
												speed=-random_range(0.4,1)
											}									
										}
									imgcap=3
									imgsped=0
									sprite_index=abil_super_two_spr
									image_speed=0
									image_index=img+other.i
									image_angle=other.imgangle
									dur=70+irandom(70)
									direction=other.i*90+other.imgangle+45
									
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
					}else{
						
						//Toaster Explosion
						if(phase==2){
							chance=0
								with(Enemy){
								hit=instance_place(x,y,other)	
								if(hit!=noone){
									if(team!=0){
										chance=0
										for(i=0;i<other.hurtnum;i+=1){
											if(other.hurtArray[i]==id){
											chance=1
											}
										}
											if(chance==0){
											hurttick=1
											dmgrecieved+=other.dmg
											Me.damagedone+=dmgrecieved
											Control.target=id									
											other.hurtArray[other.hurtnum]=id
											other.hurtnum+=1
											other.chance=1
											}
										}
									}
								}	
									if(Control.talentmapArray[19,1]>0){
										Me.passivefourArray[1,14]=1
									}									
							if(dur==0||image_index>=img+9){
								instance_destroy()
							}
						}
					
					}
				
				}
			}else{
			
			}
		}
	}else{
	
	
#endregion
#region Super Ability 4 Bacon
			//____________________________________________________________________________---------------------(Super Abil Bacon)---------------------____________________________________________________________________________
	if(pin==53){
		//Bacon
		if(phase==0){

						abil_dmg_scr()
				
							if(hit!=noone){
								if(hit.team!=0){
									with(hit){
											hurttick=1
											dmgrecieved+=other.dmg
											Me.damagedone+=dmgrecieved
											Control.target=id
									}
									dur=0
								}
							}
				startx+=hsp
				imgangle+=hsp*6
				x=startx+extrax
				y=starty+extray
				
				chance=0.15
				chancetwo=6
				
				if(tick==0){
					if(extrax<chancetwo){
						extrax+=chance
					}else{
						tick=1
					}
				}else{
					if(tick==1){
						if(extrax>-chancetwo){
							extrax-=chance
						}else{
							tick=0
						}
					}else{
				
					}				
				}

				if(ticktwo==0){
					if(extray<chancetwo){
						extray+=chance
					}else{
						ticktwo=1
					}
				}else{
					if(ticktwo==1){
						if(extray>-chancetwo){
							extray-=chance
						}else{
							ticktwo=0
						}
					}else{
				
					}				
				}


			/*
			imgangle+=hsp*5
			
			if(!instance_place(x+hsp,y,Block)){
				x+=hsp
			}
			if(!instance_place(x,y+vsp,Block)){
				y+=vsp
			}
			
			if(vsp<2){
				vsp+=grav
			}
			

				if(gravtwo!=0){
					if(hsp-gravtwo>=gravtwo){
						hsp-=gravtwo
					}else{
						if(hsp+gravtwo<=-gravtwo){
							hsp+=gravtwo
						}else{
							hsp=0
						}					
					}
				}
				
			*/
			
			if(dur==0){
								//Bacon Parts
								for(i=0;i<2;i+=1){
									created=instance_create_depth(x,y,0,Part)
									with(created){
										type=2
										pin=1
										pintwo=1
										depth=other.depth+1
										spin=1
										img=371+(other.imgrem*2)+other.i
										imgcap=3
										imgsped=0
										
										
										sprite_index=abil_super_two_spr
										image_speed=0
										image_index=img
										image_angle=other.imgangle
										dur=35+irandom(70)
										direction=other.i*90+other.imgangle+45
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
			
		}else{
			if(phase==0){
			
			}else{
		
			}		
		}
	}else{
#region Tree Ability 1 Leaf
			//____________________________________________________________________________---------------------(Tree Abil Leaf)---------------------____________________________________________________________________________
	if(pin==60){
		//Leaf
		
		if(phase==-1){
			
			if(attacktick==0){
			
				chancethree=Me.passivefourArray[1,9]
				

				if((global.con_h_e&&!global.con_r_e)||(global.conp_h_e&&!global.conp_r_e)){
					Me.passivefourArray[1,6]+=1
					
					Me.passivefourArray[1,7]=floor(Me.passivefourArray[1,6]/chancethree)
					
					dur=10

						with(Me){
								abilArray[0,1]=abilArray[0,2]
								abilArray[0,4]=0
						
							if(abilArray[1,1]<globalcdtotal){
								abilArray[1,1]=globalcdtotal
								abilArray[1,4]=1
							}					
							if(abilArray[2,1]<globalcdtotal){
								abilArray[2,1]=globalcdtotal
								abilArray[2,4]=1
							}	
						}						
					
				}else{
					
					
					
					attacktick=1
					
						count=floor(Me.passivefourArray[1,6]/chancethree)
						count+=1
						
						if(count>9){
							count=9
						}
						
						dur=40
						
						Me.passivefourArray[1,6]=0	
						Me.passivefourArray[1,7]=0
						
						//For Sapling attack
						Me.passivefourArray[100,10]=2
						Me.passivefourArray[100,11]=1
						Me.passivefourArray[100,13]=count
					
					with(Me){
					//Release
					if(global.con_h_up||global.conp_h_up){
						temp=2
					}else{
						if(global.con_h_down||global.conp_h_down){
						temp=3
						}else{
						temp=1
						}		
					}
						chance=other.count-1
					
							temp = temp *dir		
							
							Me.passivefourArray[100,12]=temp
							
					}
				}
		}
		
			
			if(attacktick==1){
				if(dur mod 5==0){
					count-=1
					with(Me){
						//create phase
					
						if(other.count==8){
							chance=0
						}else{
						if(other.count==7){
							chance=0
						}else{
						if(other.count==6){
							chance=-5
						}else{
						if(other.count==5){
							chance=5
						}else{
						if(other.count==4){
							chance=-2
						}else{
						if(other.count==3){
							chance=4
						}else{
						if(other.count==2){
							chance=-4
						}else{
						if(other.count==1){
							chance=2
						}else{
						if(other.count==0){
							chance=0
						}else{
					
						}									
						}}}}}}}
						}
					
							chancefour=other.startx
							chancefive=other.starty
							chancefour=x
							chancefive=y
						
					
							created=instance_create_depth(chancefour,chancefive-3+random(1.5)+chance,0,Abil)
							with(created){
									sndobjectone=instance_create_depth(x,y,0,Snd)
									with(sndobjectone){
										sndemitone=audio_emitter_create()				
										audio_play_sound_on(sndemitone,choose(snd_crab_fish_1,snd_crab_fish_2,snd_crab_fish_3),false,8)
										audio_emitter_falloff(sndemitone, 48, Control.falloff_max, Control.falloff_factor)					
									}	
							type=1
							pin=60
							move=0
							diddmg=0
							dmg=1
							ticky=0
							tick=choose(0,1)
							if(tick==0){
								ticky=random(4)
							}else{
								ticky=random(4)*-1
							}
						
							dmg+=dmg*(Control.invenArray[25,3]*0.01)
							creator=other.id
							sprite_index=abil_tree_spr
							depth=other.depth-1
							spin=1
							img=2+choose(0,2,4,6)
							imgcap=1
							imgsped=0.02
							image_speed=0
							image_index=img+random(1.9)
							dur=90+12
							durtotal=dur
							phase=0
							speed=random_range(0.58,0.62)
							temp=other.temp
							inside=0
								if(other.temp==-1){
									direction=0
								}else{
									if(other.temp==2){
										direction=20
									}else{
										if(other.temp==-2){
										 direction=180-20
										}else{
											if(other.temp==3){
											 direction=0-20
											}else{
												if(other.temp==-3){
												 direction=180+20
												}							
											}					
										}
									}			
								}
								image_angle=direction*other.dir
								imgangle=direction
								if(other.temp==-2||other.temp=-3){
									imgangle+=180
								}							
							hsp=hsp
							hsp=hspeed
							vsp=vspeed
							speed=0
							if(other.temp==-1){
								hsp=hsp*-1
							}
							if(direction==180){
								imgangle=0
							}
								if(hsp<0){
									dir=-1
									if(temp==1){
										dir=-1
										imgangle=0
										yscale=-1
									}
								}
								image_angle=0
								sped=hsp
							}	
						
						}
					}
				
					if(dur==0||count==0){
						instance_destroy()
					}
			}
			}else{
		
				//Leaf Phase
				if(phase==0){
					
					
					chance=4
					chancetwo=0.15
					chancethree=0.15
					
					if(tick==0){
						hsp=sped*1.1
						imgangle-=chancethree
						if(!instance_place(x,y+3,Block)){
							if(ticky<chance){
								y+=chancetwo
								ticky+=chancetwo
							}else{
								tick=1
							}
						}else{
							tick=1
						}
					}else{
						if(tick==1){
							hsp=sped*0.9
							imgangle+=chancethree
							if(!instance_place(x,y-3,Block)){
								if(ticky>0-chance){
									y-=chancetwo
									ticky-=chancetwo
								}else{
									tick=0
								}
							}else{
								tick=0
							}
						}else{
					
						}					
					}
					
					x+=hsp
					y+=vsp

						abil_dmg_scr()
				
							if(hit!=noone){
								if(hit.team!=0){
									with(hit){
											hurttick=1
											dmgrecieved+=other.dmg
											Me.damagedone+=dmgrecieved
											Control.target=id
									}
									dur=0
								}
							}

					if(dur==0||instance_place(x,y,Block)){
						if(img==2||img==4){
							chance=0
						}else{
							if(img==6||img==8){
								chance=1
							}else{
						
							}						
						}
								//Leaf Parts
								for(i=0;i<4;i+=1){
									created=instance_create_depth(x,y,0,Part)
									with(created){
										type=2
										pin=1
										pintwo=1
										depth=other.depth+1
										spin=1
										img=10+(other.chance*4)+other.i
										imgcap=3
										imgsped=0
										
										
										sprite_index=abil_tree_spr
										image_speed=0
										image_index=img
										image_angle=other.imgangle
										dur=15+irandom(15)
										direction=other.i*90+other.imgangle+45
										speed=-random_range(0.2,1)
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
				}else{
				//Acorn Phase
				if(phase==2){
					
					if(abs(hsp)>0){
						imgangle+=hsp*5
					}
					
					if(vsp<5){
						vsp+=grav
					}

					if(gravtwo!=0){
						if(hsp-gravtwo>=gravtwo){
							hsp-=gravtwo
						}else{
							if(hsp+gravtwo<=-gravtwo){
								hsp+=gravtwo
							}else{
								hsp=0
							}					
						}
					}
					
					if(sndcd>0){
						sndcd-=1	
					}
					
					if(opt==0||opt==1){
					if(instance_place(x+hsp,y,Block)){
						hsp=hsp*-bounceamt
						if(sndcd<=0){
							sndcd=sndcdtotal
							audio_play_sound_at(choose(snd_pumpkin_thud_4,snd_pumpkin_thud_5,snd_pumpkin_thud_6),x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
						}
					}
					if(instance_place(x,y+vsp,Block)){
						vsp=vsp*-bounceamt
						if(sndcd<=0){
							sndcd=sndcdtotal
							audio_play_sound_at(choose(snd_pumpkin_thud_4,snd_pumpkin_thud_5,snd_pumpkin_thud_6),x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
						}
					}	
					}else{
						
						//Sap
						if(opt==2){
							if(instance_place(x,y,Block)){
								hsp=0
								vsp=0
								imgsped=0
								
								
								if(sndcd<=0){
									sndcd=999999
									audio_play_sound_at(choose(snd_bee_honey_1,snd_bee_honey_2),x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
									image_index=img
								}
								//dur-=2
							}							
						}
					}
					
					x+=hsp
					y+=vsp


			
					//Acorn Attack
					if(opt==0){
						abil_dmg_scr()
							
							//Acorn Explosion
							if(expl==1){
								chance=0
								if(hit!=noone){
									if(hit.team!=0){
										dur=0
									
									}
								}
								
							}else{
								if(hit!=noone){
									if(hit.team!=0){
										with(hit){
												hurttick=1
												dmgrecieved+=other.dmg
												Me.damagedone+=dmgrecieved
												Control.target=id
												
												direction=point_direction(x,y,other.x,other.y)+180
												speed=2
												hsp=hspeed
												vsp=vspeed
												speed=0
												stun=10
												
										}
										dur=0
									}
								}
							}
							
						if(expl==1){
							if(global.con_p_e||global.conp_p_e){
								dur=0
							}
						}							
							
					}

						if(opt==1){
							
								//Log Attack
								chance=0
									with(Enemy){
										if(instance_place(x,y,other)){
										chance=0
										for(i=0;i<other.hurtnum;i+=1){
											if(other.hurtArray[i]==id){
											chance=1
											}
										}
											if(chance==0){
											hurttick=1
											dmgrecieved+=other.dmg
											Me.damagedone+=dmgrecieved
											Control.target=id
									
											other.hurtArray[other.hurtnum]=id
											other.hurtnum+=1
											other.chance=1
											other.diddmg=1
											other.img+=1
											other.image_index+=1
											if(other.vsp>-2){
												other.vsp-=2
											}else{
												other.vsp=-2
											}
											other.hsp=other.hsp*0.7
											}
										}
									}
									if(chance==1){
										//Acorn Parts
										for(i=0;i<4;i+=1){
											created=instance_create_depth(x,y,0,Part)
											with(created){
												type=2
												pin=1
												pintwo=1
												depth=other.depth+1
												spin=1
												if(other.opt==0){
													if(other.img<100){
														img=70+((other.img-67)*4)+other.i
													}else{
														img=other.img+1+other.i
													}
	
												}else{
													img=other.img+1+other.i
														if(other.diddmg!=1){
															img=other.img+2+other.i
														}	
												}
												imgcap=3
												imgsped=0
										
										
												sprite_index=abil_tree_spr
												image_speed=0
												image_index=img
												image_angle=other.imgangle
												dur=35+irandom(30)
												direction=other.i*90+other.imgangle+45
												speed=-random_range(0.5,1.4)
												durtotal=dur
												hsp=hspeed
												vsp=vspeed
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
							
							if(abs(hsp)<=0.1&&abs(vsp)<=0.1){
								dur-=5
							}
						}else{
							

						
						}


					if(dur<=0){
						if(img==2||img==4){
							chance=0
						}else{
							if(img==6||img==8){
								chance=1
							}else{
						
							}						
						}
						
						if(expl==1){
										created=instance_create_depth(x,y,0,Abil)
										with(created){
				
											type=1
											pin=60
											move=0
											diddmg=0
											dmg=other.dmg
											opt=1
			
											chance=dmg
/*			
											dmg+=dmg*(Control.talentmapArray[6,1]*0.25)
			
											//dmg+=chance*(Control.talentmapArray[3,1]*0.25)
											dmg+=chance*(Control.invenArray[25,3]*0.01)
*/			
											creator=other.id
											count=0
											released=0
											
											if(other.count==0){
												sprite_index=abil_tree_acornexp_1_spr
											}else{
												if(other.count==1){
													sprite_index=abil_tree_acornexp_2_spr
												}else{
													if(other.count==2){
														sprite_index=abil_tree_acornexp_3_spr
													}else{
											
													}											
												}											
											}
											depth=other.depth+2
											spin=1
											extra=0
												img=0
												imgcap=10
												imgsped=0.6
			
											image_speed=0
											image_index=img
											dur=100
											count=0
											durtotal=dur
											phase=3
											//speed=1
											sped=speed
											hsp=hsp
											hsp=0
											vsp=0
				
											tick=0
											starty=y
											tickamount=0
				
											anim=0
											animsped=0.1
											hurtnum=0
											hurtArray[0]=0	
											
				
										}						
						}

								//Acorn/Log
								for(i=0;i<4;i+=1){
									created=instance_create_depth(x,y,0,Part)
									with(created){
										type=2
										pin=1
										pintwo=1
										depth=other.depth+1
										spin=1
												if(other.opt==0){
													if(other.img<100){
														img=70+((other.img-67)*4)+other.i
													}else{
														img=other.img+1+other.i
													}
	
												}else{
													if(other.opt==1){
														img=other.img+1+other.i
															if(other.diddmg!=1){
																img=other.img+2+other.i
															}	
													}else{
													
														if(other.opt==2){
															img=63+other.i
														}
													}
												}
										imgcap=3
										imgsped=0
										
										
										sprite_index=abil_tree_spr
										image_speed=0
										image_index=img
										image_angle=other.imgangle
										dur=45+irandom(30)
										direction=other.i*90+other.imgangle+45
										speed=-random_range(0.2,1)
										durtotal=dur
										hsp=hspeed
										vsp=vspeed
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
				}else{
					
					if(phase==3){
						
									with(Enemy){
										if(instance_place(x,y,other)){
										chance=0
										for(i=0;i<other.hurtnum;i+=1){
											if(other.hurtArray[i]==id){
											chance=1
											}
										}
											if(chance==0){
											hurttick=1
											dmgrecieved+=other.dmg
											Me.damagedone+=dmgrecieved
											Control.target=id
									
											other.hurtArray[other.hurtnum]=id
											other.hurtnum+=1
											other.chance=1
											other.diddmg=1
											other.img+=1
											other.image_index+=1
											if(other.vsp>-2){
												other.vsp-=2
											}else{
												other.vsp=-2
											}
											other.hsp=other.hsp*0.7
											}
										}
									}							
						
						if(dur==0||image_index>=9){
							
							instance_destroy()
						}
					}
				}			
				}
			}
	}else{
#endregion
#region Tree Ability 2 Log
			//____________________________________________________________________________---------------------(Tree Abil 3)---------------------____________________________________________________________________________
	if(pin==61){
		//Acorn
		if(phase==0){
			if(opt==1){

				chancethree=Me.passivefourArray[1,9]
				

				if((global.con_h_e&&!global.con_r_e)||(global.conp_h_e&&!global.conp_r_e)){
					Me.passivefourArray[1,6]+=1
					
					Me.passivefourArray[1,7]=floor(Me.passivefourArray[1,6]/chancethree)
					
					dur=10

						with(Me){
								abilArray[0,1]=abilArray[0,2]
								abilArray[0,4]=0
						
							if(abilArray[1,1]<globalcdtotal){
								abilArray[1,1]=globalcdtotal
								abilArray[1,4]=1
							}					
							if(abilArray[2,1]<globalcdtotal){
								abilArray[2,1]=globalcdtotal
								abilArray[2,4]=1
							}	
						}						
					
				}else{
					
					
						count=floor(Me.passivefourArray[1,6]/chancethree)
						count+=1
						if(count>3){
							count=3
						}
						
						Me.passivefourArray[1,6]=0	
						Me.passivefourArray[1,7]=0
						
						//For Sapling attack
						Me.passivefourArray[100,10]=2
						Me.passivefourArray[100,11]=2
						Me.passivefourArray[100,13]=count
						
					
					with(Me){
					//Release
					if(global.con_h_up||global.conp_h_up){
						temp=2
					}else{
						if(global.con_h_down||global.conp_h_down){
						temp=3
						}else{
						temp=1
						}		
					}
						chance=other.count-1
					
							dur=21
					
							temp = temp *dir		
							
							if(Me.dir==1){
								xpos=5
							}else{
								xpos=-5
							}
							
							Me.passivefourArray[100,12]=temp
							
						created=instance_create_depth(Me.x+xpos,Me.y+2,0,Abil)
						with(created){
							
							startx=x
							starty=y
							
								sndobjectone=instance_create_depth(x,y,0,Snd)
								with(sndobjectone){
									sndemitone=audio_emitter_create()				
									audio_play_sound_on(sndemitone,choose(snd_crab_fish_1,snd_crab_fish_2,snd_crab_fish_3),false,8)
									audio_emitter_falloff(sndemitone, 48, Control.falloff_max, Control.falloff_factor)					
								}	
						type=1
						pin=60
						move=0
						diddmg=0
						dmg=4+(6*other.chance)
						count=other.chance
						
							dmg+=dmg*(Control.talentmapArray[1,1]*0.05)
							//dmg+=dmg*(Control.talentmapArray[3,1]*0.25)						
						
						ticky=0
						tick=choose(0,1)
						if(tick==0){
							ticky=random(4)
						}else{
							ticky=random(4)*-1
						}
						
						dmg+=dmg*(Control.invenArray[25,3]*0.01)
						creator=other.id
						sprite_index=abil_tree_spr
						depth=other.depth-1
						spin=1
						img=70+choose(0,1,2)
						img=67+other.chance
						imgcap=1
						imgsped=0
						image_speed=0
						image_index=img
						dur=90+12
						durtotal=dur
						phase=2
						speed=2
						temp=other.temp
						inside=0
						bounceamt=0.8
						opt=0
						sndcdtotal=10
						sndcd=sndcdtotal
						expl=0
						
							if(other.temp==-1){
								direction=0
							}else{
								if(other.temp==2){
									direction=20
								}else{
									if(other.temp==-2){
									 direction=180-20
									}else{
										if(other.temp==3){
										 direction=0-20
										}else{
											if(other.temp==-3){
											 direction=180+20
											}							
										}					
									}
								}			
							}
							image_angle=direction*other.dir						
						hsp=hsp
						hsp=hspeed
						vsp=vspeed
						
						speed=0
						vsp-=2.2
						if(other.temp==2||other.temp==-2){
							vsp-=0.5
							if(hsp>0){
								hsp-=0.4
							}else{
								hsp+=0.4
							}
						}else{
							if(other.temp==3||other.temp==-3){
								vsp+=0.2
								if(hsp>0){
									hsp+=0.4
								}else{
									hsp-=0.4
								}
							}else{
						
							}						
						}

						
						if(Control.talentmapArray[3,1]<100){
							grav=0.1
							gravtwo=0.03
						}else{
							grav=0.075
							gravtwo=0.0225			
						}
						
						if(other.temp==-1){
							hsp=hsp*-1
						}
							dir=1
							if(hsp<0){
								dir=-1
								if(temp==1){
									dir=-1
									yscale=-1
								}
							}
							image_angle=0
							sped=hsp									

							//Talent
							if(Control.talentmapArray[3,1]>0){
								//dur+=dur+(dur*0.25)
								//hsp=hsp+hsp*0.25

								expl=1
							
							}

							
						}	
					}
					instance_destroy()
				}
			}else{
	
	
			//____________________________________________________________________________---------------------(Tree Log Shoot)---------------------____________________________________________________________________________
			if(opt==2){
			if(released==0){
				
				chancethree=Me.passivefourArray[1,9]

						with(Me){
							if(abilArray[0,1]<globalcdtotal){
								abilArray[0,1]=globalcdtotal
								abilArray[0,4]=1
							}
							if(abilArray[1,1]<globalcdtotal){
								abilArray[1,1]=globalcdtotal
								abilArray[1,4]=1
							}				
							abilArray[2,1]=abilArray[2,2]
							abilArray[2,4]=0
						}
				
				if(global.con_h_w&&!global.con_r_w||global.conp_h_w&&!global.conp_r_w){
					Me.passivefourArray[1,6]+=1
					
					Me.passivefourArray[1,7]=floor(Me.passivefourArray[1,6]/chancethree)
					
					dur=10
						

				}else{
					
				//Release
				if(global.con_h_up||global.conp_h_up){
					temp=2
				}else{
					if(global.con_h_down||global.conp_h_down){
					temp=3
					}else{
					temp=1
					}		
				}
					
						dur=21
					
						temp = temp *dir					
				
						count=floor(Me.passivefourArray[1,6]/chancethree)
						
						count+=1
						if(count>3){
							count=3
						}
						
						Me.passivefourArray[1,6]=0
						Me.passivefourArray[1,7]=0
						released=1
						
				}
			}
				
				
				//Shoot
				if(count>0){
					if(dur mod 7==0){
						count-=1

							if(Me.dir==1){
								xpos=5
							}else{
								xpos=-5
							}

						created=instance_create_depth(Me.x+xpos,Me.y+2,0,Abil)
						with(created){
								sndobjectone=instance_create_depth(x,y,0,Snd)
								with(sndobjectone){
									sndemitone=audio_emitter_create()				
									audio_play_sound_on(sndemitone,choose(snd_crab_fish_1,snd_crab_fish_2,snd_crab_fish_3),false,8)
									audio_emitter_falloff(sndemitone, 48, Control.falloff_max, Control.falloff_factor)					
								}	
							
							img=104
							
								//For Passthrough Attack
								opt=0
								if(Control.talentmapArray[12,1]>0){
									opt=1
									img=140
								}
								diddmg=0
								
							type=1
							pin=60
							move=0
							diddmg=0
							dmg=8
							ticky=0
							sndcdtotal=10
							sndcd=sndcdtotal							
							expl=0
							
							tick=choose(0,1)
							if(tick==0){
								ticky=random(4)
							}else{
								ticky=random(4)*-1
							}
							
							dmg+=dmg*(Control.talentmapArray[11,1]*0.05)
							dmg+=dmg*(Control.talentmapArray[12,1]*0.25)
							dmg+=dmg*(Control.invenArray[25,3]*0.01)
							creator=other.id
							sprite_index=abil_tree_spr
							mask_index=abil_tree_logmask_spr
							depth=Me.depth-1
							spin=1
							
							imgcap=2
							imgsped=0.05
							imgsped=0
							image_speed=0
							image_index=img
							dur=180
							durtotal=dur
							phase=2
							speed=2.3+(other.count*0.1)
							temp=other.temp
							inside=0
							bounceamt=0.4
						
						
								if(other.temp==-1){
									direction=0
								}else{
									if(other.temp==2){
										direction=20
									}else{
										if(other.temp==-2){
										 direction=180-20
										}else{
											if(other.temp==3){
											 direction=0-20
											}else{
												if(other.temp==-3){
												 direction=180+20
												}							
											}					
										}
									}			
								}
								image_angle=direction*other.dir						
							hsp=hsp
							hsp=hspeed
							vsp=vspeed
						
							speed=0
							vsp-=1.2
							
							if(other.count==1){
								vsp-=0.7
							}
							if(other.temp==2||other.temp==-2){
								vsp-=0.5
								if(hsp>0){
									hsp-=0.4
								}else{
									hsp+=0.4
								}
							}else{
								if(other.temp==3||other.temp==-3){
									vsp+=0.2
									if(hsp>0){
										hsp+=0.4
									}else{
										hsp-=0.4
									}
								}else{
						
								}						
							}
							grav=0.1
							gravtwo=0.03						

							dir=Me.dir

							image_angle=0
							sped=hsp
							imgangle=random(360)
							
							hsp=hsp*dir
							
							hurtnum=0
							hurtArray[0]=0									
						}	
						
						
						if(count==0){
							instance_destroy()
						}
					}
					}
				}else{
				
			//____________________________________________________________________________---------------------(Tree Vine)---------------------____________________________________________________________________________
			if(opt==3){
			if(released==0){
				
				chancethree=Me.passivefourArray[1,9]

						with(Me){
							if(abilArray[0,1]<globalcdtotal){
								abilArray[0,1]=globalcdtotal
								abilArray[0,4]=1
							}
							if(abilArray[1,1]<globalcdtotal){
								abilArray[1,1]=globalcdtotal
								abilArray[1,4]=1
							}				
							abilArray[2,1]=abilArray[2,2]
							abilArray[2,4]=0
						}
				
				if(global.con_h_w&&!global.con_r_w||global.conp_h_w&&!global.conp_r_w){
					Me.passivefourArray[1,6]+=1
					
					Me.passivefourArray[1,7]=floor(Me.passivefourArray[1,6]/chancethree)
					
					dur=10
						

				}else{
					
				//Release
				if(global.con_h_up||global.conp_h_up){
					temp=2
				}else{
					if(global.con_h_down||global.conp_h_down){
					temp=3
					}else{
					temp=1
					}		
				}
					
						dur=21
					
						temp = temp *dir					
				
						count=floor(Me.passivefourArray[1,6]/chancethree)
						
						count+=1
						if(count>3){
							count=3
						}
						
						Me.passivefourArray[1,6]=0
						Me.passivefourArray[1,7]=0
						released=1
						
				}
			}
				
				
				//Shoot
				if(count>0){
					if(dur mod 7==0){
						count-=1

								if(Me.dir==1){
									xpos=5
								}else{
									xpos=-5
								}

							created=instance_create_depth(Me.x+xpos,Me.y+2,0,Abil)
							with(created){
									sndobjectone=instance_create_depth(x,y,0,Snd)
									with(sndobjectone){
										sndemitone=audio_emitter_create()				
										audio_play_sound_on(sndemitone,choose(snd_crab_fish_1,snd_crab_fish_2,snd_crab_fish_3),false,8)
										audio_emitter_falloff(sndemitone, 48, Control.falloff_max, Control.falloff_factor)					
									}	
							
								img=11
									opt=0
									diddmg=0
								
								type=1
								pin=62
								move=0
								diddmg=0
								dmg=8
								ticky=0
								sndcdtotal=10
								sndcd=sndcdtotal							
								expl=0
							
								tick=choose(0,1)
							
								dmg+=dmg*(Control.talentmapArray[11,1]*0.05)
								dmg+=dmg*(Control.talentmapArray[12,1]*0.25)
								dmg+=dmg*(Control.invenArray[25,3]*0.01)
								creator=other.id
								sprite_index=enemy_abil_spr
								mask_index=abil_tree_logmask_spr
								depth=Me.depth-1
								spin=1
							
								imgcap=8
								imgsped=0.05
								image_speed=0
								image_index=img
								dur=180
								durtotal=dur
								phase=0
								speed=2.3+(other.count*0.1)
								temp=other.temp
								inside=0
								bounceamt=0.4
									
								hsp=hsp
								hsp=hspeed
								vsp=vspeed
						
								speed=0
								vsp-=1.2
							
								grav=0.1
								gravtwo=0.03						

								dir=Me.dir

								image_angle=0
								sped=hsp
							
							
								hsp=1
								hsp=hsp*dir
							
							
								hurtnum=0
								hurtArray[0]=0	
								visible=false
							
								count=(other.count+1)*2
							}	
							count=0
						
						
							if(count==0){
								instance_destroy()
							}
						}
					}
				}else{
				
				
				}				
				}
			}
		}
	}else{
#endregion
#region Tree Ability 3 Leaf
			//____________________________________________________________________________---------------------(Tree Abil 3)---------------------____________________________________________________________________________
	if(pin==62){
		//Vine Creator
		if(phase==0){
			
				vsp+=grav
			
				x+=hsp
				
				if(!instance_place(x,y+vsp*0.5,Block)){
					y+=vsp
				}
			
				if(dur mod 16==0){
					if(count>0){
							created=instance_create_depth(x,y,0,Abil)
							with(created){
									sndobjectone=instance_create_depth(x,y,0,Snd)
									with(sndobjectone){
										sndemitone=audio_emitter_create()				
										audio_play_sound_on(sndemitone,choose(snd_crab_fish_1,snd_crab_fish_2,snd_crab_fish_3),false,8)
										audio_emitter_falloff(sndemitone, 48, Control.falloff_max, Control.falloff_factor)					
									}	
							
								img=154
									opt=0
									diddmg=0
								
								type=1
								pin=62
								move=0
								diddmg=0
								dmg=2
								ticky=0
								sndcdtotal=10
								sndcd=sndcdtotal							
								expl=0
							
								tick=choose(0,1)
							
								dmg+=dmg*(Control.talentmapArray[14,1]*0.05)
								dmg+=dmg*(Control.talentmapArray[12,1]*0.25)
								dmg+=dmg*(Control.invenArray[25,3]*0.01)
								creator=other.id
								sprite_index=abil_tree_spr
								//mask_index=abil_tree_logmask_spr
								depth=Me.depth-1
								spin=1
							
								imgcap=10
								imgsped=0.1
								image_speed=0
								image_index=img
								
								times=0
									if(Control.talentmapArray[15,1]>0){
										dur=85*3
										times=2
										imgsped=0.13
										durtotal=dur
									}else{
										dur=110
									}
								durtotal=dur
								phase=1
								speed=2.3+(other.count*0.1)
								temp=other.temp
								inside=0
								bounceamt=0.4
									
								hsp=hsp
								hsp=hspeed
								vsp=vspeed
						
								speed=0
								vsp-=1.2
							
								grav=0.1
								gravtwo=0.03						

								dir=Me.dir

								image_angle=0
								sped=hsp
							
								hsp=hsp*dir
							
								hurtnum=0
								hurtArray[0]=0	
							}	
							count-=1
					}
				}			
				
				if(count==0){
					instance_destroy()
				}
				
				
				
		}else{
			
			//Vine Use
			if(phase==1){
			
				vsp+=grav
				
				if(!instance_place(x,y,Block)){
					y+=vsp
				}
				
				if(image_index+imgsped>=img+imgcap&&times>=1&&dur<durtotal-(times*(durtotal*0.33))){
					times-=1

					for(i=0;i<hurtnum;i+=1){
						hurtArray[i]=0
					}
					
					
					hurtnum=0
					hurtArray[0]=0	

				}	

					//Log Attack
					chance=0
						with(Enemy){
							if(instance_place(x,y,other)){
							chance=0
							for(i=0;i<other.hurtnum;i+=1){
								if(other.hurtArray[i]==id){
								chance=1
								}
							}
								if(chance==0){
								hurttick=1
								dmgrecieved+=other.dmg
								Me.damagedone+=dmgrecieved
								Control.target=id
									
								other.hurtArray[other.hurtnum]=id
								other.hurtnum+=1
								other.chance=1
								other.diddmg=1
								
								effectArray[0,0]=effectArray[0,1]*6
									if(effectArray[0,3]+8<=8+Control.talentmapArray[18,1]){
										effectArray[0,3]+=8
									}else{
										effectArray[0,3]=8
									}
								}
							}
						}

				if(dur==0){
					instance_destroy()
				}
			}
		}
		
		
		
	}else{
#endregion
#region Tree Ability 4 Sap
			//____________________________________________________________________________---------------------(Tree Abil 4)---------------------____________________________________________________________________________
	if(pin==63){
		//Sap
		if(phase==0){
			
			imgangle+=hsp*10
			
			x+=hsp
			y+=vsp
			
					if(vsp<5){
						vsp+=grav
					}

					if(gravtwo!=0){
						if(hsp-gravtwo>=gravtwo){
							hsp-=gravtwo
						}else{
							if(hsp+gravtwo<=-gravtwo){
								hsp+=gravtwo
							}else{
								hsp=0
							}					
						}
					}
			

							//Sap Attack
								abil_dmg_scr()		
								
								if(hit!=noone){
									if(hit.team!=0){
										audio_play_sound_at(choose(snd_bee_honey_1,snd_bee_honey_2),x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
										with(hit){
												hurttick=1
												dmgrecieved+=other.dmg
												Me.damagedone+=dmgrecieved
												Control.target=id
												debuffArray[1,0]=450	
												other.diddmg=1
												
										}
										dur=0
									}
								}	
								
			
			if(dur==0||instance_place(x,y,Block)){

				if(diddmg==0){
					chance=3
					chancethree=0.7				


					for(i=0;i<chance;i+=1){

								if(i==0){
									chancetwo=0.05
								}else{
									if(i==1){
										chancetwo=0
									}else{
										if(i==2){
											chancetwo=0.05
										}else{
								
										}								
									}								
								}

							created=instance_create_depth(x,y,0,Abil)
							with(created){
							

							
								startx=x
								starty=y
							
									sndobjectone=instance_create_depth(x,y,0,Snd)
									with(sndobjectone){
										sndemitone=audio_emitter_create()				
										audio_play_sound_on(sndemitone,choose(snd_crab_fish_1,snd_crab_fish_2,snd_crab_fish_3),false,8)
										audio_emitter_falloff(sndemitone, 48, Control.falloff_max, Control.falloff_factor)					
									}	
								type=1
								pin=63
								move=0
								diddmg=1
								dmg=2
						
									//dmg+=dmg*(Control.talentmapArray[1,1]*0.05)
									//dmg+=dmg*(Control.talentmapArray[3,1]*0.25)						
						
								ticky=0
								tick=choose(0,1)
								if(tick==0){
									ticky=random(4)
								}else{
									ticky=random(4)*-1
								}
						
								dmg+=dmg*(Control.invenArray[25,3]*0.01)
								creator=other.id
								sprite_index=abil_tree_spr
								depth=other.depth-1
								spin=1
								img=59
								imgcap=1
								imgsped=0.03
								image_speed=0
								image_index=img
								dur=30
								durtotal=dur
								phase=0
								speed=2
								temp=other.temp
								inside=0
								bounceamt=0.8
								opt=1
								sndcdtotal=10
								sndcd=sndcdtotal
								expl=0
							

								image_angle=direction*other.dir						
							hsp=hsp
							hsp=hspeed
							vsp=vspeed
						
							speed=0
								
								temp=other.temp

								if(temp==1){
									
										hsp=0.5-other.chancetwo
										vsp=0-0.3+(other.i*0.3)
							
								}else{
									if(temp==2){
										hsp=0.3-other.chancetwo
										vsp=-0.2+(other.i*0.3)
								
									}else{
										if(temp==3){
											hsp=0.3-other.chancetwo
											vsp=0.2+(other.i*0.3)
									
										}else{
							
										}							
									}							
								}
							
								hsp=hsp*other.dir	
								
								if(other.i==1){
									vsp=-2.4
								}else{
									vsp=-2
								}
								hsp=0-0.4+(other.i*0.4)
								grav=0.2
								gravtwo=0.005
							}
					}
				}

								//Sap Parts
								for(i=0;i<4;i+=1){
									created=instance_create_depth(x,y,0,Part)
									with(created){
										type=2
										pin=1
										pintwo=1
										depth=other.depth+1
										spin=1
										
											if(other.opt==0){
												img=63+other.i
												dur=45+irandom(30)
											}else{
												img=55+other.i
												dur=15+irandom(20)
											}
											
										imgcap=3
										imgsped=0
										
										
										sprite_index=abil_tree_spr
										image_speed=0
										image_index=img
										image_angle=other.imgangle
										
										direction=other.i*90+other.imgangle+45
										speed=-random_range(0.2,1)
										durtotal=dur
										hsp=hspeed
										vsp=vspeed
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
	}else{
#endregion
#region Tree Ability 4 Sapling
			//____________________________________________________________________________---------------------(Tree Abil Sapling)---------------------____________________________________________________________________________
	if(pin==64){
		//Acorn Sapling
		if(phase==0){
			
			if(vsp<2){
				vsp+=grav
			}
			
				if(hsp<0){
					if(hsp+gravtwo<=0){
						hsp+=gravtwo
					}else{
						hsp=0
					}
				}else{
					if(hsp>0){
						if(hsp-gravtwo>=0){
							hsp-=gravtwo
						}else{
							hsp=0
						}
					}			
				}			
			
			imgangle+=hsp*8
			
			if(instance_place(x,y,Block)){
				phase=1
				img=172
				image_index=img
				imgcap=8
				hsp=0
				imgsped=0.1
				y-=14
				imgangle=0
			}
			
			
			x+=hsp
			y+=vsp
			
			
		}else{

			if(vsp<2){
				vsp+=grav
			}
			if(!instance_place(x,y-0.2,Block)){
				y+=vsp
			}else{
				if(collision_rectangle(x-4,y+8,x+4,y+12.5,Block,false,true)){
					y-=0.3
				}
			}
			
			//Grow
			if(phase==1){
				if(image_index>=img+imgcap-1){
					phase=2
					img=178
					imgcap=5
					image_index=img
					imgsped=0.04
					Me.passivefourArray[100,10]=0
					delay=0
					passivecheck=0
				}
			}else{
			
			//Fight
			if(phase==2||phase==3){


						abil_dmg_scr()
				
							if(hit!=noone){
								if(hit.team!=0){
									phase=4
								}
							}

					if(Me.passivefourArray[100,10]==1){
						if(passivecheck==0){
							passivecheck=1
							img=185
							image_index=img
							imgcap=1
							imgsped=0.025
							dir=Me.dir
							attacked=0							
						}
						
						dir=Me.dir

					}		

					if(Me.passivefourArray[100,10]==2){
						Me.passivefourArray[100,10]=3
						attdel=100
						
						img=187
						image_index=img
						imgcap=3
						imgsped=0.08
						dir=Me.dir
						attacked=0
						passivecheck=0

					}

	
				
					

					if(Me.passivefourArray[100,10]==3){

						if(attacked==0){
								
								if(delay mod 5 ==0){
									
									if(Me.passivefourArray[100,13]==0){
										attacked=1
										img=178
										imgcap=5
										image_index=img
										imgsped=0.04
										Me.passivefourArray[100,10]=0
										delay=0
										passivecheck=0										
									}else{
										
										Me.passivefourArray[100,13]-=1
										
									}
									
									temp = Me.passivefourArray[100,12]
									
									chance=0
									
									if(dir==1){
										chance=7
									}else{
										chance=-7
									}
									
									created=instance_create_depth(x+chance-0.5+random(1),y+7.5-1+random(2),0,Abil)
									with(created){
											sndobjectone=instance_create_depth(x,y+3,0,Snd)
											with(sndobjectone){
												sndemitone=audio_emitter_create()				
												audio_play_sound_on(sndemitone,choose(snd_crab_fish_1,snd_crab_fish_2,snd_crab_fish_3),false,8)
												audio_emitter_falloff(sndemitone, 48, Control.falloff_max, Control.falloff_factor)					
											}	
									type=1
									pin=60
									move=0
									diddmg=0
									dmg=1
									ticky=0
									tick=choose(0,1)
									if(tick==0){
										ticky=random(4)
									}else{
										ticky=random(4)*-1
									}
						
									dmg+=dmg*(Control.invenArray[25,3]*0.01)
									creator=other.id
									sprite_index=abil_tree_spr
									depth=other.depth-1
									spin=1
									img=2+choose(0,2,4,6)
									imgcap=1
									imgsped=0.02
									image_speed=0
									image_index=img+random(1.9)
									dur=90+12
									durtotal=dur
									phase=0
									speed=random_range(0.58,0.62)
									temp=other.temp
									inside=0
										if(other.temp==-1){
											direction=0
										}else{
											if(other.temp==2){
												direction=20
											}else{
												if(other.temp==-2){
												 direction=180-20
												}else{
													if(other.temp==3){
													 direction=0-20
													}else{
														if(other.temp==-3){
														 direction=180+20
														}							
													}					
												}
											}			
										}
										image_angle=direction*other.dir
										imgangle=direction
										if(other.temp==-2||other.temp=-3){
											imgangle+=180
										}							
									hsp=hsp
									hsp=hspeed
									vsp=vspeed
									speed=0
									if(other.temp==-1){
										hsp=hsp*-1
									}
									if(direction==180){
										imgangle=0
									}
										if(hsp<0){
											dir=-1
											if(temp==1){
												dir=-1
												imgangle=0
												yscale=-1
											}
										}
										image_angle=0
										sped=hsp
									}							
								}
									if(Me.passivefourArray[100,13]>0){
										if(image_index+imgsped>=img+2){
											image_index=img
										}		
									}
								
							}

							if(image_index>=img+imgcap-1){
								Me.passivefourArray[100,10]=0
								attdel=50
						
								img=178
								imgcap=5
								image_index=img
								imgsped=0.04
								dir=Me.dir
							
								dir=1
							}

					}else{
						if(Me.passivefourArray[100,10]!=1){
							Me.passivefourArray[100,10]=0
						}
					
					}
	
				delay+=1
			}else{
				
				//Death Phase
				if(phase==4){
						img=193
						image_index=img
						imgcap=9
						imgsped=0.08
						dir=Me.dir				
					phase=5
					
					for(i=0;i<7;i+=1){
					
									created=instance_create_depth(x-0.5+random(1),y+7.5-1+random(2),0,Abil)
									with(created){
											sndobjectone=instance_create_depth(x,y+3,0,Snd)
											with(sndobjectone){
												sndemitone=audio_emitter_create()				
												audio_play_sound_on(sndemitone,choose(snd_crab_fish_1,snd_crab_fish_2,snd_crab_fish_3),false,8)
												audio_emitter_falloff(sndemitone, 48, Control.falloff_max, Control.falloff_factor)					
											}	
									type=1
									pin=60
									move=0
									diddmg=0
									dmg=1
									ticky=0
									tick=choose(0,1)
									if(tick==0){
										ticky=random(4)
									}else{
										ticky=random(4)*-1
									}
						
									dmg+=dmg*(Control.invenArray[25,3]*0.01)
									creator=other.id
									sprite_index=abil_tree_spr
									depth=other.depth-1
									spin=1
									img=2+choose(0,2,4,6)
									imgcap=1
									imgsped=0.02
									image_speed=0
									image_index=img+random(1.9)
									dur=90+12
									durtotal=dur
									phase=0
									if(other.i mod 2==0){
										speed=random_range(0.58,0.62)
									}else{
										speed=random_range(0.38,0.42)
									}
									temp=other.temp
									inside=0

										direction=30+other.i*20

										image_angle=direction
										imgangle=direction							
									hsp=hsp
									hsp=hspeed
									vsp=vspeed
									speed=0
										image_angle=0
										sped=hsp
									}	
					}
					
				}
				
				if(phase==5){
					if(image_index>=img+imgcap-1){
						instance_destroy()
					}
				}
			
			}
			}
		
		}
		
	}else{
#endregion
#endregion
#endregion

#region Candy
#region Abil 1 Cookie Candy
			//____________________________________________________________________________---------------------(Candy Cookie abil1)---------------------____________________________________________________________________________
			if(pin==70){
				
				/*
				with(sndobjectone){
					audio_emitter_position(sndemitone,other.x,other.y,0)	
				}
				*/
				

				
				//Gumdrop
				if(bouncecd<=0){
					
					if(instance_exists(Fakeblock)){
						hit=instance_place(x+hsp,y,Fakeblock)
						if(hit!=noone){
							hsp=hsp*-1.1
							dur+=30
							bouncecd=10
							colors=hit.colors
							if(colortick==0){
								colortick=1
							}
						
						}
						hit=instance_place(x,y+vsp,Fakeblock)
						if(hit!=noone){
							vsp=vsp*-1.1
							dur+=30
							bouncecd=10
							colors=hit.colors
							if(colortick==0){
								colortick=1
							}							
						}	
					}
				}else{
				
					bouncecd-=1
				}
				
				if(colortick==1){
					colortick=2
					dmg+=1
				}
				
				imgangle+=hsp*3

				chance=0
				if(Control.talentmapArray[3,1]>0){
					chance=1	
				}

					if(chance==0||dur mod 5==0){

							if(fire==1){
								for(i=0;i<fireamount;i+=1){
									with(fireArray[i]){
										x=other.x-startx
										y=other.y-starty
										dur=10
									}
								}
								if(choose(0,1)==0){
									//Regular Cookie Part flying
									created=instance_create_depth(x-2+random(4),y-2+random(6),0,Part)
									with(created){
										type=1
										pin=1
										depth=other.depth+2
										spin=1
										img=6
										img=171
										if(other.burnt>0){
											img=223
										}
										imgcap=3
										imgsped=0
										image_speed=0
										image_index=irandom_range(img,img+imgcap)
										dur=6+choose(0,0,0,1,1,2)+irandom(8)
										durtotal=dur
										hsp=0
										vsp=0
										imgangle=random(360)
										image_angle=imgangle

									}									
								}else{
								
									//Fire Cookie Part flying
									created=instance_create_depth(x-2+random(4),y-2+random(6),0,Part)
									with(created){
										type=1
										pin=1
										depth=other.depth+2
										spin=1
										img=6
										img=229
										imgcap=3
										imgsped=0.2
										image_speed=0
										image_index=irandom_range(img,img+imgcap)
										dur=16+choose(0,0,0,1,1,2)+irandom(12)
										durtotal=dur
										hsp=0
										vsp=0
										imgangle=random(360)
										image_angle=imgangle

									}									
								}
							}else{
							
								//Regular Cookie Part flying
								created=instance_create_depth(x-2+random(4),y-2+random(6),0,Part)
								with(created){
									type=1
									pin=1
									depth=other.depth+2
									spin=1
									img=6
									img=171
									if(other.burnt>0){
										img=223
									}
									imgcap=3
									imgsped=0
									image_speed=0
									image_index=irandom_range(img,img+imgcap)
									dur=6+choose(0,0,0,1,1,2)+irandom(8)
									durtotal=dur
									hsp=0
									vsp=0
										imgangle=random(360)
										image_angle=imgangle
								}								
							}						
						
					}
					if(dur mod 3==0){
							if(colors!=-1){
								created=instance_create_depth(x-2+random(4),y-2+random(6),0,Part)
								with(created){
									sprite_index=abil_candy_spr
									type=1
									pin=1
									depth=choose(other.depth+1,other.depth+3)
									spin=1
									img=213+other.colors*5
									imgcap=2
									imgsped=0
									image_speed=0
									image_index=irandom_range(img,img+imgcap)
									image_angle=random(360)
									dur=14+choose(0,0,0,1,1,2)+irandom(8)
									durtotal=dur
									hsp=0
									vsp=0

								}					
							}							
					}
						
					//Collide with gum
					hit=instance_place(x,y,Abil)
					if(hit!=noone){
						with(hit){
							if(pin==72){
								if(phase==1){
									//phase=0
									//dur=3
									if(abs(other.hsp)<0.2){
										if(x<other.x){
											hsp=-sped
										}else{
											hsp=sped
										}
									}else{
										hsp=clamp(other.hsp,-sped,sped)
									}
									if(abs(other.vsp)<0.2){
										if(y<other.y){
											vsp=-sped*0.25
										}else{
											vsp=sped*0.25
										}
									}else{
										vsp=clamp(other.vsp,-sped,sped)
									}
								}
							}
						}
					}

			
					if(phase==1){
						if(dur<=0){

								phase=0 
								dur=10
								visible=false
								hsp=0
								vsp=0
								phasecheck=1
							
						}
						
					abil_dmg_scr()
						if(hit!=noone){
							if(hit.team!=0){
								with(hit){
										hurttick=1
										dmgrecieved+=other.dmg
										Me.damagedone+=dmgrecieved
										Control.target=id
									
									if(other.fire==1){	
										effectArray[3,0]=effectArray[3,1]*3.5
										
										if(effectArray[3,3]<3+Control.talentmapArray[18,1]){
											effectArray[3,3]+=1
										}	
										
										//effectArray[3,0]=20
										//effectArray[3,3]=1
									}		
										
								}
								
								//if(Control.talentmapArray[19,1]>0){
									if(Me.passivefourArray[10,3]==0){
										Me.passivefourArray[10,0]+=10
									}
								//}
								phase=0					
								dur=3
							}
						}
					}
						if(phase==0){
							dur=0
								//Cookie Parts
								for(i=0;i<4;i+=1){
									created=instance_create_depth(x,y,0,Part)
									with(created){
									type=2
									pin=1
									pintwo=1
									depth=other.depth+1
									spin=1
									img=other.img+1
									imgcap=3
									imgsped=0
									sprite_index=abil_candy_spr
									image_speed=0
									image_index=img+other.i
									image_angle=other.imgangle
									dur=70+irandom(70)
									direction=other.i*90+other.imgangle+45
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

						}
					
			}else{
#endregion
#region Abil 2 Cake Candy
			//____________________________________________________________________________---------------------(Candy Cake abil2)---------------------____________________________________________________________________________
			if(pin==71){
				
				/*
				with(sndobjectone){
					audio_emitter_position(sndemitone,other.x,other.y,0)	
				}
				*/
				if(instance_place(x+hsp,y+vsp,Block)){
					y-=3
					vsp=0
				}
				
					
					if(instance_place(x,y,Block)){
						dur=0
					}
					
					if(instance_place(x,y,Me)){
						if(Me.y<y&&Me.vsp>=0){
							Me.vsp=0-Me.grav
							Me.hsp=hsp
						}	
					}
				
				
				x+=hsp
				y+=vsp
				
				//imgangle+=hsp*3
				target=instance_nearest(x,y,Enemy)
				if(target!=noone){
					if(point_distance(x,y,target.x,target.y)<64){
						move_towards_point(target.x,target.y,0.2)
					}
				}

							created=instance_create_depth(x-2+random(4),y-2+random(6),0,Part)
							with(created){
							type=1
							pin=1
							depth=other.depth+1
							spin=1
							img=6
							img=171
							imgcap=3
							imgsped=0
							image_speed=0
							image_index=irandom_range(img,img+imgcap)
							dur=6+choose(0,0,0,1,1,2)+irandom(8)
							durtotal=dur
							hsp=0
							vsp=0

							}		
						
					
			
					if(phase==1){
						if(dur<=0){

								phase=0 
								dur=10
								visible=false
								hsp=0
								vsp=0
								phasecheck=1
							
						}
					abil_dmg_scr()
						if(hit!=noone){
							if(hit.team!=0){
								with(hit){
										hurttick=1
										dmgrecieved+=other.dmg
										Me.damagedone+=dmgrecieved
										Control.target=id
								}
								phase=0					
								dur=3
							}
						}
					}
						if(phase==0){
							dur=0
								//Cookie Parts
								for(i=0;i<4;i+=1){
									created=instance_create_depth(x,y,0,Part)
									with(created){
									type=2
									pin=1
									pintwo=1
									depth=other.depth+1
									spin=1
									img=other.img+1+3
									imgcap=3
									imgsped=0
									sprite_index=abil_candy_spr
									image_speed=0
									image_index=img+other.i
									image_angle=other.imgangle
									dur=50+irandom(50)
									direction=other.i*90+other.imgangle+45
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

						}
					
			}else{
#endregion
#region Abil 3 Item Select Candy
			//____________________________________________________________________________---------------------(Candy Item Select abil 3)---------------------____________________________________________________________________________
			if(pin==72){
				if(phase==0){
					
					x=Me.x
					y=Me.y-23
					
					Me.stun=2
					
					dur=10
					chance=0
					
					if(global.con_p_up||global.conp_p_up){
						image_index=img+1
						chance=1
					}else{
						if(global.con_p_right||global.conp_p_right){
							image_index=img+2
							chance=1
						}else{
							if(global.con_p_down||global.conp_p_down){
								image_index=img+3
								chance=1
							}else{
								if(global.con_p_left||global.conp_p_left){
									image_index=img+4
									chance=1
								}else{
					
								}					
							}					
						}					
					}
					
					//if(global.con_p_w||global.conp_p_w){
					if(chance==1){
						Me.stun=0
						
						Me.abilArray[2,1]=Me.abilArray[2,2]-((Me.abilArray[2,2]*0.05)*Control.talentmapArray[11,1])
						
						//Balloons
						if(image_index==img+1){
							with(Me){
								if(passivefourArray[1,1]>0){
									passivefourArray[1,0].fly=1
									passivefourArray[1,0]=0
								}
							}
							Me.passivefourArray[1,1]=1
							//Me.abilArray[2,1]=Me.abilArray[2,2]
							
							
							instance_destroy()
						}else{
							//Candy Throw
							if(image_index==img+2){
										img=139
										imgcap=3
										image_index=img+irandom(imgcap)
										image_index=img
										
										imgsped=0
										image_speed=0
										y+=6

											dir=Me.dir
											if(dir==1){
												direction=0
											}else{
												direction=180			
											}
											
											y+=10
											
											sped=1.2-0.05+random(0.1)
											speed=sped
											dur=60+irandom(20)
			
											durtotal=dur
											phase=3
	
	
												//image_angle=random(360)
												//imgangle=image_angle
												//imgangle=0

											hsp=hsp
											hsp=hspeed
											vsp=vspeed
											speed=0
											imgtick=0
											delay=0
											
											timer=40
											
											dmg=2
											dmgtotal=10
											
											imgangle=random(360)
											chancethree=1
											vsp=random_range(-0.5,0.5)
											vsp-=1.8
											grav=0.1
											
											chance=4
											if(Control.talentmapArray[12,1]>0){
												chance=6
											}
											for(i=0;i<chance;i+=1){
												created=instance_create_depth(x-6+random(12),y-2+random(4),0, Abil)
												with(created){
													chancethree=2
													sprite_index=abil_candy_spr
													visible=true
													pin=72
													img=139
													imgcap=3
													
													image_index=img+irandom(imgcap)
													
													if(Control.talentmapArray[12,1]>0){
														if(other.i==1||other.i==2){
															img=139
															imgcap=4
															image_index=img+imgcap
														}
													}
										
													imgsped=0
													image_speed=0
													y+=6

														dir=Me.dir
														if(dir==1){
															direction=0
														}else{
															direction=180			
														}
											
											
														sped=1.2-0.05+random(0.1)
														speed=sped
														dur=60+irandom(20)
			
														durtotal=dur
														phase=3

														hsp=hsp
														hsp=hspeed
														vsp=vspeed
														speed=0
														imgtick=0
														delay=0
											
														timer=40
											
														dmg=2
														dmgtotal=10
														
														imgangle=random(360)
														
														vsp=random_range(-0.5,0.5)
														vsp-=1.8
														grav=0.1
												}
											}

							}else{
								//Chocolate Sugar Rush
								if(image_index==img+3){
									
										img=144
										image_index=img
										dur=600
										imgcap=5
										
										if(Control.talentmapArray[12,1]>0){
											img=161
											image_index=img
											dur=600+300
											imgcap=8								
										}
										durtotal = dur
										duramt=floor(dur/imgcap)
										
										phase=2									
								}else{
									//Bubblegum
									if(image_index==img+4){
										img=85
										imgcap=10
										imgsped=0
										phase=1
										y+=6

											dir=Me.dir
											if(dir==1){
												direction=0
											}else{
												direction=180			
											}
											
											y+=16
											
											sped=0.8
											speed=sped
											if(Control.talentmapArray[12,1]>0){
												dur=600
											}else{
												dur=400
											}
			
											durtotal=dur
											phase=1
	
	
												//image_angle=random(360)
												//imgangle=image_angle
												//imgangle=0

											hsp=hsp
											hsp=hspeed
											vsp=vspeed
											speed=0
											imgtick=0
											delay=0
											
											timer=40
											
											dmg=2
											dmgtotal=10
											
											dmgArray[0]=0
											dmgArray[1]=0
											durmin=70
										
									}else{
									
									}
								}
							}
						}					

						
					
					}				
					
					
				}else{
				
					//Bubblegum
					if(phase==1){
						


						
						if(delay<=0){
							if(instance_place(x,y+vsp,Block)){
								vsp=vsp*-1
								delay=30
							}
							if(instance_place(x+hsp,y,Block)){
								hsp=hsp*-1
								delay=30
							}

						}else{
							delay-=1
						
						}

						if(instance_place(x,y,Block)){
							y-=1
						}

						x+=hsp
						y+=vsp

						if(dur mod 180==0){
							dmgArray[0]=0
						}

						diddmg=0
						if(dmg<dmgtotal){
							abil_dmg_scr()
							if(hit!=noone){
								if(hit.team!=0){
									with(hit){
										chance=1
										if(other.dmgArray[0]!=0){
											for(i=0;i<other.dmgArray[0];i+=1){
												if(other.dmgArray[i+1]==id){
													chance=0
												}
											}
										}
										if(chance==1){
											other.diddmg=1
											hurttick=1
											dmgrecieved+=other.dmg
											other.dmgtotal+=other.dmg
											Me.damagedone+=dmgrecieved
											other.dmgArray[0]+=1
											other.dmgArray[other.dmgArray[0]]=id
											debuffArray[1,0]=250
										}
									}
								if(diddmg==1){	
									for(i=0;i<3;i+=1){
										created=instance_create_depth(x-3+random(6),y-3+random(6),0,Part)
										with(created){
											type=1
											pin=1
											sprite_index=abil_candy_spr
											depth=other.depth+1
											spin=1
											img=135
											imgcap=3
											imgsped=0
											image_speed=0
											image_index=irandom_range(img,img+imgcap)
											dur=6+choose(0,0,0,1,1,2)+irandom(8)
											durtotal=dur
										
											chance=0.2
											hsp=random_range(chance*-1,chance)
											vsp=random_range(chance*-1,chance)

										}
									}
								}
								}
							}
						}else{
						
							if(dur>durmin){
								dur=durmin
							}
						}
							
					
						
						imgangle+=hsp*2
					
						if(imgtick==0){
							if(image_index<img+6){
								image_index+=0.08
								
								chance=((image_index*-1)+img)*0.5
								
								if(Me.dir==1){
									x=Me.x+3-(chance*1.5)
								}else{
									x=Me.x-3+(chance*1.5)
								}
								
								y=Me.y+chance
								
								if(hsp<0&&Me.dir==1){
									hsp=hsp*-1
								}
								if(hsp>0&&Me.dir!=1){
									hsp=hsp*-1
								}								
							}else{
								imgtick=1
							}

							
						}else{
							if(imgtick==1){
								if(dur>durmin){
									if(dur mod 55==0){
										//vsp+=choose(0.05,-0.05)
										if(image_index==img+6){
											image_index=img+5
										}else{
											image_index=img+6
										}
									}
								}
								
								if(instance_place(x,y,Me)){
					
										with(Me){
											if(jumps<=0&&vsp>=-1){
												if(con_h_space){
													if(y>other.y-5){
														vsp=-5.2
														if(other.dur>other.durmin){
															other.dur=other.durmin
														}
														for(i=0;i<3;i+=1){
															created=instance_create_depth(x-3+random(6),y-3+random(6),0,Part)
															with(created){
																type=1
																pin=1
																sprite_index=abil_candy_spr
																depth=other.depth+1
																spin=1
																img=135
																imgcap=3
																imgsped=0
																image_speed=0
																image_index=irandom_range(img,img+imgcap)
																dur=6+choose(0,0,0,1,1,2)+irandom(8)
																durtotal=dur
										
																chance=0.2
																hsp=random_range(chance*-1,chance)
																vsp=random_range(chance*-1,chance)

															}
														}
													}
												}
											}
										}
								}								
							}
						
						}
						

						
						if(dur<durmin){
							hsp=hsp*0.97
							vsp=vsp*0.97
							
							if(image_index>=img+0.1){
								image_index-=0.1
							}							
						}
						
						if(dur==0){
							instance_destroy()
						}

					
					}else{
						
						//Sugar Rush (Chocolate)
						if(phase==2){

							if(dur mod 3==0){
									created=instance_create_depth(Me.x-5+random(10),Me.y-6+random(14),0,Part)
									with(created){
									type=1
									pin=1
									depth=Me.depth+choose(-1,1,1)
									spin=1
									img=6
									img=173
									imgcap=2
									imgsped=0
									image_speed=0
									image_index=irandom_range(img,img+imgcap)
									dur=12+choose(0,0,0,1,1,2)+irandom(8)
									durtotal=dur
									hsp=random_range(-0.1,0.1)
									vsp=random_range(-0.1,0.1)
									image_angle=random(360)
									imgangle=image_angle

									}	
							}

							if(dur mod duramt==0){
								image_index+=1
							}
							
									chance=Me.spedsave
										//Speed
										chance+=(5*0.034)*2
				
										if(chance>0){
											Me.sped=chance
										}							
							
								x=Me.x
								y=Me.y-10

								if(dur<=0){
									Me.sped=Me.spedsave
									instance_destroy()
								}

						}else{
							
							//Candy Throw
							if(phase==3){
							
							vsp+=grav
							
							imgangle+=hsp*5
							
							if(instance_place(x,y,Block)){
								hsp=0
								vsp=0
							}

							x+=hsp
							y+=vsp


							abil_dmg_scr()
							if(hit!=noone){
								if(hit.team!=0){
									with(hit){

											other.diddmg=1
											hurttick=1
											dmgrecieved+=other.dmg
											other.dmgtotal+=other.dmg
											Me.damagedone+=dmgrecieved

									}
									dur=0
								}
							}


							if(dur==0){

								//Candy Wrapper Parts
								for(i=0;i<2;i+=1){
									created=instance_create_depth(x,y,0,Part)
									with(created){
									type=2
									pin=1
									pintwo=1
									depth=other.depth+1
									spin=1
									img=other.image_index+10+(other.image_index-139)+other.i
									imgcap=2
									imgsped=0
									sprite_index=abil_candy_spr
									image_speed=0
									image_index=img
									image_angle=other.imgangle
									dur=50+irandom(50)
									direction=other.i*90+other.imgangle+45
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
								
									//Chocolate ball part
									created=instance_create_depth(x,y,0,Part)
									with(created){
									type=2
									pin=1
									pintwo=1
									depth=other.depth+1
									spin=1
									img=160
									imgcap=2
									imgsped=0
									sprite_index=abil_candy_spr
									image_speed=0
									image_index=img
									image_angle=other.imgangle
									dur=75+irandom(50)
									direction=other.i*90+other.imgangle+45
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
								
								instance_destroy()
							}
							
							}
						}					
					}
				}
				
				
			}else{
//Cinnamon roll
#region Abil 2 Cinnamon roll Candy
			//____________________________________________________________________________---------------------(Candy Cinnamon roll 2)---------------------____________________________________________________________________________
			if(pin==73){
				if(phase==0){
					
					if(attdel>0){	
						attdel-=1
					}else{
						abil_dmg_scr()
							if(hit!=noone){
								if(hit.team!=0){
									with(hit){
											hurttick=1
											dmgrecieved+=other.dmg
											Me.damagedone+=dmgrecieved
											Control.target=id
											if(other.dmgtimes==1){
												other.dmgtimes=0
												other.img=234
												other.image_index=other.img
												other.dmg=other.dmg*0.5
												//other.hsp=other.hsp*-0.6
												other.vsp=other.vsp*-0.6
												other.imgangle=random(360)
												other.attdel=30
											}else{
												other.dur=0
											}
									}
			
								
								}
							}
					}
					
					vsp = vsp + grav
					grounded=0
					if(place_meeting(x,y+1,Block)){
						grounded=1
					}
					if(hsp>0){
						if(hsp-gravtwo>=0){
							if(grounded==1){
							hsp-=gravtwo
							}else{
								if(hsp+gravthree>=0){
								hsp-=gravthree
								}else{
								hsp=0
								}
							}
						imgangle-=hsp*3
						}else{
						hsp=0
						}
					}else{
						if(hsp+gravtwo<=0){
							if(grounded==1){
							hsp+=gravtwo
							}else{
								if(hsp+gravthree<=0){
								hsp+=gravthree
								}else{
								hsp=0
								}
							}
						imgangle-=hsp*3
						}else{
						hsp=0
						}		
					}
					if(place_meeting(x+hsp,y,Block)){
						yplus=0
						while(place_meeting(x+hsp,y-yplus,Block)&& yplus <= abs(3*hsp)){
							yplus += 1
						}
						if(place_meeting(x+hsp,y-yplus,Block)){
							while(!place_meeting(x+sign(hsp),y,Block)){
								x = x + sign(hsp)
							}
						}else{
							y -= yplus
							//hsp=hsp * 0.99
						}
					}
					if(place_meeting(x+hsp,y,Block)){
						while(!place_meeting(x+sign(hsp),y,Block)){
							x = x + sign(hsp)
						}
						if(hsp>0){
							if(hsp>0.1){
							hsp=hsp*-0.95
							audio_play_sound_at(choose(snd_pumpkin_thud_4,snd_pumpkin_thud_5,snd_pumpkin_thud_6),x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
							}else{
							hsp=0
							}
						}else{
							if(hsp<0){
								if(hsp<-0.1){
								hsp=hsp*-0.95
								audio_play_sound_at(choose(snd_pumpkin_thud_4,snd_pumpkin_thud_5,snd_pumpkin_thud_6),x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
								}else{
								hsp=0
								}
							}else{
			
							}			
						}
					}
		
					if(place_meeting(x,y+vsp,Block)){
						while(!place_meeting(x,y+sign(vsp),Block)){
							y = y + sign(vsp)
						}
						if(vsp>1.5){
						vsp=vsp*-0.95
						audio_play_sound_at(choose(snd_pumpkin_thud_4,snd_pumpkin_thud_5,snd_pumpkin_thud_6),x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
						}else{
						vsp=0
						}
					}

					x=x+hsp
					y=y+vsp


					if(dur mod 8==0){
						//Frosting
								//for(i=0;i<4;i+=1){
								if(abs(hsp)>0){
									created=instance_create_depth(x,y,0,Part)
									with(created){
										type=2
										pin=1
										pintwo=1
										depth=other.depth+choose(1,-1)
										spin=1
										img=216
										imgcap=1
										imgsped=0
										sprite_index=abil_candy_spr
										image_speed=0
										image_index=img+irandom(imgcap)
										image_angle=other.imgangle
										dur=15+irandom(15)
										direction=random(360)
										image_angle=direction
										speed=-random_range(0.1,0.4)
										durtotal=dur
										hsp=hspeed
										vsp=vspeed
										grav=0.04
										gravtwo=0.03
										chance=1
										xscale=chance
										yscale=chance
										phase=1
										speed=0
									}	
								}
								//}						
					}

					if(dur==0){
							for(i=0;i<8;i+=1){
									created=instance_create_depth(x-3+random(6),y-3+random(6),0,Part)
									with(created){
										type=2
										pin=1
										pintwo=1
										depth=other.depth+choose(1,-1)
										spin=1
										img=216
										imgcap=1
										imgsped=0
										sprite_index=abil_candy_spr
										image_speed=0
										image_index=img+irandom(imgcap)
										image_angle=other.imgangle
										dur=30+irandom(30)
										direction=random(360)
										image_angle=direction
										speed=-random_range(0.4,0.8)
										durtotal=dur
										hsp=hspeed
										vsp=vspeed
										grav=0.04
										gravtwo=0.03
										chance=1
										xscale=chance
										yscale=chance
										phase=1
										speed=0
									}									
							}
						
								//Cinn Parts
								for(i=0;i<4;i+=1){
									created=instance_create_depth(x,y,0,Part)
									with(created){
									type=2
									pin=1
									pintwo=1
									depth=other.depth+1
									spin=1
									img=other.img+1
									imgcap=3
									imgsped=0
									sprite_index=abil_candy_spr
									image_speed=0
									image_index=img+other.i
									image_angle=other.imgangle
									dur=70+irandom(70)
									direction=other.i*90+other.imgangle+45
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
					}
				}
			}else{
				if(pin==74){
				
				}else{
				if(pin==75){
				
				}else{
					//Trash
					//Abil 1 Rat
					if(pin==80){
						
						
						x+=hsp
						y+=vsp
						
						/*
						if(grounded==1){
							if(jump>0){
								jump-=1
								if(jump==0){
									jumptick=1
								}
							}
						}
						*/
						if(point_distance(x,y,Me.x,Me.y)>100){
							//disttimer+=1
						}else{
						
							disttimer=0
						}
						
						
						
						if(global.con_h_e&&global.con_p_up){
							jumptick=1
						}
						
						if(global.con_h_e&&global.con_p_right){
							target=0
							if(hsp<0){
								hsp=hsp*-1
								image_xscale=1
								if(dir==1){
									dir=-1
								}else{
									dir=1
								}									
							}
						
						}
						if(global.con_h_e&&global.con_p_left){
							target=0
							if(hsp>0){
								hsp=hsp*-1
								image_xscale=-1
								if(dir==1){
									dir=-1
								}else{
									dir=1
								}									
							}
						
						}	
						disttimer=0
						
							if(global.con_h_e&&global.con_p_down|| disttimer >= 100){
							    if(instance_place(x, y, Me) || disttimer >= 100){
							        with(Me){
							            // Find the last slot in the inventory
							            var lastSlot = -1;
							            for(i=0; i<passivefourArray[1,5]; i+=1){
							                if(passivefourArray[1,6+i] == 10){
							                    lastSlot = i;
							                    break;
							                }
							            }
            
							            // If an empty slot was found, add the mouse to it
							            if(lastSlot != -1){
							                passivefourArray[1,6+lastSlot] = other.colors;
							            }
							        }
        
							        instance_destroy();
							    }else{
									target=Me
								}
							}
							
							
							if(targetcd>0){
								targetcd-=1
							}
							
							if(jumptimer>0){
								jumptimer-=1
								
								if(vsp>0){
									if(grounded==0){
										if(jumps>0){
											if(y>Me.y+32){
												jumptick=1
											}
										}
									}
								}
							}
							
							if(target==Me){
								if(targetcd<=0){
									
									targetcd=30+irandom(15)
									
									if(jumptimer==0){
										if(y>Me.y+32){
											jumptick=1
											jumptimer=120
										}
									}
									
									if(x<Me.x-3){
										if(hsp<0){
											hsp=hsp*-1
											image_xscale=1
											if(dir==1){
												dir=-1
											}else{
												dir=1
											}									
										}									
									}else{
										if(x>Me.x+3){
											if(hsp>0){
												hsp=hsp*-1
												image_xscale=-1
												if(dir==1){
													dir=-1
												}else{
													dir=1
												}									
											}									
										}else{
									
									
										}										
									
									}	
								}
							}
						

							if(global.con_h_w&&global.con_p_down){
								Me.mouse-=1
								instance_destroy()
							}

						chance=instance_place(x, y, Abil)
						if(chance!=noone){
							if(chance.pin==82){
								with(chance){
									hit=other
									//hsp=Me.hsp*0.5
									vsp=hit.vsp*0.25
			
									if(hit.dir==1){
										if(x<hit.x-3){
											hsp=-weight*0.65
										}else{
											hsp=weight*0.65
										}
									}else{
										if(x<hit.x+3){
											hsp=-weight*0.65
										}else{
											hsp=weight*0.65
										}			
			
									}
				
									vsp-=0.2
									grounded=0
									//dir=Me.dir
									}
							}
						}	

						if(attdel>0){
							attdel-=1
						}else{
						abil_dmg_scr()
							if(hit!=noone){
								if(hit.team!=0){
									atttick=14
									img=imgsave+7
									image_index=img
									anim=4
									attdel=120
									imgsped=0
									

			
								
								}
							}
						}
						
						if(anim==4){
							if(atttick>0){
								atttick-=1
								if(atttick==10){
										img=imgsave+8
										image_index=img		
										if(instance_exists(hit)){
											if(instance_place(x,y,hit)){
												with(hit){
														hurttick=1
														dmgrecieved+=other.dmg
														Me.damagedone+=dmgrecieved
														Control.target=id
												}	
											}
										}
										
								}
							}
						}
						
						if(jumps>0){
							if(jumptick==1){
								jumps-=1
								//jumptick=0
									jump=irandom_range(240,360)
									vsp=-2.6					
							}
						}
						jumptick=0
						
						grounded=0
						if(instance_place(x,y+1,Block)){
							grounded=1
							jumps=1
							
								if(anim!=1&&atttick==0){
									anim=1
									animtick=1
									imgsped=0.12
								}
						}
						
						if(grounded==0&&atttick==0){
							if(vsp<0){
								if(anim!=2){
									anim=2
									animtick=1
									imgsped=0.04
								}
							}else{
								if(anim!=3){
									anim=3
									animtick=1
									imgsped=0.08
								}								
							}
						}
						
						
						//Grounded Run
						if(anim==1){
							if(animtick==1){
								animtick=0
								img=imgsave
								image_index=img
								imgcap=2
								imgsped=0.12
							}
						
						}else{
							//Jump
							if(anim==2){
								if(animtick==1){
									animtick=0
									img=imgsave+3
									image_index=img
									imgcap=1
									imgsped=0.12
								}
						
							}else{
								//Fall
								if(anim==3){
									if(animtick==1){
										animtick=0
										img=imgsave+5
										image_index=img
										imgcap=1
										imgsped=0.12
									}
						
								}else{
						
								}								
							}						
						}
						
						if(instance_place(x,y,Block)){
							y-=1
						}
						
						vsp+=grav
						
						
						
						if(instance_place(x,y+vsp,Block)){
							vsp=0
						}
						if(turndel>0){
							turndel-=1
						}else{
							if(instance_place(x+hsp,y-4,Block)){
								//hsp=0
									turndel=15
									hsp=hsp*-1
								if(dir==1){
									dir=-1
								}else{
									dir=1
								}
							}
						}
						
							
						
						
					}else{
				
			//____________________________________________________________________________---------------------(Trash Abil Two: Garbage Bag)---------------------____________________________________________________________________________					
				if(pin==81){
					
					imgangle+=hsp*1
					image_angle=imgangle

							abil_dmg_scr()
							if(hit!=noone){
								if(hit.team!=0){
									with(hit){
											hurttick=1
											dmgrecieved+=other.dmg
											Me.damagedone+=dmgrecieved
											Control.target=id

									}
									trashtick=12
								
								}
							}

					if(hsp!=0||vsp!=0){
						if(dur mod 20==0){
							//trashtick=1
						}
					}else{
						imgsped=0
					}
					
					if(trashtick>0){
						for(i=0;i<trashtick;i+=1){
								created=instance_create_depth(x-4+random(8),y-4+random(8),0,Abil)
	
								with(created){
						
									grounded=0
									anim=0
									animtick=0
									disttimer=0
			
								type=0
								pin=82
								move=0
								diddmg=0
								dmg=3
								turndel=0
								target=0
								targetcd=0
			
								chance=dmg
			
								//dmg+=dmg*(Control.talentmapArray[1,1]*0.05)
			
								dmg+=chance*(Control.talentmapArray[3,1]*0.25)
								dmg+=chance*(Control.invenArray[25,3]*0.01)
			
								creator=other.id
			
								depth=other.depth-1
								spin=1
								extra=0	
			
								sprite_index=abil_trash_spr
								img=124
								imgsave=img
			
								imgcap=9
								imgsped=0
								attdel=0
								atttick=0
			
								image_speed=0
								image_index=irandom_range(img,img+imgcap)
			
								speed=0
								dur=200+irandom(50)
								dur+=400
			
								durtotal=dur
								phase=1
							
									image_angle=random(360)
									imgangle=image_angle
									//dir=Me.dir

								if(other.trashtick>1){
									hsp=random(1.5)*choose(1,-1)
									vsp=random_range(1,2.5)*-1
									y-=3
								}else{
									hsp=random(0.5)*choose(1,-1)
									vsp=-1.3								
								}
								
									hsp=random_range(-0.8,0.8)
									
									if(choose(0,1,1)==0){
										hsp=hsp*0.5
									}
									
									vsp=random_range(1,2)*-1
									y-=3	
									
									if(hsp>=0){
										dir=1
									}else{
										dir=-1
									}
									
									weight=0.2+(image_index-img)*0.1
																	
								
								speed=0
			
								grav=0.08
								gravtwo=0.01
								
								grounded=0
			

								}					
							}		
							
						
						//Fruit Fly
						for(i=0;i<3;i+=1){
								created=instance_create_depth(x-8+random(16),y-8+random(16),0,Abil)
	
								with(created){
						
									grounded=0
									anim=0
									animtick=0
									disttimer=0
									
									
			
								type=0
								pin=83
								move=0
								diddmg=0
								dmg=1
								turndel=0
								target=0
								targetcd=0
								
								xoffset=x-other.x
								yoffset=y-other.y
								
								y-=16
			
								chance=dmg
			
								//dmg+=dmg*(Control.talentmapArray[1,1]*0.05)
			
								dmg+=chance*(Control.talentmapArray[3,1]*0.25)
								dmg+=chance*(Control.invenArray[25,3]*0.01)
			
								creator=other.id
			
								depth=other.depth-1
								spin=1
								extra=0	
			
								sprite_index=abil_trash_spr
								img=choose(143, 146)
								img=143
								imgsave=img
			
								imgcap=2
								imgsped=0.1
								attdel=0
								atttick=0
			
								image_speed=0
								image_index=img+random(imgcap)
			
								sped=0.3
								dur=400+irandom(100)
								dur+=400
			
								durtotal=dur
								phase=1
								
								tick=choose(0,1)
								tickthree=choose(0,1)
								range=60
								ticktwo=irandom(range)
								rangetwo=120
								tickfour=irandom(range)
			
								sped=0.25+random(0.1)

								target=0

								}					
							}								


							
							if(trashtick>1){
								instance_destroy()
							}
						trashtick=0
					}



					if(!instance_place(x,y,Block)){
						x+=hsp
					}else{
						hsp=0
						vsp=0
						trashtick=12
					}
					if(!instance_place(x,y,Block)){
						y+=vsp
					}else{
						vsp=0
					}
					if(vsp<3){
						vsp+=grav
					}
					if(dir==1){
						if(hsp-gravtwo>=0){
							hsp-=gravtwo
						}else{
							hsp=0
						}
					}else{
						if(hsp+gravtwo<=0){
							hsp+=gravtwo
						}else{
							hsp=0
						}				
					}
					
					
				
				}else{
					
			//____________________________________________________________________________---------------------(Trash Abil Two: Garbage Individual)---------------------____________________________________________________________________________					
if(pin==82){

		
		imgangle+=hsp*5
		
		if(instance_place(x, y, Me)){
			//hsp=Me.hsp*0.5
			vsp=Me.vsp*0.25
			
			
			
			if(Me.dir==1){
				if(x<Me.x-3){
					hsp=-weight
				}else{
					hsp=weight
				}
			}else{
				if(x<Me.x+3){
					hsp=-weight
				}else{
					hsp=weight
				}			
			
			}
			
			
			vsp-=0.2
			grounded=0
			//dir=Me.dir
		}
		


	    // Move trash
	    x += hsp;
	    y += vsp;

	    // Check for collisions with Block
	    if(instance_place(x, y, Block)){
	        hsp = 0;
	        vsp = 0;
	        grounded = 1;
	    }else{
			grounded=0	
		}

	    // Apply gravity if not grounded
	    if(grounded == 0){
	        if(vsp < 3){
	            vsp += grav;
	        }
	    }


	    // Slow down horizontal movement based on direction
	    if(dir == 1){
	        if(hsp - gravtwo >= 0){
	            hsp -= gravtwo;
	        } else {
	            hsp = 0;
	        }
	    } else {
	        if(hsp + gravtwo <= 0){
	            hsp += gravtwo;
	        } else {
	            hsp = 0;
	        }				
	    }

	    // Destroy instance after duration
	    if(dur == 0){
	        instance_destroy();
	    }
}else{

			//____________________________________________________________________________---------------------(Trash: Fruit Fly)---------------------____________________________________________________________________________					
if(pin==83){


							abil_dmg_scr()
							if(hit!=noone){
								if(hit.team!=0){
									with(hit){
											hurttick=1
											dmgrecieved+=other.dmg
											Me.damagedone+=dmgrecieved
											Control.target=id

									}
									dur=0
								
								}
							}
		

		
		if(target==0){
			if(point_distance(x,y,Me.x+xoffset,Me.y+yoffset)<32){
				target=Me
			}
		}
		
		if(instance_exists(Enemy)){
			if(target==Me||target==0){
				hit=instance_nearest(x,y,Enemy)
				if(hit!=noone){
					if(hit.team!=0){
						if(point_distance(x,y,hit.x+xoffset,hit.y+yoffset)<48){
							target=hit
						}
					}
				}
			}
		}
		
			if(target!=0){
				if(target==Me||point_distance(x,y,Me.x+xoffset,Me.y+yoffset)<16){
				
				if(instance_exists(target)){
					if(x<target.x-10+xoffset){
						x+=sped
					}else{
						if(x>target.x+10+xoffset){
							x-=sped
						}else{
			
						}			
					}
					if(y<target.y-10+yoffset){
						y+=sped
					}else{
						if(y>target.y+10+yoffset){
							y-=sped
						}else{
			
						}			
					}	
				}
				}else{

					if(instance_exists(target)){
						if(x<target.x-2){
							x+=sped
						}else{
							if(x>target.x+2){
								x-=sped
							}else{
			
							}			
						}
						if(y<target.y-2){
							y+=sped
						}else{
							if(y>target.y+2){
								y-=sped
							}else{
			
							}			
						}	
					}else{
						target=0
					}

				}
			}
			
			if(point_distance(x,y,Me.x+xoffset,Me.y+yoffset)>150){
				target=0
			}

		if(tick==0){
			if(ticktwo<range){
				ticktwo+=1
				y-=0.03
			}else{
				tick=1
				ticktwo=0
			}
		}else{
		
			if(ticktwo<range){
				ticktwo+=1
				y+=0.03
			}else{
				tick=0
				ticktwo=0
			}		
		}

		if(tickthree==0){
			if(tickfour<range){
				tickfour+=1
				x-=0.03
			}else{
				tickthree=1
				tickfour=0
			}
		}else{
		
			if(tickfour<range){
				tickfour+=1
				x+=0.03
			}else{
				tickthree=0
				tickfour=0
			}		
		}

	    // Destroy instance after duration
	    if(dur == 0){
			
								//Fly
								for(i=0;i<3;i+=1){
									created=instance_create_depth(x,y,0,Part)
									with(created){
									type=2
									pin=1
									pintwo=1
									depth=other.depth+1
									spin=1
									img=146
									imgcap=3
									imgsped=0
									sprite_index=abil_trash_spr
									image_speed=0
									image_index=img+other.i
									image_angle=other.imgangle
									dur=40+irandom(15)
									direction=other.i*90+other.imgangle+45
									if(other.i==0){
										direction=140
									}else{
										if(other.i==1){
											direction=90
										}else{
											direction=40
										}									
									}
									speed=random_range(0.3,0.6)
									durtotal=dur
									hsp=hspeed
									vsp=vspeed
									//hsp+=other.hsp
									//vsp+=other.vsp
									grav=0.03
									gravtwo=0.03
									chance=1
									xscale=chance
									yscale=chance
									phase=1
									speed=0
									}		
								}				
			
	        instance_destroy();
	    }
}else{
					}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}
					}
				}
			}
		}}}}}}}}}}}}}}
		//End Brackets
		}else{
#endregion
#endregion

#region Enemy
		if(en==1){
#region Enemy Basic
			//____________________________________________________________________________---------------------(ENEMY Basic)---------------------____________________________________________________________________________		
			if(pin==32){
				//Acorn Leaf shot for example
					if(partmake>0){
						created=instance_create_depth(x-2+random(4),y-1.5+random(3),0,Part)
						with(created){
						type=1
						pin=1
						depth=other.depth+1
						spin=1
						img=22
						imgcap=3
						imgsped=0
						image_speed=0
						image_index=irandom_range(img,img+imgcap)
						dur=5+choose(0,0,0,1,1,2)+irandom(6)
						durtotal=dur
						hsp=0
						vsp=0
									chance=random_range(0.6,1)
									xscale=chance
									yscale=chance
						}	
					}
			}else{
#endregion
#region Enemy Basic
			//____________________________________________________________________________---------------------(Leaf)---------------------____________________________________________________________________________		
			if(pin==33){
				enemy_move_scr(7)
				if(rangetick==0){
					imgangle+=0.1
				}else{
					imgangle-=0.1
				}
			}else{
#endregion
#region Enemy Acorn Attack
			//____________________________________________________________________________---------------------(ENEMY Acorn)---------------------____________________________________________________________________________	
			if(pin==30){
			vsp+=grav
			imgangle-=spin*dir
			if(vsp>3){
				vsp=3
			}
			if(part==10){
			
					if(dur mod 2 ==0){
						created=instance_create_depth(x-4+random(8),y-4+random(8),0,Part)
						with(created){
						
						type=1
						pin=1
						depth=other.depth+1
						spin=1
						img=22
						imgcap=3
						imgsped=0
						image_speed=0
						image_index=img+choose(0,1,2,3)
						dur=6+choose(0,0,0,1,1,2)+irandom(6)
						durtotal=dur
						hsp=0
						vsp=0
									chance=random_range(0.6,1)
									xscale=chance
									yscale=chance
						}		
					}
			}
				

				if(instance_place(x,y+vsp,Block)){
				vsp=vsp*-yrebound
				audio_play_sound_at(choose(snd_pumpkin_thud_4,snd_pumpkin_thud_5,snd_pumpkin_thud_6),x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
				}
				if(instance_place(x+hsp,y,Block)){
				hsp=hsp*-0.4
				audio_play_sound_at(choose(snd_pumpkin_thud_4,snd_pumpkin_thud_5,snd_pumpkin_thud_6),x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
				}
			}else{
#endregion
#region Acorn Explosion
			//____________________________________________________________________________---------------------(ENEMY Acorn explosion)---------------------____________________________________________________________________________		
				if(pin==31){
							with(Me){
								hit=instance_place(x,y,other)	
								if(hit!=noone){
										chance=0
										for(i=0;i<other.hurtnum;i+=1){
											if(other.hurtArray[i]==id){
											chance=1
											}
										}
										if(chance==0){
										hurttick=1
										if(dmgrecieved<4){
										dmgrecieved=4
										}
										other.hurtArray[other.hurtnum]=id
										other.hurtnum+=1
										}
								}
							}				
					if(image_index>=9){
						instance_destroy()
					}				
				}else{
#endregion
#region Tree Boss
			//____________________________________________________________________________---------------------(BOSS TREE ROOTS)---------------------____________________________________________________________________________		
				if(pin==34){
						if(image_index>=img+1){
							with(Me){
								hit=instance_place(x,y,other)	
								if(hit!=noone){
									hurttick=1
									if(dmgrecieved<other.dmg){
										dmgrecieved=other.dmg
									}
									vsp=-5.5
									stun=1
								}
							}	
						}
				}else{
#endregion
#region Add Pin Ability

				}
			}
		}
		}
		}
	hit=instance_place(x,y,Me)
					if(diddmg==0){
						if(hit!=noone){
							with(hit){
								hurttick=1
								if(dmgrecieved<other.dmg){
									dmgrecieved=other.dmg
								}
							}
							dur=0
						}
					}
		}else{
#endregion
#endregion
#region Minigame
	if(en==2){
		if(pin==100){
			if(phase==0){
					vsp+=grav
				
					imgangle-=(hsp*spin)*dir

						if(instance_place(x,y-2+vsp,Block)){
						vsp=vsp*-yrebound
						}
						if(instance_place(x+hsp,y,Block)){
						hsp=hsp*-0.4
						}		
						/*
						if(vsp<0.25){
							phase=1
							grav=0
							vsp=0
							hsp=0
							spin=0
						}
						*/
			}
			if(dur==250){
				if(item<3){
					img+=3
					image_index+=3
				}else{
					img+=6
					image_index+=6		
				}
			}
				
		}
	}else{
#endregion
#region ITEMS
#region Feather
	//____________________________________________________________________________---------------------(ITEMS: Feather)---------------------____________________________________________________________________________
	if(en==3){
		if(pin==1){
			dir=Me.dir
			if(Me.dir==1){
				x=Me.x-2
			}else{
				x=Me.x+2
			}
			y=Me.y-1
				if(dur>=durtotal-2){
				
					for(i=0;i<1;i+=1){
						created=instance_create_depth(x-8+random(16),y-6+random(16),0,Part)
						with(created){
						type=1
						pin=1
						depth=other.depth+1
						spin=1
							if(Control.invenArray[23,2]<3){
								img=75
							}else{
								img=77
							}
						imgcap=1
						imgsped=0
						image_speed=0
						image_index=irandom_range(img,img+imgcap)
						dur=25+choose(0,0,0,1,1,2)+irandom(60)
						durtotal=dur
						hsp=0
						vsp=0.3
						image_angle-=15
						image_angle+=random(30)

							if(Me.dir==-1){
								xscale=-1
								hsp=random_range(0.3,0.6)	
							}else{	
								hsp=random_range(-0.3,-0.6)	
							}
						}		
					}
				}
		}else{
#endregion	
#region Nest bird
	//____________________________________________________________________________---------------------(ITEMS: Nest)---------------------____________________________________________________________________________
		if(pin==2){
			hit=instance_place(x,y,Enemy)
			if(cd<=0){
				if(hit!=noone){
					if(hit.team!=0){
						with(hit){
							hurttick=1
							dmgrecieved+=other.dmg
							Me.damagedone+=dmgrecieved			
						}
						instance_destroy() 
					}
				}
			}else{
				cd-=1
			}
				if(x>xtarget-2&&x<xtarget+2&&y>ytarget-2&&y<ytarget+2){
					xtarget=Me.x-24+random(48)
					ytarget=Me.y-48+random(56)
				}
			
				enemy_move_scr(8)
		}else{
#endregion	
#region Apple Worm
	//____________________________________________________________________________---------------------(ITEMS: Worm)---------------------____________________________________________________________________________
		if(pin==3){
			if(phase==0){
			
				if(!instance_place(x,y+vsp,Block)){
					vsp+=grav
					y+=vsp
				}else{
					y=floor(y)
					while(!instance_place(x,y,Block)){
						y+=0.1
					}
					y-=5
					phase=1
					sprite_index=enemy_three_spr
					attcd=30
					imgsped=0
						if(enopt==0){
							img=187
						}else{
							img=196
						}
						image_index=img
				}
			}else{
				if(phase==1){
					if(attcd>0){
						attcd-=1
						if(attcd==20){
							img+=1
							image_index+=1
						}else{
							if(attcd==10){
								img+=1
								image_index+=1
							}else{
								if(attcd==0){
									img+=1
									image_index+=1
									imgcap=3
									imgcapsave=imgcap
									imgsped=0.1
									imgspedsave=imgsped
									phase=2
									imgsave=img
									attcd=100
									chancefour=0
									parttick=1
								}else{
					
								}					
							}					
						}
					}
				}else{
					if(phase==2){
						if(attcd>30){
							if(Me.x>x){
								dir=1
							}else{
								dir=-1
							}
						}
							if(dur<2){
								parttick=1
								if(dur<=0){
									instance_destroy()
								}
							}
#region Particle 
							if(parttick==1){
								parttick=0
								chance=irandom(360)
								for(i=0;i<10;i+=1){
									created=instance_create_depth(x-2+random(4),y-1.5+random(3),4,Part)
									with(created){
									type=1
									pin=1
									depth=other.depth+1
									spin=1
									if(other.enopt==0){
										img=57
									}else{
										img=61
									}
									imgcap=1
									imgsped=0
									grav=0.1
									image_speed=0
									image_index=irandom_range(img,img+imgcap)
									image_index=img
									dur=13+choose(0,0,0,1,1,2)+irandom(20)
									direction=other.i*36+other.chance
									speed=random_range(0.1,0.2)
									durtotal=dur
									hsp=hspeed
									vsp=vspeed
									imgangle=random(360)
									image_angle=imgangle
									}		
								}	
								for(i=0;i<3;i+=1){
									created=instance_create_depth(x-2+random(4),y-1.5+random(3),4,Part)
									with(created){
									type=1
									pin=1
									depth=other.depth+1
									spin=1
									img=63
									imgcap=3
									imgsped=0
									grav=0.1
									image_speed=0
									image_index=irandom_range(img,img+imgcap)
									image_index=img
									dur=13+choose(0,0,0,1,1,2)+irandom(20)
									direction=other.i*90+other.chance
									speed=random_range(0.1,0.2)
									durtotal=dur
									hsp=hspeed
									vsp=vspeed
									imgangle=random(360)
									image_angle=imgangle
									}		
								}
							}
#endregion

						chancefour=instance_place(x,y,Enemy)
						if(chancefour!=noone){
							if(img>imgsave-3){
								img=imgsave-3
								image_index=img
								imgcap=1
								imgsped=0.01
							}
						}else{				
							if(img==imgsave-3){
								chancefour=0
								img=imgsave
								imgsped=imgspedsave
								image_index=img
								imgcap=imgcapsave
							}					
						}
						if(attcd>0&&chancefour==noone||attcd<=30){
							attcd-=1
							if(attcd==30){
								img=imgsave+4
								image_index=img
								imgsped=0
							}else{
								if(attcd==15){
									img=imgsave+5
									image_index=img
#region AppleProjectile
							
								for(i=0;i<1;i+=1){
									created=instance_create_depth(x+10*dir,y-11,depth-1,Abil)
									with(created){
										en=0
										type=1
										pin=33
										dir=other.dir
										phase=1
										dmg=2
										dmg+=dmg*(Control.invenArray[25,3]*0.01)
										sprite_index=enemy_abil_spr
										if(other.enopt==0){
											img=120+choose(0,4)
										}else{
											img=122+choose(0,4)
										}
										imgcap=1
										image_index=img
										imgsped=0.1
										image_speed=0
										grav=0.15
										dur=180
											move=1
												chance=choose(0,1,2)
												if(chance==0){
													hsp=choose(1.3,1.5,1.7)
													vsp=-3+choose(0,0.2,0.4)
												}else{
													if(chance==1){
														hsp=choose(0.4,0.6,0.8)
														vsp=-4.5+choose(0,0.2,0.4)
													}else{
														if(chance==2){
															hsp=choose(0.8,1,1.2)
															vsp=-4+choose(0,0.2,0.4)											
														}else{
															if(chance==3){
											
															}else{
											
															}											
														}											
													}											
												}
											hsp=hsp*dir
											spin=8
											drag=0.01
											bounce=0.85
									}
								}
#endregion
								}else{
									if(attcd==0){
										img=imgsave
										imgsped=imgspedsave
										image_index=img
										attcd=125
									}
								}						
							}	
						}
				
					}
			
				}
			}
		}else{
#endregion	
#region Apple Heal
	if(pin==4){
		x=Me.x
		y=Me.y-16
		chance=1
			if(dur>37){
#region Particle
								chance=irandom(360)
							
								for(i=0;i<10;i+=1){
									created=instance_create_depth(x-2+random(4),y-1.5+random(3)+16,4,Part)
									with(created){
									type=1
									pin=1
									spin=1
									if(other.enopt==0){
										img=57
									}else{
										img=61
									}
									imgcap=1
									imgsped=0
									grav=0.1
									image_speed=0
									image_index=irandom_range(img,img+imgcap)
									image_index=img
									dur=13+choose(0,0,0,1,1,2)+irandom(20)
									direction=other.i*36+other.chance
									speed=random_range(0.1,0.2)
									durtotal=dur
									hsp=hspeed
									vsp=vspeed
									imgangle=random(360)
									image_angle=imgangle
									}		
								}	
#endregion		
			}
		if(dur<=0){
			instance_destroy()
		}
	}else{
#endregion
#region Leaferang
	if(pin==5){
			vsp+=grav
			imgangle+=spin*hsp
#region Particle
						created=instance_create_depth(x-2.5+random(5),y-2.5+random(5),0,Part)
						with(created){
						type=1
						pin=1
						depth=other.depth+1
						spin=1
							if(other.enopt==0){
								img=22
							}else{
								img=34
							}
						imgcap=3
						imgsped=0
						image_speed=0
						image_index=irandom_range(img,img+imgcap)
						dur=8+choose(0,0,0,1,1,2)+irandom(8)
						durtotal=dur
						hsp=0
						vsp=0
									chance=random_range(0.6,1)
									xscale=chance
									yscale=chance
						}
#endregion
		
		if(phase==0){

			if(timer>0){
				timer-=1
			
						abil_dmg_scr()
				
							if(hit!=noone){
								if(hit.team!=0){
									if(dmgtarget!=hit){
										dmgtarget=hit
										timer=0
										with(hit){
												hurttick=1
												dmgrecieved+=other.dmg
												Me.damagedone+=dmgrecieved
												Control.target=id
										}
									}
								}
							}
				if(instance_place(x+hsp,y,Block)){
					timer=0
				}else{
					x+=hsp
				}
				if(instance_place(x,y+vsp,Block)){
					timer=0
				}else{
					y+=vsp
				}
				if(timer==0){
					move_towards_point(Me.x,Me.y,sped)
					hsp=hspeed
					vsp=vspeed
					speed=0
					//grav=0.01
					//grav=0.1
				}
			}else{
				if(instance_place(x,y,Me)){
					Control.invenArray[23,3]=floor(Control.invenArray[23,3]/2)
					instance_destroy()
				}
				/*
				if(instance_place(x+hsp,y,Block)){
					hsp=0
				}else{
					x+=hsp
				}
				if(instance_place(x,y+vsp,Block)){
					vsp=0
					grav=0.1
				}else{
					y+=vsp	
				}
				*/
				x+=hsp
				y+=vsp
						abil_dmg_scr()
				
							if(hit!=noone){
								if(hit.team!=0){
									if(dmgtarget!=hit){
										dmgtarget=hit
										with(hit){
												hurttick=1
												dmgrecieved+=other.dmg/2
												Me.damagedone+=dmgrecieved
												Control.target=id
										}
									}
								}
							}
			}
		}

	}else{
#endregion

	}
	}
		}
		}
	}
	}else{
#endregion
	}
	}
		}
		}	
#region Particle
			//0=TRUE/False,1=Target,2=X,3=Y,4=Img,5=ImgCap,6=Amount,7=Delay,8=DelayAmount,9=Dur,10=hsp,11=vsp,12=DurExtra,13=XscaleYscale,14=XscaleMaxYscaleMax,15=ImgSped
			if(partArray[0]==1){
				//Target
				if(partArray[1]==0){

				}
				if(partArray[7]==0){
					for(i=0;i<partArray[6];i+=1){
						created=instance_create_depth(x-partArray[2]/2+random(partArray[2]),y-partArray[3]/2+random(partArray[3]),0,Part)
						with(created){
						type=1
						pin=1
						depth=other.depth+1
						spin=1
						img=other.partArray[4]
						imgcap=other.partArray[5]
						imgsped=other.partArray[15]
						image_speed=0
						image_index=irandom_range(img,img+imgcap)
						dur=other.partArray[9]+irandom(other.partArray[12])
						durtotal=dur
						hsp=other.partArray[10]
						vsp=other.partArray[11]
									chance=irandom_range(other.partArray[13],other.partArray[14])
									xscale=chance
									yscale=chance
						}		
					}			
				}else{
					if(dur mod partArray[8]==0){
					for(i=0;i<partArray[6];i+=1){
						created=instance_create_depth(x-2+random(4),y-1.5+random(3),0,Part)
						with(created){
						type=1
						pin=1
						depth=other.depth+1
						spin=1
						img=other.partArray[4]
						imgcap=other.partArray[5]
						imgsped=other.partArray[15]
						image_speed=0
						image_index=irandom_range(img,img+imgcap)
						dur=other.partArray[9]+irandom(other.partArray[12])
						durtotal=dur
						hsp=other.partArray[10]
						vsp=other.partArray[11]
									chance=irandom_range(other.partArray[13],other.partArray[14])
									xscale=chance
									yscale=chance
						}			
					}					
					}
				}
			
		
			}
#endregion
			if(move==1){
				x+=hsp
				y+=vsp
			
				if(instance_place(x,y,Block)){
					if(phasecheck==0){
					dur=0
						if(sndone!=0){
							audio_play_sound_at(choose(sndone,sndtwo),x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
						}
					}
				}
			
			}
		
			if(dur>0){
				dur-=1
			}else{
				if(phase==0){

				instance_destroy()
				}
			}
		
		}
	}
	}



