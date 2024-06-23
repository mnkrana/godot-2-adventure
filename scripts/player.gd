extends CharacterBody2D

signal health_depleted

const SPEED = 600.0
const DAMAGE_RATE = 50.0

@onready var character = $Character
@onready var hurt_box = $HurtBox
@onready var health_bar = $HealthBar

var health = 100.0


func _physics_process(delta):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * SPEED

	move_and_slide()
	
	character.play_idle()
	
	var overlapping_mobs = hurt_box.get_overlapping_bodies()
	if overlapping_mobs.size() > 0:
		health -= DAMAGE_RATE * overlapping_mobs.size() * delta		
		health_bar.value = health
		if health <= 0.0:
			health_depleted.emit()
		
	
