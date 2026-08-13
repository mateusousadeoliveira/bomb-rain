extends Area2D

var is_open = false
@onready var key_spawer = get_parent().get_parent().get_node("key_spawer")
@onready var preto = get_parent().get_parent().get_node("hud").get_node("preto")
@onready var level_manager = get_parent().get_parent().get_node("level_manager")
@onready var anime = $AnimatedSprite2D as AnimatedSprite2D

func open():
	anime.play("open")
	is_open = true
	
func _on_area_entered(area: Area2D) -> void:
	if area.name == "hitbox" and is_open == true:
		print("finished")
		global.actual_level += 1
		key_spawer.spawer_keys()
		level_manager.next_level()
		preto.translition()
		
