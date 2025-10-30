extends Control

const seven = preload("res://Assets/seven.jpg")
const star = preload("res://Assets/Star.jpg")
const sun = preload("res://Assets/Sun.jpg")

var textures = [seven, star, sun]

var rng = RandomNumberGenerator.new()
var roll_chances = PackedFloat32Array([Global.seven_chance, Global.star_chance, Global.sun_chance])

@onready var sprite_display: TextureRect = $TextureRect
@onready var sprite_display1: TextureRect = $TextureRect1
@onready var sprite_display2: TextureRect = $TextureRect2

@onready var clickable_area: Area2D = %HandleBar



func _ready():
	_randomize_texture()
	clickable_area.input_event.connect(_on_clickable_area_input_event)
	randomize()
	


func _randomize_texture():
	
	var chosen_texture = textures[rng.rand_weighted(roll_chances)]
	var chosen_texture1 = textures[rng.rand_weighted(roll_chances)]
	var chosen_texture2 = textures[rng.rand_weighted(roll_chances)]
	
	if sprite_display:
		sprite_display.texture = chosen_texture
	if sprite_display1:
		sprite_display1.texture = chosen_texture1
	if sprite_display2:
		sprite_display2.texture = chosen_texture2
		


func _on_clickable_area_input_event(_viewport: Viewport, event: InputEvent, _shape_idx: int):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			_randomize_texture()
			check_for_reward()

func check_for_reward():
	if sprite_display.texture == sun and sprite_display1.texture == sun and sprite_display2.texture == sun:
		Global.current_money += Global.sun_reward_money
		print('sun')


func _process(_delta):
	pass
