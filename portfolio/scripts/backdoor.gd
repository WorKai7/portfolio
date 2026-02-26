extends Area2D

signal back_to_map

var is_inside: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Button.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_inside and Input.is_action_just_pressed("interact"):
		back_to_map.emit()


func _on_body_entered(body: Node2D) -> void:
	if is_instance_of(body, CharacterBody2D):
		$Button/AnimationPlayer.play("show")
		$Button.show()
		is_inside = true


func _on_body_exited(body: Node2D) -> void:
	if is_instance_of(body, CharacterBody2D):
		$Button/AnimationPlayer.play("hide")
		await $Button/AnimationPlayer.animation_finished
		$Button.hide()
		is_inside = false


func _on_button_pressed() -> void:
	back_to_map.emit()
