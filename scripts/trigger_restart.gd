extends Area3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (Input.is_action_just_pressed("cheat")):
		Globals.level += 1
		Globals.glitchIntensity += 0.045;
		get_tree().reload_current_scene()
	pass


func _on_area_entered(area: Area3D) -> void:
	pass

func _on_body_entered(body: Node3D) -> void:
	if (body.is_in_group("Player")):
		Globals.level += 1
		Globals.glitchIntensity += 0.045;
		get_tree().reload_current_scene()
