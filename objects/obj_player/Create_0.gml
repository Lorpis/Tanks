/// @description Insert description here
// You can write your code in this editor

//for printing data on screen
self.data_map = ds_map_create();
//track direction: positive, negative, or 0
self.left_dir = 0;
self.right_dir = 0;

self.tracks = global.partsys_tracks;
init_particles();
//added
self.unit_height = 17;
self.rated_acc = .1;
self.turn_spd = 2;
self.max_speed = 5;
self.bullet_speed = 5;
self.vertical_deg = 0;
self.turret_delta_angle = 0;
self.turret_spd = 5;
self.barrel_height = 16;
self.barrel_angle_max = 30;//degrees
self.barrel_angle_min = -5;//degrees
self.unit_health = 100;
self.barrel_length = 50;
self.range = scr_get_range(vertical_deg, bullet_speed, barrel_height);
self.next_x = 0;
self.next_y = 0;