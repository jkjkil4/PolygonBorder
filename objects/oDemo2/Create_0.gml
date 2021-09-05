/// @description 初始化
//和Demo1基本一样，不过加了旋转

surf = surface_create(viewW(), viewH());	//创建表面，用于遮罩
poly = instance_create_depth(viewW() / 2, viewH() / 2, 0, oPolygonBorder);	//多边形
ds_list_add(	//添加顶点（添加的每个是顶点的坐标，不是很直观）
	poly.listVertex, 
	[-150, -100], [150, -100], [150, 0], [50, 0],
	[50, 100], [-50, 100], [-50, 0], [-150, 0]
	);
poly.updateDivide();	//添加顶点后要更新遮罩（如果要弄遮罩的话）
poly.isAutoDrawBorder = false;	//设定不自动绘制框
poly.rotSpeed = 3;	//每步转3度

//用于演示
t = 0;
