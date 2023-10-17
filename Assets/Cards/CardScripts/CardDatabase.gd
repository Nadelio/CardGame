enum {Archer, Knight, Shieldman, Madking}

#Cardname : {CardType, Damage, Retaliation, Health, Cost, CardName, CardFrame, CardBannerColor}

const DATA = {
	Archer : ["Units", 2, 1, 3, 2, "ArcherCard", "Ranged, Immune to Retaliation", "BasicFrame.png", "Red"],
	Knight : ["Units", 3, 1, 4, 3, "KnightCard", "Melee, Take one less \n   Retaliation Damage", "BasicFrame.png", "Red"],
	Shieldman : ["Units", 0, 2, 6, 3, "ShieldmanCard", "Melee, Deal double Retaliation\n   Damage when killed", "BasicFrame.png", "Red"],
	Madking : ["Units", 5, 2, 3, 5, "MadkingCard", "Deplete all of this card's health\n   to destroy a chosen card", "BasicFrame.png", "Red"]
	}
