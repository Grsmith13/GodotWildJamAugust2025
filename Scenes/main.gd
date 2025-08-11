class_name Overworld extends Node2D

@export var critter_scene: PackedScene

@onready var progress_label = $ProgressLabel
var scene = preload("res://Scenes/critter.tscn")
var spawn_position = position
var score = 0;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var food = get_node("Food")
	#food.connect("eaten", Callable(self, "_on_food_eaten"))



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _input(event):
	if event is InputEventMouseButton and event.pressed:
		spawn_position = get_global_mouse_position()
		var instance = scene.instantiate()
		get_parent().add_child(instance)
		instance.position = Vector2(spawn_position)
		print(spawn_position)


func _on_food_eaten() -> void:
	score += 1
	progress_label.text = "Progress: " + str(score)
