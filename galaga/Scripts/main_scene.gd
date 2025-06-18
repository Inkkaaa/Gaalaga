extends Node2D

var points: int = 0

func _on_player_health_changed(current, max):
	$Ui.update_health(current, max)

func _on_player_player_died():
	$Ui.show_player_died()

func _on_enemy_died():
	points += 100
	$Ui.update_points(points)

func _on_map_enemy_spawned(enemy):
	enemy.enemy_died.connect(_on_enemy_died)


func _on_score_timer_timeout():
	points += 1
	$Ui.update_points(points)
