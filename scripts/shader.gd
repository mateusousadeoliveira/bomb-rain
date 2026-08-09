extends AnimatedSprite2D

func ghosting(flip):
	flip_h = flip
	var tween = create_tween()
	tween.tween_property(self,"modulate:a",0,0.2)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
