extends Area2D

const MOVE_SPEED = 200
const SCREEN_WIDTH = 320

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += Vector2(MOVE_SPEED * delta,0)
	if position.x > SCREEN_WIDTH +10:
		queue_free()


func _on_area_entered(area):
	if area.is_in_group("asteroid"):
		queue_free()
