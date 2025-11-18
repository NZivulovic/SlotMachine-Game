extends ColorRect

var toggled = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	toggled = 0
	$BackButton.get_child(0).text = "< Back"
	$BuyButton.get_child(0).text = "Buy"
	$Bonus1.get_child(0).text = "10 Spins"
	$Bonus2.get_child(0).text = "30 Spins"
	$Bonus3.get_child(0).text = "80 Spins"
	
	



func _on_back_button_pressed():
	$BackButton.get_child(0).position.y += 5
	await get_tree().create_timer(0.025).timeout
	$BackButton.get_child(0).position.y -= 5
	await get_tree().create_timer(0.025).timeout
	get_tree().change_scene_to_file("res://Scenes/main.tscn")


func _on_buy_button_pressed():
	$BuyButton.get_child(0).position.y += 5
	await get_tree().create_timer(0.025).timeout
	$BuyButton.get_child(0).position.y -= 5
	await get_tree().create_timer(0.025).timeout
	if toggled == 1:
		Global.free_spins = 10
	if toggled == 2:
		Global.free_spins = 30
	if toggled == 3:
		Global.free_spins = 80
	get_tree().change_scene_to_file("res://Scenes/main.tscn")


func _on_bonus_1_toggled(toggled_on):
	if toggled_on == true:
		toggled = 1
		$Bonus2.disabled = true
		$Bonus3.disabled = true
	else:
		$Bonus2.disabled = false
		$Bonus3.disabled = false


func _on_bonus_2_toggled(toggled_on):
	if toggled_on == true:
		toggled = 2
		$Bonus1.disabled = true
		$Bonus3.disabled = true
	else:
		$Bonus1.disabled = false
		$Bonus3.disabled = false


func _on_bonus_3_toggled(toggled_on):
	if toggled_on == true:
		toggled = 3
		$Bonus1.disabled = true
		$Bonus2.disabled = true
	else:
		$Bonus1.disabled = false
		$Bonus2.disabled = false
