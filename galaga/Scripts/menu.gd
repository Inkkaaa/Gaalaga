extends Control

func _on_start_pressed():
	get_tree().change_scene_to_file("res://Scenes/MainScene.tscn")

func _on_scoreboard_pressed():
	pass # Replace with function body.


func _on_credits_pressed() -> void:
	pass # Replace with function body.


func _on_quit_pressed() -> void:
	get_tree().quit()
