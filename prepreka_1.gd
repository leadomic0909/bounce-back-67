
extends Area2D

@export var speed: float = 300.0
var game_over = false

func _ready():
	body_entered.connect(_on_body_entered)

func _process(delta):
	if not game_over:
		position.x -= speed * delta

func _on_body_entered(body):
	if body.name == "Player" and not game_over:
		game_over = true

		var poruka = get_tree().current_scene.find_child("MessageLabel", true, false)

		if poruka != null:
			poruka.text = "GAME OVER!"
		else:
			print("GAME OVER")

		Engine.time_scale = 0.0
