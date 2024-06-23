extends Node2D

@onready var animation_player = $AnimationPlayer

func play_idle():
	animation_player.play("idle")
