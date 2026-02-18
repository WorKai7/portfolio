extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Label.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if is_instance_of(body, CharacterBody2D):
		$Label.show()
		$Label/AnimationPlayer.play("show_label")


func _on_body_exited(body: Node2D) -> void:
	if is_instance_of(body, CharacterBody2D):
		$Label/AnimationPlayer.play("hide_label")
		await $Label/AnimationPlayer.animation_finished
		$Label.hide()
