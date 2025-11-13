extends Node2D



# Called when the node enters the scene tree for the first time.
func _ready():
	$BuyInterface.visible = false
	$BackButtonBuyMenu.visible = false
	if Global.has_diamond_token == 1:
		$Items/DiamondToken.queue_free()
		$ItemNameLabels/Label.queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass



func _on_diamond_token_input_event(_viewport: Viewport, event: InputEvent, _shape_idx: int):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			$BuyInterface.visible = true
			$BackButtonBuyMenu.visible = true
			$BuyInterface.get_child(0).text += " Diamond Token?"
			$BuyInterface/LabelDescription.text += "Get 3x 7's for 1 spin"
			Global.diamond_token_selected = 1
			$BuyInterface/Cost.text = "Cost:" + " [color=FOREST_GREEN]" + str(Global.diamond_token_cost)  + "$" + " [/color]"
			print(str(Global.current_money))
			print(Global.spin_cost)
			print(Global.spin_cost_multiplier)
