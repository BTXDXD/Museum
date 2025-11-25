module opcodes
import storage
import notifier

pub fn op_100(pos &int, mut app storage.App) {

	if *pos + 2 >= app.parsed.len {
		notifier.send('There are not enough \'${app.parsed[*pos]}\' opcode arguments (position ${*pos + 1})',
			[
				'If you are a user, contact the app developer for help',
				'If you are a developer and you write code on bytecode, check the spelling. You may have made a mistake',
				'If you are a developer and wrote the code in another language, make sure that the compiler generated the bytecode correctly and try to fix the error in the operation code'
			])
		exit(1)
	}

	unsafe { *pos += 1 }
	name := app.parsed[*pos]
	
	unsafe { *pos += 1 }
	value := app.parsed[*pos]

	app.variables.integer[name.u64()] = value.i64()

}
