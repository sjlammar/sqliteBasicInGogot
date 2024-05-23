extends HBoxContainer
@export var value = 1
var id
var Hbitname : String
var data = DataBase.database
signal push(newPoin)
# Called when the node enters the scene tree for the first time.
func _ready():
	$icon/Label.text = Hbitname
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_minus_button_down():
	emit_signal("push", -value)

func _on_plus_button_down():
	emit_signal("push", value)


func _on_button_button_down():
	var delete_query = "DELETE FROM habit WHERE id =  " + str(id)
	data.query(delete_query)
 
	var reset_query = "
		DELETE FROM sqlite_sequence WHERE name='habit';
	" 
	data.query(reset_query)
	queue_free()
