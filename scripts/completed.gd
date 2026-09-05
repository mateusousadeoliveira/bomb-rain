extends VBoxContainer


@onready var locked = $locked as AnimatedSprite2D
@onready var text = $completed_text as Label

func completed():
	if global.already_completed == false:
		locked.play_animation()
		text.text_completed()
		global.already_completed = true
	
