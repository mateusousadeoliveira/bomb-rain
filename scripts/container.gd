extends Container

func _ready() -> void:
	visible = true
	var _tween = create_tween().tween_property(self,"modulate:a",0,0.5)
	
func translition():
	var _tween = create_tween().tween_property(self,"modulate:a",1,0.5)
