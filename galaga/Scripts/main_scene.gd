extends Node2D

var points: int = 0

func _ready() -> void:
	get_tree().paused = false

func _process(delta: float) -> void:
	if Input.is_action_pressed("pause"):
		pause()


func _on_player_health_changed(current, max):
	$Ui.update_health(current, max)

func _on_player_player_died():
	$Ui.show_player_died()
	$ScoreTimer.queue_free()
	$Player.queue_free()
	get_tree().paused = true

func _on_enemy_died():
	points += 100
	$Ui.update_points(points)

func _on_map_enemy_spawned(enemy):
	enemy.enemy_died.connect(_on_enemy_died)


func _on_score_timer_timeout():
	points += 1
	$Ui.update_points(points)


func pause():
		print("PAUSOU")
		$Node2D.show()
		get_tree().paused = true
