extends Control

const seven = preload("res://Assets/seven.jpg")
const star = preload("res://Assets/Star.jpg")
const sun = preload("res://Assets/Sun.jpg")

var textures = [seven, star, sun]
var random_texture = textures[randi() % textures.size()]

@onready var sprite_display: TextureRect = $TextureRect

@onready var main_scene = load("res://Scenes/main.tscn")

@onready var clickable_area: Area2D = %HandleBar

# Called when the node enters the scene tree for the first time.
func _ready():
	clickable_area.input_event.connect(_on_clickable_area_input_event)
	randomize()
	
	

func _randomize_texture():
	var chosen_texture = textures[randi() % textures.size()]
	
	if sprite_display:
		sprite_display.texture = chosen_texture


func _on_clickable_area_input_event(_viewport: Viewport, event: InputEvent, _shape_idx: int):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			_randomize_texture()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
