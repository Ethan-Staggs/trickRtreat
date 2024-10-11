extends CharacterBody3D
@onready var skeleton = $AnimationPlayer
@onready var nav = $NavigationAgent3D

const SPEED = 1.0
var accel = 10

var followTarget:Node

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	# find your target to follow, in this case the player
	followTarget = get_tree().get_first_node_in_group("player")
	
	# find which direction you need to go to followTarget
	var direction = position.direction_to(followTarget.global_position)
	
	# rotate toward the target
	look_at(followTarget.global_position)
	self.rotate_object_local(Vector3.UP, PI)
	
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
		skeleton.play("Walking_A")
	
	move_and_slide()