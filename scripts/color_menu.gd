extends Control

signal color_changed(color: Color)

var self_opened = false

@onready var color_1 = $ColorMenu/VBoxContainer/Color1
@onready var color_2 = $ColorMenu/VBoxContainer/Color2
@onready var color_3 = $ColorMenu/VBoxContainer/Color3

func _ready():
	visible = self_opened

func _input(event):
	if event.is_action_pressed("ui_accept"):
		toggle_color_changer()
		
func toggle_color_changer():
	self_opened = !self_opened	
	visible = self_opened

func _on_color_1_pressed():
	change_color(1)
	color_2.set_pressed_no_signal(false)
	color_3.set_pressed_no_signal(false)

func _on_color_2_pressed():
	change_color(2)
	color_1.set_pressed_no_signal(false)
	color_3.set_pressed_no_signal(false)

func _on_color_3_pressed():
	change_color(3)	
	color_1.set_pressed_no_signal(false)
	color_2.set_pressed_no_signal(false)
	
func change_color(color : int):	
	match color:
		1:
			color_changed.emit(Color.RED)
		2:
			color_changed.emit(Color.GREEN)			
		3:
			color_changed.emit(Color.BLUE)			
		_:
			color_changed.emit(Color.WHITE)
