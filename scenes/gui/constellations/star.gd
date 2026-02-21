#@tool
class_name Star
extends Node2D

var origin_pos:Vector2
@export var color:Color = Color("40364a")

@export var radius := 14.0
@export var speed := 0.05

var noise := FastNoiseLite.new()
var time := 0.0

func _ready():
	origin_pos = position
	noise.seed = randi()
	noise.frequency = 0.5

func _draw():
	draw_circle(Vector2(0, 0), 3, color, true)

func _process(delta):
	time += delta * speed
	
	var offset_x = noise.get_noise_1d(time)
	var offset_y = noise.get_noise_1d(time + 100.0) # offset so x/y differ
	
	position = origin_pos + Vector2(offset_x, offset_y) * radius
	
	queue_redraw()
