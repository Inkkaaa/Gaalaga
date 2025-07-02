extends Control

func _ready() -> void:
	get_tree().paused = false

func _on_start_pressed():
	get_tree().change_scene_to_file("res://Scenes/MainScene.tscn")

func _on_credits_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Creditos.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()
