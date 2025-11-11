extends Label



func _on_back_button_pressed():
	$".".position.y += 6
	await get_tree().create_timer(0.025).timeout
	get_tree().change_scene_to_file("res://Scenes/main.tscn")
