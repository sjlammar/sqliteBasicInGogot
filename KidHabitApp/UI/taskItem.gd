extends TextureRect
@onready var data = DataBase.database
var id : int
var nama = " "
var ket = " "

func _ready():
	$name.text = nama
	$ket.text = ket

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_setting_pressed():
	if $name.editable :
		data.update_rows("task", "id = '"+str(id)+"'",{"keterangan" : $ket.text,"name" : $name.text} )
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


