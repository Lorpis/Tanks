///plan(target_x, target_y)
///@param target_x
///@param target_y

target_x = argument0;
target_y = argument1;

mp_grid_path(global.grid, self.path, x, y, target_x ,target_y, true);
path_start(path,5,path_action_stop, true);