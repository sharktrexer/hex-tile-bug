@tool
extends Node

@onready var cur_hex_map:HexagonTileMapLayer = $HexTileLayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	print("cur_hex_map tileset: ", cur_hex_map.tile_set)

	if Engine.is_editor_hint() :

		# attempt use of conversion func
		cur_hex_map.map_to_cube(Vector2i.ZERO)

		