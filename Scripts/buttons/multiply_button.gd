extends Label


func _on_texture_button_toggled(toggled_on):
	if toggled_on == true:
		%MultiplyButton.set_position(Vector2(26.6, 8))
	else:
		%MultiplyButton.set_position(Vector2(26.6, 0))
