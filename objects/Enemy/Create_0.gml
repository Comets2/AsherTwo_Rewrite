image_speed=0
image_index=1
sprite_index=dummy_spr

hsp=0
vsp=0
sped=1
slow=1
jump=-3
jumpstart=-2
grav=0.3
gravtotal=5
grounded=0
animtick=0
target=0
attcd=0
attcdtotal=120
dies=1
damagedone=0
sounddel=0

progtimer=0

pin=0
phase=1
check=1
wallcheck=1

enopt=0
team=1
nodestroy=0
xpspawn=1
xpdrop=0

charvar_scr()

dir=1
//image
img=1
//image cap
imgcap=1
//image speed
imgsped=0.1
imgspedtwo=0.1
anim=0
moving=0
animx=0
animy=0

slow=0
for(a=0;a<5;a+=1){
	for(b=0;b<5;b+=1){
		debuffArray[a,b]=0
	}
}