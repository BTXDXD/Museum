module storage

pub struct Var {
	pub mut:
	builder []string
	integer map[u64]i64
	fractional map[u64]f64
}

pub struct App {
	pub mut:
	name string
	code string
	parsed []string
	variables Var
}