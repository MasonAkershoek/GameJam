extends Node2D




func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		Global.CollectedShipParts += 1
		queue_free()
