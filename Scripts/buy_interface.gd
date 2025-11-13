extends ColorRect


# Called when the node enters the scene tree for the first time.
func _ready():
	$NoMoney.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_buy_button_pressed():
	if Global.diamond_token_selected == 1 and Global.current_money >= Global.diamond_token_cost:
		Global.has_diamond_token = 1
		Global.diamond_token_selected = 0
		Global.current_money -= Global.diamond_token_cost
		$"../Items/DiamondToken".queue_free()
		$"../ItemNameLabels/Label".queue_free()
		$BuyButton/Label.position.y += 6
		# Completion 
		await get_tree().create_timer(0.05).timeout
		$".".visible = false
		$"../BackButtonBuyMenu".visible = false
		
	elif Global.diamond_token_selected == 1 and Global.current_money <= Global.diamond_token_cost:
		$Label.visible = false
		$LabelDescription.visible = false
		$NoMoney.visible = true
		$BuyButton/Label.position.y += 6
		$BuyButton.disabled = true
		print("You are broke!")
		await get_tree().create_timer(0.05).timeout
		$BuyButton/Label.position.y -= 6
		$BuyButton.disabled = false
	else:
		$Label.visible = true
		$LabelDescription.visible = true
