extends Node

var database : SQLite

func _ready():
	database = SQLite.new()
	database.path = "res://data.db"
	database.open_db()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
