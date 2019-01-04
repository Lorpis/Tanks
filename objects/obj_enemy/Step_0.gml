
if(mouse_check_button_pressed(mb_left)){
	trg_x = window_views_mouse_get_x();
	trg_y = window_views_mouse_get_y();
}

window_views_mouse_get_x()

direction = scr_360(-phy_rotation);
var trg_angle = point_direction(x,y,planner.x,planner.y);
var angle_diff = angle_difference(direction, trg_angle);

var haxis = dsin(angle_diff);
var vaxis = -dsin(90+angle_diff);
scr_mv_tank(haxis, vaxis);

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


ds_map_add(data_map, "direction", direction);
ds_map_add(data_map, "trg_angle", trg_angle);
ds_map_add(data_map, "trg_diff", angle_diff );