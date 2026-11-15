extends Area2D

@export var speed = 80

func _process(delta):
	position.x -= speed*delta

var disappearing = false

func _on_body_entered(body):
	print("Nešto je dotaknulo oblak")
		
	if body.has_method("slow_down"):
		print("Pozvana je funkcija")
		body.slow_down()
	
	if body.name == "Player" and not disappearing:
		disappearing = true
		set_deferred("monitoring", false)
		
		body.set_physics_process(false)
		body.set_process_input(false)
		
		var tween = create_tween()
		tween.tween_property(self, "modulate:a", 0.0, 3.0)
		
		await tween.finished
		
		body.set_physics_process(true)
		body.set_process_input(true)
		
		queue_free()

		
