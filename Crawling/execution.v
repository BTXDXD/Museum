module main
import notifier
import opcodes
import storage

fn execution(mut app storage.App) {
	
	mut pos := 0

	for pos < app.parsed.len {

		// EXECUTE
		match app.parsed[pos] {

			// VM (0-99)
			
			// INTEGER (100-199)
			'100' { opcodes.op_100(&pos, mut app) } // INTEGER SET
			'101' { opcodes.op_101(&pos, mut app) } // INTEGER TO FRACTIONAL
			'109' { opcodes.op_109(&pos, mut app) } // INTEGER BUILDER ADD
			'110' { opcodes.op_110(&pos, mut app) } // INTEGER ADD
			'111' { opcodes.op_111(&pos, mut app) } // INTEGER SUB
			'112' { opcodes.op_112(&pos, mut app) } // INTEGER MUL
			'113' { opcodes.op_113(&pos, mut app) } // INTEGER DIV

			// FRACTIONAL (200-299)
			'200' { opcodes.op_200(&pos, mut app) } // FRACTIONAL SET
			'201' { opcodes.op_201(&pos, mut app) } // FRACTIONAL TO INTEGER
			'209' { opcodes.op_209(&pos, mut app) } // FRACTIONAL BUILDER ADD
			'210' { opcodes.op_210(&pos, mut app) } // FRACTIONAL ADD
			'211' { opcodes.op_211(&pos, mut app) } // FRACTIONAL SUB
			'212' { opcodes.op_212(&pos, mut app) } // FRACTIONAL MUL
			'213' { opcodes.op_213(&pos, mut app) } // FRACTIONAL DIV

			// CONSOLE (1000-1999)
			'1000' { opcodes.op_1000(mut app) } // OUT
			'1001' { opcodes.op_1001(mut app) } // BUILDER CLEAR
			
			else {
				notifier.send('Unknown bytecode opcode \'${app.parsed[pos]}\' (position ${pos + 1})',
				[
					'If you are a user, contact the app developer for help',
					'If you are a developer and you write code on bytecode, check the spelling. You may have made a mistake',
					'If you are a developer and wrote the code in another language, make sure that the compiler generated the bytecode correctly and try to fix the error in the operation code'
				])
				exit(1)
			}

		}

		// NEXT
		pos++

	}
}