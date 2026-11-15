extends Node2D

@export var oblak_scene: PackedScene

func _on_oblak_timer_timeout():
	var oblak = oblak_scene.instantiate()
	add_child(oblak)
	
	var screen_size = get_viewport_rect().size
	
	oblak.position = Vector2(
		screen_size.x + 100,
		randf_range(50, screen_size.y * 0.4)
	)
