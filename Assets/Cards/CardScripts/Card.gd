extends Control

#signals

#variables
var Cardname = 'Knight'
var startpos = 0
var targetpos = 0
var t = 0
var DRAWTIME = 1
var state = InHand

#state enum
enum
{
	InHand, InPlay, InMouse, FocusInHand, MoveDrawnCardToHand, ReOrganiseHand
}

#ONREADY VARIABLES
@onready var CardDatabase = preload("res://Assets/Cards/CardScripts/CardDatabase.gd").new()
@onready var CardInfo = CardDatabase.DATA[CardDatabase.get(Cardname)]
@onready var CardName = CardInfo[5]
@onready var CardImg = str("res://Assets/Cards/Card Faces/", CardName, ".png")
@onready var CardFrame = str("res://Assets/Cards/Card Frames/", CardInfo[8], CardInfo[7])

# Called when the node enters the scene tree for the first time.
func _ready():
	$Card.texture = load(CardImg)
	$Frame.texture = load(CardFrame)
	$"Card Title".text = Cardname
	$"Card Ability".text = str($"Card Ability".text, CardInfo[6])
	var Damage = str(CardInfo[1])
	var Retaliation = str(CardInfo[2])
	var Health = str(CardInfo[3])
	var Cost = str(CardInfo[4])
	$"Card Health".text = Health
	$"Card Damage".text = Damage
	$"Card Retaliation".text = Retaliation
	$"Card Cost".text = Cost

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	match state:
		InHand:
			pass
		InPlay:
			pass
		InMouse:
			pass
		FocusInHand:
			pass
		MoveDrawnCardToHand: #animate from the deck to my hand
			pass
			if t <= 1: #always be a 1
				position = startpos.lerp(targetpos, t)
				t += delta/float(DRAWTIME)
			else:
				position = targetpos
				state = InHand
				t = 0
		ReOrganiseHand:
			pass
			


func _on_area_2d_mouse_entered():
	var max_index = get_parent().get_child_count()
	get_node("Hovered").show()
	get_parent().move_child(self, max_index)


func _on_area_2d_mouse_exited():
	var max_index = get_parent().get_child_count()
	get_parent().move_child(self, max_index * -1)
	get_node("Hovered").hide()
