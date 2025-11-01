extends Node2D

var cost_money = Global.cost_money
var start_money = Global.start_money

var spin_cost = 20


func _ready():
	pass

func _on_handle_bar_input_event(_viewport: Viewport, event: InputEvent, _shape_idx: int):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			#%Money.text = "Money: " + str(Global.current_money)
			pass
