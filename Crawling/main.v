module main
import os
import notifier
import storage

fn main() {

	// APP INITIALIZE
	mut app := storage.App{}
	app.name = os.args[os.args.len - 1]

	// READ APP FILE
	app.code = os.read_file(app.name) or {
		notifier.send('Failed to open file \'$app.name\'', ['Check the file name. Did you make a typo?', 'Are you sure that the file is in the current directory?', 'Are you confusing the file name with another one?', 'The file may not match the .app format'])
		exit(1)
	}

	// APP FILE PARSING
	app.parsed = app.code.replace('\n', ' ').split(' ').filter(it.trim_space() != '')

	// EXECUTION
	execution(mut app)
	/*!*/println(app.variables)

}
