class_name  Nest extends  Area2D

@onready var critter  = preload("res://Scenes/critter.tscn")
@onready var main = get_tree().get_root().get_node("Main")
var inst_num = 0
var target: Vector2 = Vector2.ZERO

func _input(event):
	if event is InputEventMouseButton and event.pressed:
		var instance = critter.instantiate()
		inst_num += 1
		$Music.set_parameter("Parameter 1", inst_num)
		$BugsSound.play()
		target = get_global_mouse_position()
		instance.position = global_position
		instance.nest_location = global_position
		instance.target = target
		print("This is the value of target in the Nest scene" , target, "nest location", instance.nest_location)
		main.add_child(instance)
		
		
