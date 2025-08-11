class_name Food extends Area2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

signal eaten

func _ready() -> void:
	connect("body_entered", Callable(self, "_on_body_entered"))

func _physics_process(delta: float) -> void:
	pass
	
func _on_body_entered(body):
	emit_signal("eaten")
	body.queue_free()
