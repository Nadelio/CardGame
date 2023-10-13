extends Node

const CardSize = Vector2(125, 175)
const CardBase = preload("res://Assets/Cards/Card.tscn")
const PlayerHand = preload("res://Assets/Cards/CardScripts/Player_Hand.gd")
var CardSelected = []
var CardList = ["Archer", "Knight", "Shieldman"]
@onready var DeckSize = CardList.size()
@onready var ViewportSize = Vector2(get_viewport().content_scale_size)
@onready var CenterCardOval = ViewportSize * Vector2(0.5, 1.0)
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
	new_card.Cardname = CardList[CardSelected]
	OvalAngleVector = Vector2(Horizontal_rad * cos(angle), - Vertical_rad * sin(angle))
	new_card.position = CenterCardOval + OvalAngleVector - new_card.size/2 #ISSUE HERE
	new_card.scale *= CardSize/new_card.size
	add_child(new_card)
	CardList.erase(CardList[CardSelected])
	angle += 0.2
	DeckSize -= 1
	return DeckSize

