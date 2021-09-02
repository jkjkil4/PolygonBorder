//没写当surface凭空消失时的处理代码

//原本的绘制
surface_set_target(surf);
draw_clear_alpha(c_black, 0);

surface_reset_target();

polygon.replaceSurfaceAlpha(surf);	//遮罩
draw_surface(surf, 0, 0);	//绘制遮罩结果
polygon.drawBorder();	//绘制边框
draw_circle_color(x, y, 6, c_red, c_red, false);