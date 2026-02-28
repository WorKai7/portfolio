extends Area2D

@export var project_texture: Texture2D
@export var project_title: String
@export_multiline var project_description: String
@export var link: String

var is_inside: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Titre.text = project_title
	$Image.texture	= project_texture
	$Description.text = project_description
	$LinkIcon.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_inside:
		if Input.is_action_just_pressed("interact"):
			OS.shell_open(link)


func _on_body_entered(body: Node2D) -> void:
	if is_instance_of(body, CharacterBody2D):
		$AnimationPlayer.play("show")
		$LinkIcon.show()
		is_inside = true


func _on_body_exited(body: Node2D) -> void:
	if is_instance_of(body, CharacterBody2D):
		$AnimationPlayer.play("hide")
		await $AnimationPlayer.animation_finished
		$LinkIcon.hide()
		is_inside = false


func _on_link_icon_pressed() -> void:
	OS.shell_open(link)
