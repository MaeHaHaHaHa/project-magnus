extends Node

@export var mob_scene: PackedScene
var drop_interval = 1.0  # 1초마다 떨어지게
var drop_timer  # 타이머 변수

func _ready():
	randomize()
	
func _on_mob_timer_timeout():
	var enemy_scene = preload("res://hyunwoo.tscn")
	var enemy_instance = enemy_scene.instantiate()
	enemy_instance.global_position = Vector2(randi_range(22, 800-22), -90)
	add_child(enemy_instance)

	$MobTimer.start()
