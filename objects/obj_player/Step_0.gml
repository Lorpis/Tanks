/// @description Insert description here
// You can write your code in this editor


my_emitter = part_emitter_create(tracks);
part_emitter_region(
	tracks,my_emitter,
	x,x,y,y,ps_shape_line,ps_distr_invgaussian);


x=clamp(x, 0, room_width-32);
y=clamp(y, 0, room_height+32);
// position offset and force vector is relative to object at 0 degrees and changes with rotation
//automaticaly

left_dir = 0;
right_dir = 0;
var xos = 0;
var yos = 30;

var max_force = 600;
var yforce = 0;

//************************using physics engine attempt 2******************************
						//******using pure physics on controller*****//
						
var device_num =0;// manual device indexing
if gamepad_is_connected(0) gamepad_set_axis_deadzone(0, 0.1);

//controler inputs
var lvaxis = gamepad_axis_value(device_num, gp_axislv);
var lhaxis = gamepad_axis_value(device_num, gp_axislh);
var rvaxis = gamepad_axis_value(device_num, gp_axisrv);
var rhaxis = gamepad_axis_value(device_num, gp_axisrh);
var input_spd = max_force*lvaxis;
var lt = 0;
var rt = 0;
//if(!scr_is_between(0,0.1,lvaxis) or !scr_is_between(0, 0.1,lhaxis)){
	//Move tank -> left thumbstick	
	//left track
var m1 = (-max_force + (input_spd*-sign(lhaxis)));
lt = m1*(lhaxis) + input_spd;

	//right trackS
var m2 = (max_force + (input_spd*-sign(lhaxis)));
rt = m2*(lhaxis) + input_spd;
	//move		
physics_apply_local_force(xos,-yos, -lt, yforce);
physics_apply_local_force(xos,yos, -rt , yforce);
//}

//turn turret -> right thumbstick horizontal rotatates the turrets respectivly.
var trn_turret = -rhaxis;
turret_delta_angle += trn_turret*turret_spd;

//set rang -> right thumbstick verticle sets barrel angle (range)
var ur_bmpr = gamepad_button_check(device_num,gp_shoulderr);
var lr_bmpr = -gamepad_button_check(device_num,gp_shoulderl);
var mv_barrel =  -rvaxis; 

//range limit check
if(mv_barrel and vertical_deg <= barrel_angle_max){vertical_deg += mv_barrel*0.5;};
if(-mv_barrel and vertical_deg >= barrel_angle_min){vertical_deg += mv_barrel*0.5;};
range = scr_get_range(vertical_deg, bullet_speed, barrel_height);

//fire -> right trigger
var rt_trig = gamepad_button_value(device_num,gp_shoulderrb)
if(rt_trig >= 0.5) scr_make_bullet(self);







//************************using physics engine attempt 2******************************///
						//******using pure physics on keyboard******//
if(keyboard_check(vk_anykey)){//key event check



	var left_fwd = keyboard_check(ord("Q"));
	var left_bck = -keyboard_check(ord("A"));
	
	var right_fwd = keyboard_check(ord("E"));
	var right_bck = -keyboard_check(ord("D"));
	
	left_dir = left_fwd + left_bck;
	right_dir = right_fwd + right_bck;
	physics_apply_local_force(xos,yos, max_force*left_dir, yforce);
	physics_apply_local_force(xos,-yos, max_force*right_dir, yforce);
	
}




//**************************turret and round**********************************///

if(unit_health <= 0){
	instance_destroy()
}
draw_self();

x=clamp(x, 0, room_width-32);
y=clamp(y, 0, room_height+32);

turret_angle = -phy_rotation + turret_delta_angle;


if(keyboard_check(vk_anykey)){//key event check 
	//fire
	if(keyboard_check_pressed(vk_space)){
		scr_make_bullet(self);
		//scr_make_bullet(x, y, turret_angle, vertical_deg, global.bullet_speed, barrel_length, barrel_height);
	}
	// turn turret
	var trn_right =-keyboard_check(vk_right);
	var trn_left = keyboard_check(vk_left);
	if(trn_left or -trn_right){
		var trn_turret = trn_left + trn_right; // proves one, other, or both
		turret_delta_angle += trn_turret*turret_spd;
	}

	// elevate turret
	var mv_up = keyboard_check(vk_up);
	var mv_down = -keyboard_check(vk_down);
	if(mv_up or -mv_down){
		var mv_barrel = mv_up + mv_down; // proves one, other, or both
		//limit check
		if(mv_barrel and vertical_deg <= barrel_angle_max){vertical_deg += mv_barrel*0.1;};
		if(-mv_barrel and vertical_deg >= barrel_angle_min){vertical_deg += mv_barrel*0.1;};
		range = scr_get_range(vertical_deg, bullet_speed, barrel_height);
	}

	if(keyboard_check_pressed(vk_shift)){
		speed = 0;
	}
}























//************************using physics engine attempt 1************************
					//******using physics for collisions******//
