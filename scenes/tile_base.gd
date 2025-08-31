extends Node2D

enum TileType {EMPTY= 0, BLOCK= 1, GROUND= 2}
var _color_mapping: Dictionary[TileType, Color] = {
	TileType.EMPTY: Color(0.1,0.1,0.1),
	TileType.BLOCK: Color(0.8, 0.8, 0.8),
	TileType.GROUND: Color(0.2, 0.8, 0.6)
}
var _type: TileType


func set_type(type: TileType, tile_size: int):
	self._type = type
	$ColorRect.color = self._color_mapping[self._type]
	$ColorRect.size = Vector2(tile_size, tile_size)
