extends CanvasLayer

signal start_game

func show_message(text):
	$MessageLabel.text = text
	#$MessageLabel.show()
	#$MessageTimer.start()


func show_score(text):
	$ScoreLabel.text = Global.score


func show_game_over():
	$MessageLabel.show()
	show_message("Game Over")
	#await $MessageTimer.timeout
	#$MessageLabel.text = "멧현우 피하기"
	#$MessageLabel.show()
	#await get_tree().create_timer(1).timeout
	#$StartButton.show()


func _on_StartButton_pressed():
	$StartButton.hide()
	$MessageLabel.hide()
	start_game.emit()
	Global.timer.start()
	
