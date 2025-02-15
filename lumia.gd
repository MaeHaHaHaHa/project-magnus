extends Node

@export var mob_scene: PackedScene
var drop_interval = 1.0  # 1초마다 떨어지게
var drop_timer  # 타이머 변수

func game_over():
	$MobTimer.stop()
	$HUD.show_game_over()
	
	
func _ready():
	randomize()
	Global.timer = $MobTimer
	
func _on_mob_timer_timeout():
	var enemy_scene = preload("res://hyunwoo.tscn")
	var enemy_instance = enemy_scene.instantiate()
	enemy_instance.position = Vector2(randi_range(22, Global.screen_size.x - 22), -60)
	add_child(enemy_instance)

	if Global.start == true:
		$MobTimer.start()
