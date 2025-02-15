extends Area2D

signal hit

var speed = 500
var screen_size

#func _ready():
	#screen_size = get_viewport_rect().size
	#hide()

func _physics_process(delta):
	var velocity = Vector2()

	if Input.is_action_pressed("ui_right"):
		velocity.x = speed
	if Input.is_action_pressed("ui_left"):
		velocity.x = -speed
	#if Input.is_action_pressed("ui_up"):
		#velocity.y = -speed
	#if Input.is_action_pressed("ui_down"):
		#velocity.y = speed    
	
	position += velocity * delta
	
#func start(pos):
	#position = pos
	#rotation = 0
	#show()
	#$CollisionShape2D.disabled = false


func _on_area_entered(_area: Area2D) -> void:
	hide() # Player disappears after being hit.
	hit.emit()
	 #Must be deferred as we can't change physics properties on a physics callback.
	$CollisionShape2D.set_deferred(&"disabled", true)
