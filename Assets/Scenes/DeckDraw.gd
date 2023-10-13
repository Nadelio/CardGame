extends TextureButton

const CardSize = Vector2(125, 175)


# Called when the node enters the scene tree for the first time.
func _ready():
	scale *= CardSize/size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _gui_input(_event):
	if Input.is_action_just_released("leftclick"):
		if Global.DeckSize > 0:
			Global.DeckSize = Cards.drawcard() #broken
			print(Global.DeckSize)
			if Global.DeckSize == 0:
				disabled = true
