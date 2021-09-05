/// @description 区域限制和杂项

x += 6 * (keyboard_check(vk_right) - keyboard_check(vk_left));
y += 6 * (keyboard_check(vk_down) - keyboard_check(vk_up));

if(!poly.contains(x, y)) {	//用contains判断是否在poly内
	//如果不在poly内则调用limit得到目标位置
	var pos = poly.limit(x, y);
	x = pos[0];
	y = pos[1];
}

//用于演示
t += 4;
t %= 360;

