extends Node

var database : SQLite
var idnow
var session = "name"
var role = "STUDENT"
var idsession = 1
func _ready():
	database = SQLite.new()
	database.path = "user://database.db"
	database.open_db()
	
	
	var table = {
		"id" :  {"data_type":"int", "primary_key" : true, "not_null" : true, "auto_increment" : true,"unique" : true} ,
		"name" : {"data_type" : "text"},
		"pass" : {"data_type" : "text","not_null" : true},
	}
	database.create_table("user", table)
	var check_query = "SELECT COUNT(*) as count FROM user WHERE name = 'admin';"
	var result = database.query(check_query)
	
	if result == true and database.query_result.size() > 0:
		var row = database.query_result[0]
		var admin_count = row["count"]
		
		if admin_count == 0:
			database.insert_row("user", {"name":"admin","pass":"admin"})
	
	
	
	table = {
		"id" :  {"data_type":"int", "primary_key" : true, "not_null" : true, "auto_increment" : true} ,
		"name" : {"data_type" : "text"},
		"keterangan" : {"data_type" : "text"}
	}
	database.create_table("task", table)
	
	var create_listtask = "
		CREATE TABLE IF NOT EXISTS listTask (
			id INTEGER NOT NULL,
			idTask INTEGER,
			idUser INTEGER,
			status INTEGER,
			PRIMARY KEY (id AUTOINCREMENT),
			FOREIGN KEY (idTask) REFERENCES task (id),
			FOREIGN KEY (idUser) REFERENCES user (id)
		);
	"
	database.query(create_listtask)
	
	create_listtask = "
		CREATE TABLE IF NOT EXISTS habit (
			id INTEGER NOT NULL,
			idUser INTEGER,
			name TEXT,
			desc TEXT,
			status INTEGER,
			PRIMARY KEY (id AUTOINCREMENT),
			FOREIGN KEY (idUser) REFERENCES user (id)
		);
	"
	database.query(create_listtask)
	
	create_listtask = "
		CREATE TABLE IF NOT EXISTS status (
			id INTEGER NOT NULL,
			idUser INTEGER,
			name TEXT,
			jumlah TEXT,
			PRIMARY KEY (id AUTOINCREMENT),
			FOREIGN KEY (idUser) REFERENCES user (id)
		);
	"
	database.query(create_listtask)
	idnow = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
