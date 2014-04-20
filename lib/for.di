define for {
	var $!expr = $$~arguments[0]
	var $!body = $$~arguments[1]

	$expr~scope = $$~stack[-2]~scope
	$body~scope = $$~stack[-2]~scope

	var $cond = $expr[1]
	var $after = $expr[2]

	$expr[0]()

	{
		unless $cond() {
			$body()
			$after()
			$self()
		}
	}
}
