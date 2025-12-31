// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function perlin_noise_2d(){

/// @function perlin_noise_2d(x, y)

/// @param {real} x
/// @param {real} y
/// @return {real}

var xc = argument0;
var yc = argument1;

var X = floor(xc) & 255;
var Y = floor(yc) & 255;

xc -= floor(xc);
yc -= floor(yc);

var u = fade(xc);
var v = fade(yc);

var A = global.perm[X] + Y;
var B = global.perm[X + 1] + Y;

var gradAA = grad(global.perm[A], xc, yc);
var gradBA = grad(global.perm[B], xc - 1, yc);
var gradAB = grad(global.perm[A + 1], xc, yc - 1);
var gradBB = grad(global.perm[B + 1], xc - 1, yc - 1);

return lerpp(lerpp(gradAA, gradBA, u), lerpp(gradAB, gradBB, u), v);

}