/// @description 绘制

if(!surface_exists(surf))	//当surf凭空消失时的处理代码
	surf = surface_create(viewW(), viewH());

surface_set_target(surf);	//设置在surf上绘制，画在surf上的就可以应用遮罩
draw_clear_alpha(c_black, 0);	//清空surf
for(var i = 0; i < 6; i++) {	//画一些圆用于演示遮罩效果
	var rot = i / 6 * 360 + t;
	draw_circle_color(x + 48 * dcos(rot), y + 48 * dsin(rot), 4, c_yellow, c_yellow, false);
}
surface_reset_target();	//重设回屏幕上绘制

poly.replaceSurfaceAlpha(surf);	//使用遮罩
drawSurfaceStrokeColor(surf, 0, 0, c_white);	//把遮罩结果和框画出来，如果不用遮罩的话，也可以用下面注释的两行
//draw_surface(surf, 0, 0);
//poly.drawBorder();
draw_circle_color(x, y, 6, c_red, c_red, false);	//画自己（写在这里不被遮罩影响）
