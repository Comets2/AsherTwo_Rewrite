// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function grad(){

/// @function grad(hash, x, y)

/// @param {real} hash
/// @param {real} x
/// @param {real} y
/// @return {real}

var hash = argument0;
var xc = argument1;
var yc = argument2;

switch (hash & 3) {
    case 0: return xc + yc;
    case 1: return -xc + yc;
    case 2: return xc - yc;
    default: return -xc - yc;
}

}