extends CharacterBody2D

@onready var anime = $anime as AnimatedSprite2D
@onready var shader = preload("res://cenas/ghost.tscn")
const SPEED = 230
const JUMP_VELOCITY = -800
var anim_atual = "idle"
var is_dashing = false
var dash_able = true
var your_direction


func _ready() -> void:
	z_index += 1
	pass

func dash():
	is_dashing = true
	dash_able = false
	await get_tree().create_timer(0.2).timeout
	is_dashing = false
	await get_tree().create_timer(0.8).timeout
	dash_able = true

func animation(anim):
	anime.play(anim)

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta * 2

	# Handle jump.
		
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction and not is_dashing:
		if direction != 0:
			your_direction = direction
		animation("run")
		velocity.x = direction * SPEED
		if velocity.x > 1:
			anime.flip_h = false
		else:
			anime.flip_h = true
	else:
		animation("idle")
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if Input.is_action_just_pressed("dash"):
		if dash_able:
			dash()
			for i in 10:
				var ghost =shader.instantiate()
				get_parent().add_child(ghost)
				ghost.visible = true
				ghost.global_position = global_position
				ghost.ghosting(anime.flip_h)
				ghost.z_index = anime.z_index - 1
				await get_tree().create_timer(0.05).timeout
				
		
	if is_dashing:
		velocity.x = move_toward(velocity.x,1000 * your_direction,25000 * delta)
					
	move_and_slide()
	
	
	
	
	
