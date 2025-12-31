function hurt_scr() {
	if(hp>0){
	
	if(hurttimer<=78||team==1){	
		if(hurttick==1&&immune==0&&immunetwo==0){
			chance=0
			if(team==1){
				if(irandom(100)<Control.invenArray[26,3]){
					chance=1
					dmgrecieved+=dmgrecieved*0.25				
				}
				if(Control.invenArray[24,9]<=0){
					if(irandom(100)<Control.invenArray[24,4]){
						Control.invenArray[24,9]=600
						for(i=0;i<1;i+=1){
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
					}
				}
				audio_play_sound_at(choose(snd_enemy_hit_2,snd_enemy_hit_3,snd_enemy_hit_4),x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
				audio_play_sound_at(snd_enemy_hit_1,x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
			}else{
				audio_play_sound_at(choose(snd_player_hurt_1,snd_player_hurt_2),x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
			}
		hurttick=0
		hp-=dmgrecieved
		hurtamount+=dmgrecieved
		hurtamount=dmgrecieved
		hurttimer=90
		hurttimertotal=hurttimer
		color=hurtcolor
		
		
	//	effectArray[0,3]=1
		//0,0=amount/0,1=timertotal//1,0=timer/1,1=dmg/1,2=x/1,3=y/1,4=type
			with(Control){

				dmgArray[0,0]+=1
				// Bounds check to prevent array overflow (max 9 concurrent damage numbers)
				if(dmgArray[0,0]>9){
					dmgArray[0,0]=9
				}
				dmgArray[dmgArray[0,0],6]=other.effectArray[0,3]
				dmgArray[dmgArray[0,0],7]=0
				dmgArray[dmgArray[0,0],8]=0
				dmgArray[dmgArray[0,0],9]=0
				dmgArray[dmgArray[0,0],10]=0
			
			
				dmgArray[dmgArray[0,0],0]=dmgArray[0,1]
				dmgArray[dmgArray[0,0],1]=other.dmgrecieved
				dmgArray[dmgArray[0,0],2]=other.x
				dmgArray[dmgArray[0,0],3]=other.y-8
				if(other.team==0){
					dmgArray[dmgArray[0,0],4]=0
				}else{
					dmgArray[dmgArray[0,0],4]=1
				}
				if(other.incdmgtype==1){
					dmgArray[dmgArray[0,0],5]=1
					other.color=poisoncolor
#region Particle Effect
								chance=irandom(360)
								for(i=0;i<1;i+=1){
									created=instance_create_depth(other.x-6+random(12),other.y-6+random(8),0,Part)
									with(created){
										type=1
										pin=1
										depth=other.depth+1
										spin=1
										img=choose(81,82)
										imgcap=1
										imgsped=0
										image_speed=0
										image_index=img
										dur=15+choose(0,0,0,1,1,2)+irandom(30)
										durtotal=dur
										hsp=0
										vsp=0.2+random(0.05)
										grav=0.02
										chance=random_range(0.7,1)
										xscale=chance
										yscale=chance
									}		
								}	

#endregion
				}else{
					if(other.chance==1){
						dmgArray[dmgArray[0,0],5]=2
#region On Crit Affect
						for(i=0;i<3;i+=1){
							if(itemArray[invenArray[24+i,0]+1,7]=="OnCrit"){
								if(invenArray[24+i,8]==0){
									invenArray[24+i,8]=(itemArray[invenArray[24+i,0],8]-(itemArray[invenArray[24+i,0],8]*(invenArray[24+i,2]*0.05)))
									if(itemArray[invenArray[24+i,0],7]=="Gold"){
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
									}
								}
							}	
						}
#endregion
#region Particle Effect
								chance=irandom(360)
								for(i=0;i<3;i+=1){
									created=instance_create_depth(other.x-5,other.y-6+random(8),0,Part)
									with(created){
										type=1
										pin=1
										depth=other.depth+1
										spin=1
										img=choose(79,80)
										imgcap=1
										imgsped=0
										image_speed=0
										image_index=img
										dur=15+choose(0,0,0,1,1,2)+irandom(30)
										durtotal=dur
										hsp=0
										vsp=0.2+random(0.05)
										grav=0.02
										chance=random_range(0.7,1)
										xscale=chance
										yscale=chance
										x+=(other.i*5)+random(2)
									}		
								}	
#endregion
					}else{
					dmgArray[dmgArray[0,0],5]=0
					}
				}

			
			}
		
				incdmgtype=0
				dmgrecieved=0
		}
		if(immunetwo>0){
			immunetwo-=1
			hurttick=0
			dmgrecieved=0
		}
	}else{
	hurttick=0
	dmgrecieved=0
	}
		//Poison
		if(effectArray[0,0]>0){
			effectArray[0,0]-=1
				if(effectArray[0,4]==0||effectArray[0,0]==0){
				effectArray[0,4]=100
				}
			effectArray[0,4]-=1
			if(effectArray[0,4] mod effectArray[0,1]==0){
					hurttick=1
					dmgrecieved+=(effectArray[0,2]+effectArray[0,2]*(Control.invenArray[25,3]*0.01))*effectArray[0,3]
						if(Me.class==3){
							dmgrecieved+=dmgrecieved*(Control.talentmapArray[22,1]*0.1)
						}
					incdmgtype=1
			}
				if(effectArray[0,0]==0){
				effectArray[0,4]=99
				}
		}else{
			effectArray[0,3]=0
		}
		
		//Fire
		if(effectArray[3,0]>0){
			effectArray[3,0]-=1
				if(effectArray[3,4]==0||effectArray[3,0]==0){
				effectArray[3,4]=100
				}
					if(effectArray[3,4] mod 5==0){
							for(i=0;i<1;i+=1){
							
								created=instance_create_depth(x-4+random(8),y-4+random(8),0,Part)
								with(created){
									type=1
									pin=1
									sprite_index=abil_candy_spr
									depth=other.depth-2
									spin=1
									img=255
									imgcap=2
									imgsped=0.1
									image_speed=0
									image_index=irandom_range(img,img+imgcap)
									dur=16+choose(0,0,0,1,1,2)+irandom(8)
									durtotal=dur
									hsp=0
									vsp=0
									
									startx=other.x-x
									starty=other.y-y

								}	
							}	
					}
				
			effectArray[3,4]-=1
			if(effectArray[3,4] mod effectArray[3,1]==0){
					hurttick=1
					dmgrecieved+=(effectArray[3,2]+effectArray[3,2]*(Control.invenArray[25,3]*0.01))*effectArray[3,3]
						if(Me.class==9){
							dmgrecieved+=dmgrecieved*(Control.talentmapArray[22,1]*0.1)
						}
					incdmgtype=0
					
							for(i=0;i<1;i+=1){
							
								created=instance_create_depth(x-1.5+random(3),y-1.5+random(3),0,Part)
								with(created){
									type=1
									pin=1
									sprite_index=abil_candy_spr
									depth=other.depth-2
									spin=1
									img=255
									imgcap=2
									imgsped=0.1
									image_speed=0
									image_index=irandom_range(img,img+imgcap)
									dur=16+choose(0,0,0,1,1,2)+irandom(8)
									durtotal=dur
									hsp=0
									vsp=0
									
									startx=other.x-x
									starty=other.y-y

								}	
							}					
					
			}
				if(effectArray[3,0]==0){
				effectArray[3,4]=99
				}
		}else{
			effectArray[3,3]=0
		}		
		
	}

	if(hurttimer>0){
		if(hurttimer==hurttimertotal-12){
		color=c_white
		}
	
	if(id==Me.id){	
		if(hurttimer>hurttimertotal-18){
			if(hurttimer mod 6==0){
				Control.hurtdraw-=1
			}else{
				if(hurttimer mod 3==0){
					Control.hurtdraw+=1
				}
			}
		}else{
			if(hurttimer==hurttimertotal-18){
				Control.hurtdraw=0
			}
		}
	}
	
		if(hurttimer<=30||hp<=0){
			if(hurttimer mod 5==0){
				hurtamount-=1			
			}
			if(hurttimer==1){
				if(hurtamount>0){
				hurttimer=11
				}
			}
		}
	hurttimer-=1
		if(hurtamount==0){
		hurttimer=5
		hurtamount=-1
		}
		if(hurttimer==0){
		hurtamount=0
		}
	}else{
		if(dies==1){
			if(hp<=0){
				audio_play_sound_at(snd_enemy_die_1,x,y, 0, Control.falloff_ref, Control.falloff_max, Control.falloff_factor, false, 1)
				
				if(Me.class==3){
					if(Control.talentmapArray[16,1]>0){
						if(effectArray[0,0]>0){
							for(i=0;i<effectArray[0,3];i+=1){
								//Poison Small bee
								chance=instance_create_depth(x-4+irandom(8),y-4+irandom(8),0,Abil)
								with(chance){
									poison=1
										poisonamount=other.effectArray[0,2]
										diddmg=0
										dmg=Control.talentmapArray[17,1]*0.2
										
					
										dmg+=dmg*(Control.invenArray[25,3]*0.01)
								
										type=0
										pin=21
										pintwo=1
										pinthree=0
										phase=1
										en=0
										creator=other.id
										imgsped=0.2
											img=138
											temp=1
											tick=0
											range=16
											ticktwo=0
											startx=x
											starty=y
		
										imgcap=1
										sprite_index=mask_bee_spr
										image_index=img
										depth=Me.depth+1
										image_speed=0
										dur=500+irandom(200)*4
										dur+=(dur*(Control.talentmapArray[8,1]*0.1))
										durtotal=dur
										sped=0.01
										attcd=50
										phasetwo=0
										tick=choose(0,1)
										ticktwo=choose(0,1)
										sped=0.2+choose(-0.003,-0.0045,-0.006,0.003,0.0045,0.006)*3
										spedtwo=0.3+choose(0.03,0.015,0,-0.015,-0.03)
										durextra=irandom(20)
								
										xspot=random_range(-3,3)
										yspot=random_range(-3,3)
										
										
								}				
							}
						}
					}
				}

				instance_destroy()
			}
		}
	}

		if(hp<=0){
			if(dies==1){
			color=hurtcolor
			mask_index=dummy_spr
			depth=40
			}
		}
		
		//Heal
		if(healtick>0){
			healtick=0
			
			if(hp+healrecieved<=hptotal){
				hp+=healrecieved	
			}else{
				healrecieved=hptotal-hp
				hp=hptotal
			}
			
			if(healrecieved>0){
			
				with(Control){
			
					dmgArray[0,0]+=1		
					dmgArray[dmgArray[0,0],6]=other.effectArray[0,3]
					dmgArray[dmgArray[0,0],7]=0
					dmgArray[dmgArray[0,0],8]=0
					dmgArray[dmgArray[0,0],9]=0
					dmgArray[dmgArray[0,0],10]=0
			
			
					dmgArray[dmgArray[0,0],0]=dmgArray[0,1]
					dmgArray[dmgArray[0,0],1]=other.healrecieved
					dmgArray[dmgArray[0,0],2]=other.x
					dmgArray[dmgArray[0,0],3]=other.y-4
				}
				healrecieved=0
			}
		}


}
