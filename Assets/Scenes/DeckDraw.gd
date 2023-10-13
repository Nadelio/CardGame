extends TextureButton

var Player_Hand = preload("res://Assets/Cards/CardScripts/Player_Hand.gd").new()



# Called when the node enters the scene tree for the first time.
func _ready():
	scale *= Cards.CardSize/size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _gui_input(_event):
	if Input.is_action_just_released("leftclick"):
		if Cards.DeckSize > 0:
			Cards.DeckSize = Cards.drawcard()
			if Cards.DeckSize == 0:
				disabled = true
