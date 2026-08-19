@tool
extends Node

'''coord conversion methods that apply to my tilemap's config'''
#cube to map
# HexagonTileMap._cube_to_horizontal_stacked()

#map to cube
# HexagonTileMap._horizontal_stacked_to_cube()

# layer to copy cells onto
@onready var copy_to: HexagonTileMapLayer = $HexTileLayer

const copy_from := preload('uid://bm4yq77ujqqyr')



# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	# inits
	var copy_from_layer: HexagonTileMapLayer = copy_from.instantiate().find_child('HexTileLayer')
	var copy_from_cells: Array[Vector2i] = copy_from_layer.get_used_cells()

	# Doesn't Work when using conversion func from another scene's hex layer (tileset is defined)
	print(copy_from_layer.tile_set)
	var transform_vect = Vector3i(0,0,0) - copy_from_layer.map_to_cube(copy_from_cells[0])

	# Works when using the hex layer in this scene
	#var transform_vect := Vector3i(0,0,0) - copy_to.map_to_cube(copy_from_cells[0])
	
	for copy_vect in copy_from_cells:
		var trans_vect = copy_to.cube_to_map( copy_to.map_to_cube(copy_vect) + transform_vect )
		copy_to.set_cell(trans_vect, 0, Vector2i.ZERO, 0)
		
