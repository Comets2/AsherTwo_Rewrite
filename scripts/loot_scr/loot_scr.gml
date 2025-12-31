function loot_scr(argument0) {
#region Shop Loot
	if(argument0==0){
	invenArray[40,0]=choose(9,11,17)
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
		invenArray[40,2]=chancetwo
	
		invenArray[41,0]=choose(33,35,37,39)
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
		invenArray[41,2]=chancetwo
	
		//invenArray[42,0]=choose(1,5,7,13,15,21)
		invenArray[42,0]=choose(33,35,37,39)
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
		invenArray[42,2]=chancetwo
	}else{
#endregion 

	}


}
