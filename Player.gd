extends Area2D
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export (int) var speed  # How fast the player will move (pixels/sec).
var screensize  # Size of the game window.

# Called when the node enters the scene tree for the first time.
func _ready():
	screensize = get_viewport_rect().size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var velocity = Vector2() # The player's movement vector.
	if Input.is_action_pressed("ui_right"):
			velocity.x += 1
	if Input.is_action_pressed("ui_left"):
			velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
			velocity.y += 1
	if Input.is_action_pressed("ui_up"):
			velocity.y -= 1
	if velocity.length() > 0:
			velocity = velocity.normalized() * speed
			$AnimatedSprite.play()
	else:
			$AnimatedSprite.stop()
