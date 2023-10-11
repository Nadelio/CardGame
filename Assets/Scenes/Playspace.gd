extends Node2D

const CardSize = Vector2(125, 175)
const CardBase = preload("res://Assets/Cards/Card.tscn")
const PlayerHand = preload("res://Assets/Cards/CardScripts/Player_Hand.gd")
var CardSelected = []
@onready var DeckSize = PlayerHand.CardList.size()
@onready var CenterCardOval = get_viewport().size * Vector2(0.5, 1.3)
@onready var Horizontal_rad = get_viewport().size.x * 0.45
@onready var Vertical_rad = get_viewport().size.y * 0.4

var angle = deg2rad(90) 
var OvalAngleVector

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func drawcard():
	var new_card = CardBase.instantiate()
	CardSelected = randi() % DeckSize
	new_card.Cardname = PlayerHand.CardList[CardSelected]
	new_card.position = CenterCardOval + 
	new_card.scale *= CardSize/new_card.size
	$Cards.add_child(new_card)
	PlayerHand.CardList.erase(PlayerHand.CardList[CardSelected])
	DeckSize -= 1
	return DeckSize
