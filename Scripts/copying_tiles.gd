extends Node

# layer to copy cells onto
@onready var copy_to: HexagonTileMapLayer = $HexTileLayer

# layer to copy cells from (comes from a different scene)
const copy_from := preload('uid://bm4yq77ujqqyr')


func _ready() -> void:

	# inits
	var copy_from_layer: HexagonTileMapLayer = copy_from.instantiate().find_child('HexTileLayer')
	var copy_from_cells: Array[Vector2i] = copy_from_layer.get_used_cells()

	# tile_set exists
	print('copy from layer tileset: ', copy_from_layer.tile_set)
	print('copy to layer tileset: ', copy_to.tile_set)

	# the offset to place the copied cells
	var anchor_vector := Vector3i(2,0,1)

	# Doesn't Work when using conversion func from another scene's hex layer (tileset is defined)
	var transform_vect = anchor_vector - copy_from_layer.map_to_cube(copy_from_cells[0])

	# Works when using the hex layer in this scene
	#var transform_vect := anchor_vector - copy_to.map_to_cube(copy_from_cells[0])
	
	for copy_vect in copy_from_cells:
		var trans_vect = copy_to.cube_to_map( copy_to.map_to_cube(copy_vect) + transform_vect )
		copy_to.set_cell(trans_vect, 0, Vector2i.ZERO, 0)
		
