class_name  Critter extends CharacterBody2D


@export var speed = 50
@onready var nest = get_tree().get_root().get_node("Main/Nest")
@export var limit = 0.5
var target: Vector2 
var return_home := false
var nest_location: Vector2

var startPosition
var endPosition
var dir 

func _ready():
	#nest_location = nest.global_position
	#startPosition = nest_location
	#endPosition = target
	print("This is the value of target in the Critter scene", target)
	


func _physics_process(delta: float) -> void:
	dir = (target - position)
	if position.distance_to(target) > 10:
		velocity = position.direction_to(target) * speed
		#velocity = dir * speed
		
		
	if position.distance_to(target) < 10:
		print(target)
		target = nest.global_position
		print(target, nest.global_position)
		if position.distance_to(target) < 10:
			queue_free()

	move_and_slide()

	
	
#	This code is used so that the critters do not bump into each other and stop du
	#for i in range(get_slide_collision_count()):
		#var collision = get_slide_collision(i)
		#var collider = collision.get_collider()
		#if collider is Critter:
			#velocity = velocity.bounce(collision.get_normal()) * 1.3
			#var away = (position - collider.position).normalized()
			#velocity += away * 20
	
