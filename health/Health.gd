extends Node2D


signal max_changed(new_max)
signal changed(new_amount)
signal depleted
signal demage_player

export(int) var max_amount = 10 setget set_max
#export(int) onready var current = max_amount setget set_current
export(int) var current = 10

func _ready():
	#_initialize()
	current = max_amount

func set_max(new_max):
	current = new_max
	current = max(1, new_max)
	emit_signal("max_changed", max_amount)

func _initialize():
	current = max_amount
	emit_signal("max_changed", max_amount)
	emit_signal("changed", current)

func _on_Player_hit():
	current -= 1
	current = clamp(current, 0 , max_amount)
	emit_signal("changed", current)
	$Wrapper/HealthBar.value = current
	
	if (current == 0):
		emit_signal("depleted")

func hide():
	$Wrapper.hide()

func show():
	$Wrapper.show()

