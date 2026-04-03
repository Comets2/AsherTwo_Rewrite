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
				//Pop Tart heal pickup
				if(hit.type==4){
					if(hp<hptotal||Control.talentmapArray[21,1]>0){
						audio_play_sound(choose(snd_coin_1,snd_coin_2,snd_coin_3),8, false)
						if(hp<hptotal){
							healrecieved=1
							healtick=1
						}
						//Sugar Rush buff on pickup
						if(Control.talentmapArray[21,1]>0){
							passivefourArray[1,10]+=300
							passivefourArray[1,17]=passivefourArray[1,10]
						}
						with(hit){
							instance_destroy()
						}
					}
				}else{
				//Goblin mining/digging ore pickup (delay pickup for 30 frames)
				if((hit.type==5||hit.type==6)&&(hit.durtotal-hit.dur)>=60){
					audio_play_sound(choose(snd_coin_1,snd_coin_2,snd_coin_3),8, false)

					var _show_visual=true
					var _hit_img=hit.img

					if(hit.type==6){
						//Coin drop - add gold
						Control.mapdataArray[1000,5]+=1
					}else if(_hit_img==97||_hit_img==129){
						//Grass clump / Seaweed - no reward, no visual
						_show_visual=false
					}else if(_hit_img==135){
						//Small fish - heal 0.5
						hp=min(hp+0.5,hptotal)
						healrecieved=1
						healtick=1
					}else if(_hit_img==130){
						//Big fish - heal 1
						hp=min(hp+1,hptotal)
						healrecieved=1
						healtick=1
					}else if(_hit_img==128){
						//Treasure chest - drop 2-4 coins
						var _coins=irandom_range(2,4)
						for(var _c=0;_c<_coins;_c+=1){
							var _coin=instance_create_depth(hit.x,hit.y,0,Part)
							with(_coin){
								pin=2
								type=6
								sprite_index=spr_items
								image_speed=0
								img=96
								image_index=img
								imgcap=0
								imgsped=0
								dur=600
								durtotal=dur
								hsp=random_range(-1,1)
								vsp=random_range(-2,-1)
								grav=0.12
								gravtwo=0.02
							}
						}
					}else if(_hit_img==112||_hit_img==113||_hit_img==114){
						//Gem (Sapphire/Emerald/Ruby) - give xp
						Control.mapdataArray[1000,5]+=1
						Control.xpamount+=5
					}else{
						//Stone/Wood/other - add gold
						Control.mapdataArray[1000,5]+=1
					}

					if(_show_visual){
						//Count existing pickup sprites to offset
						var _pickup_count=0
						with(Part){
							if(pin==1&&type==1&&phase==2){ _pickup_count+=1 }
						}
						//Show picked up item over head (offset by existing count)
						created=instance_create_depth(x,y-13,depth-10,Part)
						with(created){
							pin=1
							type=1
							sprite_index=other.hit.sprite_index
							image_index=other.hit.image_index
							image_speed=0
							img=other.hit.img
							imgcap=0
							imgsped=0
							hsp=0
							vsp=-0.15
							dur=40
							durtotal=dur
							phase=2
							starty=-_pickup_count*6
						}
					}
					with(hit){
						instance_destroy()
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
										if(global.con_p_minus){
											if(global.con_h_m){

												with(Control){
													lvlselect=6
													worldgen_scr()
												}
											}else{
												class=10
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
}
	if(classcheck==1){
		classsave=class
		class_scr()
		with(Control){
			talentcreate_scr()
		}
		classcheck=0  // Prevent repeated initialization
	}