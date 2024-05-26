extends CharacterBody2D

func _physics_process(delta):
	var player = get_parent().get_node("PlayerBody/CollisionShape2D")
	if not player:
		print('Perdiste')

	var direction = (player.global_position - global_position).normalized()

	# Mover al enemigo a velocidad constante
	velocity = direction * speed
	move_and_slide()

	# Mirar hacia el jugador
	look_at(player.global_position)

func _on_area_entered(area):
	if area.is_in_group("bullets"):  # Usar grupos para identificar balas
		queue_free()

@export var speed = 150  # Velocidad de movimiento

@onready var player = get_node_or_null("/root/Player")  # Referencia al jugador (ajusta la ruta)
