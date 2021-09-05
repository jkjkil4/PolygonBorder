/// @description 区域限制和杂项

x += 6 * (keyboard_check(vk_right) - keyboard_check(vk_left));
y += 6 * (keyboard_check(vk_down) - keyboard_check(vk_up));

//检测并限制
if(!poly.contains(x, y)) {
	var pos = poly.limit(x, y);
	x = pos[0];
	y = pos[1];
}

//用于演示
t += 4;
t %= 360;

