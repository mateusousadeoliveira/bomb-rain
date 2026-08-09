extends Node2D

@onready var animation = $animation

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	z_index += 1
	animation.pause()

func explodir():
	animation.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_animation_animation_finished() -> void:
	queue_free()
