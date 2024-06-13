extends Control
@onready var data = DataBase.database
var totHabit
var totTask
var doneH
var doneT
var habit
var task

func _ready():
	var count_query = "SELECT COUNT(*) as count FROM habit WHERE idUser=="+str(DataBase.idsession)
	data.query(count_query)
	totHabit = data.query_result[0]["count"]
	
	count_query = "SELECT COUNT(*) as count FROM habit WHERE idUser=="+str(DataBase.idsession)+" AND status == 1"
	data.query(count_query)
	doneH = data.query_result[0]["count"]
	
	count_query = "SELECT COUNT(*) as count FROM listTask WHERE idUser=="+str(DataBase.idsession)
	data.query(count_query)
	totTask = data.query_result[0]["count"]
	
	count_query = "SELECT COUNT(*) as count FROM listTask WHERE idUser=="+str(DataBase.idsession)+" AND status == 1"
	data.query(count_query)
	doneT = data.query_result[0]["count"]
	
	habit = str(doneH)+"/"+str(totHabit)
	task = str(doneT)+"/"+str(totTask)
	
	$GridContainer/jHabit.text = habit
	$GridContainer/jTask.text = task
	
	var check_query = "SELECT COUNT(*) as count FROM status WHERE idUser = %s;"%DataBase.idsession
	var result = data.query(check_query)
	
	if result :
		var row = data.query_result[0]
		var admin_count = row["count"]
		
		if admin_count == 0:
			data.insert_row("status", {"idUser":DataBase.idsession,"name":"habit","jumlah":str(doneH)+"/"+str(totHabit)})
			data.insert_row("status", {"idUser":DataBase.idsession,"name":"task","jumlah":str(doneT)+"/"+str(totTask)})
	
	data.update_rows("status", "idUser="+str(DataBase.idsession)+" AND name='habit'",{"jumlah":habit})
	data.update_rows("status", "idUser="+str(DataBase.idsession)+" AND name='task'",{"jumlah":task})


func _process(delta):
	pass
