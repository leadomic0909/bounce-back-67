extends Area2D

@export var speed = 80

func _process(delta):
	position.x -= speed*delta

func _on_body_entered(body):
	print("Nešto je dotaknulo oblak")
		
	if body.has_method("slow_down"):
		print("Pozvana je funkcija")
		body.slow_down()
	
	


# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
