extends Container

var tween = create_tween()

func _ready() -> void:
	visible = true
	tween.tween_property(self,"modulate:a",0,0.5)
	
func translition():
	var fade_in = create_tween()
	fade_in.tween_property(self,"modulate:a",1,0.5)
	await fade_in.finished
	var fade_out = create_tween()
	fade_out.tween_property(self,"modulate:a",0,0.5)
	await fade_out.finished
