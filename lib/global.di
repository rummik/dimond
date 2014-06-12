define global {
	$!block = $$~arguments[0]
	$block~scope += $$~stack[0]~scope
	$block()
}
