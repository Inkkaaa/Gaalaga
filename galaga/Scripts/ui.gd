extends Control

func update_health(current, max):
	$HealthBar.max_value = max
	$HealthBar.value = current

func update_points(points):
	$PointsLabel.text = str(points)
	$PlayerDied/PointsLabel_D.text = "Your Score: " + str(points)

func show_player_died():
	$PlayerDied.show()
