
function drawSurfaceStrokeColor(_surf, _x, _y, _color) {
	var uSurfaceSize = shader_get_uniform(shaderDrawStroke, "v_vSurfaceSize");
	var uColor = shader_get_uniform(shaderDrawStroke, "v_vStrokeColor");
	shader_set(shaderDrawStroke);
	shader_set_uniform_f_array(uSurfaceSize, [surface_get_width(_surf), surface_get_height(_surf)]);
	shader_set_uniform_f_array(uColor, [color_get_red(_color) / 255, color_get_green(_color) / 255, color_get_blue(_color) / 255]);
	draw_surface(_surf, _x, _y);
	shader_reset();
}