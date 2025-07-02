extends Control

func update_health(current, max):
	$HealthBar.max_value = max
	$HealthBar.value = current

func update_points(points):
	$PointsLabel.text = str(points)
	$PlayerDied/PointsLabel_D.text = "Your Score:" +  str(points)

func show_player_died():
	$PlayerDied.show()


func _on_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")

func _on_replay_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/MainScene.tscn")
