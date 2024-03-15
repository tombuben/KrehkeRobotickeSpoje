extends Node2D

@export var player : int = 1
@export var leva_ruka : bool = true;
@export var prava_ruka : bool = true;
@export var speed_multiplier : float = 100

var kolecko : Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	kolecko = $kolo
	kolecko.init_kolo(player, speed_multiplier)
	$telo/rukaLeva.init_ruka(player)
	$telo/rukaPrava.init_ruka(player)

func get_kolo_position():
	return kolecko.global_position
