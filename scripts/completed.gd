extends VBoxContainer

var already_completed = false
@onready var locked = $locked as AnimatedSprite2D
@onready var text = $completed_text as Label

func completed():
	if already_completed == false:
		locked.play_animation()
		text.text_completed()
		already_completed = true
	
