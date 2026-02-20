extends Node2D

signal back_to_map

var is_in_backdoor: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_in_backdoor:
		if Input.is_action_just_pressed("interact"):
			back_to_map.emit()


func _on_back_door_body_entered(body: Node2D) -> void:
	if is_instance_of(body, CharacterBody2D):
		is_in_backdoor = true


func _on_back_door_body_exited(body: Node2D) -> void:
	if is_instance_of(body, CharacterBody2D):
		is_in_backdoor = false
