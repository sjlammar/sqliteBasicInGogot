extends TextureRect
@onready var data = DataBase.database
var idH = 0
var idT= 0
var habitnow = 0
var tipenow = 0

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
	
	$habit.selected =habitnow
	$tipe.selected = tipenow
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func update_habit_tipe_relation(habit_id, tipe_id):
	var update_query = "UPDATE habit_tipe SET tipe_id = %d WHERE habit_id = %d;" % [tipe_id, habit_id]
	data.query(update_query)

func update_habit_tipe_relation2(habit_id, tipe_id):
	var update_query = "UPDATE habit_tipe SET habit_id = %d WHERE tipe_id = %d;" % [habit_id, tipe_id]
	data.query(update_query)

func _on_habit_item_selected(index):
	idH = index
	update_habit_tipe_relation2(idH, idT)


func _on_tipe_item_selected(index):
	idT = index
	update_habit_tipe_relation(idH, idT)


