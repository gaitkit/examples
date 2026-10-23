extends Node3D
## A Gaitkit fox walking a circle in Godot 4.
##
## models/fox.glb is a free model from https://gaitkit.com/asset/fox. Godot imports it as a scene with an
## AnimationPlayer holding an in-place "Walk" clip. That clip covers CLIP_SPEED metres per second at 1x
## (gait.clip_speed on the model's page), so playing it at speed / CLIP_SPEED keeps the paws planted.

const CLIP_SPEED := 0.375

@export var speed := 0.45   ## metres per second
@export var radius := 1.2   ## metres

var fox: Node3D
var player: AnimationPlayer
var angle := 0.0


func _ready() -> void:
	fox = preload("res://models/fox.glb").instantiate()
	add_child(fox)
	player = fox.find_child("AnimationPlayer", true, false) as AnimationPlayer
	player.get_animation("Walk").loop_mode = Animation.LOOP_LINEAR
	player.play("Walk")
	player.speed_scale = speed / CLIP_SPEED
	_stage()


func _process(delta: float) -> void:
	angle += speed / radius * delta
	fox.position = Vector3(sin(angle), 0.0, cos(angle)) * radius   # metres, Y up, like the model
	fox.rotation.y = angle + PI / 2.0                               # Gaitkit models face +Z: turn along the circle


# camera, light and a ground disc, built in code so the example is one script
func _stage() -> void:
	var camera := Camera3D.new()
	camera.fov = 38.0
	add_child(camera)
	camera.look_at_from_position(Vector3(0.4, 1.6, 3.6), Vector3(0.0, 0.25, 0.0))
	var sun := DirectionalLight3D.new()
	sun.rotation_degrees = Vector3(-50.0, 30.0, 0.0)
	sun.shadow_enabled = true
	add_child(sun)
	var env := WorldEnvironment.new()
	env.environment = Environment.new()
	env.environment.background_mode = Environment.BG_COLOR
	env.environment.background_color = Color("#e9e4d8")
	env.environment.ambient_light_source = Environment.AMBIENT_SOURCE_COLOR
	env.environment.ambient_light_color = Color("#c8cbbf")
	add_child(env)
	var ground := MeshInstance3D.new()
	var disc := CylinderMesh.new()
	disc.top_radius = 6.0
	disc.bottom_radius = 6.0
	disc.height = 0.02
	ground.mesh = disc
	ground.position.y = -0.01
	var mat := StandardMaterial3D.new()
	mat.albedo_color = Color("#b9c2a8")
	ground.material_override = mat
	add_child(ground)
