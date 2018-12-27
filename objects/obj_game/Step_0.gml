/// @description Insert description here
// You can write your code in this editor
if(keyboard_check_pressed(vk_f1)){
	if(window_get_fullscreen() == true){
		window_set_fullscreen(false);
	} else {
		window_set_fullscreen(true);
	}
}

if(keyboard_check_pressed(vk_escape)){
	game_end();
}

if(keyboard_check_pressed(vk_enter)){
	room_restart();
}
