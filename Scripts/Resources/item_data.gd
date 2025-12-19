extends Resource
class_name ItemRes

@export var id: String
@export var name: String
@export var pic: String
@export var buyCost: int
@export var sellCost: int
@export var owned: int = 0
@export var item_type: ItemType
@export var weapon_type: WeaponType
@export var armor_type: ArmorType
@export var accessory_type: AccessoryType
@export var value: int = 0
@export var stats: Dictionary
@export var description: String
@export var flavor: String

enum ItemType {
	CONSUMABLE,
	BATTLE,
	WEAPON,
	ARMOR,
	ACCESSORY,
	KEY
}

enum WeaponType {
	NONE,
	SWORDSHIELD,
	DAGGER,
	TOME,
	STAFF,
	FLASK,
	HARP,
	GAUNTLETS,
	THROWING_KNIVES,
	WAND,
	CATALYST,
	DUAL_SWORDS,
	BRACELETS,
	PLANTS,
	CHAINS
}

enum ArmorType {
	NONE,
	LIGHT,
	HEAVY,
	ROBE,
}

enum AccessoryType {
	NONE,
	HAIRPIN,
	SCARF,
	BOOKMARK,
	NECKLACE,
	GOOGLES,
	RING,
	BRACERS,
	CHARM,
	TOY,
	WATCH,
	HEADBAND,
	DOLL,
	EARRING,
	TATOO
}
