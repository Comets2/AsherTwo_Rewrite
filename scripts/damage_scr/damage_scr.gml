function damage_scr() {
	if(dmgArray[0,0]>0){
		chance=dmgArray[0,0]
		for(i=1;i<chance+1;i+=1){
			if(dmgArray[i,0]>1){
				dmgArray[i,0]-=1
			}else{
				if(i<chance){
					for(b=0;b<10;b+=1){
						dmgArray[i,b]=dmgArray[i+1,b]
						dmgArray[i+1,b]=0
					}
				}else{
						for(b=0;b<10;b+=1){
							dmgArray[i,b]=0
						}			
						dmgArray[0,0]-=1
				}
			}
		}
	
	
	}


}
