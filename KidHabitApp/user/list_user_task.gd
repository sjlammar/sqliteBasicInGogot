extends TextureRect

@onready var data = DataBase.database
@onready var option = $task
var id  = 2
var status = 0
var result =" "

func _ready():
	$CheckBox.button_pressed = status
	option.add_item("select task", -1)
	var nil = data.select_rows("task", "id > 0", ["*"])
	for row in nil :
		option.add_item(row["name"],row["id"])
	nil = data.select_rows("listTask", "id = "+str(id), ["*"])
	if nil[0]["idTask"] != null and id !=1 :
		option.select(nil[0]["idTask"])
		data.query("SELECT keterangan from listTask
join task on task.id = listTask.idTask
join user on user.id = listTask.idUser
where idUser>1 
and listTask.id=%s;"%id)
		result = data.query_result[0]["keterangan"]
	$Label.text = result

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

"""
func _on_setting_pressed():
	if $name.editable :
		data.update_rows("list", "id = '"+str(id)+"'",{"keterangan" : $ket.text,"name" : $name.text} )
		get_tree().reload_current_scene()
	$name.editable = not($name.editable)
	$ket.editable = not($ket.editable)
	$delete.visible = not($delete.visible)


func _on_delete_button_down():
	var delete_query = "DELETE FROM task WHERE id =  " + str(id)
	data.query(delete_query)
 
	var reset_query = "
		DELETE FROM sqlite_sequence WHERE name='task';
	" 
	data.query(reset_query)
	get_tree().reload_current_scene()
"""


func _on_task_item_selected(index):
	if index > 0 :
		data.update_rows("listTask","id="+str(id),{"idTask":index})
	else :
		result = " "
		$Label.text = result
	

func _on_delete_button_down():
	var delete_query = "DELETE FROM listTask WHERE id = %d  " %id
	data.query(delete_query)
 
	var reset_query = "
		DELETE FROM sqlite_sequence WHERE name='listTask';
	"
	data.query(reset_query)
	get_tree().reload_current_scene()


func _on_check_box_toggled(toggled_on):
	if toggled_on:
		data.update_rows("listTask","id="+str(id),{"status":1})
	else :
		data.update_rows("listTask","id="+str(id),{"status":0})
