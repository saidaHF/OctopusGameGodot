extends RigidBody2D


# Called when the node enters the scene tree for the first time.
# First, we get the list of animation names from the AnimatedSprite's 
# frames property. This returns an Array containing all three animation names: ["walk", "swim", "fly"].
# randi() % n select a random number (0 and n-1)
func _ready():
	$AnimatedSprite.playing = true
	var mob_types = $AnimatedSprite.frames.get_animation_names()
	$AnimatedSprite.animation = mob_types[randi() % mob_types.size()]


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
