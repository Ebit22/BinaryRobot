extends Node2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Brain.input == "101010":
		$"1".enabled = false
		$Labels.queue_free()
		$"2".enabled = true
