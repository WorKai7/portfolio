extends CharacterBody2D

var has_jumped: bool = false
var speed: float = 300.0
const JUMP_VELOCITY: float = -400.0
var direction: int
var can_climb: bool = false
var climb_speed: float = -5

@onready var sprite: AnimatedSprite2D = $Sprite

func _physics_process(delta: float) -> void:
	sprite.play()
	
	# Add the gravity.
	if not is_on_floor() and not can_climb:
		velocity += get_gravity() * delta
	else:
		has_jumped = false
	
	# Handle ladder.
	if can_climb:
		if not is_on_floor():
			if Input.is_action_pressed("climb") or Input.is_action_pressed("unclimb"):
				sprite.animation = "climb"
			else:
				sprite.animation = "climb_idle"
			
		velocity.y = 0 
		
		if Input.is_action_pressed("climb"):
			position.y += climb_speed
		if Input.is_action_pressed("unclimb"):
			position.y -= climb_speed
	
	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor() and not can_climb:
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if Input.is_action_pressed("move_left"):
		direction = -1
	elif Input.is_action_pressed("move_right"):
		direction = 1
	else:
		direction = 0
		
	if direction:
		velocity.x = direction * speed
		
		if is_on_floor():
			if speed > 300:
				sprite.animation = "run"
			else:
				sprite.animation = "walk"
				
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		
		if is_on_floor():
			sprite.animation = "idle"
	
	if direction < 0:
		sprite.flip_h = true
	elif direction > 0:
		sprite.flip_h = false
		
	if Input.is_action_pressed("sprint"):
		speed = 600
	else:
		speed = 300
		
	if not is_on_floor():
		if not has_jumped:
			if not can_climb:
				sprite.animation = "jump"

	move_and_slide()


func _on_sprite_animation_finished() -> void:
	if sprite.animation == "jump":
		has_jumped = true
		sprite.animation = "fall"
