/// @description 绘制

if(!surface_exists(surf))
	surf = surface_create(viewW(), viewH());

surface_set_target(surf);
draw_clear_alpha(c_black, 0);
for(var i = 0; i < 6; i++) {	//画一些圆用于演示遮罩效果
	var rot = i / 6 * 360 + t;
	draw_circle_color(x + 48 * dcos(rot), y + 48 * dsin(rot), 4, c_yellow, c_yellow, false);
}
surface_reset_target();

poly.replaceSurfaceAlpha(surf, viewX(), viewY());	//使用遮罩
drawSurfaceStrokeColor(surf, viewX(), viewY(), c_white);	//把遮罩结果和框画出来
draw_circle_color(x, y, 6, c_red, c_red, false);


