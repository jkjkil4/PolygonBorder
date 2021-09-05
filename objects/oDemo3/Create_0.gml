/// @description 初始化

surf = surface_create(viewW(), viewH());

var xx = viewW() / 2, yy = viewH() / 2;

//在中间转的框
poly1 = instance_create_depth(xx, yy, 0, oPolygonBorder);
ds_list_add(
	poly1.listVertex,
	[-70, -70], [-40, -70], [-40, -250], [40, -250], 
	[40, -70], [70, -70], [70, 70], [40, 70],
	[40, 250], [-40, 250], [-40, 70], [-70, 70]
	);
poly1.updateDivide();
poly1.isAutoDrawBorder = false;
poly1.rotSpeed = 3;

//在外面转的框
poly2 = instance_create_depth(xx, yy, 0, oPolygonBorder);
ds_list_add(
	poly2.listVertex,
	[-100, -250], [100, -250], [100, -200], [-100, -200]
	);
poly2.updateDivide();
poly2.isAutoDrawBorder = false;
poly2.rotSpeed = 1.5;

//用于演示
t = 0;
