function abil_create_scr(argument0) {
#region Witch
	//____________________________________________________________________________---------------------(WITCH)---------------------____________________________________________________________________________
	if(class==1){
#region Spell Witch Abil 1
		if(argument0==1){

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
			
			if(Me.abilArray[16,2]==0){
				Me.abilArray[16,2]=2
			}
			if(dir==1){
				Me.abilArray[16,3]=0
			}else{
				Me.abilArray[16,3]=1
			}

			created=instance_create_depth(xpos,ypos,0,Abil)
			with(created){
					sndobjectone=instance_create_depth(x,y,0,Snd)
					with(sndobjectone){
						sndemitone=audio_emitter_create()				
						audio_play_sound_on(sndemitone,choose(snd_witch_spell_1,snd_witch_spell_2),false,8)
						audio_emitter_falloff(sndemitone, 48, Control.falloff_max, Control.falloff_factor)					
					}				
			type=1
			pin=1
			move=1
			diddmg=0
			dmg=4
			
			chance=dmg
			
			dmg+=dmg*(Control.talentmapArray[1,1]*0.05)
			
			//dmg+=chance*(Control.talentmapArray[3,1]*0.25)
			dmg+=chance*(Control.invenArray[25,3]*0.01)
			
			creator=other.id
			
			depth=other.depth-1
			spin=1
			extra=0
			if(Control.talentmapArray[3,1]>0){
				sprite_index=abil_witch_spr
				img=109
				imgcap=1
				imgsped=0.2
			}else{
				sprite_index=abil_spr
				img=1
				imgcap=3
				imgsped=1			
			}
			
			image_speed=0
			image_index=irandom_range(img,img+imgcap)
			dur=30-(Control.talentmapArray[2,1]*2)
			durtotal=dur
			phase=1
			speed=3.5
			speed=3+(Control.talentmapArray[2,1]*0.3)
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
				image_angle=direction*other.dir
				imgangle=direction
				if(hspeed<0){
					image_yscale=-1
				}
			hsp=hsp
			hsp=hspeed
			vsp=vspeed
			speed=0
			}	
		}else{
#endregion	
#region Broom Witch Abil 2
	
		if(argument0==2){
			
			//____________________________________________________________________________---------------------(Broom WITCH)---------------------____________________________________________________________________________
			if(Control.talentmapArray[4,1]>0){
				gravcd=2
				gravtick=1
				gravpercent=0.02
				wepx=1
				wepy=4
				img=28
				imgcap=0
				image_index=img		
				stun=2
					snd=choose(snd_witch_broom_1,snd_witch_broom_2)
					audio_play_sound(snd, 1, false)
		
				if(global.con_h_up||global.conp_h_up){
						temp=1
						vsp=-2.8
						if(dir==1){
							if(hsp<0.5){
								hsp=0.5
							}else{
								hsp=1
							}
						}else{
							if(hsp>-0.5){
								hsp=-0.5
							}else{
								hsp=-1
							}			
						}
									if(dir==1){
										wepangle=30
									}else{
										wepangle=330
									}	
				}else{
					if(global.con_h_down||global.conp_h_down){
						temp=2
						vsp=-1
						if(dir==1){
							if(hsp<1.5){
								hsp=1.5
							}
						}else{
							if(hsp>-1.5){
								hsp=-1.5
							}				
						}
									if(dir==1){
										wepangle=330						
									}else{
										wepangle=30
									}	
					}else{
						temp=0
						vsp=-2.5
						if(dir==1){
							if(hsp<0.5){
								hsp=0.5
							}
						}else{
							if(hsp>-0.5){
								hsp=-0.5
							}				
						}
						wepangle=0	if(dir==1){
										wepangle=15			
									}else{
										wepangle=345
									}				}		
				}	
		
			created=instance_create_depth(xpos,ypos,0,Abil)
				with(created){
					temp=other.temp
				type=1
				pin=2
				hsp=0
				vsp=0
				visible=false
				dur=75
				creator=other.id
				}	
			}else{
				
				//____________________________________________________________________________---------------------(Scarecrow WITCH)---------------------____________________________________________________________________________
				if(Control.talentmapArray[7,1]>0){
					if(passive==noone){
						passivetwo.tick=1
						//abilArray[1,1]=0
						
						if(global.con_h_up||global.conp_h_up){
							temp=2
						}else{
							if(global.con_h_down||global.conp_h_down){
							temp=3
							}else{
							temp=1
							}		
						}

							passive=instance_create_depth(x,y,depth+2,Abil)
							with(passive){
									if(instance_place(x,y+8,Block)){
										y-=4
									}
									snd=1
									audio_play_sound_at(snd_witch_cauldron_summon_1,x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
								xlast=x
								type=1
								pin=4
								diddmg=0
								dmg=3
								times=3
								dmg+=dmg*(Control.invenArray[25,3]*0.01)
								creator=other.id
								sprite_index=abil_witch_spr
								mask_index=me_mask_spr
								depth=other.depth-1
								spin=1
								img=49
								if(Control.talentmapArray[9,1]>0){
									img=49
										partone=39
										parttwo=135
										partthree=136
								}else{
									img=77
										partone=39
										parttwo=127
										partthree=128
								}
								imgcap=4
								imgsped=0.05
								image_speed=0
								image_index=img
								dur=500
								durtotal=dur
								phase=1
								attcd=30
								attcdtotal=150
								starty=y
								tick=0
								attacks=3
								dir=Me.dir
								diddmg=0
								chance=3.5
								chance=4
								cd=0
								if(other.temp==1){
									vsp=-1.25
									hsp=chance
								}else{
									if(other.temp==2){
											vsp=-2.5
											hsp=chance-(chance*0.1)
									}else{
										if(other.temp==3){
											vsp=-0
											hsp=chance+(chance*0.1)
										}
									}			
								}
									hsp=hsp*dir

								speed=0
								depth=Me.depth+2
								spedsave=hsp
						
								grav=0.1
								gravtwo=0.1
							}					
						}else{
							
							audio_play_sound_at(choose(snd_witch_scarecrow_1,snd_witch_scarecrow_2),Me.x,Me.y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
							
							//Teleport
							vsp=-1

							
							chance=Me.x
							chancetwo=Me.y
							Me.x=passive.x
							Me.y=passive.y
							passive.x=chance
							passive.y=chancetwo
							
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
									
									if(Control.talentmapArray[9,1]>0){
										img=77
											img=choose(39,135,136)
									}else{
										img=49
											img=choose(39,127,128)
									}
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
								for(i=0;i<4;i+=1){
									created=instance_create_depth(passive.x-6+random(12),passive.y-8+irandom(16),0,Part)
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
									created=instance_create_depth(passive.x-6+random(12),passive.y-6+irandom(12),0,Part)
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
										if(Control.talentmapArray[9,1]>0){
											img=77
												img=choose(39,135,136)
										}else{
											img=49
												img=choose(39,127,128)
										}
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


									if(global.con_h_down||global.conp_h_down){
										if(passive.times>1){
											passive.times-=1
											abilArray[1,1]=240-(Control.talentmapArray[8,1]*4)-(Control.talentmapArray[9,1]*40)
											abilArray[1,1]=5
										}else{
											abilArray[1,1]=abilArray[1,2]
										}
									}else{
										with(passive){
											instance_destroy()
										}
										passive=noone
									}
							
						}
				}
				
			}
		}else{
#endregion	
#region Bats Witch Abil 3
	//____________________________________________________________________________---------------------(Bats WITCH)---------------------____________________________________________________________________________
			if(argument0==3){
			if(Control.talentmapArray[10,1]>0){
			if(global.con_h_up||global.conp_h_up){
				temp=2
			}else{
				if(global.con_h_down||global.conp_h_down){
				temp=3
				}else{
				temp=1
				}		
			}
			vsp=-2.5

				created=instance_create_depth(xpos,ypos,0,Abil)
				with(created){
					first=1
					sndobjectone=instance_create_depth(x,y,0,Snd)
					with(sndobjectone){
						sndemitone=audio_emitter_create()				
						audio_play_sound_on(sndemitone,choose(snd_witch_bat_1,snd_witch_bat_2),false,8)
						audio_emitter_falloff(sndemitone, Control.falloff_ref, Control.falloff_max, Control.falloff_factor)					
					}	
				
					check=59
					temp=other.temp
					startx=x
					starty=y
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
				imgsped=0.08
				image_speed=0
				image_index=img
				dur=100
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
			}else{
	//____________________________________________________________________________---------------------(Cauldron WITCH)---------------------____________________________________________________________________________
			if(Control.talentmapArray[13,1]>0){
				
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


				created=instance_create_depth(xpos,ypos-12,depth+2,Abil)
				with(created){
						if(instance_place(x,y+8,Block)){
							y-=4
						}
						snd=1
						audio_play_sound_at(choose(snd_witch_cauldron_3,snd_witch_cauldron_4),x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
				
					xlast=x
					type=1
					pin=5
					diddmg=0
					dmg=6
					dmg+=dmg*(Control.invenArray[25,3]*0.01)
					creator=other.id
					sprite_index=abil_witch_spr
					mask_index=abil_witch_mask_spr
					depth=other.depth-1
				
					//mask_index=abil_witch_frog_mask_spr
					
				
					spin=1
					img=17
					if(Control.talentmapArray[15,1]>0){
						img=95
					}else{
						img=30
					}
					imgcap=6
					imgsped=0.13
					image_speed=0
					image_index=img
					dur=500
					durtotal=dur
					phase=1
					attcd=30
					attcdtotal=150
					starty=y
					tick=0
					attacks=3
			
					speed=0.35
				
					spedsave=3.5
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
					//image_angle=direction*other.dir
					//imgangle=direction
					if(hspeed<0){
						//image_yscale=-1
					}
					hsp=hsp
					hsp=hspeed
					vsp=vspeed
					speed=0
					depth=Me.depth+2
					dir=other.dir
					spedsave=hsp
				}					
			}
	
			}
			}else{
#endregion		
			}
		}
	}
	}else{
#endregion
#region Pumpkin
	//____________________________________________________________________________---------------------(PUMPKIN)---------------------____________________________________________________________________________
	if(class==2){
#region Pumpkin Abil 1 
		if(argument0==1){

			if(global.con_h_up||global.conp_h_up){
				temp=2
			}else{
				if(global.con_h_down||global.conp_h_down){
				temp=3
				}else{
					temp=1
				}		
			}
		
			created=instance_create_depth(xpos,ypos,0,Abil)
		
			//remember pumpkin
			abilArray[0,3]=created
			with(created){
				hurtnum=0
				hurtArray[0]=0
				cdcheck=1
				Me.abil1safety=0
			type=1
			pin=10
			diddmg=0
			dmg=4
			chance=dmg
			
			dmg+=dmg*(Control.talentmapArray[1,1]*0.05)
			
			dmg+=chance*(Control.talentmapArray[3,1]*0.25)
			dmg+=chance*(Control.invenArray[25,3]*0.01)
			
			move=0
			grav=0.1
			gravtwo=0.04
			gravthree=0.01
			creator=other.id
			sprite_index=abil_spr
			depth=other.depth-1
			mask_index=mask_pump_spr
			spin=1
			img=5+choose(0,0,0,0,0,1,1,1,2,3)
			imgcap=0
			imgsped=0.1
			image_speed=0
			image_index=irandom_range(img,img+imgcap)
			dur=99999
			durtotal=dur
			phase=1
			speed=0
			imgangle=random(360)
			
				if(other.temp==1){
				imgangle=340
					hsp=1.8
					vsp=-2.2		
				}else{
					if(other.temp==2){
					imgangle=210
						hsp=1.2
						vsp=-3.5			
					}else{
						if(other.temp==3){
							imgangle=-85
							hsp=2.4
							vsp=-0.5
						}else{
			
						}			
					}		
				}
				imgangle=imgangle*other.dir
				hsp = hsp*other.dir

			}	
		}else{
#endregion
#region	Small Pumpkin Abil 2
	//____________________________________________________________________________---------------------(Small Pumpkins)---------------------____________________________________________________________________________
			if(argument0==2){
				chance=1
				if(Control.talentmapArray[4,1]>0){
				//audio_play_sound_(choose(snd_pumpkin_throw_all_1,snd_pumpkin_throw_all_2),8,false)
				if(global.con_h_down||global.con_h_down){
					temp=3
					vsp=-4.3
				}else{
					if(global.con_h_up||global.con_h_up){
						temp=1
						vsp=4.3
					}else{
						if(global.con_h_right||global.con_h_right){
							temp=2
							hsp=-5.3
							vsp=-2.7
							stun=5
						}else{
							if(global.con_h_left||global.conp_h_left){
								temp=4
								hsp=5.3
								vsp=-2.7
								stun=3
							}else{
									vsp=-2.7
									stun=3
								if(dir==1){
									temp=2
									hsp=-4
								}else{
									temp=4
									hsp=4
								}
							}				
						}
					}		
				}
				
				for(i=0;i<3;i+=1){
				
					created=instance_create_depth(xpos,ypos,0,Abil)
		
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
						chance=dmg
						dmg+=dmg*(Control.invenArray[25,3]*0.01)
						
						dmg+=chance*(Control.talentmapArray[5,1]*0.05)
						dmg+=chance*(Control.talentmapArray[6,1]*0.25)
					type=1
					pin=11
					diddmg=0
					move=0
					grav=0
					gravtwo=0
					gravthree=0.01
					gravthree=0
					creator=other.id
					sprite_index=abil_spr
					depth=other.depth-1
					mask_index=mask_pump_spr
					if(Control.talentmapArray[6,1]>0){
						img=choose(10,10,10,11)
					}else{
						img=9+choose(0,0,0,4)
					}
					imgcap=0
					imgsped=0.1
					image_speed=0
					image_index=irandom_range(img,img+imgcap)
					if(other.i==1){
						dur=35
					}else{
						dur=30
					}
					dur-=5
					
					durtotal=dur
					phase=1
					speed=0
					imgangle=random(360)
						chancethree=1
						chance=-0.4+(other.i*0.4)
						spinamt=1.5
						spin=choose(-0.2,0.2)
						if(other.i==0){
							if(other.temp==1||other.temp==2){
								spin=spinamt
							}else{
								spin=spinamt*-1
							}
							snd=snd_pumpkin_small_blast_1
						}else{
							if(other.i==2){
								if(other.temp==1||other.temp==2){
									spin=spinamt*-1
								}else{
									spin=spinamt
								}
								snd=snd_pumpkin_small_blast_2
							}else{
								snd=snd_pumpkin_small_blast_3
							}					
						}
						if(other.temp==2||other.temp==3||other.temp==5){
							if(other.i==1){
								chancetwo=-0.1
							}else{
								chancetwo=0.1
							}
						}else{
							if(other.i==1){
								chancetwo=0.1
							}else{
								chancetwo=-0.1
							}					
						}
						if(other.temp==1){
							imgangle=180
							vsp=-chancethree+chancetwo
							hsp=chance
						}else{
							if(other.temp==2){
							imgangle=90
								hsp=chancethree+chancetwo
								vsp=chance		
							}else{
								if(other.temp==3){
									imgangle=0
									vsp=chancethree+chancetwo
									hsp=chance
								}else{
									if(other.temp==4){
									imgangle=270
									hsp=-chancethree+chancetwo
									vsp=chance		
									}else{
										imgangle=0
										vsp=2+chancetwo
										hsp=chance							
									}
								}			
							}		
						}
	//					imgangle=imgangle*other.dir

					}	
				}
			}else{
	//____________________________________________________________________________---------------------(Sprout pumpkin)---------------------____________________________________________________________________________
				if(Control.talentmapArray[7,1]>0){
					temp=1
				if(global.con_h_down||global.con_h_down){
					temp=2
				}else{
					if(global.con_h_up||global.con_h_up){
						temp=0
					}else{

					}		
				}
				abilArray[1,1]=600

						created=instance_create_depth(xpos,ypos-3,0,Abil)
		
						with(created){
							temp=other.temp
							hurtnum=0
							hurtArray[0]=0
							meon=1
							sndplay=0
								dmg=10
								
								dmgtwo=12
								
								dmgthree=14
								
								dmg+=dmg*(Control.invenArray[25,3]*0.01)
								dmgtwo+=dmgtwo*(Control.invenArray[25,3]*0.01)
								dmgthree+=dmgthree*(Control.invenArray[25,3]*0.01)
								
								type=1
								pin=14
								diddmg=0
								move=0
								grav=0.03
								grav=0.1
								gravtwo=0.04
								gravtwo=0
								gravthree=0.01
								gravthree=0
								creator=other.id
								sprite_index=mask_pump_other_spr
								depth=other.depth+1
								mask_index=mask_pump_other_spr
								spin=0
								img=35
								
								if(Control.talentmapArray[9,1]>0){
									img=58
								}
								//img=64
								imgcap=12
								imgsped=0
									phase=0
									check=1
								image_speed=0
								image_index=img
									dur=265
									imgangle=0
								durtotal=dur
								speed=0
								imgangle=0
							chancethree=1
							hsp=0
							vsp=0
							dir=Me.dir

						}						
				}
			}
			}else{
#endregion	
#region	Big Pumpkin Abil 3
		//____________________________________________________________________________---------------------(Big Pumpkin)---------------------____________________________________________________________________________
				if(argument0==3){
					chance=1
					if(Control.talentmapArray[10,1]>0){
						vsp=0
				
					if(global.con_h_up||global.conp_h_up){
						temp=1
					}else{
						if(global.con_h_down||global.conp_h_down){
							temp=2
						}else{
							temp=0
						}		
					}
				
				
						created=instance_create_depth(xpos,ypos,0,Abil)
		
						with(created){
							//0=TRUE/False,1=Target,2=X,3=Y,4=Img,5=ImgCap,6=Amount,7=Delay,8=DelayAmount,9=Dur,10=hsp,11=vsp,12=DurExtra,13=XscaleYscale,14=XscaleMaxYscaleMax,15=ImgSped
							part_gen_scr(1,0,7,7,34,3,2,0,2,14,0,0,10,0.6,1,0)
							hurtnum=0
							hurtArray[0]=0
							meon=1
							sndplay=0
							talent=1
							
						dmg=8
						
						
						dmgtwo=12
						
						
						dmgthree=14
						

						
			
						dmg+=8*(Control.talentmapArray[12,1]*0.25)
						dmg+=8*(Control.talentmapArray[11,1]*0.05)

						dmgtwo+=12*(Control.talentmapArray[12,1]*0.25)
						dmgtwo+=12*(Control.talentmapArray[11,1]*0.05)

						dmgthree+=14*(Control.talentmapArray[12,1]*0.25)
						dmgthree+=14*(Control.talentmapArray[11,1]*0.05)
						
						dmg+=dmg*(Control.invenArray[25,3]*0.01)
						dmgtwo+=dmgtwo*(Control.invenArray[25,3]*0.01)
						dmgthree+=dmgthree*(Control.invenArray[25,3]*0.01)

						type=1
						pin=13
						diddmg=0
						move=0
						grav=0.03
						grav=0.1
						gravtwo=0.04
						gravtwo=0
						gravthree=0.01
						gravthree=0
						creator=other.id
						sprite_index=abil_pump_big_spr
						depth=other.depth-1
						mask_index=mask_pump_spr
						spin=0
						img=1
							if(Control.talentmapArray[12,1]>0){
								img=34
							}
							imgsave=img
						imgcap=12
						imgsped=0.044
						image_speed=0
						image_index=img
							dur=265
							imgangle=0
						durtotal=dur
						phase=1
						speed=0
						imgangle=0
							chancethree=1
							chancetwo=-2.6
							chance=0.5
							hsp=0.6
							vsp=chancetwo
					
						
							if(other.temp==1){
								vsp=chancetwo-0.4
								hsp=0.3
							}else{
								if(other.temp==2){
									vsp=chancetwo+0.4
									hsp=0.8
								}	
							}
							hsp=hsp*other.dir
							dir=other.dir

						}	
				}else{
		//____________________________________________________________________________---------------------(Huge Pumpkin Slam)---------------------____________________________________________________________________________
					temp=1
					if(Control.talentmapArray[13,1]>0){
						
					if(global.con_h_up||global.conp_h_up){
						temp=1
					}else{
						if(global.con_h_down||global.conp_h_down){
							temp=2
						}else{
							temp=0
						}		
					}
					if(global.con_h_right||global.conp_h_right){
						temptwo=1
					}else{
						if(global.con_h_left||global.conp_h_left){
							temptwo=2
						}else{
							temptwo=0
						}		
					}
						created=instance_create_depth(xpos,ypos,0,Abil)
		
						with(created){
							//0=TRUE/False,1=Target,2=X,3=Y,4=Img,5=ImgCap,6=Amount,7=Delay,8=DelayAmount,9=Dur,10=hsp,11=vsp,12=DurExtra,13=XscaleYscale,14=XscaleMaxYscaleMax,15=ImgSped
							part_gen_scr(1,0,14,14,34,3,2,0,2,14,0,0,10,0.6,1,0)
							hurtnum=0
							hurtArray[0]=0
							meon=1
							sndplay=0
							check=1
							temp=other.temp
							temptwo=other.temptwo
							

						dmg=8
						dmg+=8*(Control.talentmapArray[15,1]*0.25)
						dmg+=8*(Control.talentmapArray[14,1]*0.05)
						dmg+=dmg*(Control.invenArray[25,3]*0.01)
						
						dmgtwo=12
						dmgtwo+=12*(Control.talentmapArray[15,1]*0.25)
						dmgtwo+=12*(Control.talentmapArray[14,1]*0.05)
						dmgtwo+=dmgtwo*(Control.invenArray[25,3]*0.01)
						
						dmgthree=14
						dmgthree+=14*(Control.talentmapArray[15,1]*0.25)
						dmgthree+=14*(Control.talentmapArray[14,1]*0.05)
						dmgthree+=dmgthree*(Control.invenArray[25,3]*0.01)
						
						type=1
						pin=15
						diddmg=0
						move=0
						grav=0.03
						grav=0.1
						gravtwo=0.04
						gravtwo=0
						gravthree=0.01
						gravthree=0
						creator=other.id
						sprite_index=mask_pump_other_spr
						depth=other.depth+1
						mask_index=mask_pump_other_spr
						spin=0
						img=78
						imgsavefour=113
						if(Control.talentmapArray[15,1]==1){
							img=171
							imgsavefour=206
						}
						imgsave=img
						imgsavethree=img
						imgcap=4
						imgsped=0.044
						image_speed=0
						image_index=img
							dur=265
							imgangle=0
						durtotal=dur
						phase=1
						speed=0
						imgangle=0
							chancethree=1
							chancetwo=-2.6
							chance=0.5
							hsp=0.6
							
					
							vsp=chancetwo
							hsp=hsp*other.dir
							dir=other.dir

						}							
					}
				}
				}else{
#endregion	
				}
			}
	
		}
	}else{
#endregion
#region Bee
	//____________________________________________________________________________---------------------(BEE)---------------------____________________________________________________________________________
	if(class==3){
#region Bee Stinger Abil 1
	//____________________________________________________________________________---------------------(Stinger)---------------------____________________________________________________________________________
	if(argument0==0){
	
				if(passiveArray[0,1]<=0){
					passiveArray[0,1]=12
			
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
					passiveArray[0,3]=temp
				}else{
					temp=passiveArray[0,3]
	
			created=instance_create_depth(xpos,ypos,0,Abil)
			with(created){
				//0=TRUE/False,1=Target,2=X,3=Y,4=Img,5=ImgCap,6=Amount,7=Delay,8=DelayAmount,9=Dur,10=hsp,11=vsp,12=DurExtra,13=XscaleYscale,14=XscaleMaxYscaleMax,15=ImgSped
			//	part_gen_scr(1,0,3,3,43,3,1,0,2,8,0,0,3,0.6,1,0)
					sndobjectone=instance_create_depth(x,y,0,Snd)
					with(sndobjectone){
						sndemitone=audio_emitter_create()				
						audio_play_sound_on(sndemitone,choose(snd_bee_stinger_1,snd_bee_stinger_2,snd_bee_stinger_3,snd_bee_stinger_4),false,8)
						audio_emitter_falloff(sndemitone, 48, Control.falloff_max, Control.falloff_factor)					
					}
					dirtwo=other.dir
						pinfour=0
						if(Me.passiveArray[20,1]>0){
							if(Control.talentmapArray[20,1]>0){
								if(irandom(99)<=(Control.talentmapArray[20,1])*2){
									pinfour=1
								}
							}
						}
					
			type=1
			pin=20
			move=1
			diddmg=0
			pintwo=0
			
			creator=other.id
			sprite_index=abil_spr
			depth=other.depth-1
			spin=1
	
			//Normal Bee
			if(Control.talentmapArray[3,1]==0){
				img=29
				imgcap=3
				imgsped=0.1
				image_index=irandom_range(img,img+imgcap)
				speed=1.5
				dur=50
			}else{
				//Stinger
				img=44
				sprite_index=mask_bee_spr

				imgcap=3
				imgsped=0.15
				imgsped=0.25
				image_index=img
				speed=3
				dur=25
			}
			if(Control.talentmapArray[12,1]>0&&Me.passiveArray[2,5]==1){
				//Stinger
				img=48
				sprite_index=mask_bee_spr

				imgcap=1
				imgsped=0.15
				imgsped=0.25
				image_index=img
				speed=6
				dur=18	

				//speed=3
				//dur=18*2	


				//speed=12
				//dur=9
				
				dmg=4
				
				pintwo=1
				chance=dmg
			
				dmg+=dmg*(Control.talentmapArray[1,1]*0.05)
			
				dmg+=chance*(Control.talentmapArray[3,1]*0.25)
				dmg+=chance*(Control.invenArray[25,3]*0.01)
				
				Me.passiveArray[0,1]=0
			}else{
				dmg=1

				chance=dmg
			
				dmg+=dmg*(Control.talentmapArray[1,1]*0.05)
			
				dmg+=chance*(Control.talentmapArray[3,1]*0.25)
				dmg+=chance*(Control.invenArray[25,3]*0.01)
			
			}

			
			image_speed=0
			durtotal=dur
			phase=1
			
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
				image_angle=direction*other.dir
				imgangle=direction
				if(hspeed<0){
					image_yscale=-1
				}
			hsp=hspeed
			vsp=vspeed
			speed=0
			}	
				}

	}else{
#endregion
#region Bee Honey Abil 2
	//____________________________________________________________________________---------------------(Honey glob)---------------------____________________________________________________________________________
		if(argument0==2){
			if(global.con_h_up||global.conp_h_up){
				temp=1
			}else{
				if(global.con_h_down||global.conp_h_down){
					temp=2
				}else{
					temp=0
				}		
			}
			if(Control.talentmapArray[4,1]>0){
				with(Abil){
					if(pin==21){
						if(pintwo==0&&pintwo!=1){
							dur=0
							phase=0
							}
					}
				}
				passiveArray[2,0]=1
				sndplaying=1
			
				created=instance_create_depth(xpos,ypos,0,Abil)
				with(created){
					//0=TRUE/False,1=Target,2=X,3=Y,4=Img,5=ImgCap,6=Amount,7=Delay,8=DelayAmount,9=Dur,10=hsp,11=vsp,12=DurExtra,13=XscaleYscale,14=XscaleMaxYscaleMax,15=ImgSped
					part_gen_scr(1,0,7,7,43,3,2,0,2,8,0,0,3,0.6,1,0)
						if(Control.talentmapArray[19,1]>0){
							didhoney=0
						}else{
							didhoney=-1
						}
					Me.passiveArray[2,1]=id
					hittwo=0
					type=1
					pin=21
					pinthree=0
					pinfour=0
						if(Me.passiveArray[20,1]>0){
							if(Control.talentmapArray[20,1]>0){
								if(irandom(99)<=(Control.talentmapArray[20,1])*20){
									pinfour=1
								}
							}
						}
					pintwo=0
					move=1
					diddmg=0
					
					depth=Me.depth-1
					creator=other.id
					sprite_index=abil_spr
					depth=other.depth-1
					spin=1
						if(Control.talentmapArray[6,1]>0){
							img=75
						}else{
							img=41
						}
					
					imgcap=3
					imgsped=0.1
					image_speed=0
					image_index=img
					dur=600
					durtotal=dur
					phase=1
					phasecheck=1
					grav=0.07
					
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
						if(hspeed<0){
							image_yscale=-1
						}
					dir=other.dir
					hsp=hsp*dir
					
				}	
			}else{
				
				//Hive
				if(Control.talentmapArray[7,1]>0){
						passiveArray[2,0]=1
						sndplaying=1
			
						created=instance_create_depth(xpos,ypos,0,Abil)
						with(created){
							//0=TRUE/False,1=Target,2=X,3=Y,4=Img,5=ImgCap,6=Amount,7=Delay,8=DelayAmount,9=Dur,10=hsp,11=vsp,12=DurExtra,13=XscaleYscale,14=XscaleMaxYscaleMax,15=ImgSped
							part_gen_scr(1,0,7,7,43,3,2,0,2,8,0,0,3,0.6,1,0)
			
							Me.passiveArray[2,1]=id
								hurtnum=0
								hurtArray[0]=0
						hittwo=0
						type=1
						pin=21
						pinthree=0
					pinfour=0
						if(Me.passiveArray[20,1]>0){
							if(Control.talentmapArray[20,1]>0){
								if(irandom(99)<=(Control.talentmapArray[20,1])*20){
									pinfour=1
								}
							}
						}
						move=0
						diddmg=0
						depth=Me.depth-1
						creator=other.id
						sprite_index=mask_bee_spr
						depth=other.depth-1
						spin=1
						img=31
						if(Control.talentmapArray[9,1]>0){
							img=94
						}
						imgcap=1
						imgsped=0.05
						image_speed=0
						image_index=img
						dur=240
						durtotal=dur
						phase=0
						phasecheck=1
						grav=0.07
						gravtwo=0.01
						sndcd=0
						dmg=1
						
						attcd=0
						attcdtotal=15
						
							chance=-1
							chancetwo=1.5
							if(other.temp==0){
								hsp=chancetwo
								vsp=chance-0.2
							}else{
								if(other.temp==1){
									hsp=chancetwo-0.2
									vsp=chance-1.5
								}else{
									if(other.temp==2){
										hsp=chancetwo+0.2
										vsp=chance+1
									}
								}			
							}
							if(hspeed<0){
								image_yscale=-1
							}
							dir=other.dir
							hsp=hsp*dir
							timer=30
							pintwo=0
						}				
				}
			}
		}else{
#endregion
#region Bee Hover Abil 3
	//____________________________________________________________________________---------------------(Hover)---------------------____________________________________________________________________________
			if(argument0==3){
				//Hover
				if(Control.talentmapArray[10,1]>0){
					if(grounded==1){
						passiveArray[2,0]=0	
					}else{
						passiveArray[2,0]=2
						passiveArray[2,1]=Me
						sndplaying=1
				
					}
				}else{
					//Swarm Shield
					if(Control.talentmapArray[13,1]>0){
						passiveArray[2,1]=Me
						passiveArray[2,0]=4
						passiveArray[2,50]=15+(8*Control.talentmapArray[15,1])
						sndplaying=1			
						beecd=0
					}
				}
				
			}else{
		#endregion

			}
		}
	}

	}else{
#endregion
#region Burger
	//____________________________________________________________________________---------------------(Burger)---------------------____________________________________________________________________________
	if(class==4){
#region Burger Abil 1
		if(argument0==1){
			
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

#region Other Feather
			chance=2.5+(Control.talentmapArray[1,1]*0.12)
			if(Me.dir==-1){
					Me.hsp=-chance
			}else{
					Me.hsp=chance 			
			}
			Me.vsp=-2
			temp=1
			if(global.con_h_up||global.conp_h_up){
					//Me.vsp=-3.5
			}else{
				if(global.con_h_down||global.conp_h_down){
					//Me.vsp=3
				}else{
				temp=1
				}		
			
			}
			if(!global.con_h_right&&!global.conp_h_right&&!global.con_h_left&&!global.con_h_left){
				if(global.con_h_up||global.conp_h_up){
						temp=2
						Me.vsp=-6
						hsp=0
				}else{
					if(global.con_h_down||global.conp_h_down){
						temp=3
						Me.vsp=5
						hsp=0
					}else{
					temp=1
					}		
			
				}
			}

			Me.stun=30
			//audio_play_sound(choose(snd_burger_burger_sizzle_1,snd_burger_burger_sizzle_2),8,false)
			created=instance_create_depth(x,y,0,Abil)
			with(created){
				holding=0
				sndgen=1
					diddmg=0
					Me.passive=1
				type=0
				pin=25
				en=0
				creator=other.id
				imgsped=0.12
					img=0
					temp=other.temp
					slam=0
					if(Control.talentmapArray[3,1]>0){	
						slam=1
					}
				if(other.temp!=1){
					img+=2
				}
			
				version=0
				dmg=4
			
				if(Me.passivethree>0){
					version=1
					img+=57
					dmg=5
				}
								dmg+=dmg*(Control.talentmapArray[2,1]*0.05)
								dmg+=dmg*(Control.talentmapArray[3,1]*0.25)
								dmg+=dmg*(Control.invenArray[25,3]*0.01)				
		
				imgcap=1
				sprite_index=abil_burger_spr
				image_index=img
				depth=other.depth-2
				image_speed=0
				dur=30
				durtotal=dur
			}	
#endregion
		}else{
#endregion	
#region Broom Witch Abil 2
	//____________________________________________________________________________---------------------(Burger Fries)---------------------____________________________________________________________________________
		if(argument0==2){
			
			if(Control.talentmapArray[7,1]>0){	
				passivetwo=instance_create_depth(x,y,10,Abil)
				if(global.con_h_up||global.conp_h_up){
						temp=2
				}else{
					if(global.con_h_down||global.conp_h_down){
						temp=3
					}else{
					temp=1
					}		
			
				}
				with(passivetwo){
						sndobjectone=instance_create_depth(x,y,0,Snd)
						with(sndobjectone){
							sndemitone=audio_emitter_create()				
							audio_play_sound_on(sndemitone,choose(snd_burger_fries_throw_1,snd_burger_fries_throw_2,snd_burger_fries_throw_3),false,8)
							audio_emitter_falloff(sndemitone, 48, Control.falloff_max, Control.falloff_factor)					
						}	
					temp=other.temp
						diddmg=0

						Me.passive=1
					type=0
					pin=26
					en=0
						grav=0.3
						gravtwo=0.05
						if(temp==1){
							vsp=-2.5
							hsp=2*other.dir
						}else{
							if(temp==2){
								vsp=-5
								hsp=1*other.dir
							}else{
								if(temp==3){
									vsp=2
									hsp=1*other.dir
								}else{
				
								}					
							}				
						}
					creator=other.id
					imgsped=0.12
					imgsped=0.05
						img=5
						version=0
						dmg=5
					if(Me.passivethree>0){
						img+=56
						version=1
						dmg=7
					}
								//dmg+=dmg*(Control.talentmapArray[7,1]*0.05)
								//dmg+=dmg*(Control.talentmapArray[8,1]*0.25)
								//dmg+=dmg*(Control.invenArray[25,3]*0.01)
			
						temp=1
		
					imgcap=1
					sprite_index=abil_burger_spr
					image_index=img
					depth=other.depth-1
					image_speed=0
					dur=160
					durtotal=dur
					phase=0
				}	
			}else{
				
				//__________________________________________Fries Two Melee__________________________________________
				if(Control.talentmapArray[4,1]>0){	
					
					chance=6
					
					for(i=0;i<5;i+=1){
						
						created=instance_create_depth(x,y-chance+other.i*2,0,Abil)
						with(created){
							seperate=irandom(50)
								hsp=0
								vsp=0
								diddmg=0
								dmg=1.5
								dmgtwo=2
								
								dmg+=dmg*(Control.talentmapArray[5,1]*0.05)
								dmg+=dmg*(Control.talentmapArray[6,1]*0.25)
								dmg+=dmg*(Control.invenArray[25,3]*0.01)
								
								dmgtwo+=dmgtwo*(Control.talentmapArray[5,1]*0.05)
								dmgtwo+=dmgtwo*(Control.talentmapArray[6,1]*0.25)
								dmgtwo+=dmgtwo*(Control.invenArray[25,3]*0.01)
								
								yspotfour=other.chance
								img=30+irandom(4)

								ketchupcheck=0
								version=0
								if(Me.passivethree>0){
									img+=8
									version=1
									dmg=dmgtwo
									ketchupcheck=1
								}
					
								dmg+=dmg*(Control.invenArray[25,3]*0.01)
								
								
								Me.passive=1
								xspot=Me.x-x
								yspot=Me.y-y
								type=0
								pin=26
								en=0
								creator=other.id
								imgsped=0
								
								
								if(Control.talentmapArray[6,1]>0){	
									returns=1	
								}else{
									returns=0
								}
									
									temp=1
					
								imgcap=1
								phase=0
								sprite_index=abil_burger_two_spr
								image_index=img
								depth=Me.depth+1
								image_speed=0
								dur=400+irandom(100)
								durtotal=dur
								pintwo=0
								xspottwo=random_range(-6,6)
								yspottwo=0
								imgangle+=random_range(-5,5)
								tick=choose(0,1)
								ticktwo=choose(0,1)
								imgangle+=choose(180,0)
								if(other.i mod 2==0){
									depth=Me.depth-1
								}
								spinamount=choose(random_range(-0.15,-0.25),random_range(0.15,0.25))
								shootid=other.i
								shootidtwo=0
								yspotthree=0
								grounded=0
						}						
					}
				}
			
			}
		}else{
#endregion	
#region Burger Abil 3 Ketchup
	//____________________________________________________________________________---------------------(Burger 3 Ketchup)---------------------____________________________________________________________________________
			if(argument0==3){
				if(Control.talentmapArray[10,1]>0){	
					temp=1
					created=instance_create_depth(x,y,0,Abil)
					with(created){
							diddmg=0
							dmg=4
					
							dmg+=dmg*(Control.invenArray[25,3]*0.01)
							Me.passive=1
						type=0
						pin=28
						en=0
						creator=other.id
						imgsped=0
							img=34
							temp=1
		
						imgcap=1
						sprite_index=abil_burger_spr
						image_index=img
						depth=Me.depth+1
						image_speed=0
						dur=300
						durtotal=dur
						pintwo=0
					}			
				}else{
					//Tomato Boom
						if(Control.talentmapArray[13,1]>0){
							
							
							
							if(global.con_h_up||global.conp_h_up){
								temp=1
							}else{
								if(global.con_h_down||global.conp_h_down){
									temp=2
								}else{
									temp=0
								}		
							}

							created=instance_create_depth(x,y,0,Abil)
							with(created){
									diddmg=0
									dmg=4
					
								dmg+=dmg*(Control.talentmapArray[11,1]*0.05)
								dmg+=dmg*(Control.talentmapArray[12,1]*0.25)
								dmg+=dmg*(Control.invenArray[25,3]*0.01)
									Me.passive=1
								type=0
								pin=28
								en=0
								creator=other.id
								imgsped=0
								imgangle=0
									img=8
									temp=1
									move=0
									pintwo=0
								

								imgcap=1
								sprite_index=abil_burger_two_spr
								image_index=img
								depth=Me.depth+1
								image_speed=0
								dur=100
								durtotal=dur
								grav=0.1
								gravtwo=0.05
								dir=other.dir
					
								chance=-1
								if(other.temp==0){
									hsp=2.1
									vsp=chance-0.2
								}else{
									if(other.temp==1){
										hsp=1.6
										vsp=chance-1.5
									}else{
										if(other.temp==2){
											hsp=2.6
											vsp=chance+1
										}
									}			
								}
								
								hsp=hsp*dir
								
							}							
						}
				}

			}else{
#endregion		
			}
		}
	}
	}else{
#endregion
#region Crab
	//____________________________________________________________________________---------------------(Crab)---------------------____________________________________________________________________________
	if(class==5){
#region Crab Abil 1
		if(argument0==1){

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


			created=instance_create_depth(xpos,ypos,0,Abil)
			with(created){
					sndobjectone=instance_create_depth(x,y,0,Snd)
					with(sndobjectone){
						sndemitone=audio_emitter_create()				
						audio_play_sound_on(sndemitone,choose(snd_crab_fish_1,snd_crab_fish_2,snd_crab_fish_3),false,8)
						audio_emitter_falloff(sndemitone, 48, Control.falloff_max, Control.falloff_factor)					
					}	
			type=1
			pin=40
			move=0
			diddmg=0
			dmg=4
			tick=0
			ticky=0
			
			dmg+=dmg*(Control.talentmapArray[2,1]*0.05)
			dmg+=dmg*(Control.invenArray[25,3]*0.01)
			creator=other.id
			sprite_index=abil_crab_spr
			mask_index=abil_crab_mask_spr
			depth=other.depth-1
			spin=1
			num=choose(0,1,2)
			num=1
			num=Me.passive
			if(num==0){
				img=34
			}else{
				if(num==1){
					img=38
				}else{
					img=42
				}
			}
			imgcap=3
			imgsped=0.1
			image_speed=0
			image_index=irandom_range(img,img+imgcap)
			dur=(30+(Control.talentmapArray[1,1]*3))+12*num
			durtotal=dur
			phase=1
			speed=1.75
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
			}	
			
			//--------------------------------------------------------------------------------------------{Bonus Fish}--------------------------------------------------------------------------------------------
			if(Control.talentmapArray[3,1]==1){
				
				for(i=0;i<Me.passive+1;i+=1){
					created=instance_create_depth(xpos,ypos,0,Abil)
					with(created){
							sndobjectone=instance_create_depth(x,y,0,Snd)
							with(sndobjectone){
								sndemitone=audio_emitter_create()				
								audio_play_sound_on(sndemitone,choose(snd_crab_fish_1,snd_crab_fish_2,snd_crab_fish_3),false,8)
								audio_emitter_falloff(sndemitone, 48, Control.falloff_max, Control.falloff_factor)					
							}	
					type=1
					pin=40
					move=0
					diddmg=0
					dmg=1
					tick=0
					ticky=other.i mod 2
			
					dmg+=dmg*(Control.invenArray[25,3]*0.01)
					creator=other.id
					sprite_index=abil_crab_spr
					mask_index=abil_crab_mask_spr
					depth=other.depth-1
					spin=1
					num=choose(0,1,2)
					num=1

					img=55
					imgcap=3
					imgsped=0.1
					image_speed=0
					image_index=irandom_range(img,img+imgcap)
					dur=(30+(Control.talentmapArray[1,1]*3))+12*num
					dur+=10+(Control.talentmapArray[1,1]*3)-other.i*2
					durtotal=dur
					phase=1
					speed=1.75
					speed=1+other.i*0.2
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
					}		
				}
			}
		}else{
#endregion	
#region Broom Witch Abil 2 ?? Not Needed ??
	//____________________________________________________________________________---------------------(Broom WITCH)---------------------____________________________________________________________________________
		if(argument0==2){
			gravcd=2
			gravtick=1
			gravpercent=0.02
			wepx=1
			wepy=4
			img=28
			imgcap=0
			image_index=img		
			stun=2
			

			if(global.con_h_up||global.conp_h_up){
					temp=1
					vsp=-2.8
					if(dir==1){
						if(hsp<0.5){
							hsp=0.5
						}else{
							hsp=1
						}
					}else{
						if(hsp>-0.5){
							hsp=-0.5
						}else{
							hsp=-1
						}			
					}
								if(dir==1){
									wepangle=30
								}else{
									wepangle=330
								}	
			}else{
				if(global.con_h_down||global.conp_h_down){
					temp=2
					vsp=-1
					if(dir==1){
						if(hsp<1.5){
							hsp=1.5
						}
					}else{
						if(hsp>-1.5){
							hsp=-1.5
						}				
					}
								if(dir==1){
									wepangle=330						
								}else{
									wepangle=30
								}	
				}else{
					temp=0
					vsp=-2.5
					if(dir==1){
						if(hsp<0.5){
							hsp=0.5
						}
					}else{
						if(hsp>-0.5){
							hsp=-0.5
						}				
					}
					wepangle=0	if(dir==1){
									wepangle=15			
								}else{
									wepangle=345
								}				}		
			}	
		
		created=instance_create_depth(xpos,ypos,0,Abil)
			with(created){
				temp=other.temp
			type=1
			pin=2
			hsp=0
			vsp=0
			visible=false
			dur=75
			creator=other.id
			}	
		}else{
#endregion	
#region 
	//____________________________________________________________________________---------------------(CRAB Jellyfish)---------------------____________________________________________________________________________
			if(argument0==3){
			

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


			created=instance_create_depth(xpos,ypos,0,Abil)
			with(created){
					sndobjectone=instance_create_depth(x,y,0,Snd)
					with(sndobjectone){
						sndemitone=audio_emitter_create()		
						
						audio_play_sound_on(sndemitone,choose(snd_crab_squid_throw_1,snd_crab_squid_throw_2,snd_crab_squid_throw_3),false,8)
						//audio_play_sound_on(sndemitone,choose(snd_crababilwave_1,snd_crab_wave_2,snd_crab_wave_3),false,8)
						audio_emitter_falloff(sndemitone, 48, Control.falloff_max, Control.falloff_factor)					
					}					
			type=1
			pin=41
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
				dmg=2+num
				dmg+=dmg*(Control.invenArray[25,3]*0.01)
			grav=0.1
			gravtwo=0.1
			
			if(num==0){
				img=143
			}else{
				if(num==1){
					img=146
				}else{
					img=149
				}
			}
			imgcap=2
			imgsped=0.07
			image_speed=0
			image_index=irandom_range(img,img+imgcap)
			dur=100+40*num
			durtotal=dur
			phase=1
			speed=1.2
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
			hsp=hsp
			hsp=hspeed
			vsp=vspeed
			grav=0.022
			gravtwo=0.0082
			speed=0
			yscale=-1
			if(other.temp==-1){
				hsp=hsp*-1
			}
				if(hsp<0){
					imgangle+=90
					dir=-1
					if(temp==1){
						dir=-1
						imgangle=0
						
					}
					if(temp!=-1){
						image_xscale=-1
						imgangle+=180
					}
				}else{
					imgangle-=90
				}
				image_angle=0
				
				hsptwo=hsp
				vsptwo=vsp
				if(hsp>0){
					going=1
				}else{
					going=-1
				}
				if(vsp>0){
					goingtwo=1
				}else{
					goingtwo=-1
				}
				imgsave=img
				attcd=0
				attcdtotal=15
				img=imgsave
				dmgArray[0]=0
				dmgArray[1]=0
				releasew=0
				delay=0
			}	
			}else{
#endregion		
			}
		}
	}
	}else{
#endregion

#region Super 
	//____________________________________________________________________________---------------------(Super Punch)---------------------____________________________________________________________________________
	if(class==6){
#region Super Abil 1
		if(argument0==1){
			
		

	if(passivefourArray[1,2]==passivefourArray[1,3]){
		passivefourArray[1,2]=0
					//Super Bacon Punch 
					for(i=0;i<5;i+=1){
							created=instance_create_depth(x-3+random(6),y-6+random(6),0,Abil)
							with(created){
			
								startx=x
								starty=y
								extrax=0
								extray=0
			
								type=2
								pin=53
								phase=0
								move=0
								diddmg=0
								dmg=1
				
								chance=dmg
			
			
								//dmg+=chance*(Control.talentmapArray[3,1]*0.25)
								dmg+=chance*(Control.invenArray[25,3]*0.01)
			
								creator=other.id
			
								depth=other.depth-2
								spin=1
								extra=0
								
								imgrem=0
								
									sprite_index=abil_super_two_spr
									if(other.i<3){
										img=342+irandom(2)
										image_index=img
									}else{
										if(other.i==3){
											img=345
											imgrem=3
											image_index=img
											depth-=1
											
										}else{
											img=346
											imgrem=4
											image_index=img
											depth-=1
										}
									}
									imgcap=1
			
								image_speed=0
								
								dur=140+irandom(40)
								count=0
								durtotal=dur
								phase=0
							
								direction=random_range(30,60)
								speed=random_range(1.8,2.2)
								sped=speed
								hsp=hspeed
								vsp=vspeed
								grav=0.1
								gravtwo=0.04
				
								hsp=hsp*Me.dir
								speed=0
								tick=0
								starty=y
								tickamount=0
								imgangle=random(360)
								
								sped=0.3
								hsp=sped*Me.dir
								
								tick=choose(0,1)
								ticktwo=choose(0,1)
								extrax=irandom_range(-10,10)
								extray=irandom_range(-10,10)
				
							}						
						}
	}
			
			created=instance_create_depth(xpos,ypos,0,Abil)
			with(created){
				
				startx=x+Me.hsp*5
				starty=y
				
				pushsped=Control.talentmapArray[1,1]*0.3
				pushamount=0

				hurtnum=0
				hurtArray[0]=0

				part=1
				partdir=Me.dir
				pin=50
				diddmg=0
				
				depth=other.depth-1

				dmg=3
				chance=dmg
			
				dmg+=dmg*(Control.talentmapArray[2,1]*0.05)
				//dmg+=dmg*(Control.talentmapArray[3,1]*0.25)
			
				//dmg+=chance*(Control.talentmapArray[3,1]*0.25)
				dmg+=chance*(Control.invenArray[25,3]*0.01)
			
				
			
				creator=other.id
			
				spin=0
				extra=0
				sprite_index=abil_super_two_spr
			

				dur=30
				durtotal=dur
				phase=1		
				imgsped=0.6
				
				
				if(Control.talentmapArray[3,1]>0){
					if(other.passivefourArray[0,1]==3){
						img=306
						imgopt=1
						dur=45
						imgsped=0.225
						startx=x
						starty=y
					}else{
						img=37
						imgopt=0					
					}
				}else{
					img=37
					imgopt=0
				}
				imgcap=6+1
				
				
				image_speed=0
				image_index=img

				hsp=0
				vsp=0
				speed=0
				
				opt=0
				if(Me.dir==1){
					opt=1
				}else{
					image_index+=7
					img+=7
					opt=-1
				}
				
				if(global.con_h_down){
					if(Control.talentmapArray[3,1]>0){
						if(other.passivefourArray[0,1]==3){
							img=320
							image_index=img							
						}else{
							img=51
							image_index=img						
						}
					}else{
					img=51
					image_index=img
					}
					opt=2
						if(Me.passivethree==1){
							Me.passivethree=0
							Me.vsp=2
						}
				}else{
					if(global.con_h_up){
						if(Control.talentmapArray[3,1]>0){
							if(other.passivefourArray[0,1]==3){
								img=327
								image_index=img							
							}else{
								img=58
								image_index=img						
							}
						}else{
						img=58
						image_index=img
						}
						opt=3
						if(Me.passivethree==1){
							Me.passivethree=0
							Me.vsp=-2
						}
					}else{
				
					}				
				}
				
				yshift=0
				xshift=0
				
				if(opt==1){
						x=Me.x+18+2
						y=Me.y+4

				}else{
					if(opt==-1){
						x=Me.x-18-2
						y=Me.y+4	
					}else{
						if(opt==2){
							x=Me.x
							y=Me.y+18+8	
							
						}else{
							if(opt==3){
								x=Me.x
								y=Me.y-18-6
							}else{
					
							}					
						}					
					}
				}
				
				
				if(opt==1||opt==-1){
						if(other.passivefourArray[0,1]==1){
							yshift=-5
						}else{
							if(other.passivefourArray[0,1]==2){
								yshift=3
							}else{
								if(other.passivefourArray[0,1]==3){
									yshift=-5
								}
							}
						}				
				}
				
					
				if(opt==2||opt==3){
					if(Me.dir==1){
						dir=1
					}else{
						dir=-1
					}
						if(dir==1){
							if(other.passivefourArray[0,1]==1){
								xshift=-5
							}else{
								if(other.passivefourArray[0,1]==2){
									xshift=3
								}else{
									xshift=-2
								}
							}	
						}
						xshift=xshift*dir
				}

			}
			
			chance=2
			if(Control.talentmapArray[3,1]>0){
				chance+=1
			}
			if(passivefourArray[0,1]<chance){
				passivefourArray[0,1]+=1
				passivefourArray[0,0]=35
			}else{
				passivefourArray[0,1]=0
				passivefourArray[0,0]=44
				abilArray[0,1]=50
				abilArray[0,2]=50
			}			
			
		}else{
#endregion		
	//____________________________________________________________________________---------------------(Super Waffle)---------------------____________________________________________________________________________
#region Waffle Super Abil 2
		if(argument0==2){
	

			if(Control.talentmapArray[10,1]>0){
							
				
				created=instance_create_depth(xpos,ypos,0,Abil)
				with(created){
			
					type=1
					pin=51
					move=0
					diddmg=0
					dmg=8
				
					chance=dmg
			
					dmg+=dmg*(Control.talentmapArray[12,1]*0.05)
			
					//dmg+=chance*(Control.talentmapArray[3,1]*0.25)
					dmg+=chance*(Control.invenArray[25,3]*0.01)
			
					creator=other.id
			
					depth=other.depth-1
					spin=1
					extra=0
						sprite_index=abil_super_two_spr
						img=65
						imgcap=1
			
					image_speed=0
					image_index=img
					dur=200-(Control.talentmapArray[11,1]*15)
					count=0
					durtotal=dur
					phase=0
					speed=1
					sped=speed
					hsp=hsp
					hsp=hspeed
					vsp=vspeed
				
					hsp=hsp*Me.dir
					speed=0
					tick=0
					starty=y
					tickamount=0
				
				}	
			}else{

				if(Control.talentmapArray[13,1]>0){
	//____________________________________________________________________________---------------------(Super Cereal)---------------------____________________________________________________________________________
	
	
					created=instance_create_depth(x,y-6,0,Abil)
					with(created){
			
						dmgedArray[0]=0
			
						type=1
						pin=51
						move=0
						diddmg=0
						dmg=15
						
						delay=99
			
						chance=dmg
						meimg=0
			
						dmg+=dmg*(Control.talentmapArray[15,1]*0.25)
						dmg+=dmg*(Control.talentmapArray[14,1]*0.05)
			
						dmg+=chance*(Control.invenArray[25,3]*0.01)
						
						dmgsave=dmg
						
						dmgcap=dmg
			
						creator=other.id
			
						depth=other.depth-1
						spin=1
						extra=0
							sprite_index=abil_super_spr
							mask_index=abil_super_mask_spr
							imgnum=choose(0,1,2)
							img=1+(imgnum*9)
							imgcap=3
			
						image_speed=0
						image_index=img
						dur=300
						durtotal=dur
						phase=1
						sped=1
						hsp=0
						vsp=-1
						grav=0.25
						gravtwo=0.05
						phase=0

						tick=0
						starty=y
						tickamount=0
						//hsp=hsp*Me.dir
						speed=0

/*
						for(i=0;i<7;i+=1){
							if(!instance_place(x,y-10,Block)){
								y-=10
							}else{
								if(!instance_place(x,y-5,Block)){
									y-=5
								}
								break
							}
							if(i==6){
								y+=5
							}
						}
						*/

						bk1=instance_create_depth(x,y,0,Part)
						with(bk1){
									type=0
									pin=0
									pintwo=0
									depth=other.depth+2
									spin=1
									img=other.img+4

									imgcap=1
									imgsped=0
									image_speed=0
									image_index=img
									imgsped=0
									sprite_index=abil_super_spr
									image_speed=0
									dur=other.dur
									durtotal=dur
			
									chance=1
									xscale=chance
									yscale=chance
									phase=1
									speed=0
									visible=false
					
					}	
					
					//Cereal particles
					for(i=0;i<10;i+=1){
							created=instance_create_depth(x-7+random(14),y-7+random(14),0,Part)
							with(created){
										type=2
										pin=1
										pintwo=1
										depth=other.depth-1
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
										dur=10+irandom(20)
													
										direction=random_range(60,120)
										speed=random_range(0.4,1)
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

							if(instance_place(x,y,Block)){
									y-=4
								for(i=0;i<12;i+=1){
									if(instance_place(x,y,Block)){
										y-=4
									}else{
										i=100
									}
								}
							}

					}	

				img=40
				image_index=img
				maskdraw=0
				stun=2
			}
			}
			
		}else{
#endregion
	//____________________________________________________________________________---------------------(Fly Doughtnut Charge)---------------------____________________________________________________________________________
#region Fly Super Abil 3
		if(argument0==3){

		if(Control.talentmapArray[19,1]>0){
			passivefourArray[1,14]=1
		}	

			if(Control.talentmapArray[4,1]>0){
			
			created=instance_create_depth(xpos,ypos,0,Abil)
			with(created){
			
				type=1
				pin=52
				move=0
				diddmg=0
				dmg=5
			
				chance=dmg
			
				dmg+=dmg*(Control.talentmapArray[6,1]*0.25)
			
				//dmg+=chance*(Control.talentmapArray[3,1]*0.25)
				dmg+=chance*(Control.invenArray[25,3]*0.01)
			
				creator=other.id
			
				depth=other.depth+1
				spin=1
				extra=0
					sprite_index=abil_super_two_spr
					img=107+choose(0,0,1,1,2,3,4)
					imgcap=1
			
				image_speed=0
				image_index=img
				dur=20
				count=0
				durtotal=dur
				phase=0
				speed=1
				sped=speed
				hsp=hsp
				hsp=0
				vsp=0
				
				hsp=hsp*Me.dir
				speed=0
				tick=0
				starty=y
				tickamount=0
				
				anim=0
				animsped=0.1
				
			}	
			
				img=34
				animsave=34
				imgcap=1
				image_index=img	
				anim=1
				hsp=3
				stun=2
				hsp=hsp*dir			
			
		}else{

	//____________________________________________________________________________---------------------(Fly Toaster)---------------------____________________________________________________________________________
#region Fly Toast Super Abil 3
			if(Control.talentmapArray[7,1]>0){
			
			created=instance_create_depth(x,y,0,Abil)
			with(created){
			
				type=1
				pin=52
				move=0
				diddmg=0
				dmg=3
			
				chance=dmg
			
				dmg+=dmg*(Control.talentmapArray[6,1]*0.25)
			
				//dmg+=chance*(Control.talentmapArray[3,1]*0.25)
				dmg+=chance*(Control.invenArray[25,3]*0.01)
			
				creator=other.id
			
				depth=other.depth+1
				spin=1
				extra=0
					sprite_index=abil_super_two_spr
					img=230
					imgcap=2
					imgsped=0.03
			
				image_speed=0
				image_index=img
				dur=199
				opt=0
				count=0
				durtotal=dur
				phase=0
				speed=1
				sped=speed
				hsp=hsp
				hsp=0
				vsp=0
				
				hsp=hsp*Me.dir
				speed=0
				tick=0
				starty=y
				tickamount=0
				grav=0
				
				anim=0
				animsped=0.1

				toast=instance_create_depth(x,y-4,0,Abil)
				with(toast){
					
					if(Control.talentmapArray[9,1]>0){
						bounce=2
						img=246
					}else{
						bounce=0
						img=180
					}
					type=1
					pin=52
					move=0
					diddmg=0
					dmg=5
			
					chance=dmg
			
					dmg+=dmg*(Control.talentmapArray[9,1]*0.25)
		
					dmg+=chance*(Control.invenArray[25,3]*0.01)
			
					creator=other.id
			
					depth=other.depth+1
					spin=1
					extra=0
						sprite_index=abil_super_two_spr
						
						imgcap=2
						imgsped=0
			
					image_speed=0
					image_index=img
					dur=249
					opt=0
					count=0
					durtotal=dur
					phase=1
					speed=1
					sped=speed
					hsp=hsp
					hsp=0
					vsp=0
					phasetwo=0
				
					hsp=hsp*Me.dir
					speed=0
					tick=0
					starty=y
					tickamount=0
				
					anim=0
					animsped=0.1
				
				
				}	
				
			}	
			
				img=34
				animsave=34
				imgcap=1
				image_index=img	
				anim=1
				hsp=3
				stun=2
				hsp=hsp*dir			
			
		}
		
#endregion		
		}
		}else{
		
		}
#endregion
		}}

#endregion
	}else{
#region Tree 
	//____________________________________________________________________________---------------------(Tree)---------------------____________________________________________________________________________
	if(class==7){
#region Tree Abil 1
		if(argument0==1){

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

						passivefourArray[1,8]=3
						passivefourArray[1,9]=10-(Control.talentmapArray[2,1]*0.5)
//						Control.drawone=passivefourArray[1,9]*9
		
			passivefourArray[100,10]=1
		
			//Leaf
			if(passivefourArray[1,5]==0){
				created=instance_create_depth(xpos,ypos,0,Abil)
				with(created){
			
					startx=x
					starty=y
			
					count=7
			
					visible=false

					attacktick=0
					type=1
					pin=60
					move=0
					diddmg=0
					dmg=2
					tick=0
					ticky=0
					dmg+=dmg*(Control.invenArray[25,3]*0.01)
					creator=other.id
					spin=1
					img=2+choose(0,2,4,6)
					imgcap=1
					imgsped=0.03
					dur=40
					chancefour=0
					durtotal=dur
					phase=-1
					speed=0.6
					temp=other.temp
					inside=0
						imgangle=direction
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
				}	
			}else{
				
				//Acorn
				if(passivefourArray[1,5]==1){

						passivefourArray[100,10]=1

						passivefourArray[1,8]=0
						passivefourArray[1,9]=50-(50*(Control.talentmapArray[2,1]*0.05))
//						Control.drawone=passivefourArray[1,9]*3

						created=instance_create_depth(xpos,ypos,0,Abil)
						with(created){
			
			
							type=1
							pin=61
							move=0
							diddmg=0
							dmg=5
							opt=1
			
							chance=dmg
			
							dmg+=dmg*(Control.talentmapArray[6,1]*0.25)
			
							//dmg+=chance*(Control.talentmapArray[3,1]*0.25)
							dmg+=chance*(Control.invenArray[25,3]*0.01)
			
							creator=other.id
							count=0
							released=0
			
							depth=other.depth+1
							spin=1
							extra=0
								visible=false
								img=107+choose(0,0,1,1,2,3,4)
								imgcap=1
			
							image_speed=0
							image_index=img
							dur=20
							count=0
							durtotal=dur
							phase=0
							speed=1
							sped=speed
							hsp=hsp
							hsp=0
							vsp=0
				
							tick=0
							starty=y
							tickamount=0
				
							anim=0
							animsped=0.1
				
						}	
					
				}
			}
		}else{
#endregion	

	//____________________________________________________________________________---------------------(Tree)---------------------____________________________________________________________________________
#region Tree Abil 3
		if(argument0==2){

chance=1

				if(passivefourArray[1,5]==0){
					
					
					//Sap
					if(Control.talentmapArray[10,1]>=1){
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
					
							
							if(Me.dir==1){
								xpos=5
							}else{
								xpos=-5
							}
							
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
							pin=63
							move=0
							diddmg=0
							dmg=5
						
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
							img=53
							imgcap=1
							imgsped=0.03
							image_speed=0
							image_index=img
							dur=90
							durtotal=dur
							phase=0
							speed=2
							temp=other.temp
							inside=0
							bounceamt=0.8
							opt=0
							sndcdtotal=10
							sndcd=sndcdtotal
							expl=0
							dir=Me.dir

							image_angle=direction*other.dir						
						hsp=hsp
						hsp=hspeed
						vsp=vspeed
						
						grav=0
						gravtwo=0
						
						speed=0
						temp=other.temp
						
							if(temp==1){
								hsp=0.5
								vsp=0
							
							}else{
								if(temp==2){
									hsp=0.3
									vsp=-0.2
								
								}else{
									if(temp==3){
										hsp=0.3
										vsp=0.2
									
									}else{
							
									}							
								}							
							}	
							
							hsp=hsp*Me.dir
							
						}	
					}else{
					
						//Sapling
						if(Control.talentmapArray[13,1]>=1){
							
							if(Me.passivefourArray[100,14]!=0){
								if(instance_exists(Me.passivefourArray[100,14])){
									with(Me.passivefourArray[100,14]){
										phase=4
									}
									Me.passivefourArray[100,14]=0
								}
							}	
							
							if(Me.passivefourArray[100,14]==0){
								
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
					
							
										if(Me.dir==1){
											xpos=5
										}else{
											xpos=-5
										}
							
									created=instance_create_depth(Me.x+xpos,Me.y+2,0,Abil)
									with(created){
							
										Me.passivefourArray[100,14]=id
							
										startx=x
										starty=y
							
											sndobjectone=instance_create_depth(x,y,0,Snd)
											with(sndobjectone){
												sndemitone=audio_emitter_create()				
												audio_play_sound_on(sndemitone,choose(snd_crab_fish_1,snd_crab_fish_2,snd_crab_fish_3),false,8)
												audio_emitter_falloff(sndemitone, 48, Control.falloff_max, Control.falloff_factor)					
											}	
										type=1
										pin=64
										move=0
										diddmg=0
										dmg=5
						
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
										depth=other.depth+3
										spin=1
										img=170
										imgcap=1
										imgsped=0
										image_speed=0
										image_index=img
										dur=90
										durtotal=dur
										phase=0
										speed=2
										temp=other.temp
										inside=0
										bounceamt=0.8
										opt=0
										sndcdtotal=10
										sndcd=sndcdtotal
										expl=0
										dir=Me.dir
										attdel=0
									

										image_angle=direction*other.dir						
									hsp=hsp
									hsp=hspeed
									vsp=vspeed
						
									grav=0.1
									gravtwo=0.05
						
									speed=0
									temp=other.temp
						
										if(temp==1){
											hsp=2
											vsp=0
							
										}else{
											if(temp==2){
												hsp=1.7
												vsp=-0.5
								
											}else{
												if(temp==3){
													hsp=1.7
													vsp=0.5
									
												}else{
							
												}							
											}							
										}	
										vsp-=1
							
										hsp=hsp*Me.dir
							
									}	
								}
						}
					}					
					
					
					
				}else{

				//Log
				if(passivefourArray[1,5]==1){

					if(Control.talentmapArray[10,1]>=1){
						passivefourArray[1,8]=1
						passivefourArray[1,9]=75
	//					Control.drawone=passivefourArray[1,9]*3

						created=instance_create_depth(xpos,ypos,0,Abil)
						with(created){
							opt=2
							type=1
							pin=61
							move=0
							diddmg=0
							dmg=5
							count=0
			
							chance=dmg
			
							dmg+=dmg*(Control.talentmapArray[6,1]*0.25)
			
							//dmg+=chance*(Control.talentmapArray[3,1]*0.25)
							dmg+=chance*(Control.invenArray[25,3]*0.01)
			
							creator=other.id
							released=0
			
							depth=other.depth+1
							spin=1
							extra=0
								visible=false
								img=107+choose(0,0,1,1,2,3,4)
								imgcap=1
			
							image_speed=0
							image_index=img
							dur=20
							durtotal=dur
							phase=0
							speed=1
							sped=speed
							hsp=hsp
							hsp=0
							vsp=0
				
							tick=0
							starty=y
							tickamount=0
				
							anim=0
							animsped=0.1
				
						}	

					}else{

						//Vine
						if(Control.talentmapArray[13,1]>=1){
							passivefourArray[1,8]=2
							passivefourArray[1,9]=75-(75*(Control.talentmapArray[14,1]*0.05))
		//					Control.drawone=passivefourArray[1,9]*3

							created=instance_create_depth(xpos,ypos,0,Abil)
							with(created){
								opt=3
								type=1
								pin=61
								move=0
								diddmg=0
								dmg=5
			
								chance=dmg
			
								dmg+=dmg*(Control.talentmapArray[6,1]*0.25)
			
								//dmg+=chance*(Control.talentmapArray[3,1]*0.25)
								dmg+=chance*(Control.invenArray[25,3]*0.01)
			
								creator=other.id
								count=0
								released=0
			
								depth=other.depth+1
								spin=1
								extra=0
									visible=false
									img=107+choose(0,0,1,1,2,3,4)
									imgcap=1
			
								image_speed=0
								image_index=img
								dur=20
								count=0
								durtotal=dur
								phase=0
								speed=1
								sped=speed
								hsp=hsp
								hsp=0
								vsp=0
				
								tick=0
								starty=y
								tickamount=0
				
								anim=0
								animsped=0.1
							}
						}	
					}

				}else{
				
				}}
			

		}else{
#endregion	

	//____________________________________________________________________________---------------------(Tree Stump)---------------------____________________________________________________________________________
#region Tree Abil 3
		if(argument0==3){

			if(passivefourArray[1,5]==0){
				passivefourArray[1,5]=1
			}else{
				passivefourArray[1,5]=0
			}


		}else{
#endregion	

	//____________________________________________________________________________---------------------(Tree)---------------------____________________________________________________________________________
#region Tree Abil 4
		if(argument0==4){



		}else{
#endregion	
		}}}}
	}else{

#endregion

	//____________________________________________________________________________---------------------(Candy)---------------------____________________________________________________________________________
	if(class==8){
#region Cookie Candy Abil 1
		if(argument0==1){

			//Cookie Choose
			if(wep==0){
				if(abilArray[0,1]==0){
					wep=choose(17,17,17,17,17,17,18,18,18,18,18,18,19,19,20)
					if(passivefourArray[10,2]==2||passivefourArray[10,3]==1){
						wep=21
					}
				}
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
			temp = temp *dir
			
			if(Me.abilArray[16,2]==0){
				Me.abilArray[16,2]=2
			}
			if(dir==1){
				Me.abilArray[16,3]=0
			}else{
				Me.abilArray[16,3]=1
			}


		chance=1
	if(Control.talentmapArray[3,1]>0){
		chance=3	
	}
	for(i=0;i<chance;i+=1){
		
			created=instance_create_depth(xpos,ypos,0,Abil)
			with(created){
				
				/*
					sndobjectone=instance_create_depth(x,y,0,Snd)
					with(sndobjectone){
						sndemitone=audio_emitter_create()				
						audio_play_sound_on(sndemitone,choose(snd_witch_spell_1,snd_witch_spell_2),false,8)
						audio_emitter_falloff(sndemitone, 48, Control.falloff_max, Control.falloff_factor)					
					}	
				*/
			bouncecd=0
					
					colors=-1
					colortick=0
					
			type=1
			pin=70
			move=1
			diddmg=0
			dmg=5
			
			chance=dmg
			
			//dmg+=dmg*(Control.talentmapArray[1,1]*0.05)
			
			dmg+=chance*(Control.talentmapArray[3,1]*0.25)
			dmg+=chance*(Control.invenArray[25,3]*0.01)
			
			creator=other.id
			
			depth=other.depth-1
			spin=1
			extra=0
			

				sprite_index=abil_spr
				img=1
				imgcap=3
				imgsped=1			

			if(Me.passivefourArray[10,2]==2||Me.passivefourArray[10,3]==1){
				Me.wep=21
			}	

			fire=0
			burnt=0

			sprite_index=abil_candy_spr
			if(Me.wep==17){
				img=1
			}else{
				if(Me.wep==18){
					img=6
				}else{
					if(Me.wep==19){
						img=11
					}else{
						if(Me.wep==20){
							img=16
						}else{
							if(Me.wep==21){
								img=262
								burnt=1
								dmg=dmg*0.75
							}
						}			
					}			
				}			
			}
			

			if(Me.passivefourArray[10,2]==1){
				fire=1
				fireamount=2
				fireamount=1
				//dmg=dmg*1.25
				
				
							fireArray[0]=0
							for(i=0;i<fireamount;i+=1){
							
								fireArray[i]=instance_create_depth(x-1.5+random(3),y-1.5+random(3),0,Part)
								with(fireArray[i]){
									type=1
									pin=1
									sprite_index=abil_candy_spr
									depth=other.depth-2
									spin=1
									img=6
									img=255
									imgcap=2
									imgsped=0.1
									image_speed=0
									image_index=irandom_range(img,img+imgcap)
									dur=6+choose(0,0,0,1,1,2)+irandom(8)
									durtotal=dur
									hsp=0
									vsp=0
									
									startx=other.x-x
									starty=other.y-y

								}	
							}
								
				
			}
			
			Me.wep=0
			imgcap=0
			
			
			image_speed=0
			image_index=irandom_range(img,img+imgcap)
			
			speed=1
			dur=80+Control.talentmapArray[2,1]*7
			
			/*
			if(img==1||img==6){
			speed=1
			dur=90		
			}else{
				if(img==11){
					speed=0.8
					dur=115		
				}else{
					if(img==16){
						speed=1.2
						dur=75			
					}
				}			
			}
			*/
			
			durtotal=dur
			phase=1
			
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
				image_angle=random(360)
				imgangle=image_angle
				if(hspeed<0){
					image_yscale=-1
				}
			hsp=hsp
			hsp=hspeed
			vsp=vspeed
			speed=0
			
				//Cookie Bites
				if(Control.talentmapArray[3,1]>0){
					img=choose(70,70,70,70,70,70,70,70,70,70,70,70,75,75,80)
					image_index=img
					dmg=2
					
					dur-=15
					dur+=irandom(30)
			
					x-=3+random(6)
					y-=3+random(6)
			
					if(other.i==1){
						x-=4
					}else{
						if(other.i==2){
							x+=4
						}else{
							y-=8
						}			
					}
					y+=4.5
				}
			
			}	
		}
		
		
			
		}else{
			
#region Candy Abil 2 Cake
		if(argument0==2){

		//CAKE
		if(Control.talentmapArray[4,1]>0){
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
			
			if(Me.abilArray[16,2]==0){
				Me.abilArray[16,2]=2
			}
			if(dir==1){
				Me.abilArray[16,3]=0
			}else{
				Me.abilArray[16,3]=1
			}

			created=instance_create_depth(xpos,ypos,0,Abil)
			with(created){
				
				/*
					sndobjectone=instance_create_depth(x,y,0,Snd)
					with(sndobjectone){
						sndemitone=audio_emitter_create()				
						audio_play_sound_on(sndemitone,choose(snd_witch_spell_1,snd_witch_spell_2),false,8)
						audio_emitter_falloff(sndemitone, 48, Control.falloff_max, Control.falloff_factor)					
					}	
				*/
					
			type=0
			pin=71
			move=0
			diddmg=0
			dmg=8
			
			chance=dmg
			
			//dmg+=dmg*(Control.talentmapArray[5,1]*0.05)
			
			dmg+=chance*(Control.talentmapArray[6,1]*0.25)
			
			
			dmg+=chance*(Control.invenArray[25,3]*0.01)
			
			creator=other.id
			
			depth=other.depth-1
			spin=1
			extra=0
			if(Control.talentmapArray[3,1]>0){
				sprite_index=abil_witch_spr
				img=109
				imgcap=1
				imgsped=0.2
			}else{
				sprite_index=abil_spr
				img=1
				imgcap=3
				imgsped=1			
			}
			sprite_index=abil_candy_spr
			img=choose(1,1,1,6,6,6,11,11,16)
			imgcap=0
			
			img=choose(22,22,22,22,22,22,22,22,22,22,30,30,30,38,38,46,54,54,54)
			imgcap=3
			imgsped=0.1
			
			chance=0
			
			image_speed=0
			image_index=img+2
			
			speed=0.5
			dur=90+Control.talentmapArray[5,1]*18




			dur+=30
			
			durtotal=dur
			phase=1
	
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
				image_angle=random(360)
				imgangle=image_angle
				imgangle=0

			hsp=hsp
			hsp=hspeed
			vsp=vspeed
			speed=0
			
			dir=Me.dir
			
				chance=0
				while(instance_place(x,y,Block)&&chance<10){
					y-=1
					chance+=1
				}			
			}	
		}else{
		
		
			//if(Control.talentmapArray[4,1]>0){
			//Cinnamon Roll
			
#region Candy Abil 2 Cinnamon roll
		
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

			created=instance_create_depth(xpos,ypos-3,0,Abil)
			with(created){
					
			type=0
			pin=73
			move=0
			diddmg=0
			dmg=8
			
			chance=dmg
			
			//dmg+=dmg*(Control.talentmapArray[5,1]*0.05)
			
			dmg+=chance*(Control.talentmapArray[6,1]*0.25)
			
			dmg+=chance*(Control.invenArray[25,3]*0.01)
			
			creator=other.id
			
			depth=other.depth-1
			spin=1
			extra=0
			/*
			if(Control.talentmapArray[3,1]>0){
				sprite_index=abil_witch_spr
				img=109
				imgcap=1
				imgsped=0.2
			}else{
				sprite_index=abil_spr
				img=1
				imgcap=3
				imgsped=1			
			}
			*/
				sprite_index=abil_candy_spr
				img=234
				imgcap=1
				imgsped=0
				image_index=img
				imgcap=0
				dmgtimes=0
				attdel=0
				
				if(Control.talentmapArray[9,1]>0){
					img=239
					dmgtimes=1
				}
			
			chance=0
			
			image_speed=0
			image_index=img
			
			speed=0
			dur=120+Control.talentmapArray[8,1]*18

			dur+=30
			
			durtotal=dur
			phase=0
	
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
				image_angle=random(360)
				imgangle=image_angle
				imgangle=0
			
				dir=Me.dir
			
				chance=0
				while(instance_place(x,y,Block)&&chance<10){
					y-=1
					chance+=1
				}		
				
				hsp=0.7+(Control.talentmapArray[8,1]*0.02)
				hsp=Me.dir*hsp
				vsp=-1.7-(Control.talentmapArray[8,1]*0.02)
				grav=0.08
				gravtwo=0.015
				gravthree=0
			}				
			
		}
		
#endregion				
		}else{
#endregion	

#region Candy Abil 3 Item
		if(argument0==3){
			
			
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
			
			if(Me.abilArray[16,2]==0){
				Me.abilArray[16,2]=2
			}
			if(dir==1){
				Me.abilArray[16,3]=0
			}else{
				Me.abilArray[16,3]=1
			}

			created=instance_create_depth(x,y-23,0,Abil)
			with(created){
				
				/*
					sndobjectone=instance_create_depth(x,y,0,Snd)
					with(sndobjectone){
						sndemitone=audio_emitter_create()				
						audio_play_sound_on(sndemitone,choose(snd_witch_spell_1,snd_witch_spell_2),false,8)
						audio_emitter_falloff(sndemitone, 48, Control.falloff_max, Control.falloff_factor)					
					}	
				*/
					
			type=0
			pin=72
			move=0
			diddmg=0
			dmg=8
			
			chance=dmg
			
			//dmg+=dmg*(Control.talentmapArray[5,1]*0.05)
			
			dmg+=chance*(Control.talentmapArray[6,1]*0.25)
			
			
			dmg+=chance*(Control.invenArray[25,3]*0.01)
			
			creator=other.id
			
			depth=other.depth-1
			spin=1
			extra=0
			if(Control.talentmapArray[3,1]>0){
				sprite_index=abil_witch_spr
				img=109
				imgcap=1
				imgsped=0.2
			}else{
				sprite_index=abil_spr
				img=1
				imgcap=3
				imgsped=1			
			}
			sprite_index=abil_candy_spr
			img=choose(1,1,1,6,6,6,11,11,16)
			imgcap=3
			imgsped=0.1
			
			chance=0
			
			image_speed=0
			image_index=img+2
			
			speed=0.5
			dur=90+Control.talentmapArray[5,1]*18




			dur+=30
			
			durtotal=dur
			phase=1
	
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
				image_angle=random(360)
				imgangle=image_angle
				imgangle=0

			hsp=hsp
			hsp=hspeed
			vsp=vspeed
			speed=0
			
			dir=1
			
				chance=0
				while(instance_place(x,y,Block)&&chance<10){
					y-=1
					chance+=1
				}	
				
				//This
				hsp=0
				vsp=0
				grav=0
				dur=10
				img=125
				image_index=img
				imgcap=5
				imgsped=0
				phase=0
				//game_end()
			}	
		}else{
#endregion	



		}
		}			
			
#endregion	
		}
		
		}else{
		
	//____________________________________________________________________________---------------------(Trash)---------------------____________________________________________________________________________
	if(class==9){
#region Mouse Trash Abil 1
		if(argument0==1){

		
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
			
			if(Me.abilArray[16,2]==0){
				Me.abilArray[16,2]=2
			}
			if(dir==1){
				Me.abilArray[16,3]=0
			}else{
				Me.abilArray[16,3]=1
			}


		chance=1
	if(Control.talentmapArray[3,1]>0){
		chance=3	
	}		
			//Trash Mouse
			//If mouse count is less then mouse total count
			if(passivefourArray[1,0]<passivefourArray[1,5]){
			//passivefourArray[1,0]+=1

			created=instance_create_depth(xpos,ypos,0,Abil)
			
			if(passivefourArray[1,1]==0){
				passivefourArray[1,1]=created
			}else{
				if(passivefourArray[1,2]==0){
					passivefourArray[1,2]=created
				}else{
					if(passivefourArray[1,3]==0){
						passivefourArray[1,3]=created
					}else{
						if(passivefourArray[1,4]==0){
							passivefourArray[1,4]=created
						}else{
			
						}			
					}			
				}			
			}
	
			with(created){
				
				
				grounded=0
				anim=0
				animtick=0
				disttimer=0
				
				/*
					sndobjectone=instance_create_depth(x,y,0,Snd)
					with(sndobjectone){
						sndemitone=audio_emitter_create()				
						audio_play_sound_on(sndemitone,choose(snd_witch_spell_1,snd_witch_spell_2),false,8)
						audio_emitter_falloff(sndemitone, 48, Control.falloff_max, Control.falloff_factor)					
					}	
				*/
			bouncecd=0
					
					colors=Me.wep-27
					Me.wep=0
					//colors=0
					
					//if(passivefourArray[1,0]<Me.passivefourArray[1,5]){
						//Decide color based on mouse inventory
				//	}
					
					colortick=0
					
			type=1
			pin=80
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
			

				sprite_index=abil_spr
				mask_index=abil_trash_mask_spr
				
				img=1
				imgcap=3
				imgsped=1			
			
			sprite_index=abil_trash_spr
			img=17+colors*16
			imgsave=img
			
			imgcap=2
			imgsped=0.12
			jump=irandom_range(240,360)
			jumptick=0
			jumps=2
			attdel=0
			atttick=0
			jumptimer=0
			
			image_speed=0
			image_index=irandom_range(img,img+imgcap)
			
			

			
			speed=1
			dur=300
			
			durtotal=dur
			phase=1
			

				image_angle=0
				imgangle=image_angle
				if(hspeed<0){
					dir=-1
				}
				dir=Me.dir

				
			hsp=0.6
			vsp=-1.3
			speed=0
			
			grav=0.08
			gravtwo=0.1

				if(other.temp==-1){
				
				}else{
					if(other.temp==2||other.temp==-2){
						vsp-=1
						//hsp=0.4
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
				
				

				if(Control.talentmapArray[3,1]>=1){
					img+=137
					image_index+=img
					hsp=0.7
					imgsave=img
				}
				
				hsp=hsp*dir

			}	
	
			}		
#endregion

		}else{
	//____________________________________________________________________________---------------------(Trash Abil 2 Garbage)---------------------____________________________________________________________________________

#region Mouse Garbage Abil 1
		if(argument0==2){
			if(global.con_h_up||global.conp_h_up){
				temp=2
			}else{
				if(global.con_h_down||global.conp_h_down){
				temp=3
				}else{
				temp=1
				}		
			}

			chance=1		

			created=instance_create_depth(xpos,ypos,0,Abil)
	
			with(created){
				
				
				grounded=0
				anim=0
				animtick=0
				disttimer=0
			
			type=1
			pin=81
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
			img=117
			imgsave=img
			
			imgcap=3
			imgsped=0.01
			attdel=0
			atttick=0
			
			image_speed=0
			image_index=img
			
			speed=1
			dur=900
			
			durtotal=dur
			phase=1
			
			trashtick=0
			

				//image_angle=random_range(10,40)
				
				
				if(hspeed<0){
					dir=-1
					
					//image_angle=0-random_range(10,40)
				}
				dir=Me.dir

				imgangle=image_angle
				
			hsp=1
			vsp=-1.6
			speed=0
			
			grav=0.08
			gravtwo=0.001

				if(other.temp==-1){
				
				}else{
					if(other.temp==2||other.temp==-2){
						vsp-=1
						//hsp=0.4
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
				
				hsp=hsp*dir
				image_angle=random(30)*choose(1,-1)
				
				if(dir!=1){
					image_angle+=180
				}
				imgangle=image_angle

			}			
		}else{
#endregion

		}
	}
		}
	}}}
	}}
	}
	}
	}

#region Items
		//____________________________________________________________________________---------------------(Feather)---------------------____________________________________________________________________________
	if(argument0==4){
			if(chance==1){
				Me.vsp=0-Control.itemArray[Control.invenArray[23,0],10]-(Control.invenArray[23,2]*Control.itemArray[Control.invenArray[23,0],11])
				created=instance_create_depth(x,y,0,Abil)
				with(created){
			
				type=1
				pin=1
				en=3
				creator=other.id
				sprite_index=enemy_three_spr
				depth=Me.depth
				if(Control.invenArray[23,2]<3){
					img=123
				}else{
					img=137
				}
				image_index=img
				imgcap=3
				imgsped=0.003
				dur=18
				durtotal=dur
				}
#region Feather
	/*
#region Other Feather
			if(Me.dir==-1){
					temp=2
					Me.hsp=-4
					Me.vsp=-2
			}else{
					temp=3
					Me.hsp=4
					Me.vsp=-2	
			
			}
			if(global.con_h_up||global.conp_h_up){
					temp=2
					Me.vsp=-3.5
			}else{
				if(global.con_h_down||global.conp_h_down){
					temp=3
					Me.vsp=3.5
				}else{
				temp=1
				}		
			
			}

			Me.stun=8
			temp = temp *dir


			created=instance_create_depth(x,y,0,Abil)
			with(created){
			type=1
			pin=1
			en=3
			creator=other.id
			sprite_index=dummy_spr
			depth=other.depth-1
			dur=8
			durtotal=dur
			}	
#endregion
	*/
#endregion

			}else{
#region Nest
		//____________________________________________________________________________---------------------(Nest)---------------------____________________________________________________________________________
				if(chance==2){
					created=instance_create_depth(x,y-16,0,Abil)
					with(created){
						xtarget=Me.x-16+random(32)
						ytarget=Me.y-48+random(16)			
						type=1
						pin=2
						en=3
						cd=60
						grav=0
						creator=other.id
						image_speed=0
						dmg=2
						dmg+=dmg*(Control.invenArray[25,3]*0.01)
						sprite_index=enemy_three_spr
						depth=Me.depth
						if(other.chancetwo<3){
							img=170
						}else{
							img=174+(choose(0,0,0,0,1,1,1,2,2)*4)
						}
						image_index=img
						imgcap=3
						imgsped=0.2
						sped=0.5
						dur=99999999999999999999999999999
						durtotal=dur
					}				
				}else{
#endregion		
#region Apple Worm 
		//____________________________________________________________________________---------------------(Apple Worm)---------------------____________________________________________________________________________
				if(chance==3){
					created=instance_create_depth(x,y,9,Enemy)
					with(created){
						dir=Me.dir
						if(dir==-1){
							xscale=-1
						}
						xtarget=Me.x-16+random(32)
						ytarget=Me.y-48+random(16)			
						type=1
						pin=3
						en=3
						cd=60
						grav=0.1
						vsp=0
						phase=0
						creator=other.id
						image_speed=0
						dmg=2
						dmg+=dmg*(Control.invenArray[25,3]*0.01)
						sprite_index=enemy_abil_spr
						depth=Me.depth
							if(other.chancetwo<3){
								img=120
								enopt=0
							}else{
								img=122
								enopt=1
							}
						image_index=img
						imgcap=1
						imgsped=0.1
						sped=0.5
						dur=(Control.itemArray[Control.invenArray[23,0],10]+(Control.itemArray[Control.invenArray[23,0],10]*(Control.invenArray[23,2]*Control.itemArray[Control.invenArray[23,0],11])))*60
						durtotal=dur
					}				
				}else{
#endregion		
#region Apple Heal
		//____________________________________________________________________________---------------------(Apple Heal)---------------------____________________________________________________________________________
				if(chance==5){
					created=instance_create_depth(x,y-16,4,Abil)
					with(created){
						en=3
						pin=4
						dur=40
						move=0
						img=124
						imgsped=0
						enopt=0
						image_index=img
						sprite_index=enemy_abil_spr
							chance=Control.itemArray[chancefive,10]
							if(Me.hp+chance<Me.hptotal){
								Me.hp+=chance
							}else{
								Me.hp=Me.hptotal
							}
					}				
				}else{
#endregion		
#region Leaferang
		//____________________________________________________________________________---------------------(Leaferang)---------------------____________________________________________________________________________
				if(chance==6){
			if(global.con_h_up||global.conp_h_up){
				temp=2
			}else{
				if(global.con_h_down||global.conp_h_down){
				temp=3
				}else{
				temp=1
				}		
			}
					created=instance_create_depth(x,y,4,Abil)
					with(created){
						dmgtarget=noone
						timer=60
						en=3
						pin=5
						dur=400
						with(Control){
							other.dmg=itemArray[invenArray[23,0],10]+(itemArray[invenArray[23,0],10]*(invenArray[23,2]*itemArray[invenArray[23,0],11]))
						}
						dmg+=dmg*(Control.invenArray[25,3]*0.01)
						enopt=0
						move=0
						if(other.chancetwo<3){
							img=9
							enopt=0
						}else{
							img=10
							enopt=1
						}
						imgsped=0
						image_index=img
						sprite_index=items_spr
						grav=0
						spin=5
							chance=1
							if(Me.dir==1){
								dir=1
							}else{
								dir=-1
							}
							hsp=2
							hsp=hsp*dir
							sped=1.5
						
							if(other.temp==1){
								vsp=0
							}else{
								if(other.temp==2){
									vsp=-1
								}else{
									if(other.temp==3){
										vsp=1
									}else{
						
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
	}
#endregion


}


