module notifier
import term

pub fn send(title string, text []string) {

	title_rune := title.runes()
	
	println(
		term.bold(term.rgb(255, 127, 0, '┌' + '─'.repeat(title_rune.len + 2) + '┐\n│ ')) +
		term.bold(title) +
		term.bold(term.rgb(255, 127, 0, ' │\n└' + '─'.repeat(title_rune.len + 2) + '┘'))
	)

	mut is_bold := false

	for ms in text {
		if is_bold {
			println(term.bold(term.rgb(255, 127, 0, '│ ')) + term.bold(ms) + term.bold(term.rgb(255, 127, 0, ';')))
			is_bold = false
		} else {
			println(term.bold(term.rgb(255, 127, 0, '│ ')) + ms + term.bold(term.rgb(255, 127, 0, ';')))
			is_bold = true
		}
	}

	println('')
	
}