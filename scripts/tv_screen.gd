extends MeshInstance3D

@export var textures : Array[Texture2D]

var timer = 0.0
var static_timer = 0.0
var is_static = true

var tex_index = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (Globals.level > 3):
		get_surface_override_material(0).albedo_texture = textures[4]
		return

	if (is_static):
		static_timer += delta
		if (static_timer > 0.5):
			static_timer = 0
			is_static = false
			tex_index+=1
			if (tex_index >= textures.size()):
				tex_index = 1
				pass
			get_surface_override_material(0).albedo_texture = textures[tex_index]
			pass
		pass
	else:
		timer += delta
		if (timer > 3.0):
			timer = 0
			is_static = true
			get_surface_override_material(0).albedo_texture = textures[0]
			pass
		pass
