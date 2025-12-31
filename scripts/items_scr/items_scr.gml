function items_scr() {
#region Initialize inventory
	chance=1
		for(a=0;a<50;a+=1){
			for(b=0;b<10;b+=1){
				invenArray[a,b]=0
				if(a<-11){
					if(b==0){
						invenArray[a,0]=chance
						chance+=2
					}else{
						if(b==2){
#region Loot Rarity
							chancetwo=irandom(100)
								if(chancetwo<=2){
									chancetwo=4
								}else{
									if(chancetwo<=2+10){
										chancetwo=3
									}else{
										if(chancetwo<=2+10+20){
											chancetwo=2
										}else{
											if(chancetwo<=2+10+20+30){
												chancetwo=1
											}else{
												if(chancetwo<=2+10+20+30+38){
													chancetwo=0
												}else{
		
												}			
											}			
										}		
									}			
								}
#endregion
							chancetwo=choose(0,1,2,3,4)
							invenArray[a,2]=chancetwo
						}
					}
				}
			}
		}

		for(a=0;a<21;a+=1){
	//			invenArray[a,0]=a+1
		}
		invenArray[30,0]=999
		invenArray[31,15]=0
		invenArray[31,16]=0
	
	loot_scr(0)
		invenArray[43,0]=25
		invenArray[44,0]=23

	
	/*	

		invenArray[0,0]=1
		invenArray[0,2]=1
		invenArray[1,0]=1
		invenArray[1,2]=2
		invenArray[2,0]=5
		invenArray[2,2]=3
		invenArray[3,0]=5
		invenArray[3,2]=3

		invenArray[4,0]=3
		invenArray[5,0]=3
		invenArray[6,0]=7
		invenArray[7,0]=7
		invenArray[8,0]=9
		invenArray[9,0]=9
		invenArray[10,0]=11
		invenArray[11,0]=11
		invenArray[12,0]=13
		invenArray[13,0]=13
		invenArray[14,0]=15
		invenArray[15,0]=15
		invenArray[16,0]=17
		invenArray[17,0]=17
		invenArray[18,0]=19
		invenArray[19,0]=19
	*/


	///*
		//Bat rarity test
		invenArray[0,0]=1
		invenArray[0,2]=0
		
		invenArray[1,0]=1
		invenArray[1,2]=1
		
		invenArray[2,0]=1
		invenArray[2,2]=2
		
		invenArray[3,0]=1
		invenArray[3,2]=3
		
		invenArray[4,0]=1
		invenArray[4,2]=4

		//Owl Item
		invenArray[5,0]=5
		invenArray[5,2]=0
		
		invenArray[6,0]=5
		invenArray[6,2]=1
		
		invenArray[7,0]=5
		invenArray[7,2]=2
		
		invenArray[8,0]=5
		invenArray[8,2]=3
		
		invenArray[9,0]=5
		invenArray[9,2]=4

//test all
/*
a=1
for(i=0;i<19;i+=1){
		invenArray[i,0]=a
		a+=2
}
*/



	//*/


	//item_create_scr(0:id,0:name,1:type,2:Effect ID,3:NA,4:NA,5:NA,7:NA,8:NA,9:NA,10:NA)//item_create_scr(2,"Bat Wing",1,1,3,5,6,7,8,9,10,11,12,13,14,15)
	//ITEM STATS 0=Health, 1=Attack, 2=Crit, 3=Vamp, 4=0, 5=0, 6=0
	item_create_scr(1,"Fang",1,1,0,4,5,6,162,4,250,0.4,0.6,3,1,15)
	item_create_scr(2,1,1,1,1,4,5,6,153,"Damage","AttCD","Speed","Attsped","Image Cap","Vamp","Amount")
	item_createstats_scr(1,"Health",0,"Attack",0,"Crit",0,"Vamp",0,"Empty",0,"Empty",0,"Empty",0,0)
	item_create_scr(3,"Skull",2,0,0,6,5,6,"Health",600,0,0,0,3,1,10)
	item_create_scr(4,0,1,0,1,6,5,6,"OnVamp","CD",0,0,0,3,1,20)
	item_createstats_scr(3,"Health",0,"Attack",10,"Crit",0,"Vamp",5,"Empty",0,"Empty",0,"Empty",0,0)

	item_create_scr(5,"Hoot",1,1,2,4,5,6,123,4,200,0.5,0.8,3,0,0)
	item_create_scr(6,1,1,1,3,4,5,6,137,"Damage","AttCD","Speed","Attsped","Image Cap",0,0)
	item_createstats_scr(5,"Health",0,"Attack",0,"Crit",0,"Vamp",0,"Empty",0,"Empty",0,"Empty",0,0)
	item_create_scr(7,"Feather",1,2,0,4,5,6,162,0,30,3.5,0.1,3,1,1)
	item_create_scr(8,2,1,2,1,4,5,6,153,"Move","CD","Speed",0,0,0,2)
	item_createstats_scr(7,"Health",0,"Attack",0,"Crit",0,"Vamp",0,"Empty",0,"Empty",0,"Empty",0,0)
	item_create_scr(9,"Leaferang",1,2,0,4,5,6,162,0,4500,12,0.1,3,1,6)
	item_create_scr(10,2,1,2,1,4,5,6,153,"Atk","CD","Damage",0,0,0,8)
	item_createstats_scr(9,"Health",0,"Attack",0,"Crit",0,"Vamp",0,"Empty",0,"Empty",0,"Empty",0,0)
	item_create_scr(11,"Acorn Cap",2,0,0,3,5,6,0,0,0,0,0,3,1,10)
	item_create_scr(12,0,1,0,1,3,5,6,0,0,0,0,0,3,1,20)
	item_createstats_scr(11,"Health",20,"Attack",0,"Crit",0,"Vamp",0,"Empty",0,"Empty",0,"Empty",0,0)

	item_create_scr(13,"Apple",1,5,0,4,5,5,30,4,30,1,0.6,3,1,10)
	item_create_scr(14,0,1,5,1,4,5,6,"CD",5,30,"Heal",0.6,3,1,20)
	item_createstats_scr(13,"Health",0,"Attack",0,"Crit",0,"Vamp",0,"Empty",0,"Empty",0,"Empty",0,0)
	item_create_scr(15,"Apple Worm",1,2,0,4,5,6,162,4,2000,15,0.2,3,1,3)
	item_create_scr(16,2,1,2,1,4,5,6,153,"Pet","CD","Length",0.6,3,1,5)
	item_createstats_scr(15,"Health",0,"Attack",0,"Crit",0,"Vamp",0,"Empty",0,"Empty",0,"Empty",0,0)
	item_create_scr(17,"Pointy Stick",3,0,0,2,5,6,0,0,0,0,0.6,3,1,10)
	item_create_scr(18,0,1,0,1,2,5,6,0,0,0,0,0.6,3,1,20)
	item_createstats_scr(17,"Health",0,"Attack",4,"Crit",2,"Vamp",0,"Empty",0,"Empty",0,"Empty",0,0)

	item_create_scr(19,"Toadstool",1,0,1,4,5,6,153,5,250,0.4,0.6,3,1,20)
	item_create_scr(20,0,1,0,1,4,5,6,153,5,250,0.4,0.6,3,1,20)
	item_createstats_scr(19,"Health",0,"Attack",0,"Crit",0,"Vamp",0,"Empty",0,"Empty",0,"Empty",0,0)
	item_create_scr(21,"Nest",4,0,1,4,5,2,50,50,250,0.4,0.6,3,1,25)
	item_create_scr(22,0,4,0,1,4,5,2,"Chance","Chance",250,0.4,0.6,3,1,25)
	item_createstats_scr(21,"Health",2,"Attack",0,"Crit",0,"Vamp",0,"Empty",0,"Empty",0,"Empty",0,0)

	item_create_scr(23,"Reset Token",10,10,1,0,5,2,"Shop",50,250,0.4,0.6,3,1,25)
	item_create_scr(24,0,10,10,1,0,5,2,"Items","Chance",250,0.4,0.6,3,1,25)
	item_createstats_scr(23,"Health",0,"Attack",0,"Crit",0,"Vamp",0,"Empty",0,"Empty",0,"Empty",0,0)
	item_create_scr(25,"Heal",10,10,1,4,5,2,4,50,250,0.4,0.6,3,1,25)
	item_create_scr(26,"Heal",10,10,1,4,5,2,"Health","Chance",250,0.4,0.6,3,1,25)
	item_createstats_scr(25,"Health",0,"Attack",0,"Crit",0,"Vamp",0,"Empty",0,"Empty",0,"Empty",0,0)

	item_create_scr(33,"Baseball Bat",3,0,0,4,5,6,0,0,0,0,0,3,1,10)
	item_create_scr(34,0,1,0,1,4,5,6,0,0,0,0,0,3,1,20)
	item_createstats_scr(33,"Health",0,"Attack",5,"Crit",0,"Vamp",0,"Empty",0,"Empty",0,"Empty",0,0)

	item_create_scr(35,"StuffySweater",2,0,0,6,5,6,0,0,0,0,0,3,1,10)
	item_create_scr(36,0,1,0,1,6,5,6,0,0,0,0,0,3,1,20)
	item_createstats_scr(35,"Health",20,"Attack",0,"Crit",0,"Vamp",0,"Empty",0,"Empty",0,"Empty",0,0)

	item_create_scr(37,"Moth Yoyo",2,0,0,7,5,6,0,0,0,0,0,3,1,10)
	item_create_scr(38,0,1,0,1,7,5,6,0,0,0,0,0,3,1,20)
	item_createstats_scr(37,"Health",0,"Attack",2,"Crit",10,"Vamp",0,"Empty",0,"Empty",0,"Empty",0,0)

	item_create_scr(39,"Lucky Briefs",2,0,0,8,5,6,"Gold",600,0,0,0,3,1,10)
	item_create_scr(40,0,1,0,1,8,5,6,"OnCrit","CD",0,0,0,3,1,20)
	item_createstats_scr(39,"Health",0,"Attack",2,"Crit",5,"Vamp",0,"Empty",0,"Empty",0,"Empty",0,0)

#endregion




}
