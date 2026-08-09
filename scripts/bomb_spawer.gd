extends Node

var bomb_scene = preload("res://cenas/bomb.tscn")
var player_position_x


func create_bomb():
	var bomb = bomb_scene.instantiate()
	bomb.position = Vector2(randf_range(player_position_x - 1000,player_position_x + 1000),-1000)
	add_child(bomb)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	while 1>0:
		await get_tree().create_timer(0.5).timeout
		create_bomb()
func _process(_delta: float) -> void:
	player_position_x = get_parent().get_node("player").global_position.x
