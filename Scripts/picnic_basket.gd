class_name Food extends Area2D


var picked_up: bool = false
var critter
signal carrying
signal eaten

func _ready() -> void:
	connect("body_entered", Callable(self, "_on_body_entered"))
	

func _physics_process(delta: float) -> void:
	if picked_up == true:
		if is_instance_valid(critter):
			position = position.move_toward(critter.position, delta * 200)
		else:
			emit_signal("eaten")
			queue_free()
		
	
func _on_body_entered(body):
	if body == Nest:
		print("congrats!")
	else:
		emit_signal("carrying")
		picked_up = true
		critter = body
		$PickupSound.play()

	
	
