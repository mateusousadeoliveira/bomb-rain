extends AnimatedSprite2D

func ghosting(flip):
	flip_h = flip
	var tween = create_tween()
	tween.tween_property(self,"modulate:a",0,0.2)
	
func _ready() -> void:
	visible = false
