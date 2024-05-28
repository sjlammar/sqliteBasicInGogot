extends Node

var database : SQLite
var idnow
func _ready():
	database = SQLite.new()
	database.path = "res://database.db"
	database.open_db()
	
	var table = {
		"id" :  {"data_type":"int", "primary_key" : true, "not_null" : true, "auto_increment" : true} ,
		"name" : {"data_type" : "text"},
		"keterangan" : {"data_type" : "text"},
		"status": {"data_type" : "int"}
	}
	database.create_table("task", table)
	
	table = {
		"id" :  {"data_type":"int", "primary_key" : true, "not_null" : true, "auto_increment" : true} ,
		"name" : {"data_type" : "text"}
	}
	database.create_table("habit", table)
	
	table = {
		"id" :  {"data_type":"int", "primary_key" : true, "not_null" : true, "auto_increment" : true} ,
		"name" : {"data_type" : "text"},
		"jumlah" : {"data_type" : "text"},
	}
	database.create_table("status", table)
	
	table = {
		"id" :  {"data_type":"int", "primary_key" : true, "not_null" : true, "auto_increment" : true} ,
		"name" : {"data_type" : "text"},
	}
	database.create_table("tipe", table)
	
	var create_habit_tipe_table = "
		CREATE TABLE IF NOT EXISTS habit_tipe (
			habit_id INTEGER,
			tipe_id INTEGER,
			status INTEGER,
			PRIMARY KEY (habit_id, tipe_id),
			FOREIGN KEY (habit_id) REFERENCES habit (id),
			FOREIGN KEY (tipe_id) REFERENCES tipe (id)
		);
	"
	database.query(create_habit_tipe_table)
	idnow = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
