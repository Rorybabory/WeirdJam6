extends Node3D

@export var number : int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if (Globals.level < number):
		queue_free()
	else:
		show()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
