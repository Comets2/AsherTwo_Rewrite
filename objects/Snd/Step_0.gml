if(Control.pause==0){
	if(dur>0){
	dur-=1

	}else{
		if(audio_emitter_exists(sndemitone)){
		 audio_emitter_free(sndemitone)
		}
		instance_destroy()
	}
}