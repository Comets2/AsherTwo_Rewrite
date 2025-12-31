function map_gen_scr() {
#region Map Gen Script

		selectx=2
		selecty=0
		selectxtwo=selectx
		selectytwo=selecty

	mapArray[0,0]=0
	chance=0
	for(a=0;a<10;a+=1){
		for(b=0;b<10;b+=1){
			mapArray[a,b]=chance
			chance+=1
		}
	}
	for(a=0;a<1000;a+=1){
		for(b=0;b<11;b+=1){
			mapdataArray[a,b]=0	
		}
	}

#region Icon Data
	/*
		0=nothing
		1=enemy
		2=miniboss
		3=boss
		4=blue
		5=open
		6=open
		7=open
		8=coin
		9=blue exclamation
		10=yellow exclamation
		11=blue question mark
		12=money sack
		13=open
		14=open
		15=me
		16=pumpkin
		17=witch
		18=bee
	*/
		spedx=0
		spedy=0
			//Extra Map level data
				//Unused
				mapdataArray[1000,0]=0
				//anim tick world icon
				mapdataArray[1000,1]=0
				//LAST key direction press UP Down
				mapdataArray[1000,2]=0
				//LAST key direction press Right Left
				mapdataArray[1000,3]=0
				//timer
				mapdataArray[1000,4]= 0
				//Money reward hold
				mapdataArray[1000,5]= 0
				//Money Timer
				mapdataArray[1000,6]= 0
			
			
				//Me x position
				mapdataArray[1001,0]=2
				//Me y position
				mapdataArray[1001,1]=0
				//Me Moving
				mapdataArray[1001,2]=0
				//Me MOVE x position
				mapdataArray[1001,3]=2
				//Me MOVE y position
				mapdataArray[1001,4]=0
				//Me CURRENT x position
				mapdataArray[1001,5]=64
				//Me CURRENT y position
				mapdataArray[1001,6]=0
				//Me MOVE x position grid size
				mapdataArray[1001,7]=0
				//Me MOVE y position grid size
				mapdataArray[1001,8]=0
			

		mapdataArray[mapArray[2,0],0]=15
				phasetick=1
	
		chance=5
		//Boss
		mapdataArray[mapArray[2,9],10]=chance*3+choose(-2,-1,-1,0,0,1,1,2)
		mapdataArray[mapArray[2,9],0]=3
		mapdataArray[mapArray[2,9],1]=2
		mapdataArray[mapArray[2,9],2]=4
	
		//Shops
		//mapdataArray[mapArray[1,8],0]=12
		//mapdataArray[mapArray[3,8],0]=12
		mapdataArray[mapArray[1,8],0]=1
		mapdataArray[mapArray[3,8],0]=1
		mapdataArray[mapArray[1,8],10]=chance+choose(-2,-1,-1,0,0,1,1,2)
		mapdataArray[mapArray[3,8],10]=chance+choose(-2,-1,-1,0,0,1,1,2)
		
		// Dungeon entrance
		mapdataArray[mapArray[4,4],0]=7 // Using unused icon 7 for dungeon entrance
		mapdataArray[mapArray[4,4],10]=0 // No coin reward for dungeon
		// Add connections to dungeon (connect from nodes at 3,4 and 4,3)
		mapdataArray[mapArray[4,4],1]=mapArray[3,4]+1 // Connection from left
		mapdataArray[mapArray[4,4],2]=mapArray[4,3]+1 // Connection from below
		//mapdataArray[mapArray[1,8],1]=3
		//mapdataArray[mapArray[3,8],1]=3
	
		//Enemy
		mapdataArray[mapArray[1,1],10]=chance+choose(-2,-1,-1,0,0,1,1,2)
		mapdataArray[mapArray[1,1],0]=1
		mapdataArray[mapArray[1,1],1]=3
	
		mapdataArray[mapArray[2,1],10]=chance+choose(-2,-1,-1,0,0,1,1,2)
		mapdataArray[mapArray[2,1],0]=1
		mapdataArray[mapArray[2,1],1]=3
	
		mapdataArray[mapArray[3,1],10]=chance+choose(-2,-1,-1,0,0,1,1,2)
		mapdataArray[mapArray[3,1],0]=1
		mapdataArray[mapArray[3,1],1]=3
	
#region OLD two path code
	/*
		for(i=0;i<2;i+=1){
			if(i==0){
				chance=1
			}else{
				chance=3
			}
			chancetwo=a
			rem=chance
			remtwo=-1
			for(b=2;b<8;b+=1){
				for(ii=0;ii<1;ii+=1){	
						if(i==0){
							if(chance<3){
								if(chance-1>=0){
									if(ii=0){
										chance+=choose(-1,-1,0,0,1)
										chancetwo=chance
									}else{
										chancetwo=chance+1
										remtwo=chancetwo
									
									}
								}else{
									chance+=choose(0,1)
									chancetwo=chance
								}
							}else{
									if(ii=0){
										chance+=choose(-1,-1,0,0)
										chancetwo=chance
									}else{
										chancetwo=chance+1
										remtwo=chancetwo
									}
					
							}
						}else{
							if(chance+1<=5){
								if(chance>=3){
									if(ii=0){
										chance+=choose(1,1,0,0,-1)
										chancetwo=chance
									}else{
										chancetwo=chance-1
										remtwo=chancetwo
									}
								}else{
									if(ii=0){
										chance+=choose(1,1,0,0)
										chancetwo=chance
									}else{
										chancetwo=chance-1
										remtwo=chancetwo
									}							
								}
							}else{
									chance-=choose(0,1)
									chancetwo=chance				
							}
						}
					if(b<5){
						if(b>2){
							mapdataArray[mapArray[chancetwo,b],0]=choose(1,1,1,1,1,1,10,10,11,11,12,4)
						}else{
							mapdataArray[mapArray[chancetwo,b],0]=1
						}		
					}else{
						if(b<8){
							mapdataArray[mapArray[chancetwo,b],0]=choose(1,1,1,1,1,10,10,11,11,12,4,2,2)
						}else{
							mapdataArray[mapArray[chancetwo,b],0]=choose(1,1,1,1,10,10,11,11,12,4,2,2,2,2)
						}
					}	
					if(mapdataArray[mapArray[chancetwo,b],1]==0){
						mapdataArray[mapArray[chancetwo,b],1]=rem
					}else{
						if(mapdataArray[mapArray[chancetwo,b],2]==0){
							mapdataArray[mapArray[chancetwo,b],2]=rem
						}else{
							if(mapdataArray[mapArray[chancetwo,b],3]==0){
								mapdataArray[mapArray[chancetwo,b],3]=rem
							}else{
								if(mapdataArray[mapArray[chancetwo,b],4]==0){
									mapdataArray[mapArray[chancetwo,b],4]=rem
								}else{
									mapdataArray[mapArray[chancetwo,b],5]=rem
								}
							}
						}
					}
					if(remtwo!=-1){
						if(mapdataArray[mapArray[chancetwo,b],1]==0){
							mapdataArray[mapArray[chancetwo,b],1]=remtwo
						}else{
							if(mapdataArray[mapArray[chancetwo,b],2]==0){
								mapdataArray[mapArray[chancetwo,b],2]=remtwo
							}else{
								if(mapdataArray[mapArray[chancetwo,b],3]==0){
									mapdataArray[mapArray[chancetwo,b],3]=remtwo
								}else{
									if(mapdataArray[mapArray[chancetwo,b],4]==0){
										mapdataArray[mapArray[chancetwo,b],4]=remtwo
									}else{
										mapdataArray[mapArray[chancetwo,b],5]=remtwo
									}
								}
							}
						}
					}
				}
				rem=chance
				remtwo=-1
			}	
		}
		*/
	/*
	chance=irandom_range(2,4)
		for(b=1;b<9;b+=1){
				chance=choose(2,2,3,3,4)
			
				if(chance==2){
					chancetwo=choose(1,2)
				}else{
					if(chance==3){
						chancetwo=1
					}else{
						if(chance==4){
							chancetwo=choose(0,1)
						}else{
							chancetwo=0
						}
					}
				}
			for(a=0;a<chance;a+=1){
				if(b<5){
					if(b>2){
						mapdataArray[mapArray[a+chancetwo,b],0]=choose(1,1,1,1,1,1,10,10,11,11,12,4)
					}else{
						mapdataArray[mapArray[a+chancetwo,b],0]=1
					}		
				}else{
					if(b<8){
						mapdataArray[mapArray[a+chancetwo,b],0]=choose(1,1,1,1,1,10,10,11,11,12,4,2,2)
					}else{
						mapdataArray[mapArray[a+chancetwo,b],0]=choose(1,1,1,1,10,10,11,11,12,4,2,2,2,2)
					}
				}
			}
		}
	*/
#endregion
		for(i=0;i<5;i+=1){
			if(i==0){
				chance=1
			}else{
				if(i==1||i==2){
					chance=2
				}else{
					chance=3
				}
			}
			rem=chance
			for(b=2;b<8;b+=1){
						if(i==0){
							if(chance<3){
								if(chance-1>=0){
									chance+=choose(-1,-1,0,0,1)
								}else{
									chance+=choose(0,1)
								}
							}else{
								chance+=choose(-1,-1,0,0)
							}
						}else{
							if(i==1||i==3){
									if(chance<=1){
										chance+=choose(1,1,1,0)
									}else{
										if(chance>=4){
											chance+=choose(-1,-1,-1,0)
										}else{
											chance+=choose(1,1,0,-1,-1)						
										}					
									}							
							}else{
								if(chance+1<=5){
									if(chance>=3){
										chance+=choose(1,1,0,0,-1)
									}else{
										chance+=choose(1,1,0,0)						
									}
								}else{
										chance-=choose(0,1)			
								}
							}
						}
					if(b<5){
						if(b>2){
							if(b==44){
								mapdataArray[mapArray[chance,b],0]=12
							}else{
								mapdataArray[mapArray[chance,b],0]=choose(1,1,1,1,1,1,1,9,9,11)
							}
						}else{
							mapdataArray[mapArray[chance,b],0]=1
						}		
					}else{
						if(b<7){
							mapdataArray[mapArray[chance,b],0]=choose(1,1,1,1,1,1,9,9,11,2,2)
	
						}else{
							mapdataArray[mapArray[chance,b],0]=choose(1,1,1,1,1,9,9,11,2,2,2,2)
						}
					}	
					
					//Miniboss
					//mapdataArray[mapArray[chance,b],0]=2
						
						//mapdataArray[mapArray[chance,b],0]=2 Miniboss
							//mapdataArray[mapArray[chance,b],0]=choose(9,11)
							//mapdataArray[mapArray[chance,b],0]=11
							//mapdataArray[mapArray[chance,b],0]=choose(1,2,9,11)
							//Bounty coin reward
							chancefour=mapArray[chance,b]
							if(mapdataArray[chancefour,0]<12){
								mapdataArray[chancefour,10]=mapdataArray[1006,mapdataArray[chancefour,0]]+choose(-2,-1,-1,0,0,0,1,1,2)
							}
					
						chancetwo=0
						ii=1
						while(chancetwo==0){
							if(mapdataArray[mapArray[chance,b],ii]==0){
								mapdataArray[mapArray[chance,b],ii]=rem+1
							
								
								chancetwo=1
							}else{
								if(ii<5){
									ii+=1
								}else{
									chancetwo=1
								}
							}
						}
				rem=chance
				if(b==7){
						chancetwo=0
						ii=1
							if(chance<3){
								chancethree=1
							}else{
								chancethree=3
							}
							while(chancetwo==0){
								if(mapdataArray[mapArray[chancethree,8],ii]==0){
									mapdataArray[mapArray[chancethree,8],ii]=rem+1
									chancetwo=1
								}else{
									if(ii<5){
										ii+=1
									}else{
										chancetwo=1
									}
								}
							}
					
				}
			}	
		}	
	
#region Uncross Paths
		for(a=0;a<5;a+=1){
			for(b=2;b<8;b+=1){
				if(mapdataArray[mapArray[a,b],1]!=0){
						chance=0	
						for(ii=1;ii<5;ii+=1){
							for(i=1;i<5;i+=1){
								if(mapdataArray[mapArray[a,b],i]!=0){
									if(mapdataArray[mapArray[a,b],i]-1==a+1&&mapdataArray[mapArray[a+1,b],ii]-1==a){
											chance=1
											chancetwo=mapdataArray[mapArray[a,b],i]
											mapdataArray[mapArray[a,b],i]=mapdataArray[mapArray[a+1,b],ii]
											mapdataArray[mapArray[a+1,b],ii]=chancetwo
																				i=5
									}	
							
								}
							}
						}

				}
			}
		}
		if(mapdataArray[mapArray[1,8],1]==0){
			mapdataArray[mapArray[1,8],0]=0
			mapdataArray[mapArray[2,9],1]=0
		}
		if(mapdataArray[mapArray[3,8],1]==0){
			mapdataArray[mapArray[3,8],0]=0
			mapdataArray[mapArray[2,9],2]=0
		}
#endregion

#endregion

#endregion


}
