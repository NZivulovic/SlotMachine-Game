extends ColorRect


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_buy_button_pressed():
	if Global.diamond_token_selected == 1:
		Global.has_diamond_token = 1
		Global.diamond_token_selected = 0
		$"../Items/DiamondToken".queue_free()
		$"../ItemNameLabels/Label".queue_free()
		$BuyButton/Label.position.y += 6
	await get_tree().create_timer(0.025).timeout
	$".".visible = false
	$"../BackButtonBuyMenu".visible = false
