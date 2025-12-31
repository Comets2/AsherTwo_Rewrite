// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function talentcreate_scr(){
if(Me.class==0){
	Me.class=2
	Me.classcheck=1
	//CLASS map 
	for(a=0;a<10;a+=1){
		for(b=0;b<10;b+=1){
			if(b==1){
				classArray[a,b]=1
			}else{
				classArray[a,b]=0
			}
		}
	}
	classArray[0,0]="Human"
	classArray[1,0]="Witch"
	classArray[2,0]="Pumpkin"
	classArray[3,0]="Bee"
	classArray[4,0]="Burger"
	classArray[5,0]="Fisher"
	classArray[6,0]="Super"
	classArray[7,0]="Treeling"
	classArray[8,0]="CakeQueen"
	for(a=0;a<10;a+=1){	
		//Level
		classArray[a,1]=1
		classArray[a,1]=30
		//Experience Current
		classArray[a,2]=0
		//Experience Total
		classArray[a,3]=(classArray[a,1]*10)+10
		//Talents spent
		classArray[a,4]=0
		//Experience Total
		classArray[a,5]=classArray[a,1]-1
		
		//Talent
	}
	
	//initiating talent array
	for(a=0;a<24;a+=1){
		for(b=0;b<10;b+=1){
			talentmapArray[a,b]=0
			if(b==0){
				talentmapArray[a,0]=0
			}else{
				//point total
				if(b==2){
					talentmapArray[a,2]=5
				}else{
					//Total points required to purchase COST
					if(b==3){
						talentmapArray[a,3]=1
					}else{
						//Blue inheritence marker
						if(b==4){
							talentmapArray[a,4]=2
						}else{
							//What talent to check for inheritence
							if(b==5){
								talentmapArray[a,5]=0
							}else{
								//Unlock level
								if(b==6){
									talentmapArray[a,6]=0
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



#region Pumpkin Talents
if(Me.class==2){
	//E ability 
		talentmapArray[1,0]="Pumpkin"
		talentmapArray[1,4]=1
		talentmapArray[1,6]=1
		talentmapArray[1,5]=0
		talentmapArray[1,7]="Buff"
		talentmapArray[1,8]="Damage +5%"
		
		//Unlock level
		talentmapArray[2,0]="Pumpkin"
		talentmapArray[2,6]=10
		talentmapArray[2,4]=1
		talentmapArray[2,7]="Buff"
		talentmapArray[2,8]="AOE +"
		
		talentmapArray[3,0]="Pumpkin"
		talentmapArray[3,2]=1
		talentmapArray[3,3]=1
		talentmapArray[3,6]=20
		talentmapArray[3,5]=2
		talentmapArray[3,7]="Modify"
		talentmapArray[3,8]="Pumpkin Spirit"
		talentmapArray[3,9]="Damage +25%"
		
	//Q
		talentmapArray[4,0]="Gourds"
		talentmapArray[4,6]=5
		talentmapArray[4,4]=1
		talentmapArray[4,3]=3
		talentmapArray[4,2]=3
		talentmapArray[4,7]="Ability"
		talentmapArray[4,8]="Spread Dmg"
		talentmapArray[4,9]="Mobility"
		
		talentmapArray[5,0]="Gourds"
		talentmapArray[5,6]=15
		talentmapArray[5,5]=4
		talentmapArray[5,7]="Buff"
		talentmapArray[5,8]="Damage +5%"
		
		talentmapArray[6,0]="Gourds"
		talentmapArray[6,2]=1
		talentmapArray[6,3]=1
		talentmapArray[6,4]=3
		talentmapArray[6,6]=20
		talentmapArray[6,5]=5
		talentmapArray[6,7]="Modify"
		talentmapArray[6,8]="Duration +"
		talentmapArray[6,9]="Damage +25%"
		
	//Q2
		talentmapArray[7,0]="Sprout"
		talentmapArray[7,6]=15
		talentmapArray[7,4]=1
		talentmapArray[7,3]=3
		talentmapArray[7,2]=3
		talentmapArray[7,7]="Ability"
		talentmapArray[7,8]="Minion Control"
		talentmapArray[7,9]="Area Damage"

		talentmapArray[8,0]="Sprout"
		talentmapArray[8,6]=20
		talentmapArray[8,5]=7
		talentmapArray[8,7]="Buff"
		talentmapArray[8,8]="Spread Damage"

		talentmapArray[9,0]="Sprout"
		talentmapArray[9,2]=1
		talentmapArray[9,3]=1
		talentmapArray[9,4]=3
		talentmapArray[9,6]=25
		talentmapArray[9,5]=8
		talentmapArray[9,7]="Modify"
		talentmapArray[9,8]="Spread Damage"
	
	//W
		talentmapArray[10,0]="Haunt"
		talentmapArray[10,6]=10
		talentmapArray[10,4]=1
		talentmapArray[10,3]=3
		talentmapArray[10,2]=3
		talentmapArray[10,7]="Ability"
		talentmapArray[10,8]="High Damage"
		talentmapArray[10,9]="Area Damage"

		talentmapArray[11,0]="Haunt"
		talentmapArray[11,6]=20
		talentmapArray[11,5]=10
		talentmapArray[11,7]="Buff"
		talentmapArray[11,8]="Damage +5%"

		talentmapArray[12,0]="Haunt"
		talentmapArray[12,2]=1
		talentmapArray[12,3]=1
		talentmapArray[12,4]=3
		talentmapArray[12,6]=25
		talentmapArray[12,5]=11
		talentmapArray[12,7]="Modify"
		talentmapArray[12,8]="AOE +"
		talentmapArray[12,9]="Damage +25%"
		
	//W2
		talentmapArray[13,0]="JackoLantern"
		talentmapArray[13,6]=20
		talentmapArray[13,4]=1
		talentmapArray[13,3]=3
		talentmapArray[13,2]=3
		talentmapArray[13,7]="Ability"
		talentmapArray[13,8]="Area Damage"
		talentmapArray[13,9]="Mobility"

		talentmapArray[14,0]="JackoLantern"
		talentmapArray[14,6]=25
		talentmapArray[14,5]=13
		talentmapArray[14,7]="Buff"
		talentmapArray[14,8]="Damage +5%"

		talentmapArray[15,0]="JackoLantern"
		talentmapArray[15,2]=1
		talentmapArray[15,3]=1
		talentmapArray[15,4]=3
		talentmapArray[15,6]=25
		talentmapArray[15,5]=14
		talentmapArray[15,7]="Modify"
		talentmapArray[15,8]="Gravity -"
		talentmapArray[15,9]="Damage +25%"
		
	//P
		talentmapArray[16,0]="Shell Shield"
		talentmapArray[16,6]=0
		talentmapArray[16,4]=1
		talentmapArray[16,3]=3
		talentmapArray[16,2]=3
		talentmapArray[16,7]="Passive"
		talentmapArray[16,8]="Block Damage"

		talentmapArray[17,0]="Shell Shield"
		talentmapArray[17,6]=5
		talentmapArray[17,5]=16
		talentmapArray[17,7]="Buff"
		talentmapArray[17,8]="Large Area"

		talentmapArray[18,0]="Shell Shield"
		talentmapArray[18,2]=1
		talentmapArray[18,3]=1
		talentmapArray[18,4]=3
		talentmapArray[18,6]=15
		talentmapArray[18,5]=17
		talentmapArray[18,7]="Modify"
		talentmapArray[18,8]="Large Area"
		
	//P2
		talentmapArray[19,0]="Tick or Treat"
		talentmapArray[19,6]=10
		talentmapArray[19,4]=1
		talentmapArray[19,3]=3
		talentmapArray[19,2]=3
		talentmapArray[19,7]="Passive"
		talentmapArray[19,8]="Buff Attack"

		talentmapArray[20,0]="Tick or Treat"
		talentmapArray[20,6]=20
		talentmapArray[20,5]=19
		talentmapArray[20,7]="Buff"
		talentmapArray[20,8]="Large Area"

		talentmapArray[21,0]="Tick or Treat"
		talentmapArray[21,2]=1
		talentmapArray[21,3]=1
		talentmapArray[21,4]=3
		talentmapArray[21,6]=25	
		talentmapArray[21,5]=20
		talentmapArray[21,7]="Modify"
		talentmapArray[21,8]="Large Area"
	
	//Extra 1
		talentmapArray[22,0]="Pumpkin Heart"
		talentmapArray[22,4]=1
		talentmapArray[22,6]=0
		talentmapArray[22,5]=0
		talentmapArray[22,7]="Stat"
		talentmapArray[22,8]="Health UP"

	//Extra 2
		talentmapArray[23,0]="Pumpkin Blade"
		talentmapArray[23,4]=1
		talentmapArray[23,6]=5
		talentmapArray[23,5]=0
		talentmapArray[23,7]="Stat"
		talentmapArray[23,8]="Damage UP"
}else{
#endregion
#region Witch Talents
if(Me.class==1){

	//E ability 
		talentmapArray[1,0]="Spell"
		talentmapArray[1,4]=1
		talentmapArray[1,6]=1
		talentmapArray[1,5]=0
		talentmapArray[1,7]="Buff"
		talentmapArray[1,8]="Damage +5%"
		
		//Unlock level
		talentmapArray[2,0]="Spell"
		talentmapArray[2,6]=10
		talentmapArray[2,4]=1
		talentmapArray[2,7]="Buff"
		talentmapArray[2,8]="AOE +"
	
		talentmapArray[3,0]="Spell"
		talentmapArray[3,2]=1
		talentmapArray[3,3]=1
		talentmapArray[3,6]=20
		talentmapArray[3,5]=2
		talentmapArray[3,7]="Modify"
		talentmapArray[3,8]="Pumpkin Spirit"
		talentmapArray[3,9]="Damage +25%"
		
	//Q
		talentmapArray[4,0]="Broom"
		talentmapArray[4,6]=5
		talentmapArray[4,4]=1
		talentmapArray[4,3]=3
		talentmapArray[4,2]=3
		talentmapArray[4,7]="Ability"
		talentmapArray[4,8]="Spread Dmg"
		talentmapArray[4,9]="Mobility"
		
		talentmapArray[5,0]="Broom"
		talentmapArray[5,6]=15
		talentmapArray[5,5]=4
		talentmapArray[5,7]="Buff"
		talentmapArray[5,8]="Damage +5%"
		
		talentmapArray[6,0]="Broom"
		talentmapArray[6,2]=1
		talentmapArray[6,3]=1
		talentmapArray[6,4]=3
		talentmapArray[6,6]=20
		talentmapArray[6,5]=5
		talentmapArray[6,7]="Modify"
		talentmapArray[6,8]="Duration +"
		talentmapArray[6,9]="Damage +25%"
		
	//Q2
		talentmapArray[7,0]="Scarecrow"
		talentmapArray[7,6]=15
		talentmapArray[7,4]=1
		talentmapArray[7,3]=3
		talentmapArray[7,2]=3
		talentmapArray[7,7]="Ability"
		talentmapArray[7,8]="Minion Control"
		talentmapArray[7,9]="Area Damage"

		talentmapArray[8,0]="Scarecrow"
		talentmapArray[8,6]=20
		talentmapArray[8,5]=7
		talentmapArray[8,7]="Buff"
		talentmapArray[8,8]="Spread Damage"

		talentmapArray[9,0]="Scarecrow"
		talentmapArray[9,2]=1
		talentmapArray[9,3]=1
		talentmapArray[9,4]=3
		talentmapArray[9,6]=25
		talentmapArray[9,5]=8
		talentmapArray[9,7]="Modify"
		talentmapArray[9,8]="Spread Damage"
	
	//W
		talentmapArray[10,0]="Bats"
		talentmapArray[10,6]=10
		talentmapArray[10,4]=1
		talentmapArray[10,3]=3
		talentmapArray[10,2]=3
		talentmapArray[10,7]="Ability"
		talentmapArray[10,8]="High Damage"
		talentmapArray[10,9]="Area Damage"

		talentmapArray[11,0]="Bats"
		talentmapArray[11,6]=20
		talentmapArray[11,5]=10
		talentmapArray[11,7]="Buff"
		talentmapArray[11,8]="Damage +5%"

		talentmapArray[12,0]="Bats"
		talentmapArray[12,2]=1
		talentmapArray[12,3]=1
		talentmapArray[12,4]=3
		talentmapArray[12,6]=25
		talentmapArray[12,5]=11
		talentmapArray[12,7]="Modify"
		talentmapArray[12,8]="AOE +"
		talentmapArray[12,9]="Damage +25%"
		
	//W2
		talentmapArray[13,0]="Cauldron"
		talentmapArray[13,6]=20
		talentmapArray[13,4]=1
		talentmapArray[13,3]=3
		talentmapArray[13,2]=3
		talentmapArray[13,7]="Ability"
		talentmapArray[13,8]="Area Damage"
		talentmapArray[13,9]="Mobility"

		talentmapArray[14,0]="Cauldron"
		talentmapArray[14,6]=25
		talentmapArray[14,5]=13
		talentmapArray[14,7]="Buff"
		talentmapArray[14,8]="Damage +5%"

		talentmapArray[15,0]="Cauldron"
		talentmapArray[15,2]=1
		talentmapArray[15,3]=1
		talentmapArray[15,4]=3
		talentmapArray[15,6]=25
		talentmapArray[15,5]=14
		talentmapArray[15,7]="Modify"
		talentmapArray[15,8]="Gravity -"
		talentmapArray[15,9]="Damage +25%"
		
	//P
		talentmapArray[16,0]="Spirit orbs"
		talentmapArray[16,6]=0
		talentmapArray[16,4]=1
		talentmapArray[16,3]=3
		talentmapArray[16,2]=3
		talentmapArray[16,7]="Passive"
		talentmapArray[16,8]="Block Damage"

		talentmapArray[17,0]="Spirit Orbs"
		talentmapArray[17,6]=5
		talentmapArray[17,5]=16
		talentmapArray[17,7]="Buff"
		talentmapArray[17,8]="Large Area"

		talentmapArray[18,0]="Spirit orbs"
		talentmapArray[18,2]=1
		talentmapArray[18,3]=1
		talentmapArray[18,4]=3
		talentmapArray[18,6]=15
		talentmapArray[18,5]=17
		talentmapArray[18,7]="Modify"
		talentmapArray[18,8]="Large Area"
		
	//P2
		talentmapArray[19,0]="Tick or Treat"
		talentmapArray[19,6]=10
		talentmapArray[19,4]=1
		talentmapArray[19,3]=3
		talentmapArray[19,2]=3
		talentmapArray[19,7]="Passive"
		talentmapArray[19,8]="Buff Attack"

		talentmapArray[20,0]="Tick or Treat"
		talentmapArray[20,6]=20
		talentmapArray[20,5]=19
		talentmapArray[20,7]="Buff"
		talentmapArray[20,8]="Large Area"

		talentmapArray[21,0]="Tick or Treat"
		talentmapArray[21,2]=1
		talentmapArray[21,3]=1
		talentmapArray[21,4]=3
		talentmapArray[21,6]=25	
		talentmapArray[21,5]=20
		talentmapArray[21,7]="Modify"
		talentmapArray[21,8]="Large Area"
	
	//Extra 1
		talentmapArray[22,0]="Pumpkin Heart"
		talentmapArray[22,4]=1
		talentmapArray[22,6]=0
		talentmapArray[22,5]=0
		talentmapArray[22,7]="Stat"
		talentmapArray[22,8]="Health UP"

	//Extra 2
		talentmapArray[23,0]="Pumpkin Blade"
		talentmapArray[23,4]=1
		talentmapArray[23,6]=5
		talentmapArray[23,5]=0
		talentmapArray[23,7]="Stat"
		talentmapArray[23,8]="Damage UP"
}else{
#endregion

#region Bee Talents
if(Me.class==3){

	//E ability 
		talentmapArray[1,0]="Bees"
		talentmapArray[1,4]=1
		talentmapArray[1,6]=1
		talentmapArray[1,5]=0
		talentmapArray[1,7]="Buff"
		talentmapArray[1,8]="Damage +5%"
		
		//Unlock level
		talentmapArray[2,0]="Bees"
		talentmapArray[2,6]=10
		talentmapArray[2,4]=1
		talentmapArray[2,7]="Buff"
		talentmapArray[2,8]="Follow +"
	
		talentmapArray[3,0]="Wasps"
		talentmapArray[3,2]=1
		talentmapArray[3,3]=1
		talentmapArray[3,6]=20
		talentmapArray[3,5]=2
		talentmapArray[3,7]="Modify"
		talentmapArray[3,8]="Abil Speed"
		talentmapArray[3,9]="Damage +25%"
		
	//Q
		talentmapArray[4,0]="Honey"
		talentmapArray[4,6]=5
		talentmapArray[4,4]=1
		talentmapArray[4,3]=3
		talentmapArray[4,2]=3
		talentmapArray[4,7]="Ability"
		talentmapArray[4,8]="Dmg Over time"
		talentmapArray[4,9]=""
		
		talentmapArray[5,0]="Honey"
		talentmapArray[5,6]=15
		talentmapArray[5,5]=4
		talentmapArray[5,7]="Buff"
		talentmapArray[5,8]="Damage +5%"
		
		talentmapArray[6,0]="Honey"
		talentmapArray[6,2]=1
		talentmapArray[6,3]=1
		talentmapArray[6,4]=3
		talentmapArray[6,6]=20
		talentmapArray[6,5]=5
		talentmapArray[6,7]="Modify"
		talentmapArray[6,8]="Duration +"
		talentmapArray[6,9]="Damage +25%"
		
	//Q2
		talentmapArray[7,0]="Hive"
		talentmapArray[7,6]=15
		talentmapArray[7,4]=1
		talentmapArray[7,3]=3
		talentmapArray[7,2]=3
		talentmapArray[7,7]="Ability"
		talentmapArray[7,8]="Minion Control"
		talentmapArray[7,9]="Area Damage"

		talentmapArray[8,0]="Hive"
		talentmapArray[8,6]=20
		talentmapArray[8,5]=7
		talentmapArray[8,7]="Buff"
		talentmapArray[8,8]="Spread Damage"

		talentmapArray[9,0]="Hive"
		talentmapArray[9,2]=1
		talentmapArray[9,3]=1
		talentmapArray[9,4]=3
		talentmapArray[9,6]=25
		talentmapArray[9,5]=8
		talentmapArray[9,7]="Modify"
		talentmapArray[9,8]="Spread Damage"
	
	//W
		talentmapArray[10,0]="Hover"
		talentmapArray[10,6]=10
		talentmapArray[10,4]=1
		talentmapArray[10,3]=3
		talentmapArray[10,2]=3
		talentmapArray[10,7]="Ability"
		talentmapArray[10,8]="High Damage"
		talentmapArray[10,9]="Area Damage"

		talentmapArray[11,0]="Hover"
		talentmapArray[11,6]=20
		talentmapArray[11,5]=10
		talentmapArray[11,7]="Buff"
		talentmapArray[11,8]="Damage +5%"

		talentmapArray[12,0]="Hover"
		talentmapArray[12,2]=1
		talentmapArray[12,3]=1
		talentmapArray[12,4]=3
		talentmapArray[12,6]=25
		talentmapArray[12,5]=11
		talentmapArray[12,7]="Modify"
		talentmapArray[12,8]="AOE +"
		talentmapArray[12,9]="Damage +25%"
		
	//W2
		talentmapArray[13,0]="Swarm Shield"
		talentmapArray[13,6]=20
		talentmapArray[13,4]=1
		talentmapArray[13,3]=3
		talentmapArray[13,2]=3
		talentmapArray[13,7]="Ability"
		talentmapArray[13,8]="Area Damage"
		talentmapArray[13,9]="Mobility"

		talentmapArray[14,0]="Swarm Shield"
		talentmapArray[14,6]=25
		talentmapArray[14,5]=13
		talentmapArray[14,7]="Buff"
		talentmapArray[14,8]="Damage +5%"

		talentmapArray[15,0]="Swarm Shield"
		talentmapArray[15,2]=1
		talentmapArray[15,3]=1
		talentmapArray[15,4]=3
		talentmapArray[15,6]=25
		talentmapArray[15,5]=14
		talentmapArray[15,7]="Modify"
		talentmapArray[15,8]="Gravity -"
		talentmapArray[15,9]="Damage +25%"
		
	//P
		talentmapArray[16,0]="Bee Venom"
		talentmapArray[16,6]=0
		talentmapArray[16,4]=1
		talentmapArray[16,3]=3
		talentmapArray[16,2]=3
		talentmapArray[16,7]="Passive"
		talentmapArray[16,8]="Block Damage"

		talentmapArray[17,0]="Bee Venom"
		talentmapArray[17,6]=5
		talentmapArray[17,5]=16
		talentmapArray[17,7]="Buff"
		talentmapArray[17,8]="Large Area"

		talentmapArray[18,0]="Bee Venom"
		talentmapArray[18,2]=1
		talentmapArray[18,3]=1
		talentmapArray[18,4]=3
		talentmapArray[18,6]=15
		talentmapArray[18,5]=17
		talentmapArray[18,7]="Modify"
		talentmapArray[18,8]="Large Area"
		
	//P2
		talentmapArray[19,0]="Honey Comb"
		talentmapArray[19,6]=10
		talentmapArray[19,4]=1
		talentmapArray[19,3]=3
		talentmapArray[19,2]=3
		talentmapArray[19,7]="Passive"
		talentmapArray[19,8]="Buff Attack"

		talentmapArray[20,0]="Honey Comb"
		talentmapArray[20,6]=20
		talentmapArray[20,5]=19
		talentmapArray[20,7]="Buff"
		talentmapArray[20,8]="Large Area"

		talentmapArray[21,0]="Honey Comb"
		talentmapArray[21,2]=1
		talentmapArray[21,3]=1
		talentmapArray[21,4]=3
		talentmapArray[21,6]=25	
		talentmapArray[21,5]=20
		talentmapArray[21,7]="Modify"
		talentmapArray[21,8]="Large Area"
	
	//Extra 1
		talentmapArray[22,0]="Toxins"
		talentmapArray[22,4]=1
		talentmapArray[22,6]=0
		talentmapArray[22,5]=0
		talentmapArray[22,7]="Buff"
		talentmapArray[22,8]="Poison +5%"

	//Extra 2
		talentmapArray[23,0]="Honey Pot"
		talentmapArray[23,4]=1
		talentmapArray[23,6]=5
		talentmapArray[23,5]=0
		talentmapArray[23,7]="Buff"
		talentmapArray[23,8]="HoneyHeal +1%"
}else{
#endregion

#region Burger Talents
if(Me.class==4){

	//E ability 
		talentmapArray[1,0]="Chomp"
		talentmapArray[1,4]=1
		talentmapArray[1,6]=1
		talentmapArray[1,5]=0
		talentmapArray[1,7]="Buff"
		talentmapArray[1,8]="Mobility"
		
		//Unlock level
		talentmapArray[2,0]="Chomp"
		talentmapArray[2,6]=10
		talentmapArray[2,4]=1
		talentmapArray[2,7]="Buff"
		talentmapArray[2,8]="AOE +"
	
		talentmapArray[3,0]="Chomp"
		talentmapArray[3,2]=1
		talentmapArray[3,3]=1
		talentmapArray[3,6]=20
		talentmapArray[3,5]=2
		talentmapArray[3,7]="Modify"
		talentmapArray[3,8]="Pumpkin Spirit"
		talentmapArray[3,9]="Damage +25%"
		
	//Q
		talentmapArray[4,0]="Fries"
		talentmapArray[4,6]=5
		talentmapArray[4,4]=1
		talentmapArray[4,3]=3
		talentmapArray[4,2]=3
		talentmapArray[4,7]="Ability"
		talentmapArray[4,8]="Spread Dmg"
		talentmapArray[4,9]="Mobility"
		
		talentmapArray[5,0]="Fries"
		talentmapArray[5,6]=15
		talentmapArray[5,5]=4
		talentmapArray[5,7]="Buff"
		talentmapArray[5,8]="Damage +5%"
		
		talentmapArray[6,0]="Fries"
		talentmapArray[6,2]=1
		talentmapArray[6,3]=1
		talentmapArray[6,4]=3
		talentmapArray[6,6]=20
		talentmapArray[6,5]=5
		talentmapArray[6,7]="Modify"
		talentmapArray[6,8]="Duration +"
		talentmapArray[6,9]="Damage +25%"
		
	//Q2
		talentmapArray[7,0]="Fries Two"
		talentmapArray[7,6]=15
		talentmapArray[7,4]=1
		talentmapArray[7,3]=3
		talentmapArray[7,2]=3
		talentmapArray[7,7]="Ability"
		talentmapArray[7,8]="Minion Control"
		talentmapArray[7,9]="Area Damage"

		talentmapArray[8,0]="Fries Two"
		talentmapArray[8,6]=20
		talentmapArray[8,5]=7
		talentmapArray[8,7]="Buff"
		talentmapArray[8,8]="Spread Damage"

		talentmapArray[9,0]="Fries Two"
		talentmapArray[9,2]=1
		talentmapArray[9,3]=1
		talentmapArray[9,4]=3
		talentmapArray[9,6]=25
		talentmapArray[9,5]=8
		talentmapArray[9,7]="Modify"
		talentmapArray[9,8]="Spread Damage"
	
	//W
		talentmapArray[10,0]="Ketchup"
		talentmapArray[10,6]=10
		talentmapArray[10,4]=1
		talentmapArray[10,3]=3
		talentmapArray[10,2]=3
		talentmapArray[10,7]="Ability"
		talentmapArray[10,8]="High Damage"
		talentmapArray[10,9]="Area Damage"

		talentmapArray[11,0]="Ketchup"
		talentmapArray[11,6]=20
		talentmapArray[11,5]=10
		talentmapArray[11,7]="Buff"
		talentmapArray[11,8]="Damage +5%"

		talentmapArray[12,0]="Ketchup"
		talentmapArray[12,2]=1
		talentmapArray[12,3]=1
		talentmapArray[12,4]=3
		talentmapArray[12,6]=25
		talentmapArray[12,5]=11
		talentmapArray[12,7]="Modify"
		talentmapArray[12,8]="AOE +"
		talentmapArray[12,9]="Damage +25%"
		
	//W2
		talentmapArray[13,0]="Tomato Boom"
		talentmapArray[13,6]=20
		talentmapArray[13,4]=1
		talentmapArray[13,3]=3
		talentmapArray[13,2]=3
		talentmapArray[13,7]="Ability"
		talentmapArray[13,8]="Area Damage"
		talentmapArray[13,9]="Mobility"

		talentmapArray[14,0]="Cauldron"
		talentmapArray[14,6]=25
		talentmapArray[14,5]=13
		talentmapArray[14,7]="Buff"
		talentmapArray[14,8]="Damage +5%"

		talentmapArray[15,0]="Cauldron"
		talentmapArray[15,2]=1
		talentmapArray[15,3]=1
		talentmapArray[15,4]=3
		talentmapArray[15,6]=25
		talentmapArray[15,5]=14
		talentmapArray[15,7]="Modify"
		talentmapArray[15,8]="Gravity -"
		talentmapArray[15,9]="Damage +25%"
		
	//P
		talentmapArray[16,0]="Kids Meal"
		talentmapArray[16,6]=0
		talentmapArray[16,4]=1
		talentmapArray[16,3]=3
		talentmapArray[16,2]=3
		talentmapArray[16,7]="Passive"
		talentmapArray[16,8]="Block Damage"

		talentmapArray[17,0]="Kids Meal"
		talentmapArray[17,6]=5
		talentmapArray[17,5]=16
		talentmapArray[17,7]="Buff"
		talentmapArray[17,8]="Large Area"

		talentmapArray[18,0]="Kids Meal"
		talentmapArray[18,2]=1
		talentmapArray[18,3]=1
		talentmapArray[18,4]=3
		talentmapArray[18,6]=15
		talentmapArray[18,5]=17
		talentmapArray[18,7]="Modify"
		talentmapArray[18,8]="Large Area"
		
	//P2
		talentmapArray[19,0]="BurgerHop"
		talentmapArray[19,6]=10
		talentmapArray[19,4]=1
		talentmapArray[19,3]=3
		talentmapArray[19,2]=3
		talentmapArray[19,7]="Passive"
		talentmapArray[19,8]="Buff Attack"

		talentmapArray[20,0]="BurgerHop"
		talentmapArray[20,6]=20
		talentmapArray[20,5]=19
		talentmapArray[20,7]="Buff"
		talentmapArray[20,8]="Large Area"

		talentmapArray[21,0]="BurgerHop"
		talentmapArray[21,2]=1
		talentmapArray[21,3]=1
		talentmapArray[21,4]=3
		talentmapArray[21,6]=25	
		talentmapArray[21,5]=20
		talentmapArray[21,7]="Modify"
		talentmapArray[21,8]="Large Area"
	
	//Extra 1
		talentmapArray[22,0]="The Arches"
		talentmapArray[22,4]=1
		talentmapArray[22,6]=0
		talentmapArray[22,5]=0
		talentmapArray[22,7]="Modify"
		talentmapArray[22,8]="Tomato Duration +20%"

	//Extra 2
		talentmapArray[23,0]="FreshProduce"
		talentmapArray[23,4]=1
		talentmapArray[23,6]=5
		talentmapArray[23,5]=0
		talentmapArray[23,7]="Stat"
		talentmapArray[23,8]="Tom Dur +20%"
}else{
#endregion

#region Crab Talents
if(Me.class==5){

	//E ability 
		talentmapArray[1,0]="Guppy"
		talentmapArray[1,4]=1
		talentmapArray[1,6]=1
		talentmapArray[1,5]=0
		talentmapArray[1,7]="Buff"
		talentmapArray[1,8]="Distance +"
		
		//Unlock level
		talentmapArray[2,0]="Fish Food"
		talentmapArray[2,6]=10
		talentmapArray[2,4]=1
		talentmapArray[2,7]="Buff"
		talentmapArray[2,8]="+5% dmg"
	
		talentmapArray[3,0]="School"
		talentmapArray[3,2]=1
		talentmapArray[3,3]=1
		talentmapArray[3,6]=20
		talentmapArray[3,5]=2
		talentmapArray[3,7]="Modify"
		talentmapArray[3,8]="Pumpkin Spirit"
		talentmapArray[3,9]="+fish attack"
		
	//Q
		talentmapArray[4,0]="Crab"
		talentmapArray[4,6]=5
		talentmapArray[4,4]=1
		talentmapArray[4,3]=3
		talentmapArray[4,2]=3
		talentmapArray[4,7]="Ability"
		talentmapArray[4,8]="Spread Dmg"
		talentmapArray[4,9]="Mobility"
		
		talentmapArray[5,0]="Crab Cooldown"
		talentmapArray[5,6]=15
		talentmapArray[5,5]=4
		talentmapArray[5,7]="Buff"
		talentmapArray[5,8]="CD -5%"
		
		talentmapArray[6,0]="Crab"
		talentmapArray[6,2]=1
		talentmapArray[6,3]=1
		talentmapArray[6,4]=3
		talentmapArray[6,6]=20
		talentmapArray[6,5]=5
		talentmapArray[6,7]="Modify"
		talentmapArray[6,8]=""
		talentmapArray[6,9]="+2 fish"
		
	//Q2
		talentmapArray[7,0]="Crab Two"
		talentmapArray[7,6]=15
		talentmapArray[7,4]=1
		talentmapArray[7,3]=3
		talentmapArray[7,2]=3
		talentmapArray[7,7]="Ability"
		talentmapArray[7,8]="Minion Control"
		talentmapArray[7,9]="Area Damage"

		talentmapArray[8,0]="Crab Two"
		talentmapArray[8,6]=20
		talentmapArray[8,5]=7
		talentmapArray[8,7]="Buff"
		talentmapArray[8,8]="Spread Damage"

		talentmapArray[9,0]="Crab Two"
		talentmapArray[9,2]=1
		talentmapArray[9,3]=1
		talentmapArray[9,4]=3
		talentmapArray[9,6]=25
		talentmapArray[9,5]=8
		talentmapArray[9,7]="Modify"
		talentmapArray[9,8]="Spread Damage"
	
	//W
		talentmapArray[10,0]="Jelly Fish"
		talentmapArray[10,6]=10
		talentmapArray[10,4]=1
		talentmapArray[10,3]=3
		talentmapArray[10,2]=3
		talentmapArray[10,7]="Ability"
		talentmapArray[10,8]="High Damage"
		talentmapArray[10,9]="Area Damage"

		talentmapArray[11,0]="More sting"
		talentmapArray[11,6]=20
		talentmapArray[11,5]=10
		talentmapArray[11,7]="Buff"
		talentmapArray[11,8]="CD -5%"

		talentmapArray[12,0]="Electrocute"
		talentmapArray[12,2]=1
		talentmapArray[12,3]=1
		talentmapArray[12,4]=3
		talentmapArray[12,6]=25
		talentmapArray[12,5]=11
		talentmapArray[12,7]="Modify"
		talentmapArray[12,8]="AOE +"
		talentmapArray[12,9]="Lightning on hit"
		
	//W2
		talentmapArray[13,0]="Jelly Fish 2"
		talentmapArray[13,6]=20
		talentmapArray[13,4]=1
		talentmapArray[13,3]=3
		talentmapArray[13,2]=3
		talentmapArray[13,7]="Ability"
		talentmapArray[13,8]="Area Damage"
		talentmapArray[13,9]="Mobility"

		talentmapArray[14,0]="Jelly Fish 2"
		talentmapArray[14,6]=25
		talentmapArray[14,5]=13
		talentmapArray[14,7]="Buff"
		talentmapArray[14,8]="Damage +5%"

		talentmapArray[15,0]="Jelly Fish 2"
		talentmapArray[15,2]=1
		talentmapArray[15,3]=1
		talentmapArray[15,4]=3
		talentmapArray[15,6]=25
		talentmapArray[15,5]=14
		talentmapArray[15,7]="Modify"
		talentmapArray[15,8]="Gravity -"
		talentmapArray[15,9]="Damage +25%"
		
	//P
		talentmapArray[16,0]="Bubble"
		talentmapArray[16,6]=0
		talentmapArray[16,4]=1
		talentmapArray[16,3]=3
		talentmapArray[16,2]=3
		talentmapArray[16,7]="Passive"
		talentmapArray[16,8]="Block Damage"

		talentmapArray[17,0]="More Bubbles"
		talentmapArray[17,6]=5
		talentmapArray[17,5]=16
		talentmapArray[17,7]="Buff"
		talentmapArray[17,8]="+ bubble gen"

		talentmapArray[18,0]="Bubble Shield"
		talentmapArray[18,2]=1
		talentmapArray[18,3]=1
		talentmapArray[18,4]=3
		talentmapArray[18,6]=15
		talentmapArray[18,5]=17
		talentmapArray[18,7]="Modify"
		talentmapArray[18,8]="Protects against fish loss"
		
	//P2
		talentmapArray[19,0]="Shark"
		talentmapArray[19,6]=10
		talentmapArray[19,4]=1
		talentmapArray[19,3]=3
		talentmapArray[19,2]=3
		talentmapArray[19,7]="Passive"
		talentmapArray[19,8]="Buff Attack"

		talentmapArray[20,0]="Sharp Teeth"
		talentmapArray[20,6]=20
		talentmapArray[20,5]=19
		talentmapArray[20,7]="Buff"
		talentmapArray[20,8]="+ 5% damage"

		talentmapArray[21,0]="Great White"
		talentmapArray[21,2]=1
		talentmapArray[21,3]=1
		talentmapArray[21,4]=3
		talentmapArray[21,6]=25	
		talentmapArray[21,5]=20
		talentmapArray[21,7]="Modify"
		talentmapArray[21,8]="AOE and +25% dmg"
	
	//Extra 1
		talentmapArray[22,0]="Fishing"
		talentmapArray[22,4]=1
		talentmapArray[22,6]=0
		talentmapArray[22,5]=0
		talentmapArray[22,7]="Modify"
		talentmapArray[22,8]="Tomato Duration +20%"

	//Extra 2
		talentmapArray[23,0]="Fish"
		talentmapArray[23,4]=1
		talentmapArray[23,6]=5
		talentmapArray[23,5]=0
		talentmapArray[23,7]="Stat"
		talentmapArray[23,8]="Tom Dur +20%"
}else{
#endregion

#region Super Talents
if(Me.class==6){

	//E ability 
		talentmapArray[1,0]="Milk Carton"
		talentmapArray[1,4]=1
		talentmapArray[1,6]=1
		talentmapArray[1,5]=0
		talentmapArray[1,7]="Buff"
		talentmapArray[1,8]="Range +"
		
		//Unlock level
		talentmapArray[2,0]="Milk Punch"
		talentmapArray[2,6]=10
		talentmapArray[2,4]=1
		talentmapArray[2,7]="Buff"
		talentmapArray[2,8]="Damage + 5%"
	
		talentmapArray[3,0]="Choco Milk"
		talentmapArray[3,2]=1
		talentmapArray[3,3]=1
		talentmapArray[3,6]=20
		talentmapArray[3,5]=2
		talentmapArray[3,7]="Modify"
		talentmapArray[3,8]="Pumpkin Spirit"
		talentmapArray[3,9]="Damage +25%"
		
	//Q
		talentmapArray[4,0]="DoughnutDash"
		talentmapArray[4,6]=5
		talentmapArray[4,4]=1
		talentmapArray[4,3]=3
		talentmapArray[4,2]=3
		talentmapArray[4,7]="Ability"
		talentmapArray[4,8]="Spread Dmg"
		talentmapArray[4,9]="Mobility"
		
		talentmapArray[5,0]="Powdered"
		talentmapArray[5,6]=15
		talentmapArray[5,5]=4
		talentmapArray[5,7]="Buff"
		talentmapArray[5,8]="CD Reduction +5%"
		
		talentmapArray[6,0]="Sprinkles"
		talentmapArray[6,2]=1
		talentmapArray[6,3]=1
		talentmapArray[6,4]=3
		talentmapArray[6,6]=20
		talentmapArray[6,5]=5
		talentmapArray[6,7]="Modify"
		talentmapArray[6,8]="Duration +"
		talentmapArray[6,9]="Damage +25%"
		
	//Q2
		talentmapArray[7,0]="Toaster"
		talentmapArray[7,6]=15
		talentmapArray[7,4]=1
		talentmapArray[7,3]=3
		talentmapArray[7,2]=3
		talentmapArray[7,7]="Ability"
		talentmapArray[7,8]="Minion Control"
		talentmapArray[7,9]="Area Damage"

		talentmapArray[8,0]="Toaster"
		talentmapArray[8,6]=20
		talentmapArray[8,5]=7
		talentmapArray[8,7]="Buff"
		talentmapArray[8,8]="Spread Damage"

		talentmapArray[9,0]="Jelly Toast"
		talentmapArray[9,2]=1
		talentmapArray[9,3]=1
		talentmapArray[9,4]=3
		talentmapArray[9,6]=25
		talentmapArray[9,5]=8
		talentmapArray[9,7]="Modify"
		talentmapArray[9,8]="Spread Damage"
	
	//W
		talentmapArray[10,0]="Waffler"
		talentmapArray[10,6]=10
		talentmapArray[10,4]=1
		talentmapArray[10,3]=3
		talentmapArray[10,2]=3
		talentmapArray[10,7]="Ability"
		talentmapArray[10,8]="High Damage"
		talentmapArray[10,9]="Area Damage"

		talentmapArray[11,0]="Waffler"
		talentmapArray[11,6]=20
		talentmapArray[11,5]=10
		talentmapArray[11,7]="Buff"
		talentmapArray[11,8]="Damage +5%"

		talentmapArray[12,0]="Waffler"
		talentmapArray[12,2]=1
		talentmapArray[12,3]=1
		talentmapArray[12,4]=3
		talentmapArray[12,6]=25
		talentmapArray[12,5]=11
		talentmapArray[12,7]="Modify"
		talentmapArray[12,8]="AOE +"
		talentmapArray[12,9]="Damage +25%"
		
	//W2
		talentmapArray[13,0]="Cereal"
		talentmapArray[13,6]=20
		talentmapArray[13,4]=1
		talentmapArray[13,3]=3
		talentmapArray[13,2]=3
		talentmapArray[13,7]="Ability"
		talentmapArray[13,8]="Area Damage"
		talentmapArray[13,9]="Mobility"

		talentmapArray[14,0]="Cereal"
		talentmapArray[14,6]=25
		talentmapArray[14,5]=13
		talentmapArray[14,7]="Buff"
		talentmapArray[14,8]="Damage +5%"

		talentmapArray[15,0]="Cereal"
		talentmapArray[15,2]=1
		talentmapArray[15,3]=1
		talentmapArray[15,4]=3
		talentmapArray[15,6]=25
		talentmapArray[15,5]=14
		talentmapArray[15,7]="Modify"
		talentmapArray[15,8]="Gravity -"
		talentmapArray[15,9]="Damage +25%"
		
	//P
		talentmapArray[16,0]="Bacon Cape"
		talentmapArray[16,6]=0
		talentmapArray[16,4]=1
		talentmapArray[16,3]=3
		talentmapArray[16,2]=3
		talentmapArray[16,7]="Passive"
		talentmapArray[16,8]="Block Damage"

		talentmapArray[17,0]="Super Bacon"
		talentmapArray[17,6]=5
		talentmapArray[17,5]=16
		talentmapArray[17,7]="Buff"
		talentmapArray[17,8]="Large Area"

		talentmapArray[18,0]="Sunnyside"
		talentmapArray[18,2]=1
		talentmapArray[18,3]=1
		talentmapArray[18,4]=3
		talentmapArray[18,6]=15
		talentmapArray[18,5]=17
		talentmapArray[18,7]="Modify"
		talentmapArray[18,8]="Large Area"
		
	//P2
		talentmapArray[19,0]="BalancedBkfst"
		talentmapArray[19,6]=10
		talentmapArray[19,4]=1
		talentmapArray[19,3]=3
		talentmapArray[19,2]=3
		talentmapArray[19,7]="Passive"
		talentmapArray[19,8]="Buff Attack"

		talentmapArray[20,0]="BalancedBkfst"
		talentmapArray[20,6]=20
		talentmapArray[20,5]=19
		talentmapArray[20,7]="Buff"
		talentmapArray[20,8]="Large Area"

		talentmapArray[21,0]="Super Crust"
		talentmapArray[21,2]=1
		talentmapArray[21,3]=1
		talentmapArray[21,4]=3
		talentmapArray[21,6]=25	
		talentmapArray[21,5]=20
		talentmapArray[21,7]="Modify"
		talentmapArray[21,8]="Large Area"
	
	//Extra 1
		talentmapArray[22,0]="The Arches"
		talentmapArray[22,4]=1
		talentmapArray[22,6]=0
		talentmapArray[22,5]=0
		talentmapArray[22,7]="Modify"
		talentmapArray[22,8]="Tomato Duration +20%"

	//Extra 2
		talentmapArray[23,0]="Coffee"
		talentmapArray[23,4]=1
		talentmapArray[23,6]=5
		talentmapArray[23,5]=0
		talentmapArray[23,7]="Stat"
		talentmapArray[23,8]="Speed +2%"
		
	//Frosted fortitude
	//Breakfast Blend
	//Cinnamon Swirl

}else{
#endregion

#region Tree Talents
if(Me.class==7){

	//E ability 
		talentmapArray[1,0]="Leaf Acorn"
		talentmapArray[1,4]=1
		talentmapArray[1,6]=1
		talentmapArray[1,5]=0
		talentmapArray[1,7]="Buff"
		talentmapArray[1,8]="Mobility"
		
		//Unlock level
		talentmapArray[2,0]="Leaf Acorn"
		talentmapArray[2,6]=10
		talentmapArray[2,4]=1
		talentmapArray[2,7]="Buff"
		talentmapArray[2,8]="AOE +"
	
		talentmapArray[3,0]="Leaf Acorn"
		talentmapArray[3,2]=1
		talentmapArray[3,3]=1
		talentmapArray[3,6]=20
		talentmapArray[3,5]=2
		talentmapArray[3,7]="Modify"
		talentmapArray[3,8]="Pumpkin Spirit"
		talentmapArray[3,9]="Damage +25%"
		
	//Q
		talentmapArray[4,0]="Transform"
		talentmapArray[4,6]=5
		talentmapArray[4,4]=1
		talentmapArray[4,3]=3
		talentmapArray[4,2]=3
		talentmapArray[4,7]="Ability"
		talentmapArray[4,8]="Spread Dmg"
		talentmapArray[4,9]="Mobility"
		
		talentmapArray[5,0]="Transform"
		talentmapArray[5,6]=15
		talentmapArray[5,5]=4
		talentmapArray[5,7]="Buff"
		talentmapArray[5,8]="CD Reduction +5%"
		
		talentmapArray[6,0]="Transform"
		talentmapArray[6,2]=1
		talentmapArray[6,3]=1
		talentmapArray[6,4]=3
		talentmapArray[6,6]=20
		talentmapArray[6,5]=5
		talentmapArray[6,7]="Modify"
		talentmapArray[6,8]="Duration +"
		talentmapArray[6,9]="Damage +25%"
		
	//Q2
		talentmapArray[7,0]="Transform"
		talentmapArray[7,6]=15
		talentmapArray[7,4]=1
		talentmapArray[7,3]=3
		talentmapArray[7,2]=3
		talentmapArray[7,7]="Ability"
		talentmapArray[7,8]="Minion Control"
		talentmapArray[7,9]="Area Damage"

		talentmapArray[8,0]="Toaster"
		talentmapArray[8,6]=20
		talentmapArray[8,5]=7
		talentmapArray[8,7]="Buff"
		talentmapArray[8,8]="Spread Damage"

		talentmapArray[9,0]="Jelly Toast"
		talentmapArray[9,2]=1
		talentmapArray[9,3]=1
		talentmapArray[9,4]=3
		talentmapArray[9,6]=25
		talentmapArray[9,5]=8
		talentmapArray[9,7]="Modify"
		talentmapArray[9,8]="Spread Damage"
	
	//W
		talentmapArray[10,0]="Log"
		talentmapArray[10,6]=10
		talentmapArray[10,4]=1
		talentmapArray[10,3]=3
		talentmapArray[10,2]=3
		talentmapArray[10,7]="Ability"
		talentmapArray[10,8]="High Damage"
		talentmapArray[10,9]="Area Damage"

		talentmapArray[11,0]="Log"
		talentmapArray[11,6]=20
		talentmapArray[11,5]=10
		talentmapArray[11,7]="Buff"
		talentmapArray[11,8]="Damage +5%"

		talentmapArray[12,0]="Log"
		talentmapArray[12,2]=1
		talentmapArray[12,3]=1
		talentmapArray[12,4]=3
		talentmapArray[12,6]=25
		talentmapArray[12,5]=11
		talentmapArray[12,7]="Modify"
		talentmapArray[12,8]="AOE +"
		talentmapArray[12,9]="Damage +25%"
		
	//W2
		talentmapArray[13,0]="Vine"
		talentmapArray[13,6]=20
		talentmapArray[13,4]=1
		talentmapArray[13,3]=3
		talentmapArray[13,2]=3
		talentmapArray[13,7]="Ability"
		talentmapArray[13,8]="Area Damage"
		talentmapArray[13,9]="Mobility"

		talentmapArray[14,0]="Vine"
		talentmapArray[14,6]=25
		talentmapArray[14,5]=13
		talentmapArray[14,7]="Buff"
		talentmapArray[14,8]="Damage +5%"

		talentmapArray[15,0]="Vine"
		talentmapArray[15,2]=1
		talentmapArray[15,3]=1
		talentmapArray[15,4]=3
		talentmapArray[15,6]=25
		talentmapArray[15,5]=14
		talentmapArray[15,7]="Modify"
		talentmapArray[15,8]="Gravity -"
		talentmapArray[15,9]="Damage +25%"
		
	//P
		talentmapArray[16,0]="Bacon Cape"
		talentmapArray[16,6]=0
		talentmapArray[16,4]=1
		talentmapArray[16,3]=3
		talentmapArray[16,2]=3
		talentmapArray[16,7]="Passive"
		talentmapArray[16,8]="Block Damage"

		talentmapArray[17,0]="Super Bacon"
		talentmapArray[17,6]=5
		talentmapArray[17,5]=16
		talentmapArray[17,7]="Buff"
		talentmapArray[17,8]="Large Area"

		talentmapArray[18,0]="Sunnyside"
		talentmapArray[18,2]=1
		talentmapArray[18,3]=1
		talentmapArray[18,4]=3
		talentmapArray[18,6]=15
		talentmapArray[18,5]=17
		talentmapArray[18,7]="Modify"
		talentmapArray[18,8]="Large Area"
		
	//P2
		talentmapArray[19,0]="BalancedBkfst"
		talentmapArray[19,6]=10
		talentmapArray[19,4]=1
		talentmapArray[19,3]=3
		talentmapArray[19,2]=3
		talentmapArray[19,7]="Passive"
		talentmapArray[19,8]="Buff Attack"

		talentmapArray[20,0]="BalancedBkfst"
		talentmapArray[20,6]=20
		talentmapArray[20,5]=19
		talentmapArray[20,7]="Buff"
		talentmapArray[20,8]="Large Area"

		talentmapArray[21,0]="Super Crust"
		talentmapArray[21,2]=1
		talentmapArray[21,3]=1
		talentmapArray[21,4]=3
		talentmapArray[21,6]=25	
		talentmapArray[21,5]=20
		talentmapArray[21,7]="Modify"
		talentmapArray[21,8]="Large Area"
	
	//Extra 1
		talentmapArray[22,0]="The Arches"
		talentmapArray[22,4]=1
		talentmapArray[22,6]=0
		talentmapArray[22,5]=0
		talentmapArray[22,7]="Modify"
		talentmapArray[22,8]="Tomato Duration +20%"

	//Extra 2
		talentmapArray[23,0]="Float Leaf"
		talentmapArray[23,4]=1
		talentmapArray[23,6]=5
		talentmapArray[23,5]=0
		talentmapArray[23,7]="Stat"
		talentmapArray[23,8]="Speed +2%"
}else{
#endregion

#region Candy Talents
if(Me.class==8){

	//E ability 
		talentmapArray[1,0]="Slice n Bake"
		talentmapArray[1,4]=1
		talentmapArray[1,6]=1
		talentmapArray[1,5]=0
		talentmapArray[1,7]="Buff"
		talentmapArray[1,8]="-5% Cooldown"
		
		//Unlock level
		talentmapArray[2,0]="Cookie"
		talentmapArray[2,6]=10
		talentmapArray[2,4]=1
		talentmapArray[2,7]="Buff"
		talentmapArray[2,8]="Duration +5%"
	
		talentmapArray[3,0]="Cookie Bites"
		talentmapArray[3,2]=1
		talentmapArray[3,3]=1
		talentmapArray[3,6]=20
		talentmapArray[3,5]=2
		talentmapArray[3,7]="Modify"
		talentmapArray[3,8]="3X as tasty"
		talentmapArray[3,9]="Damage +25%"
		
	//Q
		talentmapArray[4,0]="Cakeodile"
		talentmapArray[4,6]=5
		talentmapArray[4,4]=1
		talentmapArray[4,3]=3
		talentmapArray[4,2]=3
		talentmapArray[4,7]="Ability"
		talentmapArray[4,8]="Spread Dmg"
		talentmapArray[4,9]="Damage +5%"
		
		talentmapArray[5,0]="Preservatives"
		talentmapArray[5,6]=15
		talentmapArray[5,5]=4
		talentmapArray[5,7]="Buff"
		talentmapArray[5,8]="+Duration"
		
		talentmapArray[6,0]="Batter Bite"
		talentmapArray[6,2]=1
		talentmapArray[6,3]=1
		talentmapArray[6,4]=3
		talentmapArray[6,6]=20
		talentmapArray[6,5]=5
		talentmapArray[6,7]="Modify"
		talentmapArray[6,8]="Modility +"
		talentmapArray[6,9]="Damage +25%"
		
	//Q2
		talentmapArray[7,0]="Cinnamon Roll"
		talentmapArray[7,6]=15
		talentmapArray[7,4]=1
		talentmapArray[7,3]=3
		talentmapArray[7,2]=3
		talentmapArray[7,7]="Ability"
		talentmapArray[7,8]="Minion Control"
		talentmapArray[7,9]="Area Damage"

		talentmapArray[8,0]="Preservatives"
		talentmapArray[8,6]=20
		talentmapArray[8,5]=7
		talentmapArray[8,7]="Buff"
		talentmapArray[8,8]="+Duration"

		talentmapArray[9,0]="Cinnamon Roll"
		talentmapArray[9,2]=1
		talentmapArray[9,3]=1
		talentmapArray[9,4]=3
		talentmapArray[9,6]=25
		talentmapArray[9,5]=8
		talentmapArray[9,7]="Modify"
		talentmapArray[9,8]="Spread Damage"
	
	//W
		talentmapArray[10,0]="Party Favors"
		talentmapArray[10,6]=10
		talentmapArray[10,4]=1
		talentmapArray[10,3]=3
		talentmapArray[10,2]=3
		talentmapArray[10,7]="Ability"
		talentmapArray[10,8]="High Damage"
		talentmapArray[10,9]="Area Damage"

		talentmapArray[11,0]="Party Favors"
		talentmapArray[11,6]=20
		talentmapArray[11,5]=10
		talentmapArray[11,7]="Buff"
		talentmapArray[11,8]="-5% Cooldown"

		talentmapArray[12,0]="Party Favors"
		talentmapArray[12,2]=1
		talentmapArray[12,3]=1
		talentmapArray[12,4]=3
		talentmapArray[12,6]=25
		talentmapArray[12,5]=11
		talentmapArray[12,7]="Modify"
		talentmapArray[12,8]="AOE +"
		talentmapArray[12,9]="Damage +25%"
		
	//W2
		talentmapArray[13,0]="Vine"
		talentmapArray[13,6]=20
		talentmapArray[13,4]=1
		talentmapArray[13,3]=3
		talentmapArray[13,2]=3
		talentmapArray[13,7]="Ability"
		talentmapArray[13,8]="Area Damage"
		talentmapArray[13,9]="Mobility"

		talentmapArray[14,0]="Vine"
		talentmapArray[14,6]=25
		talentmapArray[14,5]=13
		talentmapArray[14,7]="Buff"
		talentmapArray[14,8]="Damage +5%"

		talentmapArray[15,0]="Vine"
		talentmapArray[15,2]=1
		talentmapArray[15,3]=1
		talentmapArray[15,4]=3
		talentmapArray[15,6]=25
		talentmapArray[15,5]=14
		talentmapArray[15,7]="Modify"
		talentmapArray[15,8]="Gravity -"
		talentmapArray[15,9]="Damage +25%"
		
	//P
		talentmapArray[16,0]="Gumdrop"
		talentmapArray[16,6]=0
		talentmapArray[16,4]=1
		talentmapArray[16,3]=3
		talentmapArray[16,2]=3
		talentmapArray[16,7]="Passive"
		talentmapArray[16,8]="Block Damage"

		talentmapArray[17,0]="Gumdrop"
		talentmapArray[17,6]=5
		talentmapArray[17,5]=16
		talentmapArray[17,7]="Buff"
		talentmapArray[17,8]="Large Area"

		talentmapArray[18,0]="Gumdrop"
		talentmapArray[18,2]=1
		talentmapArray[18,3]=1
		talentmapArray[18,4]=3
		talentmapArray[18,6]=15
		talentmapArray[18,5]=17
		talentmapArray[18,7]="Modify"
		talentmapArray[18,8]="Large Area"
		
	//P2
		talentmapArray[19,0]="Easy Oven"
		talentmapArray[19,6]=10
		talentmapArray[19,4]=1
		talentmapArray[19,3]=3
		talentmapArray[19,2]=3
		talentmapArray[19,7]="Passive"
		talentmapArray[19,8]="Buff Attack"

		talentmapArray[20,0]="Easy Oven"
		talentmapArray[20,6]=20
		talentmapArray[20,5]=19
		talentmapArray[20,7]="Buff"
		talentmapArray[20,8]="Large Area"

		talentmapArray[21,0]="Easy Oven"
		talentmapArray[21,2]=1
		talentmapArray[21,3]=1
		talentmapArray[21,4]=3
		talentmapArray[21,6]=25	
		talentmapArray[21,5]=20
		talentmapArray[21,7]="Modify"
		talentmapArray[21,8]="Large Area"
	
	//Extra 1
		talentmapArray[22,0]="The Arches"
		talentmapArray[22,4]=1
		talentmapArray[22,6]=0
		talentmapArray[22,5]=0
		talentmapArray[22,7]="Modify"
		talentmapArray[22,8]="Tomato Duration +20%"

	//Extra 2
		talentmapArray[23,0]="Float Leaf"
		talentmapArray[23,4]=1
		talentmapArray[23,6]=5
		talentmapArray[23,5]=0
		talentmapArray[23,7]="Stat"
		talentmapArray[23,8]="Speed +2%"
}else{
#endregion

#region Trash Talents
if(Me.class==9){

	//E ability 
		talentmapArray[1,0]="Mouse"
		talentmapArray[1,4]=1
		talentmapArray[1,6]=1
		talentmapArray[1,5]=0
		talentmapArray[1,7]="Buff"
		talentmapArray[1,8]="-5% Cooldown"
		
		//Unlock level
		talentmapArray[2,0]="Whiskers"
		talentmapArray[2,6]=10
		talentmapArray[2,4]=1
		talentmapArray[2,7]="Buff"
		talentmapArray[2,8]="Duration +5%"
	
		talentmapArray[3,0]="Big Cheese"
		talentmapArray[3,2]=1
		talentmapArray[3,3]=1
		talentmapArray[3,6]=20
		talentmapArray[3,5]=2
		talentmapArray[3,7]="Modify"
		talentmapArray[3,8]="3X as tasty"
		talentmapArray[3,9]="Damage +25%"
		
	//Q
		talentmapArray[4,0]="Cakeodile"
		talentmapArray[4,6]=5
		talentmapArray[4,4]=1
		talentmapArray[4,3]=3
		talentmapArray[4,2]=3
		talentmapArray[4,7]="Ability"
		talentmapArray[4,8]="Spread Dmg"
		talentmapArray[4,9]="Damage +5%"
		
		talentmapArray[5,0]="Preservatives"
		talentmapArray[5,6]=15
		talentmapArray[5,5]=4
		talentmapArray[5,7]="Buff"
		talentmapArray[5,8]="+Duration"
		
		talentmapArray[6,0]="Batter Bite"
		talentmapArray[6,2]=1
		talentmapArray[6,3]=1
		talentmapArray[6,4]=3
		talentmapArray[6,6]=20
		talentmapArray[6,5]=5
		talentmapArray[6,7]="Modify"
		talentmapArray[6,8]="Modility +"
		talentmapArray[6,9]="Damage +25%"
		
	//Q2
		talentmapArray[7,0]="Cinnamon Roll"
		talentmapArray[7,6]=15
		talentmapArray[7,4]=1
		talentmapArray[7,3]=3
		talentmapArray[7,2]=3
		talentmapArray[7,7]="Ability"
		talentmapArray[7,8]="Minion Control"
		talentmapArray[7,9]="Area Damage"

		talentmapArray[8,0]="Preservatives"
		talentmapArray[8,6]=20
		talentmapArray[8,5]=7
		talentmapArray[8,7]="Buff"
		talentmapArray[8,8]="+Duration"

		talentmapArray[9,0]="Cinnamon Roll"
		talentmapArray[9,2]=1
		talentmapArray[9,3]=1
		talentmapArray[9,4]=3
		talentmapArray[9,6]=25
		talentmapArray[9,5]=8
		talentmapArray[9,7]="Modify"
		talentmapArray[9,8]="Spread Damage"
	
	//W
		talentmapArray[10,0]="Party Favors"
		talentmapArray[10,6]=10
		talentmapArray[10,4]=1
		talentmapArray[10,3]=3
		talentmapArray[10,2]=3
		talentmapArray[10,7]="Ability"
		talentmapArray[10,8]="High Damage"
		talentmapArray[10,9]="Area Damage"

		talentmapArray[11,0]="Party Favors"
		talentmapArray[11,6]=20
		talentmapArray[11,5]=10
		talentmapArray[11,7]="Buff"
		talentmapArray[11,8]="-5% Cooldown"

		talentmapArray[12,0]="Party Favors"
		talentmapArray[12,2]=1
		talentmapArray[12,3]=1
		talentmapArray[12,4]=3
		talentmapArray[12,6]=25
		talentmapArray[12,5]=11
		talentmapArray[12,7]="Modify"
		talentmapArray[12,8]="AOE +"
		talentmapArray[12,9]="Damage +25%"
		
	//W2
		talentmapArray[13,0]="Vine"
		talentmapArray[13,6]=20
		talentmapArray[13,4]=1
		talentmapArray[13,3]=3
		talentmapArray[13,2]=3
		talentmapArray[13,7]="Ability"
		talentmapArray[13,8]="Area Damage"
		talentmapArray[13,9]="Mobility"

		talentmapArray[14,0]="Vine"
		talentmapArray[14,6]=25
		talentmapArray[14,5]=13
		talentmapArray[14,7]="Buff"
		talentmapArray[14,8]="Damage +5%"

		talentmapArray[15,0]="Vine"
		talentmapArray[15,2]=1
		talentmapArray[15,3]=1
		talentmapArray[15,4]=3
		talentmapArray[15,6]=25
		talentmapArray[15,5]=14
		talentmapArray[15,7]="Modify"
		talentmapArray[15,8]="Gravity -"
		talentmapArray[15,9]="Damage +25%"
		
	//P
		talentmapArray[16,0]="Gumdrop"
		talentmapArray[16,6]=0
		talentmapArray[16,4]=1
		talentmapArray[16,3]=3
		talentmapArray[16,2]=3
		talentmapArray[16,7]="Passive"
		talentmapArray[16,8]="Block Damage"

		talentmapArray[17,0]="Gumdrop"
		talentmapArray[17,6]=5
		talentmapArray[17,5]=16
		talentmapArray[17,7]="Buff"
		talentmapArray[17,8]="Large Area"

		talentmapArray[18,0]="Gumdrop"
		talentmapArray[18,2]=1
		talentmapArray[18,3]=1
		talentmapArray[18,4]=3
		talentmapArray[18,6]=15
		talentmapArray[18,5]=17
		talentmapArray[18,7]="Modify"
		talentmapArray[18,8]="Large Area"
		
	//P2
		talentmapArray[19,0]="Easy Oven"
		talentmapArray[19,6]=10
		talentmapArray[19,4]=1
		talentmapArray[19,3]=3
		talentmapArray[19,2]=3
		talentmapArray[19,7]="Passive"
		talentmapArray[19,8]="Buff Attack"

		talentmapArray[20,0]="Easy Oven"
		talentmapArray[20,6]=20
		talentmapArray[20,5]=19
		talentmapArray[20,7]="Buff"
		talentmapArray[20,8]="Large Area"

		talentmapArray[21,0]="Easy Oven"
		talentmapArray[21,2]=1
		talentmapArray[21,3]=1
		talentmapArray[21,4]=3
		talentmapArray[21,6]=25	
		talentmapArray[21,5]=20
		talentmapArray[21,7]="Modify"
		talentmapArray[21,8]="Large Area"
	
	//Extra 1
		talentmapArray[22,0]="The Arches"
		talentmapArray[22,4]=1
		talentmapArray[22,6]=0
		talentmapArray[22,5]=0
		talentmapArray[22,7]="Modify"
		talentmapArray[22,8]="Tomato Duration +20%"

	//Extra 2
		talentmapArray[23,0]="Float Leaf"
		talentmapArray[23,4]=1
		talentmapArray[23,6]=5
		talentmapArray[23,5]=0
		talentmapArray[23,7]="Stat"
		talentmapArray[23,8]="Speed +2%"
}else{
#endregion


}

}
}
}
}
}
}
}}

	
	//Talent map UI points to array above 
	chance=0
	for(a=0;a<7;a+=1){
		for(b=0;b<6;b+=1){
			talentmapuiArray[a,b]=0
			chance+=1
		}	
	}
	//Number of talent points
	talentmapuiArray[0,100]=10
	//x
	talentmapuiArray[0,101]=100
	//y
	talentmapuiArray[0,102]=100
	//Red warning cooldown
	talentmapuiArray[0,103]=0
	//Red warning talent number
	talentmapuiArray[0,104]=100
	//Red warning Constant for abilities that cant be selected Q ability
	talentmapuiArray[0,105]=0
	//Red warning Constant for abilities that cant be selected W ability
	talentmapuiArray[0,105]=0
	
	//E
	talentmapuiArray[2,5]=1
	talentmapuiArray[2,3]=2
	talentmapuiArray[2,1]=3 

	//Q
	talentmapuiArray[0,4]=4
	talentmapuiArray[0,2]=5
	talentmapuiArray[0,1]=6 

	//Q2
	talentmapuiArray[1,2]=7 
	talentmapuiArray[1,1]=8 
	talentmapuiArray[1,0]=9 

	//W
	talentmapuiArray[3,3]=10 
	talentmapuiArray[3,1]=11 
	talentmapuiArray[3,0]=12 

	//W2
	talentmapuiArray[4,1]=13
	talentmapuiArray[4,0]=14
	talentmapuiArray[5,0]=15

	//P
	talentmapuiArray[5,5]=16
	talentmapuiArray[5,4]=17 
	talentmapuiArray[5,2]=18 
	
	//P2
	talentmapuiArray[6,3]=19 
	talentmapuiArray[6,1]=20
	talentmapuiArray[6,0]=21 

	//Extra 1
	talentmapuiArray[4,5]=22
	
	//Extra 2
	talentmapuiArray[4,4]=23

}
	
/*
[2,5]=1 e
[2,3]=2 e t2
[2,1]=3 e t3

[0,4]=4 q1
[0,2]=5 q1 t2
[0,1]=6 q1 t3

[1,2]=7 q2
[1,1]=8 q2 t2
[1,0]=9 q2 t3

[3,3]=10 w1
[3,1]=11 w1 t2
[3,0]=12 w1 t3

[4,1]=13 w2
[4,0]=14 w2 t2
[5,0]=15 w2 t3

[5,5]=16 p1
[5,4]=17 p1 t2
[5,2]=18 p1 t3

[6,3]=19 p2
[6,1]=20 p2 t2
[6,0]=21 p2 t3
*/