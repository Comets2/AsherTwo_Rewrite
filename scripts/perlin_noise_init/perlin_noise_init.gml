// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function perlin_noise_init(){

/// @function perlin_noise_init()

global.perm = array_create(512, 0);
global.p = array_create(256, 0);
var i;
for (i = 0; i < 256; i++) {
    global.p[i] = irandom(255);
}

for (i = 0; i < 256; i++) {
    global.perm[i] = global.p[i];
    global.perm[256 + i] = global.p[i];
}

}