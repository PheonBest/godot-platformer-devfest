extends Node2D

func _ready():
	$CanvasLayer.hide()

func _on_goal_area_body_entered(body):
	if body.is_in_group("Player"):
		$CanvasLayer.show()
		$Timer.start()

func _on_timer_timeout():
	reset_game()

func _on_damage_zone_body_entered(body):
	print("damage zone entered (1)")
	if body.is_in_group("Player"):
		print("damage zone entered (2)")
		reset_game()

func reset_game():
	print("Reset game")
	$Player.position.x = 140
	$Player.position.y = 328

	# Hide CanvasLayer after resetting the game
	$CanvasLayer.hide()

