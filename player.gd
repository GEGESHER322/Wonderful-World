extends CharacterBody2D

@export var BulletForce=2000
@export var speed = 400
var bullet_speed=1000
var bullet=preload("res://rigid_body_2d.tscn")

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed

func _physics_process(delta):
	get_input()
	move_and_slide()
	look_at(get_global_mouse_position())
	
	if Input.is_action_just_pressed("LMB"):
		fire()

func fire():
	var b = bullet.instantiate()
	b.position = get_node("Marker2D").global_position
	b.rotation_degrees = rotation_degrees
	b.apply_impulse(Vector2(bullet_speed, 0).rotated(rotation))
	get_tree().get_root().call_deferred("add_child", b)
	
func kill():
	get_tree().reload_current_scene()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if "enemy" in body.name:
		kill()
