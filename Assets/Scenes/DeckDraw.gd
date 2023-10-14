extends TextureButton

const CardSize = Vector2(125, 175)


# Called when the node enters the scene tree for the first time.
func _ready():
	scale *= CardSize/size


func _on_cards_disable_node():
	disabled = true
