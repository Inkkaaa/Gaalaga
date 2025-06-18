extends Node
@export var enemy_to_spawn: PackedScene

@onready var shapeSize = $SpawnArea/CollisionShape2D.shape.extents
@onready var origin = $SpawnArea/CollisionShape2D.global_position
@onready var spawnStart = origin - shapeSize
@onready var spawnEnd = origin + shapeSize
# Called when the node enters the scene tree for the first time.

signal enemy_spawned(enemy)

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_spawn_timer_timeout() -> void:
	var x = randf_range(spawnStart.x, spawnEnd.x)
	var y = randf_range(spawnStart.y, spawnEnd.y)
	
	var e = enemy_to_spawn.instantiate()
	e.position = Vector2(x,y)
	call_deferred("add_child", e)
	
	enemy_spawned.emit(e)

func _on_remove_area_body_entered(body: Node2D) -> void:
	print("enemy removed" + str(body))
	body.queue_free()
