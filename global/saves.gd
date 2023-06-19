extends Node

var settings = "./data/settings"
var dataDir = "./data/"

# Called when the node enters the scene tree for the first time.
func _ready():
	if(!DirAccess.dir_exists_absolute(dataDir)):
		DirAccess.make_dir_absolute(dataDir)

func getSaves():
	var out = DirAccess.get_files_at(dataDir)
	for i in range(out.size()):
		out[i] = out[i].split('.')[0]
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
