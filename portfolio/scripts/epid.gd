extends Area2D

signal epid_entered

var is_inside: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_inside:
		if Input.is_action_just_pressed("interact"):
			epid_entered.emit()


func _on_body_entered(body: Node2D) -> void:
	if is_instance_of(body, CharacterBody2D):
		is_inside = true


func _on_body_exited(body: Node2D) -> void:
	if is_instance_of(body, CharacterBody2D):
		is_inside = false
