///print_data(header, data_map, x1, y1, (optional -->)header_color, box_color, text_color)
///@param "header"
///@param data_map
///@param x1
///@param y1
///@param c_opt->none/0_head_color
///@param box_color
///@param text_color

var header = argument[0];
var map = argument[1];
var x1 = argument[2];
var y1 = argument[3];

var header_col = c_blue;
var box_col = c_white;
var text_col = c_black;

if(argument_count > 4){
	if(argument[4]!=0){var header_col = argument[4];}
    if(argument[5]!=0){var box_col = argument[5];}
	if(argument[6]!=0){var text_col = argument[6];}
} 

// print format variables
var lines = 0;
var linespace = 20;
var margin = 5;
var shade_os = 10;
var box_width = string_width(header)+(margin*2);
var text_x = x1 + margin;
var text_y = y1 + margin;
data_string[0] = 0;

//creates string data and sets box size  
for (var k = ds_map_find_first(map); !is_undefined(k); k = ds_map_find_next(map, k)) {
	var v = map[? k];
	var data = k + ": " + string(v)
	if(box_width < string_width(data)){box_width = string_width(data)+(margin*2)};
	data_string[lines] = data;	
	lines+=1;
}
/***********************boxes*****************************/
var x2 = x1+box_width;// setting box width 
var y2 = y1 +(margin*2) +(linespace*(lines+1));//setting height + header

		/***box shadow***/
draw_set_color(c_black);
draw_rectangle(x1 +shade_os, y1 +shade_os, x2 +shade_os, y2 +shade_os,false);
		
		/***box***/
draw_set_color(box_col);
draw_rectangle(x1,y1,x2,y2,false);
		
		/***header highlight***/
y2 = y1 +(margin*2) +linespace;//just 1 linespace for header box
draw_set_color(header_col);
draw_rectangle(x1,y1,x2,y2,false);

/******************************Text*********************************/
draw_set_color(text_col);

		/***print header***/
draw_text(text_x, text_y, header);

		/***print data***/
text_y += margin;
for (i=0;i< array_length_1d(data_string);i++){
	data = data_string[i];
	draw_text(text_x, text_y +(linespace*(1+i)) ,data);// skiping over header
}