extends VBoxContainer

var already_completed = false
@onready var locked = $locked as AnimatedSprite2D
@onready var text = $completed_text as Label
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
func completed():
	if already_completed == false:
		locked.play_animation()
		text.text_completed()
		already_completed = true
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
