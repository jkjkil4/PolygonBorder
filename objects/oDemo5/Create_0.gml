/// @description 初始化

//多边形框
poly = instance_create_depth(0, 0, 0, oPolygonBorder);
ds_list_add(
    poly.listVertex,
    [50, 50], [400, 50], [400, 600], [1200, 600],
    [1200, 700], [400, 700], [400, 1200],
    [300, 1200], [300, 150], [50, 150]
    );
poly.updateDivide();
poly.isAutoDrawBorder = false;

//用于演示
t = 0;
