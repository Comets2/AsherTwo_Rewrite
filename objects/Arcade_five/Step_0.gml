/// @description Insert description here
// You can write your code in this editor


//if(Control.pause==10){

	if(image_index+imgsped>img+imgcap){
		image_index=img
	}else{
		image_index+=imgsped
	}

	if(dur>0){
		dur-=1
	}

//}

if(hurt>0){
	hurt-=1
	color=hurtcolor
}else{
	color=c_white
}