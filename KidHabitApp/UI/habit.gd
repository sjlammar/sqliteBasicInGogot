extends TextureRect
@onready var data = DataBase.database
var id 


# Called when the node enters the scene tree for the first time.
func _ready():
	DataBase.idnow = id
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func add_habit_tipe_relation(habit_id, tipe_id):
	var insert_query = "INSERT INTO habit_tipe (habit_id, tipe_id) VALUES (%d, %d)" % [habit_id, tipe_id]
	data.query(insert_query)



