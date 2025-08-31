extends Node2D
var _map: Array
var _units: Array
var _units_pos: Array
enum UnitsEnum {SOLDIER=0}

@export var tile_scene: PackedScene
@export var unit_scenes: Dictionary[String, PackedScene]
var tile_size: int = 80

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_right"):
		for y in range(self._units_pos.size()):
			for x in range(self._units_pos[y].size()):
				var index = self._units_pos[y][x]
				if index == -1:
					continue
				var current_pos = self._units[index].pos
				current_pos.x += 1
				self._units[index].move(current_pos)

func set_level(map: Array, units: Array):
	var width = get_viewport_rect().size.x / map[0].size()
	var height = get_viewport_rect().size.y / map.size()
	self.tile_size = round(min(width, height))

	for unit in units:
		var new_unit: Unit
		match unit['type']:
			UnitsEnum.SOLDIER:
				new_unit = Soldier.new(unit['pos'], tile_size)
		self._units.append(new_unit)

	self._map = map
	generate_tiles()
	create_units()

func generate_tiles():
	for y in range(self._map.size()):
		for x in range(self._map[y].size()):
			var new_tile = tile_scene.instantiate()
			new_tile.position = Vector2(x * tile_size, y * tile_size)
			new_tile.set_type(self._map[y][x], tile_size)
			add_child(new_tile)

func create_units():
	# Creating empty position map
	for y in range(self._map.size()):
		var row = []
		for x in range(self._map[0].size()):
			row.append(-1)
		self._units_pos.append(row)
		
	for i in range(self._units.size()):
		# filling unit_positions map
		var pos = self._units[i].pos
		self._units_pos[pos.y][pos.x] = i
		self.add_child(self._units[i])
