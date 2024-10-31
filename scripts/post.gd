extends MeshInstance3D

var lastGlitch = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (Globals.glitchIntensity != lastGlitch):
		lastGlitch = Globals.glitchIntensity
		get_surface_override_material(0).set_shader_parameter("range", 0.025 * lastGlitch)
		get_surface_override_material(0).set_shader_parameter("noiseIntensity", 0.004 * lastGlitch)
		get_surface_override_material(0).set_shader_parameter("offsetIntensity", 0.03 * lastGlitch)
		get_surface_override_material(0).set_shader_parameter("colorOffsetIntensity", 0.7 * lastGlitch)
		get_surface_override_material(0).set_shader_parameter("redVal", 4.0 * lastGlitch)
	pass
