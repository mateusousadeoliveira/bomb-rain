extends Area2D

var is_open = false
@onready var preto = get_parent().get_parent().get_node("hud").get_node("preto")
@onready var anime = $AnimatedSprite2D as AnimatedSprite2D

func open():
	anime.play("open")
	is_open = true
	
func _on_area_entered(area: Area2D) -> void:
	if area.name == "hitbox" and is_open == true:
		print("finished")
		preto.translition()
		
