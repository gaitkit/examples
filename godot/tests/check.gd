extends SceneTree
## Headless smoke test: godot --headless --path godot -s res://tests/check.gd
## Loads the main scene, runs it for a second and checks the fox moved and its Walk clip is playing.

var frames := 0
var main: Node3D
var start: Vector3


func _initialize() -> void:
	main = load("res://main.tscn").instantiate()
	root.add_child(main)


func _process(_delta: float) -> bool:
	frames += 1
	if frames == 2:
		start = main.fox.position
	if frames < 60:
		return false
	var ok: bool = main.player.is_playing() and main.player.current_animation == "Walk" and main.fox.position.distance_to(start) > 0.05
	print("walk clip playing: ", main.player.is_playing(), " (", main.player.current_animation, "), moved ", snappedf(main.fox.position.distance_to(start), 0.001), " m -> ", "OK" if ok else "FAIL")
	quit(0 if ok else 1)
	return true
