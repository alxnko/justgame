extends Node

var settings = "./data/settings"
var dataDir = "./data/"

# Called when the node enters the scene tree for the first time.
func _ready():
	if(!DirAccess.dir_exists_absolute(dataDir)):
		DirAccess.make_dir_absolute(dataDir)

func getSaves():
	var inp = DirAccess.get_files_at(dataDir)
	var out = []
	for i in range(inp.size()):
		var file = inp[i].split('.')
		if len(file) > 1:
			if file[1] == 'json' && isValidSave(file[0]):
				out.append(file[0])
	return out

func hasSave(fname):
	return FileAccess.file_exists(dataDir+fname+".json")

func Save(fname, data):
	DirAccess.remove_absolute(dataDir+fname+".json")
	var file = FileAccess.open(dataDir+fname+".json",FileAccess.WRITE)
	file.store_string(JSON.stringify(data))

func Load(fname):
	return JSON.parse_string(FileAccess.get_file_as_string(dataDir+fname+".json"))

func saveSettings(data):
	if(FileAccess.file_exists(settings)):
		DirAccess.remove_absolute(settings)
	var file = FileAccess.open(settings,FileAccess.WRITE)
	file.store_string(JSON.stringify(data))

func loadSettings():
	if(FileAccess.file_exists(settings)):
		return JSON.parse_string(FileAccess.get_file_as_string(settings))
	else: return {}

func isValidSave(fname):
	var data = JSON.parse_string(FileAccess.get_file_as_string(dataDir+fname+".json"))
	if data.size() == 6 and data[1].size() == 6: return true
	else: return false
