extends Node2D

var count = 0
var total_coins = 10
var finished = false
var coin_speed = 250

@onready var coin67 = self
@onready var coin69 = $"../69"

func _ready():
	update_count()
	
func _process(delta):
	if finished:
		return
	coin67.position.x -= coin_speed * delta
	coin69.position.x -= coin_speed * delta
	
func add_coin():
	if finished:
		return	
	count += 1
	update_count()
	print("COIN collected:" , count)
	if count >= total_coins:
		win_game()	
func update_count():
	get_node("../UI/Count").text = "COINS: " + str(count)
func lose_game():
	if finished:
		return	
	finished = true 
	Engine.time_scale = 1.0
	get_node("../UI/MessageLabel").text = "GAME OVER!" 
func win_game():
	if finished:
		return
	finished = true
	Engine.time_scale = 1.0
	get_node("../UI/MessageLabel").text = "YOU WIN!"
		

		
