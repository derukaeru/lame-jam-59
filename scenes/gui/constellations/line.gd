#@tool
class_name StarLine
extends Node2D

@export var node_a:Star
@export var node_b:Star
@export var color:Color = Color("312234")

func _ready():
	pass # Replace with function body.

func _draw():
	var a_pos = node_a.position
	var b_pos = node_b.position
	
	position = a_pos
	draw_line(Vector2(0, 0), b_pos - a_pos, color, 1.8, false)

func _process(_delta):
	queue_redraw()
