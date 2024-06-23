extends Node2D

const MOB = preload("res://scenes/mob.tscn")

@onready var game_over = $GameOver

var time = 0

func spawn_mob():
	var mob = MOB.instantiate()
	%PathFollow2D.progress_ratio = randf()
	mob.global_position = %PathFollow2D.global_position
	add_child(mob)
	
func _on_timer_timeout():
	spawn_mob()
	time += 1
	var h = fmod(time/3600, 24)
	var m = fmod(time/60, 60)
	var s = fmod(time, 60)
	%Time.text = str(h)+":"+str(m)+":"+str(s)	

func _on_player_health_depleted():	
	game_over.visible = true
	#get_tree().paused = true
	
func _on_button_pressed():
	print("button pressed")
	get_tree().reload_current_scene()
	#get_tree().paused = false

func _on_color_changer_color_changed(color: Color):
	print("Change color to "+ str(color))
	%GameBg.color = color
