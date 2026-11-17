extends AnimatedSprite2D

var rotation_tween: Tween
var position_tween: Tween

func _ready() -> void:
	z_index = 2

func _process(_delta: float) -> void:
	if !global.is_live:
		visible = true
		if rotation_tween == null:
			visible = true
			rotation_tween = create_tween().set_loops()
			position_tween = create_tween()
			rotation_tween.set_trans(Tween.TRANS_SINE)
			rotation_tween.set_ease(Tween.EASE_IN_OUT)
			position_tween.tween_property(self,"position:y",230,0.5)
			rotation_tween.tween_property(self, "rotation_degrees", 15.5, 2)
			rotation_tween.tween_property(self, "rotation_degrees", -15.5, 2)
	else:
		if rotation_tween != null:
			rotation_tween.kill()
			rotation_tween = null
			visible = false
			rotation_degrees = 0
