extends Node2D
@export var map: Array = [
	[0,0,0,0,0,0,0,0],
	[2,2,2,2,2,2,2,2],
	[2,2,2,1,2,1,2,2],
	[2,2,2,2,2,2,2,2],
	[0,0,0,0,0,0,0,0]
]

func _ready() -> void:
	var units = [
		{
			"type": $Ground.UnitsEnum.SOLDIER,
			"pos": Vector2i(3,2)
		}
	]
	$Ground.set_level(map, units)
	$Ground.position = Vector2(-4*$Ground.tile_size, -2.5*$Ground.tile_size)
