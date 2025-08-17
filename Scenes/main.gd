class_name Overworld extends Node2D

@onready var progress_label = $CanvasLayer/Panel/Container/ProgressLabel
@onready var time_left_label = $CanvasLayer/Panel/Container/TimeLeft
@onready var nest = $Nest

var score = 0;
var time_left = 120
var game_over = false

func _ready() -> void:
	time_left_label.text = "Time left: " + str(time_left)
	$Music.play()


func _on_food_eaten() -> void:
	if game_over:
		return
	
	[$EatSound, $EatSound2].pick_random().play()
	score += 1
	progress_label.text = "Progress: " + str(score)
	if $Timer.wait_time > 1.0:
		$Timer.wait_time -= 0.2


func _on_timer_timeout() -> void:
	var spawn = $FoodSpawns.get_child(randi_range(0, $FoodSpawns.get_child_count() - 1))
	var food = preload("res://Scenes/food.tscn").instantiate()
	food.position = spawn.position
	food.connect("eaten", _on_food_eaten)
	add_child(food)


func _on_timer_time_timeout() -> void:
	time_left -= 1
	time_left_label.text = "Time left: " + str(time_left)
	
	if time_left <= 0:
		game_over = true
		$Timer.stop()
		$TimerTime.stop()
		$CanvasLayer/PanelEnd.show()


func restart_the_game() -> void:
	get_tree().reload_current_scene()
