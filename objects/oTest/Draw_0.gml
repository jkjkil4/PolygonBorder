//没写当surface凭空消失时的处理代码

//原本的绘制
surface_set_target(surf);
draw_clear_alpha(c_black, 0);
draw_circle_color(x, y, 6, c_red, c_red, false);
surface_reset_target();

poly1.replaceSurfaceAlpha(surf);	//遮罩
poly2.replaceSurfaceAlpha(surf, 0, 0, false);

drawSurfaceStrokeColor(surf, 0, 0, c_white); //绘制surface和边框

