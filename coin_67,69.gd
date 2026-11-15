extends Area2D
 
static var count = 0
static var finished = false
var coin_speed = 250.0
 
var count_label: Label = null
var timer_label: Label = null
var game_timer: Timer = null
 
func _ready():
	add_to_group("coins")
	if not body_entered.is_connected(_on_body_entered):
		body_entered.connect(_on_body_entered)
	setup_ui()
	update_count()
 
func setup_ui():
	var parent = get_parent()
	if not parent:
		return
	var ui = parent.get_node_or_null("UI")
	if not ui:
		ui = CanvasLayer.new()
		ui.name = "UI"
		parent.add_child(ui)
	count_label = ui.get_node_or_null("Count")
	if not count_label:
		count_label = Label.new()
		count_label.name = "Count"
		count_label.position = Vector2(20, 20)
		ui.add_child(count_label)
	timer_label = ui.get_node_or_null("Timer")
	if not timer_label:
		timer_label = Label.new()
		timer_label.name = "Timer"
		timer_label.position = Vector2(20, 50)
		ui.add_child(timer_label)
	game_timer = ui.get_node_or_null("GameTimer")
	if not game_timer:
		game_timer = Timer.new()
		game_timer.name = "GameTimer"
		game_timer.wait_time = 15.0
		game_timer.one_shot = true
		ui.add_child(game_timer)
		game_timer.timeout.connect(_on_global_timer_timeout)
		game_timer.start()
 
func _process(delta):
	if finished:
		return
 
	position.x -= coin_speed * delta
 
	if timer_label and game_timer:
		timer_label.text = "TIME: " + "%.1f" % game_timer.time_left
 
func _on_body_entered(body):
	if finished:
		return
 
	if body.name == "Player":
		if name == "coin69" or name == "69" or name.to_lower().contains("69"):
			count -= 2
			print("KAZNA! Uhvatio si 69, oduzeto -2 boda.")
		else:
			count += 1
			print("NOVČIĆ SKUPLJEN! +1 bod")
		update_count()
		queue_free()
 
func update_count():
	if count_label:
		count_label.text = "COINS: " + str(count)
 
func _on_global_timer_timeout():
	finished = true
	if timer_label:
		timer_label.text = "TIME: 0.0"
	print("VRIJEME JE ISTEKLO!")
