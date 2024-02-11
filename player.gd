extends Area2D


const MOVE_SPEED = 300.0
const SCREEN_WIDTH = 320
const SCREEN_HEIGHT = 180
var can_shoot = true
var BulletScene = preload("res://Bullet.gd")

func _process(delta):
	var direction = Vector2.ZERO
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	
	if Input.is_key_pressed(KEY_SPACE) and can_shoot:
		shoot()
		
	# Normaliza la dirección para asegurar que el personaje se mueva a la misma velocidad en todas las direcciones
	direction = direction.normalized()
	
	# Mueve al personaje multiplicando la dirección por la velocidad y el delta de tiempo
	position += MOVE_SPEED * direction * delta
	
	# Limita al personaje dentro de los límites de la pantalla
	position.x = clamp(position.x, 0, SCREEN_WIDTH)
	position.y = clamp(position.y, 0, SCREEN_HEIGHT)

func shoot():
	can_shoot = false
	var bullet_instance =  BulletScene.instance()
	bullet_instance.position = position
	get_parent().add_child(bullet_instance)
	$Timer.start()
	

func _on_timer_timeout():
	can_shoot = true
	$Timer.stop()
