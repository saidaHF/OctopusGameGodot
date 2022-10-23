extends CanvasLayer

signal start_game
signal BombButton
signal Difficult


var timer = null

# Called when the node enters the scene tree for the first time. (Only when enter in the game)
func _ready():
	$BombButton.hide()

func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func show_game_over():
	show_message("Game Over")
	# Wait until the MessageTimer has counted down.
	yield($MessageTimer, "timeout")
	$Message.text = "Dodge the\nCreeps!"
	$Message.show()
	# Make a one-shot timer and wait for it to finish.
	yield(get_tree().create_timer(1), "timeout")
	$StartButton.show()	
	$BombButton.hide()
	
func update_score(score):
	$ScoreLabel.text = str(score)

func _on_MessageTimer_timeout():
	$Message.hide()
	
func _on_StartButton_pressed():
	$StartButton.hide()
	$BombButton.disabled = false
	$BombButton.show()
	emit_signal("start_game")
	
	$ChoseLevel.hide()
	$ButtonEasy.hide()
	$ButtonHard.hide()

func _on_BombButton_pressed():
	get_tree().call_group("mobs", "queue_free")
	$BombButton.disabled = true
	# TIME DELAY FOR CLICK THE BUTTON BUMB!:	
	yield(get_tree().create_timer(5), "timeout")
	$BombButton.disabled = false

func _on_ButtonEasy_pressed():
	emit_signal("Difficult", "easy")
	
func _on_ButtonHard_pressed():
	emit_signal("Difficult", "hard")	

