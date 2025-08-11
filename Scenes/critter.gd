class_name  Critter extends CharacterBody2D


@onready var target: Node2D = null
@export var speed = 200




func _ready():
	var main_scene = get_tree().root.get_child(0)
	target = main_scene.get_node("Food")
	print(target.position)

func _physics_process(delta: float) -> void:
	var direction = (target.position - position).normalized()
	velocity = direction * speed
	
	
	for i in range(get_slide_collision_count()):
		var collision = get_slide_collision(i)
		var collider = collision.get_collider()
		if collider is Critter:
			velocity = velocity.bounce(collision.get_normal()) * 1.3
			var away = (position - collider.position).normalized()
			velocity += away * 200
	move_and_slide()
