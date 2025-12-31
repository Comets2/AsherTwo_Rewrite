function inven_place_scr() {
									chancethree=1
										if(selected>=21){
											if(selected==21){
												if(itemArray[invenArray[invenArray[30,0],0],2]!=1){
													chancethree=0
												}
											}else{
												if(selected==23){
													if(itemArray[invenArray[invenArray[30,0],0],2]!=2){
														chancethree=0
													}											
												}else{
													if(selected>=24&&selected<30){
														if(itemArray[invenArray[invenArray[30,0],0],2]==1||itemArray[invenArray[invenArray[30,0],0],2]==2){
															chancethree=0
														}
													}else{
														if(selected>=40&&selected<45){
															chancethree=0
														}
													}	
												}
											}
										}
										if(invenArray[30,0]>=40&&invenArray[30,0]<45&&invenArray[selected,0]!=0||selected==45&&invenArray[30,0]>=40&&invenArray[30,0]<45){
											chancethree=0 
										}
										if(invenArray[30,0]>=40&&invenArray[30,0]<45&&selected==invenArray[30,0]||invenArray[30,0]>=40&&invenArray[30,0]<45&&selected>=40&&selected<45){
											chancethree=1
										}
										//Buy
										if(invenArray[30,0]>=40&&invenArray[30,0]<45){
											if(selected>=40&&selected<45){
										
											}else{
#region Instant on Buy Items
												if(itemArray[invenArray[invenArray[30,0],0],2]==10){
													chancefour=0
												
													//Reset Shop Loot
													if(invenArray[invenArray[30,0],0]==23){
														chancefour=2
														loot_scr(0)
													}else{
													
														//Heal 
														if(invenArray[invenArray[30,0],0]==25){
															chancefour=2
															if(Me.hp<Me.hptotal){
																if(Me.hp+4<Me.hptotal){
																	Me.hp+=4
																}else{
																	Me.hp=Me.hptotal
																}
															}else{
																chancefour=1
															}
															chancethree=0
														}else{
												
														}
													}
														if(chancefour==0||chancefour==2){
															
																if(mapdataArray[1010,0]+mapdataArray[1000,5]>=itemArray[invenArray[invenArray[30,0],0],4]+floor(invenArray[invenArray[30,0],2])){
																mapdataArray[1000,5]-=itemArray[invenArray[invenArray[30,0],0],4]+floor(invenArray[invenArray[30,0],2])
																mapdataArray[1000,6]=0
																}else{
																	chancethree=0
																}
															}
															if(chancefour==2){
																if(invenArray[invenArray[30,0],2]<4){
																	invenArray[invenArray[30,0],2]+=1
																}
																chancethree=0
																selected=999
																invenArray[invenArray[30,0],1]=0	
																invenArray[30,0]=999															
															}
												}else{
#endregion
													if(mapdataArray[1010,0]+mapdataArray[1000,5]>=itemArray[invenArray[invenArray[30,0],0],4]+floor(invenArray[invenArray[30,0],2]*2)){
													mapdataArray[1000,5]-=itemArray[invenArray[invenArray[30,0],0],4]+floor(invenArray[invenArray[30,0],2]*2)
													mapdataArray[1000,6]=0
													}else{
														chancethree=0
													}
												}
											}
										}	
										if(selected==45&&invenArray[30,0]==45){
											invenArray[invenArray[30,0],1]=0	
											invenArray[30,0]=999	
											chancethree=0
										}
									if(chancethree==1){
										//Sell
										if(selected==45&&invenArray[30,0]!=selected){
												mapdataArray[1000,5]+=floor((itemArray[invenArray[invenArray[30,0],0],4]+floor(invenArray[invenArray[30,0],2]*2))/2)
												mapdataArray[1000,6]=0
										}
										//Re purchase sold item
										if(invenArray[30,0]==45&&selected!=45){
											if(mapdataArray[1010,0]+mapdataArray[1000,5]>=floor((itemArray[invenArray[invenArray[30,0],0],4]+floor(invenArray[invenArray[30,0],2]*2))/2)){
											mapdataArray[1000,5]-=floor((itemArray[invenArray[invenArray[30,0],0],4]+floor(invenArray[invenArray[30,0],2]*2))/2)
											mapdataArray[1000,6]=0
											}
										}							
									invenArray[invenArray[30,0],1]=0
									
											for(i=0;i<10;i+=1){
												invenArray[31,i]=invenArray[invenArray[30,0],i]
												if(selected!=45){
													invenArray[invenArray[30,0],i]=invenArray[selected,i]
												}
											}
									
										for(i=0;i<10;i+=1){
											invenArray[selected,i]=invenArray[31,i]
											if(selected==45){
												invenArray[invenArray[30,0],i]=0
											}
										}
									
										invenArray[30,0]=999
									}


}
