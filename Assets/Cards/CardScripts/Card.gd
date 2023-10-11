extends Control

#VARIABLES
var Cardname = 'Knight'

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
func _process(delta):
	pass
