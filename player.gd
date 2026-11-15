extends CharacterBody2D

var slow_active = false

func slow_down():
	print ("usporavanje radi")
	if slow_active:
		return
	slow_active = true
	Engine.time_scale = 0.5
	
	await get_tree().create_timer(0.4, true, false, true).timeout
	
	Engine.time_scale = 2.0
	print("Normalna brzina vraćena")
	slow_active = false
	
	
	

		




# Called when the node enters the scene tree for the first time.
@warning_ignore("unused_parameter")
func _physics_process(delta):
	var direction = Input.get_axis( "ui_up", "ui_down")
	velocity = Vector2 (0, direction * 400)
	move_and_slide()# Replace with function body.
	



# Called every frame. 'delta' is the elapsed time since the previous fra
func _on_body_entered(body):
	
	
	if body.name == "Player":
		Engine.time_scale = 0.5
		await get_tree().create_timer(0.4, true, false, true).timeout
		Engine.time_scale = 2.0
		

	
