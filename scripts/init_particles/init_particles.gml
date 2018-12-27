global.partsys_tracks = part_type_create();
var track = global.partsys_tracks;
part_type_sprite(track,spr_tracks,false, false,true);// randomly grabs frames
part_type_size(track,1,1,0,0);// size start range and transision
part_type_orientation(track,0,0,0,0,true);
part_type_colour1(track, c_black);
part_type_alpha1(track, .01);
//part_type_alpha3(track,.1,.05 ,0);
part_type_life(track,480,480);

/*
global.p1 = part_type_create();
part_type_sprite(global.p1 , spr_Coins, 1, 0, 0);
part_type_size(global.p1, 1, 3, 0, 0);
part_type_scale(global.p1, 1, 1);
part_type_colour1(global.p1, c_white);
part_type_alpha2(global.p1, 1, 0);
part_type_speed(global.p1, 2, 4, 0, 0);
part_type_direction(global.p1, 0, 180, 0, 0);
part_type_gravity(global.p1, 0.20, 270);
part_type_orientation(global.p1, 0, 0, 0, 0, 1);
part_type_blend(global.p1, 1);
part_type_life(global.p1, 15, 60);