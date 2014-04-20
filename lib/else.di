define binary else {
	var $!body = $[1]

	$body~scope = $$~stack[-2]~scope

	$[0] || $body()
}
