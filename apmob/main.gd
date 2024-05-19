extends Control


var database : SQLite
func _ready():
	database = SQLite.new()
	database.path = "res://data.db"
	database.open_db()

func _process(delta):
	pass

func _on_buattabel_button_down():
	var table = {
		"id" :  {"data_type":"int", "primary_key" : true, "not_null" : true, "auto_increment" : true} ,
		"name" : {"data_type" : "text"},
		"score" : {"data_type" : "int"}
	}
	database.create_table("players", table)

func _on_insert_button_down():
	var data = {
		"name" : $boxnama.text,
		"score" : int($boxscore.text)
	}
	database.insert_row("players", data)
func _on_pilihdata_button_down():
	print(database.select_rows("players", "score > 10", ["*"]))

func _on_update_button_down():
	database.update_rows("players", "name = '"+$boxnama.text+"'",{"score" : int($boxscore.text),"name" : $boxnama.text} )

func _on_hapus_button_down():
	pass # Replace with function body.

func _on_kostem_button_down():
	pass # Replace with function body.
