extends Area2D

signal hit

var speed = 500
var movement_max
var movement_min

func _ready():
	movement_max = Global.screen_size.x - 52
	movement_min = 0 + 52
	
	#screen_size = get_viewport_rect().size
	#hide()

func _physics_process(delta):
	var velocity = Vector2()

	if Input.is_action_pressed("move_right"):
		velocity.x = speed
		var pos_temp = position
		pos_temp += velocity * delta
		if pos_temp.x < movement_max:
			position = pos_temp
		else:
			position.x = movement_max
			
	if Input.is_action_pressed("move_left"):
		velocity.x = -speed
		var pos_temp = position
		pos_temp += velocity * delta
		if pos_temp.x > movement_min:
			position = pos_temp
		else:
			position.x = movement_min


func _on_area_entered(_area: Area2D):
	hide() # Player disappears after being hit.
	hit.emit()
	 #Must be deferred as we can't change physics properties on a physics callback.
	$CollisionShape2D.set_deferred(&"disabled", true)
	Global.start = false
