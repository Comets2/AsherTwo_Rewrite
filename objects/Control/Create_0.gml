instance_create_depth(0,0,40,Terrain)
randomize()
depth=1
midx=room_width/2
midy=room_height/2
blockwidth=16
camx=midx
camy=midy
camxtwo=floor(255/2)
camytwo=floor(143/2)
camera = camera_create()
var vm = matrix_build_lookat(camx,camy,-10,camx,camy,0,0,1,0)
var pm = matrix_build_projection_ortho(255,143,1,10000)
camera_set_view_mat(camera,vm)
camera_set_proj_mat(camera,pm)
view_camera[0]=camera
//window_set_size(1920,1080)
window_set_size(display_get_width(),display_get_height())

window_set_position(0,0)
camtarget=Me
xto=camx
yto=camy
mespr=me_spr
minix=0
miniy=0
phase=0
stagetimer=0
selectedtwo=0
playerbee=0

death=1

drawone=9999999
drawtwo=9999999

//Sound Audio
soundrange=500
falloff_ref=48 
falloff_max=500000
falloff_factor=2000
	camcheck=0
	camxressave=255
	camyressave=143
	camxres=255
	camyres=143
	camborder=0
	animation=0
	animationtick=0
	anim=0
	screenshake=0
	screenshaketick=0
	screenshakeamt=0
	targettick=0
	targetpos=0
	pausetwo=0
	pause=20
	pauselast=1
	pauseopt=0
	selectx=0
	selecty=0
	selectxtwo=0
	selectytwo=0
	selected=0
	
	// Keyboard/Controller cursor position
	cursor_x = 0
	cursor_y = 0
	cursor_mode = 0  // 0 = mouse mode, 1 = keyboard/controller mode
	cursor_area = 0  // 0 = main inventory, 1 = equipment slots, 2 = shop, 3 = sell slot, 4 = mask
	cursor_timer = 0 // For input repeat delay
	
	// Mouse tracking for mode switching
	mouse_x_previous = mouse_x
	mouse_y_previous = mouse_y

	// Title Menu variables
	title_selection = 0  // 0=Adventure, 1=Arcade, 2=Options
	title_anim = 0
	game_initialized = false
	menu_input_delay = 0  // Prevents input from carrying over between menus

	// Options Menu variables
	options_tab = 0      // 0=Sound, 1=Controls
	options_selection = 0
	remap_active = false
	remap_target = -1

	// Arcade Selection variables
	arcade_selection = 0

	// Sound Settings
	global.master_volume = 1.0
	global.music_volume = 1.0
	global.sfx_volume = 1.0

lvlArray[1000,0]=0



hurtcolor = $5959BB
poisoncolor = $A86984
pathcolor =	$2C1E37
pathcolor = $332F55
pathcolortwo = $4E6089
colorgold = $78A5D1
colorgoldmed = $5E7EC4
colorgoldlight = $8EDDCA
colorblue = $A8945E
colorbluelight = $D8DEBC
colorgreen = $72C074
colorpurple = $A86984
colorpurpledark = $75495F
colorgray = $B3ABC2
colorred = $5959BB
colorbrown = $3F4169
colorlightgreen = $8EDDCA

door=noone

players=0
boss=0
	target=noone
	//0,0=amount//1,0=timer/1,1=dmg/1,2=x/1,3=y/1,4=type
	dmgArray[0,0]=0
	dmgArray[0,1]=35
	for(a=1;a<10;a+=1){
		for(b=0;b<10;b+=1){
			dmgArray[a,b]=0
		}
	}

#region Overworld Map details
//World
mapdataArray[1003,0]=0
			//World
			mapdataArray[1004,0]="The Deep Woods"
			mapdataArray[1004,1]="Land of Honey"
			mapdataArray[1004,2]="The Deep Woods"
			
			//Map Icon Names
			mapdataArray[1002,0]=0
			mapdataArray[1002,1]= "Monsters"
			mapdataArray[1002,2]= "Elite Monster"
			mapdataArray[1002,3]= "Boss Monster"
			mapdataArray[1002,4]= "Rare Monster"
			mapdataArray[1002,9]= "Quest"
			mapdataArray[1002,10]= "Quest"
			mapdataArray[1002,11]= "Quest"
			mapdataArray[1002,12]= "Shop"
			mapdataArray[1002,15]= "Asher"
			mapdataArray[1002,16]= "Asher"
			mapdataArray[1002,17]= "Asher"
			mapdataArray[1002,18]= "Asher"
			mapdataArray[1002,19]= "Asher"
			
			//Map Icon Names
			mapdataArray[1005,0]=0
			mapdataArray[1005,1]= "Defeat All Waves of Monsters"
			mapdataArray[1005,2]= "Defeat Elite Monster"
			mapdataArray[1005,3]= "Defeat Boss Monster"
			mapdataArray[1005,4]= "Defeat Rare Monster"
			mapdataArray[1005,9]= "Complete task"
			mapdataArray[1005,10]= "Complete task"
			mapdataArray[1005,11]= "Complete task"
			mapdataArray[1005,12]= "Buy or Sell Items"
			
			//Bounty Reward Amounts
			mapdataArray[1006,0]=0
			mapdataArray[1006,1]= 5
			mapdataArray[1006,2]= 15
			mapdataArray[1006,3]= 25
			mapdataArray[1006,4]= 15
			mapdataArray[1006,5]= 15
			mapdataArray[1006,6]= 15
			mapdataArray[1006,7]= 15
			mapdataArray[1006,8]= 15
			mapdataArray[1006,9]= 0
			mapdataArray[1006,10]= 10
			mapdataArray[1006,11]= 10
			mapdataArray[1006,12]= 0
			
			//Me Run Data
			//Money
			mapdataArray[1010,0]= 0
