class_name Food extends Area2D


var picked_up: bool = false
var critter
signal carrying

func _ready() -> void:
	connect("body_entered", Callable(self, "_on_body_entered"))

func _physics_process(delta: float) -> void:
	if picked_up == true:
		position = position.move_toward(critter.position, delta * 200)
		
	
func _on_body_entered(body):
	emit_signal("carrying")
	picked_up = true
	critter = body
	
	
