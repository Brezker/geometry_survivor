extends CharacterBody2D

"""
const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
"""

var move_speed = 500
var bullet_speed = 2000
##var bullet = preload("res://Bullet.tscn")

func _physics_process(delta):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * 600
	move_and_slide()
	
	"""
	var motion = Vector2()
	
	if	Input.is_action_pressed("up"):
		motion.y -= 1
	if	Input.is_action_pressed("down"):
		motion.y += 1
	if	Input.is_action_pressed("right"):
		motion.x += 1
	if	Input.is_action_pressed("left"):
		motion.x -= 1
	
	motion = motion.normalized()
	motion = move_and_slide()"""
	##look_at(get_global_mouse_position())
	##Cambiar a get_nearest_enemy_position()
	
	"""if Input.is_action_just_pressed("LMB"):
		fire()"""
		
func fire():
	"""var bullet_instance = bullet.instance()
	bullet_instance.position = get_global_position()
	bullet_instance.rotation_degrees = rotation_degrees
	bullet_instance.apply_impulse(Vector2(),Vector2(bullet_speed,0).rotated(rotation))
	get_tree().get_root().call_deferred("add_child",bullet_instance)"""
	
func kill():
	get_tree().reload_current_scene()


func _on_Area2D_body_entered(body):
	if "Enemy" in body.name:
		kill()
