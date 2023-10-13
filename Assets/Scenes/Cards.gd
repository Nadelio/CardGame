extends Node

const CardSize = Vector2(125, 175)
const CardBase = preload("res://Assets/Cards/Card.tscn")
var CardSelected = []
@onready var ViewportSize = Vector2(get_viewport().content_scale_size)
@onready var CenterCardOval = ViewportSize * Vector2(0.5, 1.25)
@onready var Horizontal_rad = ViewportSize.x * 0.45
@onready var Vertical_rad = ViewportSize.y * 0.4

var angle = deg_to_rad(90) 
var OvalAngleVector = Vector2()

func drawcard():
	var new_card = CardBase.instantiate()
	CardSelected = randi() % Global.DeckSize
	new_card.Cardname = Global.CardList[CardSelected]
	OvalAngleVector = Vector2(Horizontal_rad * cos(angle), -Vertical_rad * sin(angle))
	new_card.position = CenterCardOval + OvalAngleVector - new_card.size/2
	new_card.scale *= CardSize/new_card.size
	add_child(new_card)
	Global.CardList.erase(Global.CardList[CardSelected])
	angle += 0.2
	Global.DeckSize -= 1
	return Global.DeckSize

