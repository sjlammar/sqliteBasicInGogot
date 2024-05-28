extends TextureRect
@onready var data = DataBase.database
var id : int
var nama = " "
var ket = " "
func _ready():
	$name.text = nama
	$ket.text = ket
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_setting_pressed():
	if $name.editable :
		data.update_rows("task", "id = '"+str(id)+"'",{"keterangan" : $ket.text,"name" : $name.text} )
		get_tree().change_scene_to_file("res://Task/task_scene.tscn")
	$name.editable = not($name.editable)
	$ket.editable = not($ket.editable)
	$ket/delete.visible = not($ket/delete.visible)


func _on_delete_button_down():
	var delete_query = "DELETE FROM task WHERE id =  " + str(id)
	data.query(delete_query)
 
	var reset_query = "
		DELETE FROM sqlite_sequence WHERE name='task';
	" 
	data.query(reset_query)
	get_tree().change_scene_to_file("res://Task/task_scene.tscn")




func _on_check_button_toggled(toggled_on):
	if toggled_on:
		data.update_rows("task", "id = '"+str(id)+"'",{"status" : 1} )
		$Line2D.visible = true
		$ket/setting.visible = false
	else :
		data.update_rows("task", "id = '"+str(id)+"'",{"status" : 0} )
		$Line2D.visible = false
		$ket/setting.visible = true
