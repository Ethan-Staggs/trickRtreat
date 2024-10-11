extends CharacterBody3D
@onready var skeleton = $AnimationPlayer
@onready var nav = $NavigationAgent3D

const SPEED = 5.0

var radius = 3
var accel = 10

func _physics_process(delta: float) -> void:
	skeleton.play("Running_A")
	var currentLocation = global_transform.origin
	var nextLocation = nav.get_next_path_position()
	var newVelocity = (nextLocation - currentLocation).normalized() * SPEED
	velocity = newVelocity
	print(newVelocity)
	move_and_slide()
	
func updateTargetLocation(targetLocation):
	nav.set_target_position(targetLocation)
	

	
