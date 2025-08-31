class_name Soldier
extends Unit
var soldier_texture = preload("res://icon.svg")

func _init(pos: Vector2i, tile_size: int):
	self.tile_size = tile_size
	self.pos = pos

func _ready() -> void:
	super._ready()
	self.sprite.texture = soldier_texture
