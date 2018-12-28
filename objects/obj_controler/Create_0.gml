/// @description Insert description here
// You can write your code in this editor


var cell_width = spr_tile.sprite_width;
var cell_height = spr_tile.sprite_height;
var vcells = floor(room_height/64);
var hcells = floor(room_width/64);

global.grid = mp_grid_create(0,0, hcells, vcells, 64, 64);

mp_grid_add_instances(global.grid, obj_wall ,false);

/*
left	Starting x coordinate of the mp_grid in the room
top	Starting y coordinate of the mp_grid in the room
hcells	Number of horizontal cells that the mp_grid will contain
vcells	Number of vertical cells that the mp_grid will contain
cellwidth	The width (in pixels) of each individual cell of the mp_grid
cellheight	The height (in pixels) of each individual cell of the mp_grid