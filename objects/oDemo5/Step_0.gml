/// @description 步

x += 6 * (keyboard_check(vk_right) - keyboard_check(vk_left));
y += 6 * (keyboard_check(vk_down) - keyboard_check(vk_up));

if(!poly.contains(x, y)) {
    var pos = poly.limit(x, y);
    x = pos[0];
    y = pos[1];
}

//用于演示
t += 4;
t %= 360;
