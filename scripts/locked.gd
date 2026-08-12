extends AnimatedSprite2D



# Called when the node enters the scene tree for the first time.
func play_animation():
	visible = true
	
	var tween_fade_in = create_tween()
	tween_fade_in.tween_property(self,"modulate:a",1,0.35)
	await tween_fade_in.finished
	
	play("unlocked")
	
	await get_tree().create_timer(1.5).timeout
	var tween_fade_out = create_tween()
	tween_fade_out.tween_property(self,"modulate:a",0,0.35)
	await tween_fade_out.finished
	
func _ready() -> void:
	modulate.a = 0.0
