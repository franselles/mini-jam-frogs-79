extends Area2D


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"

onready var timer = $Timer
onready var tween_show = $TweenFloorShow
onready var tween_hide = $TweenFloorHide
onready var sprite = $Sprite
onready var label = $Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#show_floor()
	timer.wait_time = 5
	label.text = str(timer.wait_time)
	timer.start()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	label.text = str(round(timer.time_left))
	pass

func show_floor() -> void:
	tween_show.interpolate_property(self, 'scale',
		Vector2.ZERO, Vector2(3, 3),
		2.0, Tween.TRANS_BOUNCE, Tween.EASE_IN_OUT)
	tween_show.start()


func _on_Timer_timeout() -> void:
	timer.stop()
	tween_hide.interpolate_property(self, 'scale',
		scale, Vector2.ZERO,
		2.0, Tween.TRANS_BACK, Tween.EASE_IN_OUT)
	tween_hide.start()


func _on_TweenFloorHide_tween_completed(object: Object, key: NodePath) -> void:
	self.queue_free()
	pass # Replace with function body.
