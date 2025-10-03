extends CharacterBody2D

const MAX_SPEED : float = 200
const JUMP_VELOCITY = -400.0

@export_range(0.0, MAX_SPEED, 1.0)
var speed : float = 160.0
@export_range(0.0, -JUMP_VELOCITY, 1.0)
var jump_velocity : float = -300.0

@onready var sprite = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
		sprite.play("Jump")

	if Input.is_action_pressed("saltar") and is_on_floor():
		velocity.y = jump_velocity

	var direction := Input.get_axis("mover_izquierda", "mover_derecha")
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	move_and_slide()
