/// @description 绘制

if(!surface_exists(surf))
	surf = surface_create(viewW(), viewH());

surface_set_target(surf);
draw_clear_alpha(c_black, 0);
with(oStar) {	//接管oStar绘制
	// 如果是别的方式（如自写draw_self等）或者没有视野跟随，就不用改x和y
	x -= viewX();
	y -= viewY();
	draw_self();
	x += viewX();
	y += viewY();
}
for(var i = 0; i < 6; i++) {	//画一些圆用于演示遮罩效果
	var rot = i / 6 * 360 + t;
	//由于要跟随视野，因此这里与前几个不同的是，要减去视野坐标
	draw_circle_color(x + 48 * dcos(rot) - viewX(), y + 48 * dsin(rot) - viewY(), 4, c_yellow, c_yellow, false);
}
surface_reset_target();

//绘制网格（仅用于演示中便于观察位置）
var startx = floor(viewX() / 256) * 256, endx = ceil((viewX() + viewW()) / 256) * 256;
var starty = floor(viewY() / 256) * 256, endy = ceil((viewY() + viewH()) / 256) * 256;
draw_set_color(c_blue)
for(var xx = startx; xx < endx; xx += 256)
	draw_line(xx, starty, xx, endy);
for(var yy = starty; yy < endy; yy += 256)
	draw_line(startx, yy, endx, yy)
draw_set_color(c_white);

poly.replaceSurfaceAlpha(surf, -viewX(), -viewY());	//使用遮罩
drawSurfaceStrokeColor(surf, viewX(), viewY(), c_white);	//把遮罩结果和框画出来
draw_circle_color(x, y, 6, c_red, c_red, false);


