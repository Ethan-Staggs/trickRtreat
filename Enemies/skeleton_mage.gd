extends CharacterBody3D
@onready var skeleton = $AnimationPlayer
@onready var nav = $NavigationAgent3D

const SPEED = 1.0

var accel = 10


func _physics_process(delta: float) -> void:
	skeleton.play("Walking_A")
	velocity = Vector3.BACK * SPEED
	move_and_slide()
	

	
