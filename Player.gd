extends Area2D

# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"
var rotate = 4
var velocity = 100
var position_2 = Vector2()

onready var tween_jump = $TweenJump
onready var ani_player = $AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass  # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed('ui_left'):
		rotation -= rotate * delta
	if Input.is_action_pressed('ui_right'):
		rotation += rotate * delta
#	if Input.is_action_pressed('ui_up'):
#		velocity = 200
#	else:
#		velocity = 0

	if Input.is_action_pressed('ui_select'):
		ani_player.play('up')
		#position_1 += position 
		position_2 = position + Vector2(velocity * sin(rotation), -velocity * cos(rotation))
		tween_jump.interpolate_property(
			self, 'position', position, position_2, 1.0 / 4, Tween.TRANS_SINE, Tween.EASE_IN_OUT
		)
		tween_jump.start()

	#position += Vector2.UP.rotated(rotation) * velocity * delta

	if get_overlapping_areas().size() == 0:
		ani_player.play('die')


func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	if anim_name == 'die':
		self.queue_free()
