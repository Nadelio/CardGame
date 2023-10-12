extends TextureButton

var Decksize = INF


# Called when the node enters the scene tree for the first time.
func _ready():
	scale *= playspace.CardSize/size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _gui_input(event):
	if Input.is_action_just_released("leftclick"):
		if Decksize > 0:
			Decksize = playspace.drawcard()
			if Decksize == 0:
				disabled = true
