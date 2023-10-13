extends Node

const CardSize = Vector2(125, 175)
const CardBase = preload("res://Assets/Cards/Card.tscn")
const PlayerHand = preload("res://Assets/Cards/CardScripts/Player_Hand.gd")
var CardSelected = []
@onready var DeckSize = PlayerHand.CardList.size()
@onready var ViewportSize = Vector2(get_viewport().size)
@onready var CenterCardOval = ViewportSize * Vector2(0.5, 1.3)
@onready var Horizontal_rad = ViewportSize.x * 0.45
@onready var Vertical_rad = ViewportSize.y * 0.4

var angle = deg_to_rad(90) 
var OvalAngleVector = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func drawcard():
	var new_card = CardBase.instantiate()
	CardSelected = randi() % DeckSize
	new_card.Cardname = PlayerHand.CardList[CardSelected]
	Horizontal_rad *= cos(angle)
	Vertical_rad *= sin(angle)
	OvalAngleVector = Vector2(Horizontal_rad, - Vertical_rad)
	new_card.position = CenterCardOval + OvalAngleVector - new_card.size/2
	new_card.scale *= CardSize/new_card.size
	add_child(new_card)
	PlayerHand.CardList.erase(PlayerHand.CardList[CardSelected])
	DeckSize -= 1
	return DeckSize

