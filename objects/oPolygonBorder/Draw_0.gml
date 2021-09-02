/// @description 绘制

if(isAutoDrawBorder)
	drawBorder();

/*var size = ds_list_size(listDivideIndex);
draw_set_alpha(0.3);
for(var i = 0; i < size; i++) {
	var di = listDivideIndex[| i];
	var t = i / (size - 1);
	draw_set_color(make_color_rgb(255 * (1 - t), 255 * t, 0));
	draw_primitive_begin(pr_trianglelist);
	for(var j = 0; j < 3; j++) {
		var pos = listVertex[| di[j]];
		draw_vertex(pos[0], pos[1]);
	}
	draw_primitive_end();
}
draw_set_color(c_white);
draw_set_alpha(1);*/

/*draw_set_color(c_aqua);
function drawIndexLine(di1, di2) {
	var a = listVertex[| di1], b = listVertex[| di2];
	draw_line_width(x + a[0], y + a[1], x + b[0], y + b[1], 2);
}
for(var i = 0; i < ds_list_size(listDivideIndex); i++) {
	var di = listDivideIndex[| i];
	drawIndexLine(di[0], di[1]);
	drawIndexLine(di[1], di[2]);
	drawIndexLine(di[2], di[0]);
}
draw_set_color(c_white);*/
