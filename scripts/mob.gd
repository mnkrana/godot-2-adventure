extends CharacterBody2D

const SPEED = 200.0
const SMOKE_EXPLOSION = preload("res://assets/smoke_explosion/smoke_explosion.tscn")

var health = 3

@onready var player = get_node("/root/Game/Player")
@onready var slime = $Slime

func _ready():
	slime.play_walk()

func _physics_process(_delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * SPEED
	
	move_and_slide()

func take_damage():
	health -= 1
	slime.play_hurt()
	
	if health == 0:
		queue_free()
		var smoke = SMOKE_EXPLOSION.instantiate()
		smoke.global_position = global_position
		get_parent().add_child(smoke)
