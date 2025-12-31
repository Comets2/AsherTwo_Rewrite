// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function fade(){
/// @function fade(t)

/// @param {real} t
/// @return {real}

var t = argument0;
return t * t * t * (t * (t * 6 - 15) + 10);
}