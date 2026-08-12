extends Node2D

@onready var animation = $animation

func _ready() -> void:
	z_index += 1
	animation.pause()

func explodir():
	animation.play()

func _on_animation_animation_finished() -> void:
	queue_free()
