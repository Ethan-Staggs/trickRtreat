extends CharacterBody3D
@onready var skeleton = $AnimationPlayer
@onready var nav = $NavigationAgent3D
@onready var player = $Rig/Skeleton3D

const SPEED = 10.0

var accel = 10


func _physics_process(delta: float) -> void:
	skeleton.play("Walking_A")
	var direction = Vector3()
	
	nav.target_position = player.global_position
	direction = nav.get_next_path_position() - global_position
	direction = direction.normalized()
	
	velocity = velocity.lerp(direction * SPEED, accel * delta)
	
	move_and_slide()
	
