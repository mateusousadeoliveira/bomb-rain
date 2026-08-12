extends Label




func _ready() -> void:
	modulate.a = 0
	set("theme_override_colors/font_shadow_color",Color(0,0,0,0.5))
	
func text_completed():
	visible = true
	await get_tree().process_frame
	
	var tween_fade_in = create_tween()
	tween_fade_in.tween_property(self,"modulate:a",1,0.35)
	await tween_fade_in.finished
	
	await get_tree().create_timer(1.5).timeout
	
	var tween_fade_out = create_tween()
	tween_fade_out.tween_property(self,"modulate:a",0,0.35)
	await tween_fade_out.finished
