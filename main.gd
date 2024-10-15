extends Node3D
@onready var backgroundMusic = $BackgroundMusic
@onready var player = $Player
@onready var label = $Label
@onready var timer = $Timer
@onready var healthBar = $HealthBar



func _ready() -> void:
	healthBar.show_percentage = true
	backgroundMusic.autoplay
	timer.start(60)
	label.set("theme_override_fonts/font", load("res://Assets/Fonts/Haedus.ttf"))
	
	

func _physics_process(delta):
	label.set_text(str(timer.get_time_left()).pad_decimals(1))
	get_tree().call_group("enemies", "updateTargetLocation", player.global_transform.origin)
