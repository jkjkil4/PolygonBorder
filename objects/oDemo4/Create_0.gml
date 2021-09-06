/// @description 初始化

surf = surface_create(viewW(), viewH());
var cx = viewW() / 2, cy = viewH() / 2;

//四个圆形框
circle1 = instance_create_depth(cx - 200, cy - 200, 0, oCircleBorder);
circle2 = instance_create_depth(cx + 200, cy - 200, 0, oCircleBorder);
circle3 = instance_create_depth(cx - 200, cy + 200, 0, oCircleBorder);
circle4 = instance_create_depth(cx + 200, cy + 200, 0, oCircleBorder);

//中间的多边形框
poly = instance_create_depth(cx, cy, 0, oPolygonBorder);
ds_list_add(
	poly.listVertex,
	[-70, -70], [-40, -70], [-40, -280], [40, -280], 
	[40, -70], [70, -70], [70, 70], [40, 70],
	[40, 280], [-40, 280], [-40, 70], [-70, 70]
	);
poly.updateDivide();
poly.isAutoDrawBorder = false;
poly.rotSpeed = 2;

//包含所有边框的列表，方便遍历，或者用其他合适的方式也可以
borders = [circle1, circle2, circle3, circle4, poly];
borderCount = array_length(borders);

//用于演示
t = 0;
