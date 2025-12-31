function abil_scr() {

	//Abil CD
	for(i=0;i<5;i+=1){
		if(abilArray[i,1]>0){
		abilArray[i,1]-=1
			if(abilArray[i,1]==0){
				abilArray[i,4]=0
			}
		}
	}
	if(globalcd>0){
		globalcd-=1
	}

	//Active Item CD
	if(Control.invenArray[23,0]!=0){
			if(Control.invenArray[23,3]>0){
				Control.invenArray[23,3]-=1
			}
	}

#region Abilities
	if(con_h_e){
	//____________________________________________________________________________---------------------(Witch Spell)---------------------____________________________________________________________________________	
		if(class==1){
			//Abil 1
			if(abilArray[0,1]==0){
				anim=12
				animsave=14
					abilArray[0,1]=abilArray[0,2]
						if(abilArray[2,1]<globalcdtotal){
							abilArray[2,1]=globalcdtotal
							abilArray[2,4]=1
						}
				xpos=x
				ypos=y+2
				abil_create_scr(1)
	
			}else{

			}
		}else{
	
	//____________________________________________________________________________---------------------(Pumpkin Pumpkin)---------------------____________________________________________________________________________	
		if(class==2){
			//Abil 1
			if(con_p_e){
				if(abil1safety>0&&abil1safety<=18){
					abilArray[0,1]=0
				}
				
				if(abilArray[0,1]==0){
					abilArray[0,4]=2
						if(abilArray[1,1]<globalcdtotal){
							abilArray[1,1]=globalcdtotal
							abilArray[1,4]=1
						}
						if(abilArray[2,1]<globalcdtotal){
							abilArray[2,1]=globalcdtotal
							abilArray[2,4]=1
						}
						if(abilArray[0,1]<globalcdtotal){
							abilArray[0,1]=globalcdtotal
							abilArray[0,4]=1
						}
					anim=12
					animsave=14
	//				abilArray[0,1]=abilArray[0,2]
					xpos=x
					ypos=y+2
					abil_create_scr(1)
	
				}else{
				
					anim=12
					animsave=14
					abilArray[0,4]=2
					created=abilArray[0,3]
					if(instance_exists(created)){
						created.phase=2
					}
				}
			}
		}else{
	//____________________________________________________________________________---------------------(Bee Stinger)---------------------____________________________________________________________________________	
		if(class==3){
			//Abil 1	
			if(abilArray[0,1]==0){
				anim=12
				animsave=14
					abilArray[0,1]=abilArray[0,2]
						if(abilArray[1,1]<globalcdtotal){
							abilArray[1,1]=globalcdtotal
							abilArray[1,4]=1
						}
						if(abilArray[2,1]<globalcdtotal){
							//abilArray[2,1]=globalcdtotal
						}
					globalcd=10
				xpos=x
				ypos=y+2
				abil_create_scr(0)
	
			}else{

			}	
		}else{

	//____________________________________________________________________________---------------------(Burger)---------------------____________________________________________________________________________
		if(class==4){
			if(con_p_e){
				//Abil 1	
				if(abilArray[0,1]==0){
					anim=12
					animsave=14
						abilArray[0,1]=abilArray[0,2]
							if(abilArray[1,1]<globalcdtotal){
								abilArray[1,1]=globalcdtotal
								abilArray[1,4]=1
							}
							if(abilArray[2,1]<globalcdtotal){
								abilArray[2,1]=globalcdtotal
								abilArray[2,4]=1
							}
					xpos=x
					ypos=y+2
					abil_create_scr(1)
				}
			}
		}else{
	//____________________________________________________________________________---------------------(Crab Fish)---------------------____________________________________________________________________________	
		if(class==5){
			//Abil 1
			if(abilArray[0,1]==0){
				anim=12
				animsave=14
					abilArray[0,1]=abilArray[0,2]
						if(abilArray[2,1]<globalcdtotal){
							abilArray[2,1]=globalcdtotal
							abilArray[2,4]=1
						}
						if(abilArray[1,1]<globalcdtotal){
							abilArray[1,1]=globalcdtotal
							abilArray[1,4]=1
						}
				xpos=x
				ypos=y+2
				abil_create_scr(1)
	
			}else{

			}
		}else{
	//____________________________________________________________________________---------------------(Super Punch)---------------------____________________________________________________________________________	
		if(class==6){
			//Abil 1 Super Punch
			if(con_p_e){
				if(abilArray[0,1]==0){
					anim=12
					animsave=14
						abilArray[0,1]=abilArray[0,2]
							if(abilArray[2,1]<globalcdtotal){
								abilArray[2,1]=globalcdtotal
								abilArray[2,4]=1
							}
					xpos=x
					ypos=y+2
					abil_create_scr(1)
	
				}else{

				}
			}
		}else{
	//____________________________________________________________________________---------------------(Tree Leaves)---------------------____________________________________________________________________________	
		if(class==7){
			//Abil 1
			if(abilArray[0,1]==0){
				anim=12
				animsave=14
					abilArray[0,1]=abilArray[0,2]
						if(abilArray[2,1]<globalcdtotal){
							abilArray[2,1]=globalcdtotal
							abilArray[2,4]=1
						}
				xpos=x
				ypos=y+2
				abil_create_scr(1)
	
			}else{

			}
		}else{
	//____________________________________________________________________________---------------------(Candy Cookie)---------------------____________________________________________________________________________	
		if(class==8){
			//Abil 1
			if(abilArray[0,1]==0){
				anim=12
				animsave=14
					abilArray[0,1]=abilArray[0,2]-(Control.talentmapArray[1,1]*5)
						if(abilArray[2,1]<globalcdtotal){
							abilArray[2,1]=globalcdtotal
							abilArray[2,4]=1
						}
				xpos=x
				ypos=y
				abil_create_scr(1)
	
			}else{

			}
		}else{

	//____________________________________________________________________________---------------------(Trash)---------------------____________________________________________________________________________	
		if(class==9){
			//Abil 1
			if(con_p_e){
				if(abilArray[0,1]==0){
					anim=12
					animsave=14
						abilArray[0,1]=abilArray[0,2]-(Control.talentmapArray[1,1]*5)
							if(abilArray[2,1]<globalcdtotal){
								abilArray[2,1]=globalcdtotal
								abilArray[2,4]=1
							}
					xpos=x
					ypos=y
					abil_create_scr(1)
	
				}else{

				}
			}
		}else{
			
		}}}}}}}
		}
	
	}


	}else{

	if(con_p_q){
	//____________________________________________________________________________---------------------(Witch Broom)---------------------____________________________________________________________________________	
			if(class==1){
				//Abil 2
				if(abilArray[1,1]==0){
					anim=12
					animsave=14
					
					//Do not show cooldown text or background abilArray[1,4]=2
					abilArray[1,4]=2
					if(Control.talentmapArray[4,1]>0){
						abilArray[1,1]=abilArray[1,2]
					}else{
						if(passive!=noone){
							
							abilArray[1,4]=0
							if(Control.talentmapArray[9,1]>0){
								
							}
							abilArray[1,1]=abilArray[1,2]
							
						}
					}
	//				abilArray[2,1]=globalcdtotal
					xpos=x
					ypos=y+2
					abil_create_scr(2)
	
				}else{

				}
			}else{


	//____________________________________________________________________________---------------------(Pumpkin Small)---------------------____________________________________________________________________________	
				if(class==2){
					//Abil 1
					if(abilArray[1,1]==0){
						if(Control.talentmapArray[4,1]>0||Control.talentmapArray[7,1]>0){
							anim=12
							animsave=14
							abilArray[1,1]=abilArray[1,2]
								if(abilArray[0,1]<globalcdtotal){
									abilArray[0,1]=globalcdtotal
									abilArray[0,4]=1
								}
								if(abilArray[2,1]<globalcdtotal){
									abilArray[2,1]=globalcdtotal
									abilArray[2,4]=1
								}
								globalcd=10
							xpos=x
							ypos=y+2
							abil_create_scr(2)
						}
					}
				}else{
			
	//____________________________________________________________________________---------------------(Bee Honey)---------------------____________________________________________________________________________	
					if(class==3){
						//Abil 1
						if(abilArray[1,1]==0){
							anim=12
							animsave=14
								abilArray[1,1]=abilArray[1,2]
								if(abilArray[0,1]<globalcdtotal){
									abilArray[0,1]=globalcdtotal
									abilArray[0,4]=1
								}
								if(abilArray[2,1]<globalcdtotal){
									abilArray[2,1]=globalcdtotal
									abilArray[2,4]=1
								}
								globalcd=10
							xpos=x
							ypos=y+2
							abil_create_scr(2)
	
						}else{

						}
					}else{
	//____________________________________________________________________________---------------------(Burger fries)---------------------____________________________________________________________________________	
					if(class==4){
						if(abilArray[1,1]==0){
							anim=12
							animsave=14
								abilArray[1,1]=abilArray[1,2]
									if(abilArray[0,1]<globalcdtotal){
										abilArray[0,1]=globalcdtotal
										abilArray[0,4]=1
									}
									if(abilArray[2,1]<globalcdtotal){
										abilArray[2,1]=globalcdtotal
										abilArray[2,4]=1
									}
							xpos=x
							ypos=y+2
							abil_create_scr(2)
						}				
					}else{
	//____________________________________________________________________________---------------------(Crab Crab)---------------------____________________________________________________________________________	
			if(class==5){
				if(abilArray[1,1]==0){
					
					if(passivetwo.phase==0){
						passivetwo.phase=1
						abilArray[1,1]=abilArray[1,2]
					}
				}

			}else{
	//____________________________________________________________________________---------------------(Super Waffle)---------------------____________________________________________________________________________	
			if(class==6){
				//Abil 1
				if(abilArray[1,1]==0){
					anim=12
					//animsave=14
					
						abilArray[1,1]=abilArray[1,2]
							if(abilArray[0,1]<globalcdtotal){
								abilArray[0,1]=globalcdtotal
								abilArray[0,4]=1
							}
							if(abilArray[2,1]<globalcdtotal){
								abilArray[2,1]=globalcdtotal
								abilArray[2,4]=1
							}
					xpos=x
					ypos=y+2
					abil_create_scr(3)
	
				}else{

				}
			}else{
		//____________________________________________________________________________---------------------(Tree)---------------------____________________________________________________________________________	
				if(class==7){
					//Abil 1
					if(abilArray[1,1]==0){
						if(Control.talentmapArray[4,1]>0||Control.talentmapArray[7,1]>0){
							anim=12
					
								abilArray[1,1]=abilArray[1,2]
									if(abilArray[0,1]<globalcdtotal){
										abilArray[0,1]=globalcdtotal
										abilArray[0,4]=1
									}
									if(abilArray[2,1]<globalcdtotal){
										abilArray[2,1]=globalcdtotal
										abilArray[2,4]=1
									}
							xpos=x
							ypos=y+2
							abil_create_scr(3)
						}
	
					}else{

					}
				}else{
					
		//____________________________________________________________________________---------------------(Candy)---------------------____________________________________________________________________________						
			if(class==8){
				//Abil 2 Cake
				if(abilArray[4,1]==0){
					
					
							anim=12
							animsave=14
								abilArray[1,1]=abilArray[1,2]
										if(abilArray[0,1]<globalcdtotal){
											abilArray[0,1]=globalcdtotal
											abilArray[0,4]=1
										}
										if(abilArray[2,1]<globalcdtotal){
											abilArray[2,1]=globalcdtotal
											abilArray[2,4]=1
										}
							xpos=x
							ypos=y
							abil_create_scr(2)
						

	
				}
			}else{
		//____________________________________________________________________________---------------------(Trash Bag)---------------------____________________________________________________________________________						
			if(class==9){
				//Abil 2 Trash
				if(abilArray[4,1]==0){
					
					
							anim=12
							animsave=14
								abilArray[1,1]=abilArray[1,2]
										if(abilArray[0,1]<globalcdtotal){
											abilArray[0,1]=globalcdtotal
											abilArray[0,4]=1
										}
										if(abilArray[2,1]<globalcdtotal){
											abilArray[2,1]=globalcdtotal
											abilArray[2,4]=1
										}
							xpos=x
							ypos=y
							abil_create_scr(2)
						

	
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
	}else{

	if(con_p_w){
	//____________________________________________________________________________---------------------(Witch Bat)---------------------____________________________________________________________________________	
			if(class==1){
				//Abil 1
				if(abilArray[2,1]==0){
					anim=12
					animsave=14
					
						if(abilArray[0,1]<globalcdtotal){
							abilArray[0,1]=globalcdtotal
							abilArray[0,4]=1
						}
					abilArray[2,1]=abilArray[2,2]
					xpos=x
					ypos=y+2
					abil_create_scr(3)
	
				}else{

				}
			}else{
	
	//____________________________________________________________________________---------------------(Pumpkin Big)---------------------____________________________________________________________________________	
				if(class==2){
					//Abil 1
					if(abilArray[2,1]==0){
						if(Control.talentmapArray[10,1]>0||Control.talentmapArray[13,1]>0){
							anim=12
							animsave=14
							abilArray[2,1]=abilArray[2,2]
								if(abilArray[0,1]<globalcdtotal){
									abilArray[0,1]=globalcdtotal
									abilArray[0,4]=1
								}
								if(abilArray[1,1]<globalcdtotal){
									abilArray[1,1]=globalcdtotal
									abilArray[1,4]=1
								}
								globalcd=10
							xpos=x
							ypos=y+2
							abil_create_scr(3)
						}
					}
				}else{
	//____________________________________________________________________________---------------------(Bee Hover)---------------------____________________________________________________________________________	
				if(class==3){
					if(Control.talentmapArray[10,1]>0){
						//Abil 1	
						if(abilArray[2,1]==0){
							abilArray[2,1]=abilArray[2,2]
							abilArray[2,4]=2
								if(abilArray[0,1]<globalcdtotal){
									abilArray[0,1]=globalcdtotal
									abilArray[0,4]=1
								}
								if(abilArray[1,1]<globalcdtotal){
									abilArray[1,1]=globalcdtotal
									abilArray[1,4]=1
								}				
								jumps=0
								abil_create_scr(3)
						}else{
							if(passiveArray[2,0]==3){
								passiveArray[2,5]=0
								passiveArray[2,0]=0
								vsp=-5
								abilArray[2,4]=3
							}
						}
					}else{
						//Bee Shield
						if(Control.talentmapArray[13,1]>0){
							
							if(abilArray[2,1]==0){
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
								abil_create_scr(3)
							}
						}
					}
				}else{
	//____________________________________________________________________________---------------------(Burger fries)---------------------____________________________________________________________________________	
					if(class==4){
						if(abilArray[2,1]==0){
							anim=12
							animsave=14
								abilArray[2,1]=abilArray[2,2]
									if(abilArray[1,1]<globalcdtotal){
										abilArray[1,1]=globalcdtotal
										abilArray[1,4]=1
									}
									if(abilArray[2,1]<globalcdtotal){
										abilArray[2,1]=globalcdtotal
										abilArray[2,4]=1
									}
							xpos=x
							ypos=y+2
							abil_create_scr(3)
						}				
					}else{
	//____________________________________________________________________________---------------------(Crab Jelly)---------------------____________________________________________________________________________	
					if(class==5){
						if(abilArray[2,1]==0){
							anim=12
							animsave=14
								abilArray[2,1]=abilArray[2,2]
									if(abilArray[0,1]<globalcdtotal){
										abilArray[0,1]=globalcdtotal
										abilArray[0,4]=1
									}
									if(abilArray[1,1]<globalcdtotal){
										abilArray[1,1]=globalcdtotal
										abilArray[1,4]=1
									}
									if(abilArray[2,1]<globalcdtotal){
										abilArray[2,1]=globalcdtotal
										abilArray[2,4]=1
									}
							xpos=x
							ypos=y+2
							abil_create_scr(3)
						}				
					}else{
	//____________________________________________________________________________---------------------(Super Waffle)---------------------____________________________________________________________________________	
			if(class==6){
				//Abil 1
				if(abilArray[2,1]==0){
					anim=12
					animsave=14
					
						if(abilArray[0,1]<globalcdtotal){
							abilArray[0,1]=globalcdtotal
							abilArray[0,4]=1
						}
					abilArray[2,1]=abilArray[2,2]
					xpos=x
					ypos=y+2
					abil_create_scr(2)
	
				}else{

				}
			}else{
	//____________________________________________________________________________---------------------(Tree Sap/Log)---------------------____________________________________________________________________________	
			if(class==7){
				//Abil 1
				if(abilArray[2,1]==0){
					anim=12
					animsave=14

						if(abilArray[0,1]<globalcdtotal){
							abilArray[0,1]=globalcdtotal
							abilArray[0,4]=1
						}
						if(abilArray[1,1]<globalcdtotal){
							abilArray[1,1]=globalcdtotal
							abilArray[1,4]=1
						}				
					abilArray[2,1]=abilArray[2,2]
					xpos=x
					ypos=y+2
					abil_create_scr(2)
	
				}else{

				}
			}else{

	//____________________________________________________________________________---------------------(Candy Item)---------------------____________________________________________________________________________	
			if(class==8){
				//Abil 3
				if(abilArray[2,1]==0){
					anim=12
					animsave=14
					
						if(abilArray[0,1]<globalcdtotal){
							abilArray[0,1]=globalcdtotal
							abilArray[0,4]=1
						}
					abilArray[2,1]=abilArray[2,2]-(Control.talentmapArray[11,1]*5)

					
					xpos=x
					ypos=y+2
					abil_create_scr(3)
	
				}else{

				}
			}else{
				
			}}}}}}}
			}
	}
	}
	}
#endregion

#region Items
	if(Control.invenArray[23,0]!=0){
		if(global.con_p_r){
			if(Control.invenArray[23,3]<=0){
				Control.invenArray[23,3]=Control.itemArray[Control.invenArray[23,0],9]-(Control.itemArray[Control.invenArray[23,0],9]*(Control.invenArray[23,2]*0.05))
				chance=Control.itemArray[Control.invenArray[23,0],14]
				chancetwo=Control.invenArray[23,2]
				abil_create_scr(4)
			}
		}
	}
#endregion


}
