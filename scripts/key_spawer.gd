extends Node2D

@onready var screen_key = preload("res://cenas/key.tscn")
@onready var screen_door = preload("res://cenas/door.tscn")
@onready var completed = get_parent().get_node("hud").get_node("completed")

var door_1
var door_2
var total_keys = 3
var collected_keys = 0
var arquivos = FileAccess.open("res://Dados/keypositions.json",FileAccess.READ)
var texto = arquivos.get_as_text()
var dados = JSON.parse_string(texto)

func _ready() -> void:
	door_1 = screen_door.instantiate()
	door_2 = screen_door.instantiate()
	add_child(door_1)
	add_child(door_2)
	door_1.global_position = Vector2(dados["fase_inicial"]["level01"]["door1"]["x"],dados["fase_inicial"]["level01"]["door1"]["y"])
	door_2.global_position = Vector2(dados["fase_inicial"]["level01"]["door2"]["x"],dados["fase_inicial"]["level01"]["door2"]["y"])
	spawer_keys()
	
	
func _process(_delta: float) -> void:
	if collected_keys == total_keys:
		door_2.open()
		completed.completed()
	
func spawer_keys():
	collected_keys = 0
	for i in range(0,3):
		var key = screen_key.instantiate()
		add_child(key)
		key.global_position = Vector2(dados["fase_inicial"]["level0{level}".format({"level":global.actual_level})]["keys"][i]["x"],dados["fase_inicial"]["level0{level}".format({"level":global.actual_level})]["keys"][i]["y"])
		print(i)
