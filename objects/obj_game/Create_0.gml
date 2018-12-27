/// @description Insert description here
// You can write your code in this editor
window_set_fullscreen(true);
scr_variables();
global.partsys_tracks = part_system_create();// creating a partical system as a global variable
part_system_depth(global.partsys_tracks,0);// setting its depth