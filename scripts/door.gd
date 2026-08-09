extends Area2D

var is_open = false
@onready var preto = get_parent().get_parent().get_node("hud").get_node("preto")
@onready var anime = $AnimatedSprite2D as AnimatedSprite2D
# Called when the node enters the scene tree for the first time.
func open():
	anime.play("open")
	is_open = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_entered(area: Area2D) -> void:
	if area.name == "hitbox" and is_open == true:
		print("finished")
		preto.translition()
		
