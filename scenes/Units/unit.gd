class_name Unit
extends Node2D
static var group_name = "unit"
enum LimitDirEnum {SIDE, CROS, FRONT}
enum DirectionsEnum {LEFT, RIGHT, UP, DOWN, IDLE}

@export var pos = Vector2i(0, 0)
@export var maximum_health = 1000.0
@export var damage_power = 100.0
var buffs: Array[String] = []
var debuffs: Array[String] = []
var health = 1000.0
var sprite: Sprite2D
var unit_name: String
var maximum_move: int = 1
var shooring_direction
var tile_size: int

func _ready() -> void:
	self.sprite = Sprite2D.new()
	self.move(self.pos)
	scale = Vector2.ONE
	self.sprite.scale = Vector2((tile_size/128.0) * .75, (tile_size/128.0)*.75)
	print(tile_size)

	self.add_child(sprite)

func move(pos: Vector2i):
	self.pos = pos
	var tween = get_tree().create_tween()
	var target_pos = Vector2()
	target_pos.x = (self.pos.x + 0.5) * self.tile_size
	target_pos.y = (self.pos.y + 0.5) * self.tile_size
	tween.tween_property(self, 'position', target_pos, 0.2)

func attack():
	pass
