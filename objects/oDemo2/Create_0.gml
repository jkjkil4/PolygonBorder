/// @description 初始化
//和Demo1基本一样，不过加了旋转
//一些已在Demo1说明过的不再赘述

surf = surface_create(viewW(), viewH());
poly = instance_create_depth(viewW() / 2, viewH() / 2, 0, oPolygonBorder);
ds_list_add(	//添加顶点
	poly.listVertex, 
	[-150, -100], [150, -100], [150, 0], [50, 0],
	[50, 100], [-50, 100], [-50, 0], [-150, 0]
	);
poly.updateDivide();	//更新遮罩
poly.isAutoDrawBorder = false;	//不自动绘制框
poly.rotSpeed = 3;	//每步转3度

//用于演示
t = 0;
