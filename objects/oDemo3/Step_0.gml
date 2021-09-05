/// @description 区域限制和杂项

x += 6 * (keyboard_check(vk_right) - keyboard_check(vk_left));
y += 6 * (keyboard_check(vk_down) - keyboard_check(vk_up));

//如果有较多的框的话，应用循环遍历（见Demo4），而不是像这样列举
if(!poly1.contains(x, y) && !poly2.contains(x, y)) {	//如果不在任何框内部
	var pos1 = poly1.limit(x, y), pos2 = poly2.limit(x, y);	//分别得到与两框的最近位置
	
	//分别得到与两框的最近距离
	var dis1 = point_distance(x, y, pos1[0], pos1[1]);
	var dis2 = point_distance(x, y, pos2[0], pos2[1]);
	
	//这句代码的意思是：如果dis1 < dis2，那么结果是pos1，否则是pos2
	var result = (dis1 < dis2 ? pos1 : pos2);
	x = result[0];
	y = result[1];
}

//用于演示
t += 4;
t %= 360;

