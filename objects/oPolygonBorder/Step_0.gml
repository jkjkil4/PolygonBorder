/// @description Insert description here
// You can write your code in this editor
if(mouse_check_button_pressed(mb_left))
	ds_list_add(listVertex, [mouse_x - x, mouse_y - y]);

if(keyboard_check_pressed(vk_space))
	updateDivide();