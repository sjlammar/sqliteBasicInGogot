extends TextureRect
@onready var data = DataBase.database

var nama = " "
var id = 0
var jen = ""
func _ready():
	$LineEdit.text = nama
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_delete_button_down():
	var delete_query = "DELETE FROM '%s' WHERE id = %d  " %[jen,id]
	data.query(delete_query)
 
	var reset_query = "
		DELETE FROM sqlite_sequence WHERE name='%s';
	" %jen
	data.query(reset_query)
	get_tree().reload_current_scene()


func _on_edit_button_down():
	if $LineEdit.editable :
		data.update_rows(jen, "id = '"+str(id)+"'",{"name" : $LineEdit.text} )
	$LineEdit.editable = not($LineEdit.editable)
