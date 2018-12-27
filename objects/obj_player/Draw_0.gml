/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor
var turret_angle = -phy_rotation + turret_delta_angle;

draw_self();


draw_sprite_ext(spr_turret,0,x,y,1,1,turret_angle,c_white,1);
scr_get_range(x, y, range);
draw_circle(x,y,range + barrel_length, c_white);

//draw_circle_color(next_x , next_y, 12, c_red, c_red, true);
//draw_line_color(x,y, next_x, next_y, c_purple,c_maroon);


//track marks
my_emitter = part_emitter_create(tracks);
var tr_os = 1;
var rand_x = irandom_range(-tr_os, tr_os)
var x_pos = x+lengthdir_x(rand_x, -phy_rotation);
var y_pos = y+lengthdir_y(rand_x, -phy_rotation);
part_emitter_region(
	tracks, my_emitter,
	x_pos,x_pos,y_pos,y_pos,ps_shape_line,ps_distr_linear);
part_type_direction(tracks, -phy_rotation, -phy_rotation, 0, 0);	
part_emitter_burst(tracks,my_emitter,tracks,5);



//print_data("Player", data_map, 50, 5,c_green,0,0);
ds_map_clear(data_map);


/*
draw_set_color(c_red);

var left_y = y+lengthdir_y(30, -phy_rotation -90 +45*left_dir);
var left_x = x+lengthdir_x(30, -phy_rotation -90 +45*left_dir);
draw_circle(left_x, left_y, 5, false);
var right_y = y+lengthdir_y(30,-phy_rotation +90 -45*right_dir);
var right_x = x+lengthdir_x(30, -phy_rotation +90 -45*right_dir);
draw_circle(right_x, right_y, 5, false);*/
/*
for (i = 0; i<4; i++){
	var xm = x+lengthdir_x(40,direction+(i*90));
	var ym = y+lengthdir_y(40,direction+(i*90));
	
	var xc = x+lengthdir_x(57,direction +45 +(i*90));
	var yc = y+lengthdir_y(57,direction  +45 +(i*90));
	
	draw_circle_color(xc,yc,2,c_yellow, c_red, false);
	draw_circle_color(xm,ym,2,c_yellow, c_red, false);
	
}

*/


/*
for (i = 0; i<4; i++){
	var x1 = x+lengthdir_x(46,image_angle +45 +(i*90));
	var y1 = y+lengthdir_y(46,image_angle  +45 +(i*90));
	var x2 = x+lengthdir_x(46,image_angle +45 +90 +(i*90));
	var y2 = y+lengthdir_y(46,image_angle  +45 +90 +(i*90));
	draw_line_color(x1, y1, x2,y2, c_red, c_red);
	
	var x2 = x1+lengthdir_x(5,image_angle +45 +(i*90));
	var y2 = y1+lengthdir_y(5,image_angle  +45 +(i*90));	
	draw_line_color(x1, y1, x2,y2, c_red, c_red);	
}