#endregion

dif=0

debug=0
terrainspr=terrain_spr
rmtype=4
hurtdraw=0

	created=instance_create_depth(midx,midy,0,Background)
	with(created){
	image_index=0
	sprite_index=background_spr
	}


	vibrate=0
	vibratel=0
	vibrater=0
	vibrateamount=0
	vibrateamountl=0
	vibrateamountr=0
	vibratetick=0
	


//view_camera[0]=camera_create_view(0,0,255,143,0,Me,-1,-1,120,120)

global.myFont = font_add_sprite(alpha1_spr,ord("!"),true,0.8) 

global.myCol = c_white
draw_set_font(global.myFont) 
//invenArray[] 0=spot, 0=id,1=amount, 2=amount type, 3=durability type, 4=durability amount, 5=durability total, 6=rarity, 7=enchant1,8=enchant2, 
draw_set_color(global.myCol) 


global.consave_up=vk_up
//down
global.consave_down=vk_down
//right
global.consave_right=vk_right
//left
global.consave_left=vk_left
//space
global.consave_space=vk_space
//enter
global.consave_enter=vk_enter
//shift
global.consave_shift=vk_shift
//control
global.consave_control=vk_control
//escapeE
global.consave_escape=vk_escape
//R
global.consave_r=ord("R")
//E
global.consave_e=ord("E")
//W
global.consave_w=ord("W")
//Q
global.consave_q=ord("Q")
//M
global.consave_m=ord("M")
//A
global.consave_a=ord("A")
//S
global.consave_s=ord("S")
//D
global.consave_d=ord("D")
//I
global.consave_i=ord("I")

global.controlopt=1
global.conp_h_up=0
global.conp_h_down=0
global.conp_h_right=0
global.conp_h_left=0
global.conp_p_up=0
global.conp_p_down=0
global.conp_p_right=0
global.conp_p_left=0

controls_scr()

// Default values for variables that may be accessed before game_start_scr() runs
lvlselect = 0
miniArray[0,1] = 0
mapx = 0
mapy = 0
rmw = 0
rmh = 0
border = 0
roomArray[0,0] = 0

// Arcade variables (initialized here so Draw doesn't error before arcade_scr runs)
acvartimer = 0
acvarthree = 0
acvarfour = 0
acvarfive = 0
acvarsign = 0
acvarsigntwo = 0
acvarsix = 0
acvarseven = 0
acvareight = 0
acvarnine = 0
acvarten = 0
acvareleven = 0
acvartwelve = 0
acvarthirteen = 0
acvarfourteen = 0
acvarfifteen = 0
acvarsixteen = 0
acvarseventeen = 0
acvareighteen = 0
acvarnineteen = 0
acvartwenty = 0
acvartwentyone = 0
acvartwentyonetwo = 0
acvartwentyonethree = 0
acvartwentyonefour = 0
acvartwentyonefive = 0
acvartwentyonestable = 0
acvartwentytwo = 0
acvartwentythree = 0
acvartwentyfour = 0
acvartwentyfive = 0
acvartwentysix = 0
acvartwentysixtwo = 0
acvartwentyseven = 0
acvartwentyeight = 0
acvartwentynine = 0
acvarthirty = 0
acvarthirtythree = 0
acvardur = 0
crabtype = 0
arcadepet = 0
arcadepetrarity = 0
arcadegrid = 0
arcadegridsize = 0
arcwave = 0
arcwavetimer = 0
tokens = 0
arcpause = 0
// Initialize arcadeArray with enough indices
for(var i = 0; i < 150; i++){
	for(var j = 0; j < 10; j++){
		arcadeArray[i,j] = 0
	}
}

// Initialize invenArray with default values (for arcade mode before game starts)
for(var i = 0; i < 50; i++){
	for(var j = 0; j < 20; j++){
		invenArray[i,j] = 0
	}
}

// Game initialization moved to game_start_scr() - called when Adventure is selected
// This prevents loading game data before the player chooses to start

exitdoor=0
exitdoortrig=0
