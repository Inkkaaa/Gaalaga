extends CharacterBody2D

const JUMP_VELOCITY = -15

@onready var current_weapon = $Weapon

@export var max_hp: float = 5
var current_hp: float

signal health_changed(current, max)
signal player_died

func _ready():
	current_hp = max_hp
	health_changed.emit(current_hp, max_hp)

func _process(delta):
		current_weapon.shoot()

func _physics_process(delta: float) -> void:
	velocity += get_gravity() * delta 
	if Input.is_action_pressed("up"):
		velocity.y += JUMP_VELOCITY

	move_and_slide()

func take_damage(damage):
	current_hp -= damage
	
	print("Player took %s damage. Current HP: %s/%s" % [damage, current_hp, max_hp])
	
	current_hp = clamp(current_hp,0,max_hp)
	health_changed.emit(current_hp, max_hp)
	
	if current_hp == 0:
		die()
	
func die():
	print("Player Died")
	
	player_died.emit()
	
	queue_free()
