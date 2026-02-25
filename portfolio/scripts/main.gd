extends Node

var main_map_scene: PackedScene
var epid_map_scene: PackedScene
var iut_map_scene: PackedScene
var skills_map_scene: PackedScene
var current_map: Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	main_map_scene = preload("res://scenes/map/map.tscn")
	epid_map_scene = preload("res://scenes/map/epid_map.tscn")
	iut_map_scene = preload("res://scenes/map/iut_map.tscn")
	skills_map_scene = preload("res://scenes/map/skills_map.tscn")
	current_map = $Map


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if current_map.name == "SkillsMap":
		$Camera2D.position.y = $Player.position.y
	else:
		$Camera2D.position.x = $Player.position.x


func _on_map_change_to_epid_scene() -> void:
	var epid_map = self.epid_map_scene.instantiate()
	
	var parent = current_map.get_parent()
	var index = current_map.get_index()
	
	current_map.queue_free()
	
	parent.add_child(epid_map)
	parent.move_child(epid_map, index)
	
	current_map = epid_map
	
	epid_map.back_to_map.connect(_back_to_main_map)
	
	$Player.position = Vector2(0, 550)

func _back_to_main_map():
	var main_map = main_map_scene.instantiate()
	
	var parent = current_map.get_parent()
	var index = current_map.get_index()
	
	var old_map_name = current_map.name
	current_map.queue_free()
	
	parent.add_child(main_map)
	parent.move_child(main_map, index)
	
	current_map = main_map
	
	main_map.change_to_epid_scene.connect(_on_map_change_to_epid_scene)
	main_map.change_to_iut_scene.connect(_on_map_change_to_iut_scene)
	main_map.change_to_skills_scene.connect(_on_map_change_to_skills_scene)
	
	match old_map_name:
		"EPIDMap":
			$Player.position = Vector2(8800, 400)
		"IUTMap":
			$Player.position = Vector2(12500, 400)
		"SkillsMap":
			$Player.position = Vector2(15300, 400)
	
	$Camera2D.position.y = 362


func _on_control_teleport(pos: Vector2) -> void:
	if current_map.name != "Map":
		_back_to_main_map()
		
	$Player.position = pos


func _on_map_change_to_iut_scene() -> void:
	var iut_map = self.iut_map_scene.instantiate()
	
	var parent = current_map.get_parent()
	var index = current_map.get_index()
	
	current_map.queue_free()
	
	parent.add_child(iut_map)
	parent.move_child(iut_map, index)
	
	current_map = iut_map
	
	iut_map.back_to_map.connect(_back_to_main_map)
	
	$Player.position = Vector2(0, 550)


func _on_map_change_to_skills_scene() -> void:
	var skills_map = self.skills_map_scene.instantiate()
	
	var parent = current_map.get_parent()
	var index = current_map.get_index()
	
	current_map.queue_free()
	
	parent.add_child(skills_map)
	parent.move_child(skills_map, index)
	
	current_map = skills_map
	
	skills_map.back_to_map.connect(_back_to_main_map)
	
	$Player.position = Vector2(150, 550)
	$Camera2D.position.x = 540
