define $ &(
	#**
	 * Handle arguments parsing
	 * @example:
	 *   $(2..3, {String, Regex} ;; {Lambda})
	 *   $(2..3, foo: {String, Regex} ;; bar: {Lambda})
	 *#
	__call__: {
		for {$key, $value} in $$~stack[-1]~scope~$$~arguments {
		}
	}

	#**
	 * Return result for arguments passed to the parent element
	 * @example:
	 *   $[0]; $['foo']; $~foo
	 *#
	__get_property__: {
		$$~stack[-1]~scope~$$~arguments[$$~arguments[0]]
	}
)
