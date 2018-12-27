var object_id = argument0

var muzzleX = x + lengthdir_x(barrel_length, turret_angle);
var muzzley = y + lengthdir_y(barrel_length, turret_angle);
var bullet = instance_create_layer(muzzleX,muzzley, "Instances", obj_bullet);

bullet.velocity = bullet_speed;

bullet.speed =  bullet_speed*dcos(vertical_deg);//bullet_x_speed; lat
bullet.direction = turret_angle;
bullet.image_angle = turret_angle;

bullet.vertical_deg = vertical_deg;
bullet.vertical_speed = bullet_speed*dsin(vertical_deg);//bullet_y_speed up in air
bullet.start_height = barrel_height;