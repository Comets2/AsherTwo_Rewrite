// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function lerpp(){

/// @function lerp(a, b, t)

/// @param {real} a
/// @param {real} b
/// @param {real} t
/// @return {real}

var a = argument0;
var b = argument1;
var t = argument2;
return a + t * (b - a);

}