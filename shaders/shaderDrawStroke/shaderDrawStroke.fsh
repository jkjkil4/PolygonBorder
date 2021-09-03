//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 v_vSurfaceSize;
uniform vec3 v_vStrokeColor;

void main()
{
	vec4 resultColor = texture2D(gm_BaseTexture, v_vTexcoord);
	if(resultColor.a == 0.0) {
		resultColor.rgb = v_vStrokeColor;
	
		float offset = 6.0;
		float a1 = texture2D(gm_BaseTexture, v_vTexcoord + vec2(0.7, 0.7) / v_vSurfaceSize * offset).a;
		float a2 = texture2D(gm_BaseTexture, v_vTexcoord + vec2(1, 0) / v_vSurfaceSize * offset).a;
		float a3 = texture2D(gm_BaseTexture, v_vTexcoord + vec2(0.7, -0.7) / v_vSurfaceSize * offset).a;
		float a4 = texture2D(gm_BaseTexture, v_vTexcoord + vec2(0, 1) / v_vSurfaceSize * offset).a;
		float a5 = texture2D(gm_BaseTexture, v_vTexcoord + vec2(0, -1) / v_vSurfaceSize * offset).a;
		float a6 = texture2D(gm_BaseTexture, v_vTexcoord + vec2(-0.7, 0.7) / v_vSurfaceSize * offset).a;
		float a7 = texture2D(gm_BaseTexture, v_vTexcoord + vec2(-1, 0) / v_vSurfaceSize * offset).a;
		float a8 = texture2D(gm_BaseTexture, v_vTexcoord + vec2(-0.7, -0.7) / v_vSurfaceSize * offset).a;
		resultColor.a = max(a1, max(a2, max(a3, max(a4, max(a5, max(a6, max(a7, a8)))))));
	}
	
    gl_FragColor = v_vColour * resultColor;
}