/*
	//turn
	var trn_right =-keyboard_check(ord("D"));
	var trn_left = keyboard_check(ord("A"));
	if(trn_left or -trn_right){
		var turn = trn_right + trn_left; // proves one, other, or both
		physics_apply_angular_impulse(-turn*turn_spd);
		phy_rotation += -turn*turn_spd;
		if keyboard_check_released(ord("D")){phy_rotation += +turn*turn_spd};
		if keyboard_check_released(ord("A")){phy_rotation += +turn*turn_spd};
		phy_angular_velocity = 0;
	}
	
	
	//move
	var mv_fwrd = keyboard_check(ord("W"));
	var mv_back = -keyboard_check(ord("S"));
	if(mv_fwrd or -mv_back){
		var mv_acc = mv_fwrd + mv_back; // proves one, other, or both	
		var current_volocity = phy_speed
		var direct = 0;
		
		if(mv_fwrd and current_volocity < max_speed){//max volocity check
			current_volocity += rated_acc*mv_acc;
			direct = 0;
		
		} else if(-mv_back){		

			if(current_volocity < max_speed){current_volocity -= rated_acc*mv_acc;}
			if(current_volocity > 0){direct =180;}
		}
		if(current_volocity > max_speed){current_volocity = max_speed;}
		ds_map_add(data_map,"current velocity", current_volocity);
		var xf = current_volocity*dsin(phy_rotation + direct);//adjusting vector components
		var yf= current_volocity*dcos(phy_rotation + direct);

		phy_speed_x = xf;
		phy_speed_y = -yf;
		phy_angular_velocity = 0;
	}
	if(keyboard_check_released(ord("W")) or keyboard_check_released(ord("S"))){
		phy_speed_x = 0;
		phy_speed_y = 0;
	}
	
		
} else {
	phy_speed_x = 0;
	phy_speed_y = 0;
	phy_angular_velocity = 0;
}

*/

//variable map used in print_data(). see draw event.
ds_map_add(data_map,"rotation", phy_rotation);
ds_map_add(data_map,"image angle", image_angle);	
ds_map_add(data_map,"x speed", phy_speed_x);	
ds_map_add(data_map,"y speed", phy_speed_y);
ds_map_add(data_map,"speed", phy_speed);



//************************Controls***********************************	
			/*****using manual speed and direction*****/
			/*
	// move forward/reverse
	var mv_fwrd = keyboard_check(ord("W"));
	var mv_back = -keyboard_check(ord("S"));
	if(mv_fwrd or -mv_back){
		var mv_acc = mv_fwrd + mv_back; // proves one, other, or both
		//limit check
		if(mv_acc and speed <= max_speed){speed += mv_acc*rated_acc;};
		if(-mv_acc and speed >= -max_speed){speed += mv_acc*rated_acc;};		
	}

	// turn tank
	var trn_right =-keyboard_check(ord("D"));
	var trn_left = keyboard_check(ord("A"));
	if(trn_left or -trn_right){
		var turn = trn_right + trn_left; // proves one, other, or both
		direction += turn*turn_spd;
		image_angle = direction;
	}
	if(keyboard_check_pressed(vk_shift)){
		speed = 0;
	}
}

//direction correction
if(direction > 359){direction = 0}
if(direction < 0){direction = 359}

//************************collision detection*************************
			//***point array on box corner and midpoints***
/*
for (i = 0; i<4; i++){
	var xm = x+lengthdir_x(40,direction+(i*90));
	var ym = y+lengthdir_y(40,direction+(i*90));
	
	var xc = x+lengthdir_x(57,direction +45 +(i*90));
	var yc = y+lengthdir_y(57,direction  +45 +(i*90));
	
	var mp = collision_point(xm,ym,obj_wall, false, true);
	var cp = collision_point(xc,yc,obj_wall, false, true);
	if(mp or cp ){
	//speed = speed*-1;
	x = x+lengthdir_x(5,direction+180);
	y = y+lengthdir_x(5,direction+180)	
	}
	
}*/

			// ***sqare collision line with corner lines***
/*
for (i = 0; i<4; i++){
	var x1 = x+lengthdir_x(46,direction +45 +(i*90));
	var y1 = y+lengthdir_y(46,direction  +45 +(i*90));
	var x2 = x+lengthdir_x(46,direction +45 +90 +(i*90));
	var y2 = y+lengthdir_y(46,direction  +45 +90 +(i*90));		
	var hit_line = collision_line(x1, y1, x2,y2, all,false, true);
	
	var x2 = x1+lengthdir_x(5,direction +45 +(i*90));
	var y2 = y1+lengthdir_y(5,direction  +45 +(i*90));	
	var hl_corner = collision_line(x1, y1, x2,y2, all,false, true);
	
	if(hit_line != noone or hl_corner != noone){

		//bounce effect
		//speed = speed*-1;
		
		
		//back off effects
		var correction = 1;
		if(direction > 180){correction  = -1;}
		
		x = x+lengthdir_x(5,direction +180*correction);
		y = y+lengthdir_x(5,direction+180*correction);

		speed = 0;	
	}
		
}
ds_map_add(data_map,"direction", direction);
var correction = 1;
if(direction > 180){correction  = -1;}
ds_map_add(data_map,"direction rev", direction+180*correction);


				//***square collision line***
/*
for (i = 0; i<4; i++){
	var x1 = x+lengthdir_x(46,direction +45 +(i*90));
	var y1 = y+lengthdir_y(46,direction  +45 +(i*90));
	var x2 = x+lengthdir_x(46,direction +45 +90 +(i*90));
	var y2 = y+lengthdir_y(46,direction  +45 +90 +(i*90));		
	var hit_line = collision_line(x1, y1, x2,y2, obj_wall,true, true);
	if(hit_line != noone){
	speed = speed*-1;
	}	
}*/




if( keyboard_check(ord("Q"))){
	direction = 0;
	image_angle = direction;
}
	
