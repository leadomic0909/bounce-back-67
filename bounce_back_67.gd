extends Node2D

@export var oblakb_scene: PackedScene
@export var oblak_scene: PackedScene
@export var coin_scene: PackedScene
@export var coinbad_scene: PackedScene




func _on_oblak_timer_timeout():
	var oblak = oblak_scene.instantiate()
	add_child(oblak)
	
	var screen_size = get_viewport_rect().size
	
	oblak.position = Vector2(
		screen_size.x + 100,
		randf_range(50, 150)
	)

func _on_coin_timer_timeout():
	var coin = coin_scene.instantiate()
	add_child(coin)
	
	var screen_size = get_viewport_rect().size
	
	coin.position = Vector2(
		screen_size.x + 50,
		randf_range(50, screen_size.y - 50)
	)
	





func _on_oblak_2_timer_timeout():
		var oblakb = oblakb_scene.instantiate()
		add_child(oblakb)
	
		var screen_size = get_viewport_rect().size
	
		oblakb.position = Vector2(
		screen_size.x + 100,
		randf_range(50, 150)
	)


func _on_coin_69_timer_timeout():
	var coinbad = coinbad_scene.instantiate()
	add_child(coinbad)
	
	var screen_size = get_viewport_rect().size
	
	coinbad.position = Vector2(
		screen_size.x + 50,
		randf_range(50, screen_size.y - 50)
	)
