extends RigidBody2D

@onready var explosion_scene = preload("res://cenas/explosion.tscn")
@onready var hitbox = $hitbox as Area2D
@onready var colision = $collision
@onready var animation = $animation as AnimatedSprite2D
var rotation_number = randf_range(0.055,0.1)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	z_index += 1
	gravity_scale = 0.2
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	animation.rotation += rotation_number

func _on_hitbox_body_entered(body: Node2D) -> void:
	var explosao = explosion_scene.instantiate()
	explosao.position = Vector2(position.x,position.y)
	get_parent().add_child(explosao)
	explosao.explodir()
	queue_free()
