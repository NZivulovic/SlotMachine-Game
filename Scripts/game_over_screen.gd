extends ColorRect



func _on_texture_button_pressed():
	%GameOverScreen.visible = false
	Global.current_money = 1000
	Global.spin_cost = 20
	Global.spin_cost_multiplier = 1
	get_tree().change_scene_to_file("res://Scenes/main.tscn")
