/// @description Insert description here
// You can write your code in this editor

x += (keyboard_check(vk_right) - keyboard_check(vk_left)) * 6;
y += (keyboard_check(vk_down) - keyboard_check(vk_up)) * 6;

if(!polygon.contains(x, y)) {
	var pos = polygon.limit(x, y);
	x = pos[0];
	y = pos[1];
}