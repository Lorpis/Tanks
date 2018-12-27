/// @description Insert description here
// You can write your code in this editor

// bullet trajectory
time += 1;
x += lengthdir_x(speed,direction);
y += lengthdir_y(speed,direction);


var height = vertical_speed*time;
var grav = 0.5*global.acc*sqr(time);
current_height = (height + grav + start_height);
if(current_height <= 0){
	instance_destroy(self);
}
ds_map_add(bullet_data,"height", current_height);
ds_map_add(bullet_data,"speed", speed);
image_xscale = (current_height/50)+1;
image_yscale = (current_height/50)+1;

// enemy collision
var next_x = x + lengthdir_x(speed, direction);
var next_y = y + lengthdir_y(speed, direction);
var collision = place_meeting(next_x, next_y, obj_enemy);
if(collision){
	var instance = instance_nearest(x,y,obj_enemy);
	if(current_height < instance.unit_height){
		instance.unit_health -= 50;
		image_index = 1;
		speed = 0
		explode = true;
		time = 0;
	}
}
	
if(explode){
	image_xscale = 4*dsin(time*12);
	image_yscale = 4*dsin(time*12);
	image_angle = 359*dsin(time*12);
	image_alpha = (1- (time/15))*1;
	if(time == 15){
		explode = false; 
		instance_destroy()
	}
}
