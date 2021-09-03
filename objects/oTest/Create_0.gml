surf = surface_create(camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]));
poly1 = instance_create_depth(200, 200, 0, oPolygonBorder);
poly1.isAutoDrawBorder = false;
poly2 = instance_create_depth(0, 0, 0, oMovingPolygonBorder);
poly2.isAutoDrawBorder = false;