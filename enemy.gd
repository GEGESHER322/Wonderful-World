extends CharacterBody2D




func _physics_process(delta: float) -> void:
	var player=get_parent().get_node("player")
	position+=(player.position-position)/50
	look_at(player.position)

	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if "rigid_body_2d" in body.name:
		queue_free()
