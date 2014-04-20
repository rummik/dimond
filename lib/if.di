define if {
	var $!body = $$~arguments[1]
	var $cond = $$~arguments[0]

	{
		{ $#cond = $cond }

		{
			$cond~scope = $$~stack[-4]~scope
			$#cond = $cond()
		}
	}[$cond~#call]()

	$body~scope = $$~stack[-2]~scope

	$cond && $body()
}
