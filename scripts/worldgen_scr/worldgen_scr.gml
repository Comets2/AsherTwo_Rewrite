function worldgen_scr() {
	stagetimer=0
	
	//Chest Baseline
	mapdataArray[1004,4]=0
	
	//Level Type
	lvlArray[1000,0]=mapdataArray[mapArray[mapdataArray[1001,7],mapdataArray[1001,8]],0]
	if(lvlArray[1000,0]==12){
		pause=2
		pauseopt=1
		selected=999
	}else{

	if(lvlArray[1000,0]==1){
		rmtype=choose(1,2,3,4)
		while(rmtype==lvlArray[1010,4]){
		rmtype=choose(1,2,3,4)
		}

	with(Me){
		x = other.midx+48
		y = other.midy-48
	}
			lvlArray[1010,4]=rmtype
			lvlselect=2
	}else{
		//Level Mini Boss 
		if(lvlArray[1000,0]==2){
			chance=choose(0,1)
			//chance=0
			if(chance==0){
				lvlArray[1010,24]= "Defeat Hazel"
				rmtype=3
				lvlselect=2
				with(Me){
					x = other.midx
					y = other.midy+64
				}
				
				//CHEST REWARD Loot
				mapdataArray[1004,3]=1
				chance=choose(0,1)
				if(chance==0){
					mapdataArray[1004,4]=1
				}else{
					if(chance==1){
						mapdataArray[1004,4]=3
					}else{
						mapdataArray[1004,4]=3
					}
				}
				
			}else{
				lvlArray[1010,24]= "Defeat Elmwood"
				rmtype=1
				lvlselect=2
				with(Me){
					x = other.midx
					y = other.midy+64
				}	
				//CHEST REWARD Loot
				mapdataArray[1004,3]=1
				chance=choose(0,1,2)
				if(chance==0){
					mapdataArray[1004,4]=5
				}else{
					if(chance==1){
						mapdataArray[1004,4]=7
					}else{
						mapdataArray[1004,4]=21
					}
				}
			}
		}else{
			//Level BOSS
			if(lvlArray[1000,0]==3){
				lvlArray[1010,24]= "Defeat The Orchard King"
				rmtype=1
				lvlselect=1
				with(Me){
					x = other.midx
					y = other.midy+64
				}
				//CHEST REWARD Loot
				mapdataArray[1004,3]=2
				chance=choose(0,1,2)
				if(chance==0){
					mapdataArray[1004,4]=5
				}else{
					if(chance==1){
						mapdataArray[1004,4]=9
					}else{
						mapdataArray[1004,4]=21
					}
				}
			}else{
				//Level Apple
				if(lvlArray[1000,0]==9){
					lvlArray[1010,24]= "Collect Apples"
					rmtype=choose(1,2)
					lvlselect=3
					with(Me){
						x = other.midx
						y = other.midy+64
					}
					//CHEST REWARD Loot
					mapdataArray[1004,3]=0
					chance=choose(0,1)
					if(chance==0){
						mapdataArray[1004,4]=13
					}else{
						if(chance==1){
							mapdataArray[1004,4]=15
						}else{
							mapdataArray[1004,4]=21
						}
					}			
				}else{
					//Witch
					if(lvlArray[1000,0]==11){
						lvlArray[1010,24]= "Brew the Potion"
						rmtype=1
						lvlselect=5
						with(Me){
							x = other.midx
							y = other.midy+64
						}
						//CHEST REWARD Loot
						mapdataArray[1004,3]=0
						chance=choose(0,1)
						if(chance==0){
							mapdataArray[1004,4]=19
						}else{
							if(chance==1){
								mapdataArray[1004,4]=1
							}else{
								mapdataArray[1004,4]=21
							}
						}			
					}else{
	
					}	
				}
			}	
		}
	}

	xto=camtarget.x
	yto=camtarget.y-8
	camx = xto
	camy = yto

	border=14
	bordertwo=border/2

	rmw=lvlArray[lvlselect,0]+bordertwo
	rmh=lvlArray[lvlselect,1]+bordertwo

	//Level on currently mapdataArray[1001,8]

	mapx=midx-((rmw*blockwidth)/2)
	mapy=midy-((rmh*blockwidth)/2)

	mapxspot=mapx+(border/2)*16
	mapyspot=mapy+(border/2)*16
	mapxspottotal=mapx+rmw*16
	mapyspottotal=mapy+rmh*16
	
	Me.midx=x
	Me.midy=y

	if(instance_exists(Block)){
		with(Block){
		instance_destroy()
		}
	}

	for(a=0;a<rmw+1+(border);a+=1){
		for(b=0;b<rmh+1+(border);b+=1){
			roomArray[a,b]=0
			if(a<bordertwo||a>rmw||b<bordertwo||b>rmh){
			roomArray[a,b]=2
			}
			if(a==bordertwo||b==bordertwo||a==rmw+1||b==rmh+1){
				if(b==rmh+1&&a!=rmw+1&&a>bordertwo&&a<rmw+1){
					roomArray[a,b]=1
				}else{
					roomArray[a,b]=2
				}
				created=instance_create_depth(mapx+a*blockwidth,mapy+b*blockwidth,0,Block)
				with(created){
				sprite_index=block_spr
						image_index=0
						image_speed=0
				}
			}
		}
	}
	//LEVEL FILLER
	//TYPE1

	//Stage ID
	lvlArray[1010,1]=mapArray[mapdataArray[1001,7],mapdataArray[1001,8]]

				//Timer total miniArray[1,1], Timer Current miniArray[0,1]
				//Monster camp
			
					//Level Type
					//Goal total (Total number of waves)
					lvlArray[1000,1]=2
					//Goal current	(Current wave number on)
					lvlArray[1000,2]=2 
					//Goal counter type (Count down)
					lvlArray[1000,3]=1		
					//Goal counter two (Enemy number)
					lvlArray[1000,4]=0
					//Level phase
					lvlArray[1000,5]=0
					//Level check
					lvlArray[1000,6]=0
					//Level spawn delay
					lvlArray[1000,7]=0
					//Level random option
					lvlArray[1000,8]=0
				
					//Timer (60*180=3 minutes)
					miniArray[1,1]=(60*180)+1
					miniArray[0,1]=(60*180)+1
					//Level Difficulty
					if(mapdataArray[lvlArray[1010,1],10]<5){
						lvlArray[1000,9]=0
						miniArray[1,1]+=60*30
						miniArray[0,1]+=60*30
					}else{
						if(mapdataArray[lvlArray[1010,1],10]==5){
							lvlArray[1000,9]=1
								lvlArray[1000,1]+=1
								lvlArray[1000,2]+=1
						}else{
								lvlArray[1000,9]=2
								lvlArray[1000,1]+=1
								lvlArray[1000,2]+=1
						}				
					}
					//Variables
					lvlArray[1010,20]=0
					lvlArray[1010,21]=0
					lvlArray[1010,22]=0
					lvlArray[1010,23]=0
					//End Delay timer
					lvlArray[1010,0]=0
					//lvlArray[1010,2]=0	LAST LEVEL TYPE
					//Enemy count
					lvlArray[1010,3]=0
					//Recipe Draw
					lvlArray[1010,30]=0
				
					//Ground Spawner Location x,y
					chance=mapx+8*16
					chancetwo=mapy+8*16

				if(lvlArray[1000,0]==1){
				}
#region Small Rooms
#region Small Room 1
	if(lvlselect==2){
	//____________________________________________________________________________---------------------(Small Room 1)---------------------____________________________________________________________________________	
		if(rmtype==1){
			xpos=1+bordertwo
			xpostwo=3
			ypos=11+bordertwo
			ypostwo=9
			

#region Spawns
#region Spawn 1
					lvlArray[1000,10]=(chance+1*16)-8
					lvlArray[1000,11]=chancetwo+7*16
					lvlArray[1000,12]=3
					lvlArray[1000,13]=1
					lvlArray[1000,14]=1

					lvlArray[1000,15]=(chance+23*16)+8
					lvlArray[1000,16]=chancetwo+7*16
					lvlArray[1000,17]=3
					lvlArray[1000,18]=1
					lvlArray[1000,19]=1

					lvlArray[1000,20]=(chance+13*16)+7
					lvlArray[1000,21]=chancetwo+8*16
					lvlArray[1000,22]=2
					lvlArray[1000,23]=2
					lvlArray[1000,24]=1

					lvlArray[1000,25]=0
					lvlArray[1000,26]=0
					lvlArray[1000,27]=1
					lvlArray[1000,28]=1
					lvlArray[1000,29]=1

					lvlArray[1000,30]=0
					lvlArray[1000,31]=0
					lvlArray[1000,32]=1
					lvlArray[1000,33]=1
					lvlArray[1000,34]=1

					lvlArray[1000,35]=0
					lvlArray[1000,36]=0
					lvlArray[1000,37]=1
					lvlArray[1000,38]=1
					lvlArray[1000,39]=1
#endregion
#region Spawn 2
					lvlArray[1000,40]=(chance+6*16)
					lvlArray[1000,41]=chancetwo+13*16
					lvlArray[1000,42]=3
					lvlArray[1000,43]=3
					lvlArray[1000,44]=3

					lvlArray[1000,45]=(chance+20*16)
					lvlArray[1000,46]=chancetwo+13*16
					lvlArray[1000,47]=3
					lvlArray[1000,48]=3
					lvlArray[1000,49]=3

					lvlArray[1000,50]=(chance+6*16)
					lvlArray[1000,51]=chancetwo+11*16
					lvlArray[1000,52]=2
					lvlArray[1000,53]=2
					lvlArray[1000,54]=2

					lvlArray[1000,55]=(chance+20*16)
					lvlArray[1000,56]=chancetwo+11*16
					lvlArray[1000,57]=2
					lvlArray[1000,58]=2
					lvlArray[1000,59]=2

					lvlArray[1000,60]=(chance+1*16)-8
					lvlArray[1000,61]=chancetwo+7*16
					lvlArray[1000,62]=3
					lvlArray[1000,63]=3
					lvlArray[1000,64]=2

					lvlArray[1000,65]=(chance+23*16)+8
					lvlArray[1000,66]=chancetwo+7*16
					lvlArray[1000,67]=3
					lvlArray[1000,68]=3
					lvlArray[1000,69]=2
#endregion
#region Spawn 3
					lvlArray[1000,70]=chance+4*16
					lvlArray[1000,71]=chancetwo+12*16
					lvlArray[1000,72]=3
					lvlArray[1000,73]=3
					lvlArray[1000,74]=3

					lvlArray[1000,75]=(chance+13*16)-8
					lvlArray[1000,76]=chancetwo+8*16
					lvlArray[1000,77]=3
					lvlArray[1000,78]=3
					lvlArray[1000,79]=2

					lvlArray[1000,80]=chance+13*16-8
					lvlArray[1000,81]=chancetwo+9*16
					lvlArray[1000,82]=1
					lvlArray[1000,83]=1
					lvlArray[1000,84]=1

					lvlArray[1000,85]=chance+22*16
					lvlArray[1000,86]=chancetwo+12*16
					lvlArray[1000,87]=3
					lvlArray[1000,88]=3
					lvlArray[1000,89]=3

					lvlArray[1000,90]=chance+5*16
					lvlArray[1000,91]=chancetwo+11*16
					lvlArray[1000,92]=3
					lvlArray[1000,93]=3
					lvlArray[1000,94]=3

					lvlArray[1000,95]=chance+21*16
					lvlArray[1000,96]=chancetwo+11*16
					lvlArray[1000,97]=3
					lvlArray[1000,98]=3
					lvlArray[1000,99]=3
#endregion
#region Spawn 4
					lvlArray[1000,100]=(chance+2*16)-8
					lvlArray[1000,101]=chancetwo+5*16
					lvlArray[1000,102]=2
					lvlArray[1000,103]=2
					lvlArray[1000,104]=2

					lvlArray[1000,105]=(chance+6*16)
					lvlArray[1000,106]=chancetwo+9*16
					lvlArray[1000,107]=2
					lvlArray[1000,108]=2
					lvlArray[1000,109]=2

					lvlArray[1000,110]=(chance+13*16)
					lvlArray[1000,111]=chancetwo+7*16
					lvlArray[1000,112]=2
					lvlArray[1000,113]=2
					lvlArray[1000,114]=2

					lvlArray[1000,115]=(chance+20*16)-8
					lvlArray[1000,116]=chancetwo+9*16
					lvlArray[1000,117]=2
					lvlArray[1000,118]=2
					lvlArray[1000,119]=2

					lvlArray[1000,120]=(chance+23*16)-8
					lvlArray[1000,121]=chancetwo+5*16
					lvlArray[1000,122]=2
					lvlArray[1000,123]=2
					lvlArray[1000,124]=2

					lvlArray[1000,125]=0
					lvlArray[1000,126]=0
					lvlArray[1000,127]=1
					lvlArray[1000,128]=1
					lvlArray[1000,129]=1
#endregion
#endregion
			
		
			for(c=0;c<3;c+=1){
				for(a=xpos;a<xpos+xpostwo;a+=1){
					for(b=ypos;b<ypos+ypostwo;b+=1){
						if(b==ypos){
						roomArray[a,b]=1
						}else{
						roomArray[a,b]=2
						}
						created=instance_create_depth(mapx+a*blockwidth,mapy+b*blockwidth,0,Block)
						with(created){
						sprite_index=block_spr
						image_index=0
						image_speed=0
						}
					}
				}
				if(c==1){
					xpos=10+bordertwo
					xpostwo=7
					ypos=12+bordertwo
					ypostwo=8
				}else{
					xpos=23+bordertwo
					xpostwo=3
					ypos=11+bordertwo
					ypostwo=9			
				}
			}
		}else{
#endregion
#region Small Room 2
	//____________________________________________________________________________---------------------(Small Room 2)---------------------____________________________________________________________________________	
			if(rmtype==2){
				xpos=6+bordertwo
				xpostwo=15
			ypos=14+bordertwo
			ypostwo=9

#region Spawns
#region Spawn 1
					lvlArray[1000,10]=(chance+3*16)
					lvlArray[1000,11]=chancetwo+12*16
					lvlArray[1000,12]=3
					lvlArray[1000,13]=3
					lvlArray[1000,14]=3

					lvlArray[1000,15]=(chance+22*16)
					lvlArray[1000,16]=chancetwo+12*16
					lvlArray[1000,17]=3
					lvlArray[1000,18]=3
					lvlArray[1000,19]=3

					lvlArray[1000,20]=(chance+7*16)-20
					lvlArray[1000,21]=chancetwo+9*16
					lvlArray[1000,22]=1
					lvlArray[1000,23]=1
					lvlArray[1000,24]=1

					lvlArray[1000,25]=(chance+13*16)-8
					lvlArray[1000,26]=chancetwo+9*16
					lvlArray[1000,27]=3
					lvlArray[1000,28]=3
					lvlArray[1000,29]=3

					lvlArray[1000,30]=(chance+19*16)-8
					lvlArray[1000,31]=chancetwo+9*16
					lvlArray[1000,32]=1
					lvlArray[1000,33]=1
					lvlArray[1000,34]=1

					lvlArray[1000,35]=0
					lvlArray[1000,36]=0
					lvlArray[1000,37]=3
					lvlArray[1000,38]=3
					lvlArray[1000,39]=3
#endregion
#region Spawn 2
					lvlArray[1000,40]=(chance+3*16)
					lvlArray[1000,41]=chancetwo+8*16
					lvlArray[1000,42]=2
					lvlArray[1000,43]=2
					lvlArray[1000,44]=3

					lvlArray[1000,45]=(chance+3*16)
					lvlArray[1000,46]=chancetwo+9*16
					lvlArray[1000,47]=3
					lvlArray[1000,48]=3
					lvlArray[1000,49]=2

					lvlArray[1000,50]=(chance+7*16)-20
					lvlArray[1000,51]=chancetwo+7*16
					lvlArray[1000,52]=3
					lvlArray[1000,53]=3
					lvlArray[1000,54]=1

					lvlArray[1000,55]=(chance+19*16)
					lvlArray[1000,56]=chancetwo+7*16
					lvlArray[1000,57]=3
					lvlArray[1000,58]=3
					lvlArray[1000,59]=1

					lvlArray[1000,60]=(chance+23*16)
					lvlArray[1000,61]=chancetwo+8*16
					lvlArray[1000,62]=2
					lvlArray[1000,63]=2
					lvlArray[1000,64]=3

					lvlArray[1000,65]=(chance+23*16)
					lvlArray[1000,66]=chancetwo+9*16
					lvlArray[1000,67]=3
					lvlArray[1000,68]=3
					lvlArray[1000,69]=2
#endregion
#region Spawn 3
					lvlArray[1000,70]=chance+8*16
					lvlArray[1000,71]=chancetwo+12*16
					lvlArray[1000,72]=3
					lvlArray[1000,73]=3
					lvlArray[1000,74]=3

					lvlArray[1000,75]=(chance+18*16)-8
					lvlArray[1000,76]=chancetwo+8*16
					lvlArray[1000,77]=3
					lvlArray[1000,78]=3
					lvlArray[1000,79]=3

					lvlArray[1000,80]=chance+3*16-8
					lvlArray[1000,81]=chancetwo+5*16
					lvlArray[1000,82]=3
					lvlArray[1000,83]=3
					lvlArray[1000,84]=2

					lvlArray[1000,85]=chance+23*16
					lvlArray[1000,86]=chancetwo+5*16
					lvlArray[1000,87]=3
					lvlArray[1000,88]=3
					lvlArray[1000,89]=2

					lvlArray[1000,90]=chance+13*16-8
					lvlArray[1000,91]=chancetwo+5*16
					lvlArray[1000,92]=1
					lvlArray[1000,93]=1
					lvlArray[1000,94]=1

					lvlArray[1000,95]=0
					lvlArray[1000,96]=0
					lvlArray[1000,97]=3
					lvlArray[1000,98]=3
					lvlArray[1000,99]=3
#endregion
#region Spawn 4
					lvlArray[1000,100]=(chance+2*16)-8
					lvlArray[1000,101]=chancetwo+10*16
					lvlArray[1000,102]=2
					lvlArray[1000,103]=2
					lvlArray[1000,104]=2

					lvlArray[1000,105]=(chance+24*16)
					lvlArray[1000,106]=chancetwo+10*16
					lvlArray[1000,107]=2
					lvlArray[1000,108]=2
					lvlArray[1000,109]=2

					lvlArray[1000,110]=(chance+3*16)
					lvlArray[1000,111]=chancetwo+4*16+8
					lvlArray[1000,112]=2
					lvlArray[1000,113]=2
					lvlArray[1000,114]=2

					lvlArray[1000,115]=(chance+23*16)-8
					lvlArray[1000,116]=chancetwo+4*16+8
					lvlArray[1000,117]=2
					lvlArray[1000,118]=2
					lvlArray[1000,119]=2

					lvlArray[1000,120]=(chance+13*16)-8
					lvlArray[1000,121]=chancetwo+4*16
					lvlArray[1000,122]=2
					lvlArray[1000,123]=2
					lvlArray[1000,124]=2

					lvlArray[1000,125]=0
					lvlArray[1000,126]=0
					lvlArray[1000,127]=1
					lvlArray[1000,128]=1
					lvlArray[1000,129]=1
#endregion
#endregion

				for(c=0;c<3;c+=1){
					for(a=xpos;a<xpos+xpostwo;a+=1){
						for(b=ypos;b<ypos+ypostwo;b+=1){
							if(b==ypos){
							roomArray[a,b]=1
							}else{
							roomArray[a,b]=2
							}
							created=instance_create_depth(mapx+a*blockwidth,mapy+b*blockwidth,0,Block)
							with(created){
							sprite_index=block_spr
							image_index=0
							image_speed=0
							}
						}
					}
					if(c==1){
						xpos=6+bordertwo
						xpostwo=3
						ypos=13+bordertwo
						ypostwo=2
					}else{
						xpos=18+bordertwo
						xpostwo=3
						ypos=13+bordertwo
						ypostwo=2
					}
				}	
			
			}else{
#endregion
#region Small Room 3
	//____________________________________________________________________________---------------------(Small Room 3)---------------------____________________________________________________________________________	
					if(rmtype==3){
						xpos=1+bordertwo
						xpostwo=5
						ypos=9+bordertwo
						ypostwo=1
	
#region Spawns
#region Spawn 1

					lvlArray[1000,10]=(chance+2*16)
					lvlArray[1000,11]=chancetwo+4*16
					lvlArray[1000,12]=3
					lvlArray[1000,13]=1
					lvlArray[1000,14]=1

					lvlArray[1000,15]=(chance+22*16)
					lvlArray[1000,16]=chancetwo+4*16
					lvlArray[1000,17]=3
					lvlArray[1000,18]=1
					lvlArray[1000,19]=1

					lvlArray[1000,20]=(chance+2*16)
					lvlArray[1000,21]=chancetwo+12*16
					lvlArray[1000,22]=3
					lvlArray[1000,23]=3
					lvlArray[1000,24]=3

					lvlArray[1000,25]=(chance+22*16)
					lvlArray[1000,26]=chancetwo+12*16
					lvlArray[1000,27]=3
					lvlArray[1000,28]=3
					lvlArray[1000,29]=3

					lvlArray[1000,30]=(chance+13*16)-3
					lvlArray[1000,31]=chancetwo+9*16
					lvlArray[1000,32]=3
					lvlArray[1000,33]=3
					lvlArray[1000,34]=2

					lvlArray[1000,35]=(chance+13*16)-3
					lvlArray[1000,36]=chancetwo+9*16
					lvlArray[1000,37]=3
					lvlArray[1000,38]=3
					lvlArray[1000,39]=3

#endregion
#region Spawn 2
			chance=mapx+7*16
			chancetwo=mapy+8*16

					lvlArray[1000,40]=(chance+2*16)
					lvlArray[1000,41]=chancetwo+3*16
					lvlArray[1000,42]=3
					lvlArray[1000,43]=1
					lvlArray[1000,44]=1

					lvlArray[1000,45]=(chance+23*16)
					lvlArray[1000,46]=chancetwo+3*16
					lvlArray[1000,47]=3
					lvlArray[1000,48]=1
					lvlArray[1000,49]=1

					lvlArray[1000,50]=(chance+6*16)
					lvlArray[1000,51]=chancetwo+10*16
					lvlArray[1000,52]=2
					lvlArray[1000,53]=2
					lvlArray[1000,54]=2

					lvlArray[1000,55]=(chance+13*16)
					lvlArray[1000,56]=chancetwo+10*16
					lvlArray[1000,57]=3
					lvlArray[1000,58]=3
					lvlArray[1000,59]=2

					lvlArray[1000,60]=(chance+20*16)
					lvlArray[1000,61]=chancetwo+10*16
					lvlArray[1000,62]=2
					lvlArray[1000,63]=2
					lvlArray[1000,64]=2

					lvlArray[1000,65]=0
					lvlArray[1000,66]=0
					lvlArray[1000,67]=3
					lvlArray[1000,68]=3
					lvlArray[1000,69]=2

#endregion
#region Spawn 3
					lvlArray[1000,70]=chance+8*16
					lvlArray[1000,71]=chancetwo+12*16
					lvlArray[1000,72]=3
					lvlArray[1000,73]=1
					lvlArray[1000,74]=1

					lvlArray[1000,75]=(chance+18*16)-4
					lvlArray[1000,76]=chancetwo+8*16
					lvlArray[1000,77]=3
					lvlArray[1000,78]=1
					lvlArray[1000,79]=1

					lvlArray[1000,80]=chance+3*16-8
					lvlArray[1000,81]=chancetwo+5*16
					lvlArray[1000,82]=3
					lvlArray[1000,83]=2
					lvlArray[1000,84]=2

					lvlArray[1000,85]=chance+23*16
					lvlArray[1000,86]=chancetwo+5*16
					lvlArray[1000,87]=3
					lvlArray[1000,88]=2
					lvlArray[1000,89]=2

					lvlArray[1000,90]=chance+13*16
					lvlArray[1000,91]=chancetwo+3*16
					lvlArray[1000,92]=2
					lvlArray[1000,93]=2
					lvlArray[1000,94]=2

					lvlArray[1000,95]=0
					lvlArray[1000,96]=0
					lvlArray[1000,97]=3
					lvlArray[1000,98]=3
					lvlArray[1000,99]=3
#endregion
#region Spawn 4
					lvlArray[1000,100]=(chance+2*16)-8
					lvlArray[1000,101]=chancetwo+10*16
					lvlArray[1000,102]=2
					lvlArray[1000,103]=2
					lvlArray[1000,104]=2

					lvlArray[1000,105]=(chance+24*16)
					lvlArray[1000,106]=chancetwo+10*16
					lvlArray[1000,107]=2
					lvlArray[1000,108]=2
					lvlArray[1000,109]=2

					lvlArray[1000,110]=(chance+3*16)
					lvlArray[1000,111]=chancetwo+3*16
					lvlArray[1000,112]=2
					lvlArray[1000,113]=2
					lvlArray[1000,114]=2

					lvlArray[1000,115]=(chance+23*16)-8
					lvlArray[1000,116]=chancetwo+3*16
					lvlArray[1000,117]=2
					lvlArray[1000,118]=2
					lvlArray[1000,119]=2

					lvlArray[1000,120]=(chance+13*16)-8
					lvlArray[1000,121]=chancetwo+2*16
					lvlArray[1000,122]=2
					lvlArray[1000,123]=2
					lvlArray[1000,124]=2

					lvlArray[1000,125]=0
					lvlArray[1000,126]=0
					lvlArray[1000,127]=1
					lvlArray[1000,128]=1
					lvlArray[1000,129]=1
#endregion
#endregion
	
						for(c=0;c<4;c+=1){
							for(a=xpos;a<xpos+xpostwo;a+=1){
								for(b=ypos;b<ypos+ypostwo;b+=1){
									if(b==ypos){
									roomArray[a,b]=1
									}else{
									roomArray[a,b]=2
									}
									created=instance_create_depth(mapx+a*blockwidth,mapy+b*blockwidth,0,Block)
									with(created){
									sprite_index=block_spr
									image_index=0
									image_speed=0
									}
								}
							}
							if(c==1){
								xpos=10+bordertwo
								xpostwo=7
								ypos=13+bordertwo
								ypostwo=9
							}else{
								if(c==2){
									xpos=21+bordertwo
									xpostwo=5
									ypos=9+bordertwo
									ypostwo=1
								}else{
									xpos=12+bordertwo
									xpostwo=3
									ypos=7+bordertwo
									ypostwo=1							
								}
							}
						}
					}else{
#endregion	
#region Small Room 4
	//____________________________________________________________________________---------------------(Small Room 4)---------------------____________________________________________________________________________	
		if(rmtype==4){
			

#region Spawns
#region Spawn 1
					lvlArray[1000,10]=(chance+1*16)-8
					lvlArray[1000,11]=chancetwo+2*16
					lvlArray[1000,12]=3
					lvlArray[1000,13]=2
					lvlArray[1000,14]=2

					lvlArray[1000,15]=(chance+23*16)+8
					lvlArray[1000,16]=chancetwo+2*16
					lvlArray[1000,17]=3
					lvlArray[1000,18]=2
					lvlArray[1000,19]=2

					lvlArray[1000,20]=(chance+1*16)-8
					lvlArray[1000,21]=chancetwo+8*16-6
					lvlArray[1000,22]=3
					lvlArray[1000,23]=2
					lvlArray[1000,24]=1

					lvlArray[1000,25]=(chance+23*16)+8
					lvlArray[1000,26]=chancetwo+8*16-6
					lvlArray[1000,27]=3
					lvlArray[1000,28]=2
					lvlArray[1000,29]=1

					lvlArray[1000,30]=(chance+12*16)
					lvlArray[1000,31]=chancetwo+4*16
					lvlArray[1000,32]=1
					lvlArray[1000,33]=2
					lvlArray[1000,34]=2

					lvlArray[1000,35]=0
					lvlArray[1000,36]=0
					lvlArray[1000,37]=1
					lvlArray[1000,38]=1
					lvlArray[1000,39]=1
#endregion
#region Spawn 2
					lvlArray[1000,40]=(chance+2*16)
					lvlArray[1000,41]=chancetwo+2*16
					lvlArray[1000,42]=1
					lvlArray[1000,43]=1
					lvlArray[1000,44]=1

					lvlArray[1000,45]=(chance+22*16)
					lvlArray[1000,46]=chancetwo+2*16
					lvlArray[1000,47]=1
					lvlArray[1000,48]=1
					lvlArray[1000,49]=1

					lvlArray[1000,50]=(chance+3*16)-2
					lvlArray[1000,51]=chancetwo+9*16
					lvlArray[1000,52]=3
					lvlArray[1000,53]=3
					lvlArray[1000,54]=3

					lvlArray[1000,55]=(chance+22*16)-12
					lvlArray[1000,56]=chancetwo+9*16
					lvlArray[1000,57]=3
					lvlArray[1000,58]=3
					lvlArray[1000,59]=3

					lvlArray[1000,60]=(chance+6*16)
					lvlArray[1000,61]=chancetwo+2*16
					lvlArray[1000,62]=3
					lvlArray[1000,63]=3
					lvlArray[1000,64]=3

					lvlArray[1000,65]=(chance+18*16)
					lvlArray[1000,66]=chancetwo+2*16
					lvlArray[1000,67]=3
					lvlArray[1000,68]=3
					lvlArray[1000,69]=3
#endregion
#region Spawn 3
					lvlArray[1000,70]=(chance+2*16)
					lvlArray[1000,71]=chancetwo+2*16
					lvlArray[1000,72]=3
					lvlArray[1000,73]=3
					lvlArray[1000,74]=2

					lvlArray[1000,75]=(chance+22*16)
					lvlArray[1000,76]=chancetwo+2*16
					lvlArray[1000,77]=3
					lvlArray[1000,78]=3
					lvlArray[1000,79]=2

					lvlArray[1000,80]=(chance+3*16)-2
					lvlArray[1000,81]=chancetwo+9*16
					lvlArray[1000,82]=3
					lvlArray[1000,83]=3
					lvlArray[1000,84]=3

					lvlArray[1000,85]=(chance+22*16)-12
					lvlArray[1000,86]=chancetwo+9*16
					lvlArray[1000,87]=3
					lvlArray[1000,88]=3
					lvlArray[1000,89]=3

					lvlArray[1000,90]=(chance+12*16)
					lvlArray[1000,91]=chancetwo+4*16
					lvlArray[1000,92]=2
					lvlArray[1000,93]=2
					lvlArray[1000,94]=1

					lvlArray[1000,95]=0
					lvlArray[1000,96]=0
					lvlArray[1000,97]=3
					lvlArray[1000,98]=3
					lvlArray[1000,99]=3
#endregion
#region Spawn 4
					lvlArray[1000,100]=(chance+2*16)
					lvlArray[1000,101]=chancetwo+2*16
					lvlArray[1000,102]=2
					lvlArray[1000,103]=2
					lvlArray[1000,104]=2

					lvlArray[1000,105]=(chance+24*16)
					lvlArray[1000,106]=chancetwo+2*16
					lvlArray[1000,107]=2
					lvlArray[1000,108]=2
					lvlArray[1000,109]=2

					lvlArray[1000,110]=(chance+1*16)-8
					lvlArray[1000,111]=chancetwo+8*16-6
					lvlArray[1000,112]=2
					lvlArray[1000,113]=2
					lvlArray[1000,114]=2

					lvlArray[1000,115]=(chance+23*16)-8
					lvlArray[1000,116]=chancetwo+8*16-6
					lvlArray[1000,117]=2
					lvlArray[1000,118]=2
					lvlArray[1000,119]=2

					lvlArray[1000,120]=(chance+12*16)
					lvlArray[1000,121]=chancetwo+2*16
					lvlArray[1000,122]=2
					lvlArray[1000,123]=2
					lvlArray[1000,124]=2

					lvlArray[1000,125]=(chance+12*16)
					lvlArray[1000,126]=chancetwo+11*16
					lvlArray[1000,127]=2
					lvlArray[1000,128]=2
					lvlArray[1000,129]=2
#endregion
#endregion
			
			xpos=1+bordertwo
			xpostwo=9
			ypos=6+bordertwo
			ypostwo=1
			for(c=0;c<16;c+=1){
				for(a=xpos;a<xpos+xpostwo;a+=1){
					for(b=ypos;b<ypos+ypostwo;b+=1){
						roomArray[a,b]=2
						created=instance_create_depth(mapx+a*blockwidth,mapy+b*blockwidth,0,Block)
						with(created){
						sprite_index=block_spr
						image_index=0
						image_speed=0
						}
					}
				}
				if(c==1){
				xpos=1+bordertwo
				xpostwo=5
				ypos=5+bordertwo
				ypostwo=1
				}else{
					if(c==2){
					xpos=1+bordertwo
					xpostwo=2
					ypos=10+bordertwo
					ypostwo=7
					}else{
						if(c==3){
						xpos=3+bordertwo
						xpostwo=3
						ypos=13+bordertwo
						ypostwo=4
						}else{
							if(c==4){
							xpos=6+bordertwo
							xpostwo=1
							ypos=14+bordertwo
							ypostwo=3
							}else{
								if(c==5){
								xpos=7+bordertwo
								xpostwo=5
								ypos=15+bordertwo
								ypostwo=2
								}else{
									if(c==6){
									xpos=12+bordertwo
									xpostwo=3
									ypos=10+bordertwo
									ypostwo=2
									}else{
										if(c==7){
										xpos=21+bordertwo
										xpostwo=6
										ypos=5+bordertwo
										ypostwo=1
										}else{
											if(c==8){
											xpos=17+bordertwo
											xpostwo=9
											ypos=6+bordertwo
											ypostwo=1
											}else{
												if(c==9){
												xpos=15+bordertwo
												xpostwo=5
												ypos=15+bordertwo
												ypostwo=2
												}else{
													if(c==10){
													xpos=20+bordertwo
													xpostwo=1
													ypos=14+bordertwo
													ypostwo=3
													}else{
														if(c==11){
														xpos=21+bordertwo
														xpostwo=3
														ypos=13+bordertwo
														ypostwo=4
														}else{
															if(c==12){
															xpos=24+bordertwo
															xpostwo=2
															ypos=10+bordertwo
															ypostwo=7
															}else{
																if(c==13){
																xpos=1+bordertwo
																xpostwo=7
																ypos=7+bordertwo
																ypostwo=1
																}else{
																	if(c==14){
																	xpos=19+bordertwo
																	xpostwo=7
																	ypos=7+bordertwo
																	ypostwo=1
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
		}else{
#endregion
#region Medium Rooms
	if(lvlselect==3){
#region Med Room 1
	//____________________________________________________________________________---------------------(Medium Room 1)---------------------____________________________________________________________________________	
		if(rmtype==1){
			xpos=1+bordertwo
			xpostwo=2
			ypos=14+bordertwo
			ypostwo=8
				for(c=0;c<9;c+=1){
				for(a=xpos;a<xpos+xpostwo;a+=1){
					for(b=ypos;b<ypos+ypostwo;b+=1){
						if(b==ypos){
						roomArray[a,b]=1
						}else{
						roomArray[a,b]=2
						}
						created=instance_create_depth(mapx+a*blockwidth,mapy+b*blockwidth,0,Block)
						with(created){
						sprite_index=block_spr
						image_index=0
						image_speed=0
						}
					}
				}
				if(c==1){
					xpos=3+bordertwo
					xpostwo=2
					ypos=19+bordertwo
					ypostwo=3
				}else{
					if(c==2){
						xpos=5+bordertwo
						xpostwo=2
						ypos=20+bordertwo
						ypostwo=2		
					}else{
						if(c==3){
							xpos=11+bordertwo
							xpostwo=10
							ypos=20+bordertwo
							ypostwo=2	
						}else{
							if(c==4){
								xpos=13+bordertwo
								xpostwo=6
								ypos=19+bordertwo
								ypostwo=2	
							}else{
								if(c==5){
									xpos=29+bordertwo
									xpostwo=2
									ypos=14+bordertwo
									ypostwo=8
								}else{
									if(c==6){
										xpos=27+bordertwo
										xpostwo=2
										ypos=19+bordertwo
										ypostwo=3
									}else{
										if(c==7){
											xpos=25+bordertwo
											xpostwo=2
											ypos=20+bordertwo
											ypostwo=2
										}else{
					
										}					
									}					
								}					
							}					
						}					
					}
				}
			}	
		}else{
#endregion
#region Med Room 2
	//____________________________________________________________________________---------------------(Medium Room 2)---------------------____________________________________________________________________________	
		if(rmtype==2){
			xpos=1+bordertwo
			xpostwo=2
			ypos=14+bordertwo
			ypostwo=8
				for(c=0;c<9;c+=1){
				for(a=xpos;a<xpos+xpostwo;a+=1){
					for(b=ypos;b<ypos+ypostwo;b+=1){
						if(b==ypos){
						roomArray[a,b]=1
						}else{
						roomArray[a,b]=2
						}
						if(!instance_position(mapx+a*blockwidth,mapy+b*blockwidth,Block)){
							created=instance_create_depth(mapx+a*blockwidth,mapy+b*blockwidth,0,Block)
							with(created){
							sprite_index=block_spr
							image_index=0
							image_speed=0
							}
						}
					}
				}
				if(c==1){
					xpos=3+bordertwo
					xpostwo=6
					ypos=19+bordertwo
					ypostwo=3
				}else{
					if(c==2){
						xpos=5+bordertwo
						xpostwo=3
						ypos=18+bordertwo
						ypostwo=2	
					}else{
						if(c==3){

						}else{
							if(c==4){
								xpos=14+bordertwo
								xpostwo=4
								ypos=19+bordertwo
								ypostwo=3
							}else{
								if(c==5){
									xpos=29+bordertwo
									xpostwo=2
									ypos=14+bordertwo
									ypostwo=8
								}else{
									if(c==6){
										xpos=23+bordertwo
										xpostwo=7
										ypos=19+bordertwo
										ypostwo=3
									}else{
										if(c==7){
											xpos=24+bordertwo
											xpostwo=3
											ypos=18+bordertwo
											ypostwo=2
										}else{
					
										}					
									}					
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
	}else{
#region Large Rooms
#region Large Room 1
	if(lvlselect==5){
	//____________________________________________________________________________---------------------(Large Room 1)---------------------____________________________________________________________________________	
		if(rmtype==1){
			xpos=1+bordertwo
			xpostwo=1
			ypos=4+bordertwo
			ypostwo=2
			chance-=8

#region Spawns
#region Spawn 1
					lvlArray[1000,10]=(chance+4*16)
					lvlArray[1000,11]=chancetwo+6*16
				
					lvlArray[1000,12]=(chance+6*16)
					lvlArray[1000,13]=chancetwo+19*16
				
					lvlArray[1000,14]=(chance+18*16)
					lvlArray[1000,15]=chancetwo+12*16
				
					lvlArray[1000,16]=(chance+19*16)
					lvlArray[1000,17]=chancetwo+20*16
				
					lvlArray[1000,18]=(chance+21*16)
					lvlArray[1000,19]=chancetwo+2*16
				
					lvlArray[1000,20]=(chance+42*16)
					lvlArray[1000,21]=chancetwo+4*16
				
					lvlArray[1000,22]=(chance+75*16)
					lvlArray[1000,23]=chancetwo+10*16
				
					lvlArray[1000,24]=(chance+76*16)
					lvlArray[1000,25]=chancetwo+22*16
				
					lvlArray[1000,26]=(chance+78*16)
					lvlArray[1000,27]=chancetwo+3*16
				
					lvlArray[1000,28]=(chance+94*16)
					lvlArray[1000,29]=chancetwo+8*16

					lvlArray[1000,30]=(chance+99*16)
					lvlArray[1000,31]=chancetwo+3*16
				
					lvlArray[1000,32]=(chance+94*16)
					lvlArray[1000,33]=chancetwo+20*16
				
					lvlArray[1000,34]=(chance+69*16)
					lvlArray[1000,35]=chancetwo+3*16
				
					lvlArray[1000,36]=(chance+58*16)
					lvlArray[1000,37]=chancetwo+4*16
				
					lvlArray[1000,38]=0
					lvlArray[1000,39]=0
#endregion
#region Spawn 2
					lvlArray[1000,40]=(chance+5*16)
					lvlArray[1000,41]=chancetwo+13*16
				
					lvlArray[1000,42]=(chance+7*16)
					lvlArray[1000,43]=chancetwo+23*16
				
					lvlArray[1000,44]=(chance+20*16)
					lvlArray[1000,45]=chancetwo+13*16
				
					lvlArray[1000,46]=(chance+25*16)
					lvlArray[1000,47]=chancetwo+22*16
				
					lvlArray[1000,48]=(chance+27*16)
					lvlArray[1000,49]=chancetwo+3*16

					lvlArray[1000,50]=(chance+31*16)
					lvlArray[1000,51]=chancetwo+13*16
				
					lvlArray[1000,52]=(chance+94*16)
					lvlArray[1000,53]=chancetwo+21*16
				
					lvlArray[1000,54]=(chance+89*16)
					lvlArray[1000,55]=chancetwo+11*16
				
					lvlArray[1000,56]=(chance+71*16)-8
					lvlArray[1000,57]=chancetwo+23*16
				
					lvlArray[1000,58]=(chance+72*16)
					lvlArray[1000,59]=chancetwo+11*16

					lvlArray[1000,60]=(chance+78*16)+8
					lvlArray[1000,61]=chancetwo+11*16
				
					lvlArray[1000,62]=(chance+98*16)
					lvlArray[1000,63]=chancetwo+11*16
				
					lvlArray[1000,64]=0
					lvlArray[1000,65]=0
					lvlArray[1000,66]=0
					lvlArray[1000,67]=0
					lvlArray[1000,68]=0
					lvlArray[1000,69]=0
#endregion
#region Spawn 3
					lvlArray[1000,70]=(chance+23*16)+8
					lvlArray[1000,71]=chancetwo+12*16
					lvlArray[1000,72]=(chance+23*16)+8
					lvlArray[1000,73]=chancetwo+7*16
					lvlArray[1000,74]=(chance+13*16)-8

					lvlArray[1000,75]=chancetwo+8*16
					lvlArray[1000,76]=(chance+23*16)+8
					lvlArray[1000,77]=chancetwo+7*16
					lvlArray[1000,78]=(chance+23*16)+8
					lvlArray[1000,79]=chancetwo+9*16

					lvlArray[1000,80]=(chance+23*16)+8
					lvlArray[1000,81]=chancetwo+7*16
					lvlArray[1000,82]=(chance+23*16)+8
					lvlArray[1000,83]=chancetwo+12*16
					lvlArray[1000,84]=(chance+23*16)+8

					lvlArray[1000,85]=chancetwo+7*16
					lvlArray[1000,86]=(chance+23*16)+8
					lvlArray[1000,87]=chancetwo+11*16
					lvlArray[1000,88]=(chance+23*16)+8
					lvlArray[1000,89]=chancetwo+7*16

					lvlArray[1000,90]=chance+21*16
					lvlArray[1000,91]=chancetwo+11*16
					lvlArray[1000,92]=(chance+23*16)+8
					lvlArray[1000,93]=chancetwo+7*16
					lvlArray[1000,94]=0

					lvlArray[1000,95]=0
					lvlArray[1000,96]=0
					lvlArray[1000,97]=0
					lvlArray[1000,98]=0
					lvlArray[1000,99]=0
#endregion
#region Spawn 4
					lvlArray[1000,100]=(chance+2*16)-8
					lvlArray[1000,101]=chancetwo+5*16
					lvlArray[1000,102]=(chance+23*16)+8
					lvlArray[1000,103]=chancetwo+7*16
					lvlArray[1000,104]=(chance+6*16)

					lvlArray[1000,105]=chancetwo+9*16
					lvlArray[1000,106]=(chance+23*16)+8
					lvlArray[1000,107]=chancetwo+7*16
					lvlArray[1000,108]=(chance+13*16)
					lvlArray[1000,109]=chancetwo+7*16

					lvlArray[1000,110]=(chance+23*16)+8
					lvlArray[1000,111]=chancetwo+7*16
					lvlArray[1000,112]=(chance+20*16)-8
					lvlArray[1000,113]=chancetwo+9*16
					lvlArray[1000,114]=(chance+23*16)+8

					lvlArray[1000,115]=chancetwo+7*16
					lvlArray[1000,116]=(chance+23*16)-8
					lvlArray[1000,117]=chancetwo+5*16
					lvlArray[1000,118]=(chance+23*16)+8
					lvlArray[1000,119]=chancetwo+7*16

					lvlArray[1000,120]=(chance+23*16)+8
					lvlArray[1000,121]=chancetwo+7*16
					lvlArray[1000,122]=(chance+23*16)+8
					lvlArray[1000,123]=chancetwo+7*16
					lvlArray[1000,124]=0

					lvlArray[1000,125]=0
					lvlArray[1000,126]=0
					lvlArray[1000,127]=0
					lvlArray[1000,128]=0
					lvlArray[1000,129]=0
#endregion
#endregion
		
			for(c=0;c<69;c+=1){
				for(a=xpos;a<xpos+xpostwo;a+=1){
					for(b=ypos;b<ypos+ypostwo;b+=1){
						if(b==ypos){
						roomArray[a,b]=1
						}else{
						roomArray[a,b]=2
						}
						created=instance_create_depth(mapx+a*blockwidth,mapy+b*blockwidth,0,Block)
						with(created){
						sprite_index=block_spr
						image_index=0
						image_speed=0
						}
					}
				}
				if(c==1){
					xpos=1+bordertwo
					xpostwo=5
					ypos=9+bordertwo
					ypostwo=3
				}else{
					if(c==2){
						xpos=6+bordertwo
						xpostwo=2
						ypos=10+bordertwo
						ypostwo=1
					}else{
						if(c==3){
							xpos=1+bordertwo
							xpostwo=19
							ypos=15+bordertwo
							ypostwo=3
						}else{
							if(c==4){
								xpos=7+bordertwo
								xpostwo=4
								ypos=14+bordertwo
								ypostwo=2
							}else{
								if(c==5){
									xpos=1+bordertwo
									xpostwo=2
									ypos=24+bordertwo
									ypostwo=3
								}else{
									if(c==6){
										xpos=6+bordertwo
										xpostwo=2
										ypos=22+bordertwo
										ypostwo=1
									}else{
										if(c==7){
											xpos=10+bordertwo
											xpostwo=2
											ypos=8+bordertwo
											ypostwo=1
										}else{
											if(c==8){
												xpos=12+bordertwo
												xpostwo=32
												ypos=7+bordertwo
												ypostwo=2
											}else{
												if(c==9){
													xpos=12+bordertwo
													xpostwo=8
													ypos=9+bordertwo
													ypostwo=1
												}else{
													if(c==10){
														xpos=13+bordertwo
														xpostwo=3
														ypos=10+bordertwo
														ypostwo=1
													}else{
														if(c==11){
															xpos=14+bordertwo
															xpostwo=3
															ypos=1+bordertwo
															ypostwo=1
														}else{
															if(c==12){
																xpos=14+bordertwo
																xpostwo=3
																ypos=4+bordertwo
																ypostwo=4
															}else{
																if(c==13){
																	xpos=13+bordertwo
																	xpostwo=3
																	ypos=13+bordertwo
																	ypostwo=3
																}else{
																	if(c==14){
																		xpos=29+bordertwo
																		xpostwo=4
																		ypos=28+bordertwo
																		ypostwo=4
																	}else{
																		if(c==15){
																			xpos=13+bordertwo
																			xpostwo=3
																			ypos=18+bordertwo
																			ypostwo=2
																		}else{
																			if(c==16){
																				xpos=13+bordertwo
																				xpostwo=3
																				ypos=22+bordertwo
																				ypostwo=3
																			}else{
																				if(c==17){
																					xpos=29+bordertwo
																					xpostwo=4
																					ypos=28+bordertwo
																					ypostwo=4
																				}else{
																					if(c==18){
																						xpos=11+bordertwo
																						xpostwo=10
																						ypos=24+bordertwo
																						ypostwo=3
																					}else{
																						if(c==19){
																							xpos=20+bordertwo
																							xpostwo=12
																							ypos=16+bordertwo
																							ypostwo=2
																						}else{
																							if(c==20){
																								xpos=20+bordertwo
																								xpostwo=3
																								ypos=5+bordertwo
																								ypostwo=3
																							}else{
																									if(c==21){
																										xpos=48+bordertwo
																										xpostwo=6
																										ypos=24+bordertwo
																										ypostwo=1
																								}else{
																										if(c==22){
																											xpos=24+bordertwo
																											xpostwo=4
																											ypos=12+bordertwo
																											ypostwo=1																										
																										}else{
																											if(c==23){

																											}else{
																												if(c==24){
																													xpos=32+bordertwo
																													xpostwo=12
																													ypos=7+bordertwo
																													ypostwo=3
																												}else{
																													if(c==25){
																														xpos=32+bordertwo
																														xpostwo=9
																														ypos=15+bordertwo
																														ypostwo=3
																													}else{
																														if(c==26){
																															xpos=31+bordertwo
																															xpostwo=11
																															ypos=24+bordertwo
																															ypostwo=3
																														}else{
																															if(c==27){
																																xpos=33+bordertwo
																																xpostwo=3
																																ypos=5+bordertwo
																																ypostwo=3
																															}else{
																																if(c==28){
																																	xpos=32+bordertwo
																																	xpostwo=14
																																	ypos=9+bordertwo
																																	ypostwo=1
																																}else{
																																	if(c==29){
																																		xpos=36+bordertwo
																																		xpostwo=3
																																		ypos=10+bordertwo
																																		ypostwo=1
																																	}else{
																																		if(c==30){
																																			xpos=36+bordertwo
																																			xpostwo=3
																																			ypos=13+bordertwo
																																			ypostwo=7
																																		}else{
																																			if(c==31){
																																				xpos=36+bordertwo
																																				xpostwo=3
																																				ypos=22+bordertwo
																																				ypostwo=5
																																			}else{
																																				if(c==32){
																																					xpos=39+bordertwo
																																					xpostwo=3
																																					ypos=1+bordertwo
																																					ypostwo=1
																																				}else{
																																					if(c==33){
																																						xpos=39+bordertwo
																																						xpostwo=3
																																						ypos=4+bordertwo
																																						ypostwo=4
																																					}else{
																																						if(c==34){
																																							xpos=41+bordertwo
																																							xpostwo=2
																																							ypos=17+bordertwo
																																							ypostwo=1
																																						}else{
																																							if(c==35){
																																								xpos=45+bordertwo
																																								xpostwo=2
																																								ypos=20+bordertwo
																																								ypostwo=1
																																							}else{
																																								if(c==36){
																																									xpos=46+bordertwo
																																									xpostwo=10
																																									ypos=25+bordertwo
																																									ypostwo=1
																																								}else{
																																									if(c==37){
																																										xpos=24+bordertwo
																																										xpostwo=6
																																										ypos=48+bordertwo
																																										ypostwo=1
																																									}else{
																																										if(c==38){
																																											xpos=48+bordertwo
																																											xpostwo=6
																																											ypos=15+bordertwo
																																											ypostwo=2
																																										}else{
																																											if(c==39){
																																												xpos=50+bordertwo
																																												xpostwo=2
																																												ypos=6+bordertwo
																																												ypostwo=1
																																											}else{
																																												if(c==40){
																																													xpos=50+bordertwo
																																													xpostwo=2
																																													ypos=12+bordertwo
																																													ypostwo=1
																																												}else{
																																													if(c==41){
																																														xpos=56+bordertwo
																																														xpostwo=14
																																														ypos=9+bordertwo
																																														ypostwo=1
																																													}else{
																																														if(c==42){
																																															xpos=58+bordertwo
																																															xpostwo=32
																																															ypos=7+bordertwo
																																															ypostwo=2
																																														}else{
																																																if(c==43){
																																																	xpos=60+bordertwo
																																																	xpostwo=3
																																																	ypos=1+bordertwo
																																																	ypostwo=1
																																																}else{
																																																	if(c==44){
																																																		xpos=60+bordertwo
																																																		xpostwo=3
																																																		ypos=4+bordertwo
																																																		ypostwo=3
																																																	}else{
																																																		if(c==45){
																																																			xpos=56+bordertwo
																																																			xpostwo=2
																																																			ypos=20+bordertwo
																																																			ypostwo=1
																																																		}else{
																																																			if(c==46){
																																																				xpos=59+bordertwo
																																																				xpostwo=2
																																																				ypos=17+bordertwo
																																																				ypostwo=1
																																																			}else{
																																																				if(c==47){
																																																					xpos=60+bordertwo
																																																					xpostwo=7
																																																					ypos=24+bordertwo
																																																					ypostwo=2
																																																				}else{
																																																					if(c==48){
																																																						xpos=61+bordertwo
																																																						xpostwo=7
																																																						ypos=15+bordertwo
																																																						ypostwo=1
																																																					}else{
																																																					if(c==49){
																																																						xpos=61+bordertwo
																																																						xpostwo=40
																																																						ypos=16+bordertwo
																																																						ypostwo=2
																																																					}else{
																																																					if(c==50){
																																																						xpos=63+bordertwo
																																																						xpostwo=3
																																																						ypos=10+bordertwo
																																																						ypostwo=1
																																																					}else{
																																																					if(c==51){
																																																						xpos=63+bordertwo
																																																						xpostwo=3
																																																						ypos=13+bordertwo
																																																						ypostwo=2
																																																					}else{
																																																					if(c==52){
																																																						xpos=71+bordertwo
																																																						xpostwo=9
																																																						ypos=14+bordertwo
																																																						ypostwo=4
																																																					}else{
																																																					if(c==53){
																																																						xpos=81+bordertwo
																																																						xpostwo=9
																																																						ypos=9+bordertwo
																																																						ypostwo=1
																																																					}else{
																																																					if(c==54){
																																																						xpos=83+bordertwo
																																																						xpostwo=18
																																																						ypos=15+bordertwo
																																																						ypostwo=1
																																																					}else{
																																																					if(c==55){
																																																						xpos=85+bordertwo
																																																						xpostwo=3
																																																						ypos=1+bordertwo
																																																						ypostwo=1
																																																					}else{
																																																					if(c==56){
																																																						xpos=85+bordertwo
																																																						xpostwo=3
																																																						ypos=4+bordertwo
																																																						ypostwo=7
																																																					}else{
																																																					if(c==57){
																																																						xpos=85+bordertwo
																																																						xpostwo=3
																																																						ypos=13+bordertwo
																																																						ypostwo=2
																																																					}else{
																																																					if(c==58){
																																																						xpos=86+bordertwo
																																																						xpostwo=3
																																																						ypos=18+bordertwo
																																																						ypostwo=2
																																																					}else{
																																																					if(c==59){
																																																						xpos=86+bordertwo
																																																						xpostwo=3
																																																						ypos=22+bordertwo
																																																						ypostwo=2
																																																					}else{
																																																					if(c==60){
																																																						xpos=90+bordertwo
																																																						xpostwo=1
																																																						ypos=7+bordertwo
																																																						ypostwo=1
																																																					}else{
																																																					if(c==61){
																																																						xpos=93+bordertwo
																																																						xpostwo=3
																																																						ypos=12+bordertwo
																																																						ypostwo=3
																																																					}else{
																																																					if(c==62){
																																																						xpos=93+bordertwo
																																																						xpostwo=3
																																																						ypos=24+bordertwo
																																																						ypostwo=2
																																																					}else{
																																																					if(c==63){
																																																						xpos=0+bordertwo
																																																						xpostwo=0
																																																						ypos=0+bordertwo
																																																						ypostwo=0
																																																					}else{
																																																					if(c==64){
																																																						xpos=98+bordertwo
																																																						xpostwo=3
																																																						ypos=7+bordertwo
																																																						ypostwo=1
																																																					}else{
																																																					if(c==65){
																																																						xpos=85+bordertwo
																																																						xpostwo=5
																																																						ypos=24+bordertwo
																																																						ypostwo=2
																																																					}else{
																																																					if(c==66){
																																																						xpos=63+bordertwo
																																																						xpostwo=3
																																																						ypos=22+bordertwo
																																																						ypostwo=2
																																																					}else{
																																																					if(c==67){
																																																						xpos=63+bordertwo
																																																						xpostwo=3
																																																						ypos=18+bordertwo
																																																						ypostwo=2
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
#endregion

#endregion
#endregion
			}
		}
	}
	}

	//if(roomArray[a+1,b+1]!=0&&roomArray[a+1,b-1]!=0&&roomArray[a-1,b+1]!=0&&roomArray[a-1,b-1]!=0&&roomArray[a+1,b]!=0&&roomArray[a-1,b]!=0&&roomArray[a,b-1]!=0&&roomArray[a,b+1]!=0){
	for(a=1;a<rmw+(border);a+=1){
		for(b=1;b<rmh+(border);b+=1){
			if(roomArray[a,b]!=0){
				if(roomArray[a,b]==1&&roomArray[a,b-1]!=0){
					roomArray[a,b]=2
				}
				if(roomArray[a,b-1]==12||roomArray[a,b-1]==22||roomArray[a,b-1]==23){
					roomArray[a,b]=14
				}else{
					if(roomArray[a,b-1]==13||roomArray[a,b-1]==24||roomArray[a,b-1]==25){
						roomArray[a,b]=15
					}else{
						if(roomArray[a+1,b]==0&&roomArray[a-1,b]!=0&&roomArray[a,b-1]==0&&roomArray[a,b+2]!=0&&roomArray[a+1,b+1]!=0){
							roomArray[a,b]=12
								created=instance_position(mapx+a*16,mapy+b*16,Block)
								created.image_index=2
						}else{
							if(roomArray[a-1,b]==0&&roomArray[a+1,b]!=0&&roomArray[a,b-1]==0&&roomArray[a,b+2]!=0&&roomArray[a-1,b+1]!=0){
								roomArray[a,b]=13
									created=instance_position(mapx+a*16,mapy+b*16,Block)
									created.image_index=3
							}else{
								if(roomArray[a+1,b+1]!=0&&roomArray[a+1,b-1]==0&&roomArray[a-1,b+1]!=0&&roomArray[a-1,b-1]!=0&&roomArray[a+1,b]!=0&&roomArray[a-1,b]!=0&&roomArray[a,b-1]!=0&&roomArray[a,b+1]!=0||roomArray[a+1,b+1]==0&&roomArray[a+1,b-1]==0&&roomArray[a-1,b+1]!=0&&roomArray[a-1,b-1]!=0&&roomArray[a+1,b]!=0&&roomArray[a-1,b]!=0&&roomArray[a,b-1]!=0&&roomArray[a,b+1]!=0){
									roomArray[a,b]=16
								}else{
									if(roomArray[a+1,b+1]!=0&&roomArray[a+1,b-1]!=0&&roomArray[a-1,b+1]!=0&&roomArray[a-1,b-1]==0&&roomArray[a+1,b]!=0&&roomArray[a-1,b]!=0&&roomArray[a,b-1]!=0&&roomArray[a,b+1]!=0||roomArray[a+1,b+1]!=0&&roomArray[a+1,b-1]!=0&&roomArray[a-1,b+1]==0&&roomArray[a-1,b-1]==0&&roomArray[a+1,b]!=0&&roomArray[a-1,b]!=0&&roomArray[a,b-1]!=0&&roomArray[a,b+1]!=0){
										roomArray[a,b]=17
									}else{
										if(roomArray[a-1,b]==0&&roomArray[a+1,b]==0&&roomArray[a,b-1]==0&&roomArray[a,b+1]==0){
											roomArray[a,b]=6
										}else{
											if(roomArray[a+1,b]==0&&roomArray[a-1,b]!=0&&roomArray[a,b-1]!=0&&roomArray[a,b+1]!=0){
												roomArray[a,b]=4
											}else{
												if(roomArray[a+1,b]!=0&&roomArray[a-1,b]==0&&roomArray[a,b-1]!=0&&roomArray[a,b+1]!=0){
													roomArray[a,b]=5
												}else{
													if(roomArray[a+1,b]!=0&&roomArray[a-1,b]!=0&&roomArray[a,b-1]!=0&&roomArray[a,b+1]==0){
														roomArray[a,b]=3
													}else{
														if(roomArray[a+1,b]!=0&&roomArray[a-1,b]!=0&&roomArray[a,b-1]==0&&roomArray[a,b+1]!=0){
															roomArray[a,b]=1
														}else{
															if(roomArray[a+1,b]==0&&roomArray[a-1,b]!=0&&roomArray[a,b-1]==0&&roomArray[a,b+1]!=0){
																roomArray[a,b]=7
															}else{
																if(roomArray[a+1,b]!=0&&roomArray[a-1,b]==0&&roomArray[a,b-1]==0&&roomArray[a,b+1]!=0){
																	roomArray[a,b]=8
																}else{
																	if(roomArray[a+1,b]!=0&&roomArray[a-1,b]==0&&roomArray[a,b-1]==0&&roomArray[a,b+1]==0){
																		roomArray[a,b]=9
																	}else{
																		if(roomArray[a+1,b]!=0&&roomArray[a-1,b]!=0&&roomArray[a,b-1]==0&&roomArray[a,b+1]==0){
																			roomArray[a,b]=10
																		}else{
																			if(roomArray[a+1,b]==0&&roomArray[a-1,b]!=0&&roomArray[a,b-1]==0&&roomArray[a,b+1]==0){
																				roomArray[a,b]=11
																			}else{
																				if(roomArray[a+1,b]==0&&roomArray[a-1,b]!=0&&roomArray[a,b-1]!=0&&roomArray[a,b+1]==0){
																					roomArray[a,b]=18
																						//created=instance_position(mapx+a*16,mapy+b*16,Block)
																						//created.image_index=4
																				}else{
																					if(roomArray[a+1,b]!=0&&roomArray[a-1,b]==0&&roomArray[a,b-1]!=0&&roomArray[a,b+1]==0){
																						roomArray[a,b]=19
																							//created=instance_position(mapx+a*16,mapy+b*16,Block)
																							//created.image_index=5																	
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
