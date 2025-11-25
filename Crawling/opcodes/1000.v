module opcodes
import storage

pub fn op_1000(mut app storage.App) {

	for str in app.variables.builder { print(str) }
	
}