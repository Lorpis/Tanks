/// @description Insert description here
// You can write your code in this editor
self.data_map = ds_map_create()
self.unit_height = 30;
self.unit_health = 200;
self.trg_x = 0;
self.trg_y = 0;

self.planner = instance_create_layer(x,y,"Instances",obj_path_planner);
planner.follower = id;
self.target_x = 0;
self.target_y = 0;


self.xos = 0;
self.yos = 30;

self.max_force = 600;
self.yforce = 0;







/*
motion_add(point_direction(x,y,planner.x,planner.y),1)
if(speed >4){
	speed = 4
}
target_x = obj_target.x;
target_y = obj_target.y;

with(planner){
	x = follower.x;
	y = follower.y;
	scr_plan(other.target_x, other.target_y);
}