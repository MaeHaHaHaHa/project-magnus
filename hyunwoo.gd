extends Area2D

var speed = 500  # 떨어지는 속도

func _process(delta):
	position.y += speed * delta
	if position.y > 800:  # 화면 끝까지 내려가면 다시 위로
		queue_free()  # 삭제
