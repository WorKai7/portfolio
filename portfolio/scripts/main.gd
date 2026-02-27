extends Node

var main_map_scene: PackedScene
var epid_map_scene: PackedScene
var iut_map_scene: PackedScene
var skills_map_scene: PackedScene
var projects_map_scene: PackedScene
var versalis_map_scene: PackedScene
var current_map: Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	main_map_scene = preload("res://scenes/map/map.tscn")
	epid_map_scene = preload("res://scenes/map/epid_map.tscn")
	iut_map_scene = preload("res://scenes/map/iut_map.tscn")
	skills_map_scene = preload("res://scenes/map/skills_map.tscn")
	projects_map_scene = preload("res://scenes/map/project_map.tscn")
	versalis_map_scene = preload("res://scenes/map/versalis_map.tscn")
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
	
	for door in epid_map.get_tree().get_nodes_in_group("doors"):
		if door.is_inside_tree() and door.get_parent():
			if epid_map.is_ancestor_of(door):
				door.back_to_map.connect(_back_to_main_map)
	
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
	main_map.change_to_projects_scene.connect(_on_map_change_to_projects_scene)
	main_map.change_to_versalis_scene.connect(_on_map_change_to_versalis_scene)
	
	match old_map_name:
		"EPIDMap":
			$Player.position = Vector2(8800, 400)
		"IUTMap":
			$Player.position = Vector2(12500, 400)
		"SkillsMap":
			$Player.position = Vector2(15300, 400)
		"ProjectMap":
			$Player.position = Vector2(17350, 600)
		"VersalisMap":
			$Player.position = Vector2(20500, 400)
	
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
	
	for door in iut_map.get_tree().get_nodes_in_group("doors"):
		if door.is_inside_tree() and door.get_parent():
			if iut_map.is_ancestor_of(door):
				door.back_to_map.connect(_back_to_main_map)
	
	$Player.position = Vector2(0, 550)


func _on_map_change_to_skills_scene() -> void:
	var skills_map = self.skills_map_scene.instantiate()
	
	var parent = current_map.get_parent()
	var index = current_map.get_index()
	
	current_map.queue_free()
	
	parent.add_child(skills_map)
	parent.move_child(skills_map, index)
	
	current_map = skills_map
	
	for door in skills_map.get_tree().get_nodes_in_group("doors"):
		if door.is_inside_tree() and door.get_parent():
			if skills_map.is_ancestor_of(door):
				door.back_to_map.connect(_back_to_main_map)
	
	$Player.position = Vector2(150, 550)
	$Camera2D.position.x = 540


func _on_map_change_to_projects_scene() -> void:
	var projects_map = self.projects_map_scene.instantiate()
	
	var parent = current_map.get_parent()
	var index = current_map.get_index()
	
	current_map.queue_free()
	
	parent.add_child(projects_map)
	parent.move_child(projects_map, index)
	
	current_map = projects_map
	
	for door in projects_map.get_tree().get_nodes_in_group("doors"):
		if door.is_inside_tree() and door.get_parent():
			if projects_map.is_ancestor_of(door):
				door.back_to_map.connect(_back_to_main_map)
	
	$Player.position = Vector2(150, 550)
	$Camera2D.position.x = 540


func _on_map_change_to_versalis_scene() -> void:
	var versalis_map = self.versalis_map_scene.instantiate()
	
	var parent = current_map.get_parent()
	var index = current_map.get_index()
	
	current_map.queue_free()
	
	parent.add_child(versalis_map)
	parent.move_child(versalis_map, index)
	
	current_map = versalis_map
	
	for door in versalis_map.get_tree().get_nodes_in_group("doors"):
		if door.is_inside_tree() and door.get_parent():
			if versalis_map.is_ancestor_of(door):
				door.back_to_map.connect(_back_to_main_map)
	
	$Player.position = Vector2(150, 550)
	$Camera2D.position.x = 540
