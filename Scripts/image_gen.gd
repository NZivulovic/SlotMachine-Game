extends Control

var current_money = Global.current_money
var spin_cost = Global.spin_cost
var spin_cost_multiplier = Global.spin_cost_multiplier

const seven = preload("res://Assets/seven.jpg")
var seven_reward_money = Global.seven_reward_money

const star = preload("res://Assets/Star.jpg")
var star_reward_money = Global.star_reward_money

const sun = preload("res://Assets/Sun.jpg")
var sun_reward_money = Global.sun_reward_money

var textures = [seven, star, sun]

var rng = RandomNumberGenerator.new()
var roll_chances = PackedFloat32Array([Global.seven_chance, Global.star_chance, Global.sun_chance])

@onready var sprite_display: TextureRect = $TextureRect
@onready var sprite_display1: TextureRect = $TextureRect1
@onready var sprite_display2: TextureRect = $TextureRect2

@onready var clickable_area: Area2D = %HandleBar



func _ready():
	
	%GameOverScreen.visible = false
	$"../ButtonsMulti/TextureButton3".label.position.x += -6
	$"../ButtonsMulti/TextureButton3".label.position.y += 1
	%Won.set_visible(0)
	randomize()
	_randomize_texture()
	clickable_area.input_event.connect(_on_clickable_area_input_event)
	
	%Money.text = "MONEY: " + str(Global.current_money) + " $"
	%"Multiplier+Cost1".text = "MULTIPLIER: " + str(spin_cost_multiplier) + "X"
	%"SpinCost".text = "COST: " + str(spin_cost) + " $"
	


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
			Global.current_money = current_money
			current_money -= spin_cost * spin_cost_multiplier
			%Money.text = "MONEY: " + str(current_money) + " $"
			if reward_amount == 0:
				%Won.set_visible(0)
			if current_money <= 0:
				%GameOverScreen.visible = true
				
				$"../ButtonsMulti/TextureButton".disabled = true
				$"../ButtonsMulti/TextureButton2".disabled = true
				$"../ButtonsMulti/TextureButton3".disabled = true
				
				if $"../ButtonsMulti/TextureButton".button_pressed == true:
					$"../ButtonsMulti/TextureButton".label.position.y += -6
				if $"../ButtonsMulti/TextureButton2".button_pressed == true:
					$"../ButtonsMulti/TextureButton2".label.position.y += -6
				if $"../ButtonsMulti/TextureButton3".button_pressed == true:
					$"../ButtonsMulti/TextureButton3".label.position.y += -6


var reward_amount = 0

func check_for_reward():
	reward_amount = 0
	if sprite_display.texture == sun and sprite_display1.texture == sun and sprite_display2.texture == sun:
		reward_amount = sun_reward_money * spin_cost_multiplier
		print('sun 3x')
	elif sprite_display.texture == star and sprite_display1.texture == star and sprite_display2.texture == star:
		reward_amount += star_reward_money * spin_cost_multiplier
		print('star 3x')
	elif sprite_display.texture == seven and sprite_display1.texture == seven and sprite_display2.texture == seven:
		reward_amount += seven_reward_money * spin_cost_multiplier
		print('JACKPOT! seven 3x')
	if reward_amount > 0:
		current_money += reward_amount
		%Won.set_visible(1)
		%Won.text = "WON: " + str(reward_amount) + " $"
		$"../Sounds/WinningDing".play(1)
	else:
		print("Unlucky")


func _on_texture_button_toggled(toggled_on):
	if toggled_on == true:
		spin_cost_multiplier = 3
		%"SpinCost".text = "COST: " + str(spin_cost * spin_cost_multiplier) + " $"
	else:
		spin_cost_multiplier = 1
		%"SpinCost".text = "COST: " + str(spin_cost * spin_cost_multiplier) + " $"
	%"Multiplier+Cost1".text = "MULTIPLIER: " + str(spin_cost_multiplier) + "X"


func _on_texture_button_2_toggled(toggled_on):
	if toggled_on == true:
		spin_cost_multiplier = 5
		%"SpinCost".text = "COST: " + str(spin_cost * spin_cost_multiplier) + " $"
	else:
		spin_cost_multiplier = 1
		%"SpinCost".text = "COST: " + str(spin_cost * spin_cost_multiplier) + " $"
	%"Multiplier+Cost1".text = "MULTIPLIER: " + str(spin_cost_multiplier) + "X"


func _on_texture_button_3_toggled(toggled_on):
	if toggled_on == true:
		spin_cost_multiplier = 10
		%"SpinCost".text = "COST: " + str(spin_cost * spin_cost_multiplier) + " $"
	else:
		spin_cost_multiplier = 1
		%"SpinCost".text = "COST: " + str(spin_cost * spin_cost_multiplier) + " $"
	%"Multiplier+Cost1".text = "MULTIPLIER: " + str(spin_cost_multiplier) + "X"
	$"../ButtonsMulti/TextureButton3".label.position.x += -6
