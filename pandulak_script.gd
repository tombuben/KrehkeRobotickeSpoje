extends Node2D

@export var player : int = 1
@export var leva_ruka : bool = true;
@export var prava_ruka : bool = true;

var kolecko : Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	kolecko = $kolo
	kolecko.init_kolo(player)

func get_kolo_position():
	return kolecko.global_position
