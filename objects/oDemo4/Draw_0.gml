/// @description 绘制

if(!surface_exists(surf))	//当surf凭空消失时的处理代码
	surf = surface_create(viewW(), viewH());

surface_set_target(surf);
draw_clear_alpha(c_black, 0);	//清空surf
for(var i = 0; i < 6; i++) {	//画一些圆用于演示遮罩效果
	var rot = i / 6 * 360 + t;
	draw_circle_color(x + 48 * dcos(rot), y + 48 * dsin(rot), 4, c_yellow, c_yellow, false);
}
surface_reset_target();

for(var i = 0; i < borderCount; i++)	//遍历所有框，应用遮罩效果
	borders[i].replaceSurfaceAlpha(surf, 0, 0, i == 0);
drawSurfaceStrokeColor(surf, 0, 0, c_white);	//把遮罩结果和框画出来
draw_circle_color(x, y, 6, c_red, c_red, false);	//画自己
