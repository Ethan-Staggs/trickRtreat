extends Node3D
@onready var backgroundMusic = $BackgroundMusic
@onready var player = $Player

func _ready() -> void:
	backgroundMusic.autoplay

func _physics_process(delta):
	get_tree().call_group("enemies", "updateTargetLocation", player.global_transform.origin)
