
function worldgen_initialize_scr() {
		created=instance_create_depth(midx,midy,5,Me)
		with(created){
			image_index=1
			controls=0
		} 
		players+=1
		camtarget=created

	/*
		created=instance_create_depth(midx,midy,0,Me)
		with(created){
			image_index=1
			controls=1
		}
		players+=1
		camtargettwo=created
	*/

	map_gen_scr()

	lvlArray[1000,24]="lvlArray 1000 24"

	//Map 1-8
	lvlArray[1000,0]=0
	//Goal
	lvlArray[1001,0]=0
	//Goal count
	lvlArray[1002,0]=0
	//Goal type
	lvlArray[1003,0]=0

	//lvl Array Variables
	lvlselect=1
	lvlArray[0,0]=0
	//Extra Small
	lvlArray[1,0]=20
	lvlArray[1,1]=10
	//Small
	lvlArray[2,0]=25
	lvlArray[2,1]=15
	//Medium
	lvlArray[3,0]=30
	lvlArray[3,1]=20
	//Large
	lvlArray[4,0]=35
	lvlArray[4,1]=25
	//Extra Large
	lvlArray[5,0]=100
	lvlArray[5,1]=25

	//Last Level Type
	lvlArray[1010,2]=0	

	lvlArray[1000,4]=0
	lvlArray[1010,4]=0
	lvlArray[1010,5]=0





	for(a=0;a<10;a+=1){
		for(b=0;b<10;b+=1){
			miniArray[a,b]=0
		}
	}
	//0  CURRENT level type, 1 timer, 2 goal, 
	//0+1  DATA level type, 1 timer total, 2 goal total, 
	//level type
	miniArray[0,0]=0
	miniArray[1,1]=(60*180)+1

	miniArray[0,1]=miniArray[1,1]













}
