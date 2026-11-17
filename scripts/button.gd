extends Button

@onready var player = get_parent().get_parent().get_node("player")
@onready var keySpawer = get_parent().get_parent().get_node("key_spawer")
@onready var preto = get_parent().get_node("preto")

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	if !global.is_live:
		visible = true

func _on_button_down() -> void:
	preto.translition()
	player.position_return()
	player.health = 3
	global.is_live = true
	visible = false
	keySpawer.collected_keys = 0
	keySpawer.spawer_keys()
	keySpawer.spawer_doors()
	print(keySpawer.collected_keys)
