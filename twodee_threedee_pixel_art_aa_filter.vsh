/* t3ssel8r's aa vertex shader from here https://www.youtube.com/watch?v=d6tp43wZqps */
attribute vec3 in_Position;
attribute vec4 in_Colour;
varying vec4 vertex_color;
attribute vec2 in_TexCoord;

varying vec2 texture_coordinate;
varying vec4 vertex_color;

void main()	{
	vec4 position = vec4(in_Position.xyz, 1.0);
	gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * position;
	texture_coordinate = in_TexCoord;
	vertex_color = in_Colour;
}