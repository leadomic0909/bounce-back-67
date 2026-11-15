extends Area2D

static var count = 0
static var finished = false

var coin_speed = 250.0

var count_label: Label = null
var timer_label: Label = null
var game_timer: Timer = null

func _ready():
	setup_ui_and_timer()
	update_count()
	if not body_entered.is_connected(_on_body_entered):
		body_entered.connect(_on_body_entered)

func setup_ui_and_timer():
	# Pronađi ili stvori UI sloj preko koda
	var ui = get_node_or_null("../UI")
	if not ui:
		ui = CanvasLayer.new()
		ui.name = "UI"
		get_parent().add_child(ui)
		
	# Pronađi ili stvori Label za bodove
	count_label = ui.get_node_or_null("Count")
	if not count_label:
		count_label = Label.new()
		count_label.name = "Count"
		count_label.position = Vector2(20, 20)
		ui.add_child(count_label)
		
	# Pronađi ili stvori Label za vrijeme
	timer_label = ui.get_node_or_null("Timer")
	if not timer_label:
		timer_label = Label.new()
		timer_label.name = "Timer"
		timer_label.position = Vector2(20, 50)
		ui.add_child(timer_label)

	# Stvori pravi Godot Timer preko koda (ako već ne postoji) da radi neovisno o novčićima
	game_timer = ui.get_node_or_null("GameTimer")
	if not game_timer:
		game_timer = Timer.new()
		game_timer.name = "GameTimer"
		game_timer.wait_time = 15.0 # Vrijeme u sekundama
		game_timer.one_shot = true
		ui.add_child(game_timer)
		game_timer.timeout.connect(_on_timer_timeout)
		game_timer.start()

func _process(delta):
	if finished:
		return

	# Pomicanje novčića
	position.x -= coin_speed * delta

	# Ažuriranje teksta tajmera na ekranu
	if game_timer and not game_timer.is_stopped() and timer_label:
		timer_label.text = "TIME: " + String.num(game_timer.time_left, 1)

func _on_body_entered(body):
	if finished:
		return

	if body.name == "Player":
		if name == "coin69" or name == "69":
			count -= 2
			if count < 0:
				count = 0 # Sprečava minus bodove
			print("KAZNA! Uhvatio si 69, oduzeto -2 boda.")
		else:
			count += 1
			print("NOVČIĆ SKUPLJEN! +1 bod")
		
		update_count()
		queue_free()

func update_count():
	if count_label:
		count_label.text = "COINS: " + str(count)

func _on_timer_timeout():
	if finished:
		return
	finished = true
	if timer_label:
		timer_label.text = "TIME: 0.0"
	print("VRIJEME JE ISTEKLO! GAME OVER!")
