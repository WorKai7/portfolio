extends Node2D

signal change_to_epid_scene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_epid_epid_entered() -> void:
	change_to_epid_scene.emit()
