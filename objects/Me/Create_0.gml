sprite_index=me_spr
image_speed=0
mespr=me_spr

charvar_scr()
hp=12
hptotal=12
//audio_listener_set_orientation(0, 0, 0, 1000, 0, -1, 0)
	audio_listener_set_orientation(0, 0, 0, 100, 0, -1, 0)
	sndemitme=audio_emitter_create()
	audio_emitter_falloff(sndemitme, Control.falloff_ref, Control.falloff_max, Control.falloff_factor)
	sounddel=0

hsp=0
vsp=0

passiveArray[2,10]=0

dpstimer=0
dpstimertwo=0
damagedone=0
damagedonetwo=0
damagedonethree=0
passive=0
passivetwo=0
passivethree=0
passivefour=0
passivefourArray[0,0]=0
passivefourArray[0,1]=0

maskdraw=1
maskextra=0
animstop=0
class=2
classcheck=1
abilsave=0
globalcdtotal=6
globalcd=0
wep=1
wepx=0
wepy=0
wepangle=0
remhsp=0

controls=0
dies=0
deathtick=0
deathcd=0

// Rogue Mode stats
rogue_statatt = 0      // Attack bonus
rogue_statsped = 0     // Speed bonus
rogue_statattsped = 0  // Attack speed bonus
rogue_statpower = 0    // Health/Power bonus



//abil1 0, abil1 cd 1, abil1cd total 2, abil1 opt1 3, abil2 opt2 4, abil3 opt3 5, 
abilArray[0,0]=0
for(a=0;a<10;a+=1){
	for(b=0;b<10;b+=1){
	abilArray[a,b]=0
	}
}
abilArray[0,2]=40
abilArray[1,2]=80

	sped=1.7
	spedsave=sped
	spedcd=0
	spedtick=0
	spedpercent=0

jump=-1.8
jumptimer=0
jumptimertotal=4
jumpstart=-2
	grav=0.3
	gravtotal=5
	gravsave=grav
	gravcd=0
	gravpercent=0
	gravtick=0
grounded=0
jumps=2
jumptotal=2
animtick=0
wallsped=1
hurtdraw=0
team=0
pet=noone

dir=1
//image
img=1
//image cap
imgcap=5
//image speed
imgsped=0.1
imgspedtwo=0.1
anim=0
animsave=14
animysave=0
moving=0
animx=0
animy=0
hptotalback=hptotal

image_index=img
classsave=class

talentfivetwo=0