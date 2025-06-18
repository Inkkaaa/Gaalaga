extends CharacterBody2D

var speed = -250

@export var max_hp : float = 2
var current_hp: float

@export var collision_damage = 1

signal health_changed(current, max)
signal enemy_died

func _ready():
	current_hp = max_hp
	health_changed.emit(current_hp, max_hp)


func _process(delta: float) -> void:
	position.x += speed * delta
	if position.x < - 100:
		queue_free()

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	
	if collision:
		var body = collision.get_collider()
		
		print('Enemy hit: ', body.name)
		
		if body.has_method("take_damage"):
			body.take_damage(collision_damage)

func take_damage(damage):
	current_hp -= damage
	
	#print("Enemy took %s damage. Current HP: %s/%s" % [damage, current_hp, max_hp])
	
	current_hp = clamp(current_hp,0,max_hp)
	health_changed.emit(current_hp, max_hp)
	
	if current_hp <= 0:
		die()
	
func die():
	#print("Enemy Died")
	
	enemy_died.emit()
	
	queue_free()
