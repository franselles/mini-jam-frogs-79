extends Node

# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"

var FloorNode = preload('res://Floor.tscn')

var coords = [
	[600, 100],
	[500, 300],
	[250, 150],
]

var index = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass  # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass


func _on_Timer_timeout() -> void:
	var floor_node = FloorNode.instance()
	if index < 3:
		floor_node.position.y = coords[index][0]
		floor_node.position.x = coords[index][1]
		add_child(floor_node)
		index += 1
