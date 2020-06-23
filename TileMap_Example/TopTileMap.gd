extends TileMap


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if(scan_children()):
		for n in get_children() :
			if n.get_class() == "TileMap" :
				var cells = n.get_used_cells()
				var distance = ( global_position-n.global_position ) / cell_size
				for z in cells:
					set_cellv(z-distance,n.get_cellv(z))
				n.queue_free()
		for o in get_used_cells():
			update_bitmask_area(o)
				
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func scan_children():
	if(get_child_count() == 0):
		print("no children found, skipping")
		return false
	else:
		var ammount = 0
		for c in get_children() :
			if c.get_class() == "TileMap" :
				ammount += 1
		if ammount == 0 :
			print("no TileMap children found, skipping")
			return false
		else:
			print(String(ammount)+" valid children found, starting script")
			return true
	
	pass

