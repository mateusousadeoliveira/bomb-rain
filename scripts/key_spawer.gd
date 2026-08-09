extends Node2D

@onready var screen_key = preload("res://cenas/key.tscn")
@onready var screen_door = preload("res://cenas/door.tscn")
@onready var completed = get_parent().get_node("hud").get_node("completed")
var door
var total_keys = 3
var collected_keys = 0
var arquivos = FileAccess.open("res://Dados/keypositions.json",FileAccess.READ)
var texto = arquivos.get_as_text()
var dados = JSON.parse_string(texto)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	door = screen_door.instantiate()
	add_child(door)
	door.global_position = Vector2(dados["fase_inicial"]["map01"]["door"]["x"],dados["fase_inicial"]["map01"]["door"]["y"])
	spawer_keys()
	
func _process(delta: float) -> void:
	if collected_keys == total_keys:
		door.open()
		completed.completed()
	
func spawer_keys():
	for i in range(0,3):
		var key = screen_key.instantiate()
		add_child(key)
		key.global_position = Vector2(dados["fase_inicial"]["map01"]["keys"][i]["x"],dados["fase_inicial"]["map01"]["keys"][i]["y"])
		print(i)

# Called every frame. 'delta' is the elapsed time since the previous frame.
