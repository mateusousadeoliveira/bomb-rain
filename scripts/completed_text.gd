extends Label

var tween = create_tween()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	modulate.a = 0
	set("theme_override_colors/font_shadow_color",Color(0,0,0,0.5))
func text_completed():
	visible = true
	tween = create_tween().tween_property(self,"modulate:a",1,0.35)
	await get_tree().create_timer(1.85).timeout
	tween = create_tween().tween_property(self,"modulate:a",0,0.35)

	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
