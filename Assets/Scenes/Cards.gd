extends Node

const CardSize = Vector2(125, 175)
const CardBase = preload("res://Assets/Cards/Card.tscn")
var CardSelected = []
var CardList = ["Archer", "Knight", "Shieldman", "Madking", "Archer"]

@onready var DeckSize = CardList.size()
@onready var ViewportSize = Vector2(get_viewport().content_scale_size)
@onready var CenterCardOval = ViewportSize * Vector2(0.5, 1.20)
@onready var Horizontal_rad = ViewportSize.x * 0.45
@onready var Vertical_rad = ViewportSize.y * 0.4

var angle = deg_to_rad(90) - 0.5
var OvalAngleVector = Vector2()

signal disable_node()

func drawcard():
	var new_card = CardBase.instantiate()
	CardSelected = randi() % DeckSize
	new_card.Cardname = CardList[CardSelected]
	OvalAngleVector = Vector2(Horizontal_rad * cos(angle), -Vertical_rad * sin(angle))
	new_card.startpos = $"../Deck".position
	new_card.targetpos = CenterCardOval + OvalAngleVector - new_card.size/2
	new_card.scale *= CardSize/new_card.size
	new_card.rotation = deg_to_rad((90 - rad_to_deg(angle))/4)
	new_card.state = new_card.MoveDrawnCardToHand
	add_child(new_card)
	CardList.erase(CardList[CardSelected])
	angle += 0.2
	DeckSize -= 1
	return DeckSize

func _on_deck_draw_gui_input(_event):
	if Input.is_action_just_released("leftclick"):
		if DeckSize > 0:
			DeckSize = drawcard()
			if DeckSize == 0:
				emit_signal("disable_node")


