extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	$Description.visible = false
	pass



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.has_diamond_token == 1:
		$DiamondToken.visible = true
		%Trinkets.visible = true
	elif Global.has_diamond_token == 0:
		$DiamondToken.visible = false
		%Trinkets.visible = false
	pass


func _on_area_2d_mouse_shape_entered(shape_idx):
	$Description.visible = true
	$Description.text = "Get 3x 7's for one spin."
	pass # Replace with function body.


func _on_area_2d_mouse_shape_exited(shape_idx):
	$Description.visible = false
	pass # Replace with function body.
