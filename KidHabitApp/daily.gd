extends TextureRect
@onready var data = DataBase.database
var idH = 0
var idT= 0
var idn = 1
var hnow = 1
var tnow = 1
var stat = " "

# Called when the node enters the scene tree for the first time.
func _ready():
	$habit.add_item("pilih habit",0)
	$tipe.add_item("pilih tipe", 0)
	var nil = data.select_rows("habit", "id > 0", ["*"])
	for row in nil :
		$habit.add_item(row["name"],row["id"])
	
	var nul = data.select_rows("tipe", "id > 0", ["*"])
	for row in nul :
		$tipe.add_item(row["name"],row["id"])
	$habit.select(hnow)
	$tipe.select(tnow)
	$stat.text = stat

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func update_habit_tipe_relation(habit_id, tipe_id, id):
	var update_query = "UPDATE habit_tipe SET habit_id = %d, tipe_id = %d WHERE id = %d ;" % [habit_id,tipe_id, id]
	data.query(update_query)

func _on_habit_item_selected(index):
	idH = index
	update_habit_tipe_relation(idH, idT, idn)


func _on_tipe_item_selected(index):
	idT = index
	update_habit_tipe_relation(idH, idT, idn)




func _on_button_button_down():
	if $stat.editable:
		data.update_rows("habit_tipe", "id = '"+str(idn)+"'",{"status" : $stat.text} )
	$stat.editable = not($stat.editable)
