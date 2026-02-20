extends Node

var main_map_scene: PackedScene
var epid_map_scene: PackedScene
var current_map: Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	main_map_scene = preload("res://scenes/map/map.tscn")
	epid_map_scene = preload("res://scenes/map/epid_map.tscn")
	current_map = $Map


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Camera2D.position.x = clamp($Player.position.x, -150, 10000)


func _on_map_change_to_epid_scene() -> void:
	var epid_map = self.epid_map_scene.instantiate()
	
	var parent = current_map.get_parent()
	var index = current_map.get_index()
	
	current_map.queue_free()
	
	parent.add_child(epid_map)
	parent.move_child(epid_map, index)
	
	current_map = epid_map
	
	epid_map.back_to_map.connect(_on_epid_back_to_map)
	
	$Player.position = Vector2(0, 550)

func _on_epid_back_to_map():
	var main_map = main_map_scene.instantiate()
	
	var parent = current_map.get_parent()
	var index = current_map.get_index()
	
	current_map.queue_free()
	
	parent.add_child(main_map)
	parent.move_child(main_map, index)
	
	current_map = main_map
	
	main_map.change_to_epid_scene.connect(_on_map_change_to_epid_scene)
	
	$Player.position = Vector2(8800, 400)
