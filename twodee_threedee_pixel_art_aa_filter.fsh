/* t3ssel8r's aa fragment shader from here https://www.youtube.com/watch?v=d6tp43wZqps */
varying vec2 texture_coordinate;
varying vec4 vertex_color;
uniform vec2 frame_size;

void main() {
	vec2 filter_size = clamp(fwidth(texture_coordinate) * frame_size, vec2(0.00001, 0.00001), vec2(1.0, 1.0));
	vec2 texel_coordinate = texture_coordinate * frame_size - 0.5 * filter_size;
	vec2 texel_offset = smoothstep(vec2(1.0, 1.0) - filter_size, vec2(1.0, 1.0), fract(texel_coordinate));
	vec2 filtered_texture_coordinate = (floor(texel_coordinate) + vec2(0.5, 0.5) + texel_offset) / frame_size;
	vec4 anti_aliased_color = texture2D(gm_BaseTexture, filtered_texture_coordinate);
	gl_FragColor = vertex_color * anti_aliased_color;
}