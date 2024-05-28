extends Control
@onready var data = DataBase.database
var totHabit
var totTask


func _ready():
	var count_query = "SELECT COUNT(*) as count FROM habit_tipe"
	data.query(count_query)
	totHabit = data.query_result[0]["count"]
	
	count_query = "SELECT COUNT(*) as count FROM task"
	data.query(count_query)
	totTask = data.query_result[0]["count"]
	
	#insertRow()
	
	$gridHabit/habit.text = str(totHabit)
	$ColorRect/task.text = str(totTask)


func _process(delta):
	pass
