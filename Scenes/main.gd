class_name Overworld extends Node2D


@onready var progress_label = $ProgressLabel
@onready var nest = $Nest


var score = 0;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var food = get_node("Food")



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass




func _on_food_eaten() -> void:
	score += 1
	progress_label.text = "Progress: " + str(score)
