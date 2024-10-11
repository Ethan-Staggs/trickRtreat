extends CharacterBody3D
@onready var skeleton = $AnimationPlayer
@onready var nav = $NavigationAgent3D

const SPEED = 1.0

var radius = 3
var accel = 10



func _physics_process(delta: float) -> void:
	var currentLocation = global_transform.origin
	var nextLocation = nav.get_next_path_position()
	var newVelocity = (nextLocation - currentLocation).normalized() * SPEED
	skeleton.play("Walking_A")
	velocity = newVelocity
	print(global_position)
	move_and_slide()
	
func updateTargetLocation(targetLocation):
	nav.set_target_position(targetLocation)
	

	
