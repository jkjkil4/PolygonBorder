/// @description Insert description here
// You can write your code in this editor

x += (keyboard_check(vk_right) - keyboard_check(vk_left)) * 6;
y += (keyboard_check(vk_down) - keyboard_check(vk_up)) * 6;

//如有较多多边形的话应使用循环而不是逐个列举
if(!poly1.contains(x, y) && !poly2.contains(x, y)) {
	var pos1 = poly1.limit(x, y);
	var pos2 = poly2.limit(x, y);
	var dis1 = point_distance(x, y, pos1[0], pos1[1]);
	var dis2 = point_distance(x, y, pos2[0], pos2[1]);
	var result = (dis1 > dis2 ? pos2 : pos1);
	x = result[0];
	y = result[1];
}