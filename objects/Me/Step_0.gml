audio_listener_position(x,y,0)
audio_falloff_set_model(audio_falloff_linear_distance)

hit=instance_place(x,y,Part)
if(hit!=noone){
	if(hit.pin==2){
		if(hit.type==0){
			with(hit){
				instance_destroy()
			}
			audio_play_sound(choose(snd_coin_1,snd_coin_2,snd_coin_3),8, false)
			Control.mapdataArray[1000,5]+=1
			Control.mapdataArray[1000,6]=0
		}else{
			if(hit.type==1){
				if(hp<hptotal){
					audio_play_sound(choose(snd_coin_1,snd_coin_2,snd_coin_3),8, false)
					if(hp+1<=hptotal){
						hp+=1
					}else{
						hp=hptotal
					}
					with(hit){
						instance_destroy()
					}
				}
			}else{
				if(class==4){
					if(hit.type==3){
						chance=hit.img
						for(i=0;i<3;i+=1){
							created=instance_create_depth(x-5+random(10),y-5+random(10),0,Part)
							with(created){
							type=1
							pin=1
							depth=other.depth+1
							spin=1
							img=113+(other.chance-22)*2
					
							imgcap=1
							imgsped=0
							image_speed=0
							image_index=irandom_range(img,img+imgcap)
							dur=14+choose(0,0,0,1,1,2)+irandom(10)
							durtotal=dur
							hsp=0
							vsp=0.3+random(0.3)
							image_angle-=15
							image_angle+=random(30)
							}		
						}
							passivefourArray[0,0]+=1
							passivefourArray[passivefourArray[0,0],0]=30
							passivefourArray[passivefourArray[0,0],1]=hit.img-22
							with(hit){
								instance_destroy()
							}
					}
				}
			}
		}
	}
}

if(Control.pause==0){
#region DPS METER
dpstimer+=1
dpstimertwo+=1
if(dpstimertwo>=1800){
dpstimertwo=0
damagedonetwo=damagedone
}else{
damagedonethree=damagedone-damagedonetwo
}
#endregion

if(deathtick==0){

if(global.con_p_enter){
	controls=0
}else{
	if(global.conp_p_enter){
		controls=1
	}
}

if(controls==0){
	con_p_down=global.con_p_down
	con_h_right=global.con_h_right
	con_h_left=global.con_h_left
	con_h_space=global.con_h_space
	con_p_space=global.con_p_space
	con_h_down=global.con_h_down
	con_h_e=global.con_h_e
	con_p_e=global.con_p_e
	
	con_h_w=global.con_h_w
	con_p_w=global.con_p_w
	
	con_h_q=global.con_h_q
	con_p_q=global.con_p_q	
}else{
	con_p_down=global.conp_h_e
	con_h_right=global.conp_h_right
	con_h_left=global.conp_h_left
	con_h_space=global.conp_h_space
	con_p_space=global.conp_p_space
	con_h_down=global.conp_h_down
	con_h_e=global.conp_h_r
	con_p_e=global.conp_p_r
	
	con_h_w=global.conp_h_w
	con_p_w=global.conp_p_w
	
	con_h_q=global.conp_h_q
	con_p_q=global.conp_p_q		
}



me_control_scr()
abil_scr()
gravity_scr()

	if(hp<=0){
		deathtick=1
		deathcd=150
		deathcdtotal=deathcd
		wepsave=wep
		wep=0
		img=15
		imgcap=12
		imgsped=0.08
		image_index=img
		deathy=y
		color=c_white
					created=instance_create_depth(x,y-3,0,Part)
					with(created){
						sprite_index=mask_two_spr
					type=1
					pin=1
					depth=other.depth+1
					spin=1
					img=other.class*4
					imgcap=0
					imgsped=0
					image_speed=0
					image_index=img
					dur=150
					durtotal=dur
					hsp=0
					vsp=-1.2
					}	
		class=0
		classcheck=1
		audio_play_sound_at(snd_player_die_1,x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
	}
}else{

	if(deathcd>0){
		visible=true
		deathcd-=1
		if(deathcd>floor(deathcdtotal/5)){
			y-=0.4
		}else{
			if(y<deathy-0.5){
				y+=2.5
			}
		}
	}else{
		deathtick=0
		hp=hptotal
		img=1
		imgcap=5
		imgsped=0.1
		image_index=img
		class=classsave
		classcheck=1
		dmgrecieved=0
		hurttimer=0
		hurttick=0
		y=deathy
		vsp=0
		hsp=0
		wep=wepsave
		
		if(Control.death==1){
			with(Control){
				pause=1
				phase=0
				
				if(instance_exists(door)){
					with(door){
						instance_destroy()
					}
				}
				exitdoor=0

				mapdataArray[1010,0]=0
				mapdataArray[1000,5]=0
				
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
			}
		}
	}
}
class_scr()
wep_scr()
hurt_scr()

anim_scr()

}
if(global.con_p_1){
	
	if(global.con_h_m){
		
		with(Control){
			lvlselect=1
			worldgen_scr()
		}
	}else{
		class=0
		classcheck=1	
	}

}else{
	if(global.con_p_2){
		
		if(global.con_h_m){
		
			with(Control){
				lvlselect=2
				worldgen_scr()
			}
		}else{
			class=1
			classcheck=1	
		}
	}else{
		if(global.con_p_3){
			
			if(global.con_h_m){
				
				with(Control){
					lvlselect=3
					worldgen_scr()
				}
			}else{
				class=2
				classcheck=1	
			}
		}else{
			if(global.con_p_4){
				if(global.con_h_m){
					
					with(Control){
						lvlselect=4
						worldgen_scr()
					}
				}else{
					class=3
					classcheck=1	
				}
			}else{
				if(global.con_p_5){
					if(global.con_h_m){
					
						with(Control){
							lvlselect=5
							worldgen_scr()
						}
					}else{
						class=4
						classcheck=1	
					}
				}else{
					if(global.con_p_6){
						if(global.con_h_m){
					
							with(Control){
								lvlselect=6
								worldgen_scr()
							}
						}else{
							class=5
							classcheck=1	
						}
					}else{
						if(global.con_p_7){
							if(global.con_h_m){
					
								with(Control){
									lvlselect=6
									worldgen_scr()
								}
							}else{
								class=6
								classcheck=1	
							}
						}else{
							if(global.con_p_8){
								if(global.con_h_m){
					
									with(Control){
										lvlselect=6
										worldgen_scr()
									}
								}else{
									class=7
									classcheck=1	
								}
							}else{
								if(global.con_p_9){
									if(global.con_h_m){
					
										with(Control){
											lvlselect=6
											worldgen_scr()
										}
									}else{
										class=8
										classcheck=1	
									}
								}else{
									if(global.con_p_0){
										if(global.con_h_m){
					
											with(Control){
												lvlselect=6
												worldgen_scr()
											}
										}else{
											class=9
											classcheck=1	
										}
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
	if(classcheck==1){
		classsave=class
		class_scr()
		with(Control){
			talentcreate_scr()
		}
		classcheck=0  // Prevent repeated initialization
	}