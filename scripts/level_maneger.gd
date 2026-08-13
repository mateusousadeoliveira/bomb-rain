extends Node2D
@onready var levels_screen: Array = [
	preload("res://cenas/levels/level_01.tscn"),
	preload("res://cenas/levels/level_02.tscn")]

func _ready() -> void:
	var selected_level = levels_screen[global.actual_level-1]
	var level = selected_level.instantiate()
	add_child(level)
	level.global_position = Vector2(-500,-200)
	level.scale.x = 1.75
	
func next_level():
	var selected_level = levels_screen[global.actual_level-1]
	var level = selected_level.instantiate()
	add_child(level)
	level.global_position = Vector2(-500,-200)
	level.scale.x = 1.75
