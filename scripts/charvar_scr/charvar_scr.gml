function charvar_scr() {
	if(Control.dif==0){
		hp=16
	}else{
		hp=24
	}

	for(i=0;i<10;i+=1){
		effectArray[i,0]=0
	}

	effectArray[0,1]=100
	effectArray[0,2]=0.25
	effectArray[0,3]=0
	effectArray[0,4]=0	
	
	effectArray[3,1]=50
	effectArray[3,2]=1
	effectArray[3,3]=0
	effectArray[3,4]=0	
	
	hptotal=hp
	hurttick=0
	hurttimer=0
	hurttimertotal=60
	hurtamount=0
	dmgrecieved=0
	healrecieved=0
	healtick=0
	incdmgtype=0

	color=c_white
	hurtcolor = $723847
	hurttotal=0
	hurtArray[0,0]=0
	hurtArray[0,1]=0

	stun=0
	hsptwo=0
	vsptwo=0

	drop=0
	item=0
	itemamount=0
	playerhurt=1
	immune=0
	immunetwo=0


}
