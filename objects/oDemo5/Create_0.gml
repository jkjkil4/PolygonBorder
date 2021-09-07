/// @description 初始化
// 注：该示例中设定了视野跟随oDemo5（在rDemo5中设定的）

surf = surface_create(viewW(), viewH());

camera_set_view_pos(view_camera[0], 30, 30);

//多边形框
poly = instance_create_depth(0, 0, 0, oPolygonBorder);
ds_list_add(
    poly.listVertex,
    [50, 50], [400, 50], [400, 600], [1800, 600],
    [1800, 700], [400, 700], [400, 1500],
    [300, 1500], [300, 150], [50, 150]
    );
poly.updateDivide();
poly.isAutoDrawBorder = false;

//用于演示
t = 0;
