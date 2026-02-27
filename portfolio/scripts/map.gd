extends Node2D

signal change_to_epid_scene
signal change_to_iut_scene
signal change_to_skills_scene
signal change_to_projects_scene
signal change_to_versalis_scene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	


func _on_skill_tree_building_entered() -> void:
	change_to_skills_scene.emit()


func _on_epid_building_entered() -> void:
	change_to_epid_scene.emit()


func _on_iut_building_entered() -> void:
	change_to_iut_scene.emit()


func _on_projets_building_entered() -> void:
	change_to_projects_scene.emit()


func _on_versalis_building_entered() -> void:
	change_to_versalis_scene.emit()
