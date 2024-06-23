extends Area2D

const BULLET = preload("res://scenes/bullet.tscn")
var enemies_in_range

func _physics_process(_delta):
	enemies_in_range = get_overlapping_bodies()
	if enemies_in_range.size() > 0:
		var target_enemy = enemies_in_range.front()
		look_at(target_enemy.global_position)


func shoot():
	var bullet = BULLET.instantiate()
	bullet.global_position = %ShootingPoint.global_position
	bullet.global_rotation = %ShootingPoint.global_rotation
	%ShootingPoint.add_child(bullet)


func _on_timer_timeout():
	if enemies_in_range.size() > 0:
		shoot()
