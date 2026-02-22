extends CanvasLayer

signal teleport(pos: Vector2)

var teleport_map: Dictionary = {
	1: Vector2(-530, 500),
	2: Vector2(3000, 500),
	3: Vector2(5500, 500),
	4: Vector2(8000, 400)
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_option_button_item_selected(index: int) -> void:
	if index != 0:
		teleport.emit(teleport_map[index])
		$OptionButton.select(0)
