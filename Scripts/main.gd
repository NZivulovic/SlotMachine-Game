extends Node2D


func _ready():
	Global.current_money = Global.start_money
	%Money.text = "Money: " + str(Global.current_money)


func _on_handle_bar_input_event(_viewport: Viewport, event: InputEvent, _shape_idx: int):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			Global.current_money -= Global.cost_money
			%Money.text = "Money: " + str(Global.current_money)
