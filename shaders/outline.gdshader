shader_type canvas_item;

uniform vec4 color : source_color = vec4(1.0, 1.0, 1.0, 1.0);
uniform float width : hint_range(0.0, 10.0) = 1.0;

varying vec4 modulate_color;

void vertex() {
    VERTEX += sign(VERTEX) * width;
    modulate_color = COLOR; 
}

void fragment() {
    vec2 size = TEXTURE_PIXEL_SIZE * width;
    float alpha = texture(TEXTURE, UV).a;
    
    float max_alpha = alpha;
    max_alpha = max(max_alpha, texture(TEXTURE, UV + vec2(size.x, 0.0)).a);
    max_alpha = max(max_alpha, texture(TEXTURE, UV + vec2(-size.x, 0.0)).a);
    max_alpha = max(max_alpha, texture(TEXTURE, UV + vec2(0.0, size.y)).a);
    max_alpha = max(max_alpha, texture(TEXTURE, UV + vec2(0.0, -size.y)).a);
    
    vec4 original_color = texture(TEXTURE, UV);
    vec3 final_rgb = mix(color.rgb, original_color.rgb, original_color.a);
    
    COLOR = vec4(final_rgb, max_alpha * color.a) * modulate_color;
}