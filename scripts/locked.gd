extends AnimatedSprite2D

var tween = create_tween()

# Called when the node enters the scene tree for the first time.
func play_animation():
	visible = true
	tween = create_tween().tween_property(self,"modulate:a",1,0.35)
	await tween.finished
	play("locked")
	await get_tree().create_timer(1.5).timeout
	tween = create_tween().tween_property(self,"modulate:a",0,0.35)
func _ready() -> void:
	modulate.a = 0.0
