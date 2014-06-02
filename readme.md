Dimond
======
Random programming language ideas. (The name drops the letter 'a', as in a certain
other language's name)


Types
-----
```dimond
"string"
'string' # alternate string syntax
/regex/
%regex%  # alternate regex syntax
<>xml<>
{lambda}
(list)   # generic list
@(array)
%(hash)
&(object)
$variable
# comment
#* block comment *#
```


Variable types
--------------
```dimond
$!lambda
$%hash
$@array
$&object
$#integer
$.float
$"string
$/regex
$<xml
${Object}anything
```

Other reserved type prefixes: `'~[^$`


Variables
---------
`/\$(<type>{\w+}|[^\w\s])?(<name>\w+)/`


Lists, arrays, hashes, and objects
----------------------------------
```dimond
# lists are autoindexed with integer keys, and also allow non-integer keys
(0; 1; two: 2; three: 3; 4; 5)

# arrays will autoindex integer keys, but may not contain non-integer keys
@(0; 'hi'; 'two'; 3; 4)

# hashes are not autoindexed
%(one: 1; item: 'foo'; bar: 'baz')

# objects allow special methods using `get`, `set`, and `__magic__`
&(
  property: 'value'

  # called as `~extra()`
  extra: {
    print 'hello'
  }

  # called when `~extra` is accessed
  get extra: {
    return 'hi'
  }

  # called when the object is used as a constructor
  __construct__: {
  }

  # caled when the object is called as a function
  __call__: {
  }

  # any method (arguments: $[0] (name), $[1..] (arguments))
  __method__: { $(name: {String} ; arguments: {} ;;)
    $~name || $[0]
    $~arguments[0..] || $[1..]
  }

  # any property (get)
  get __property__: { $(1, name: {String})
    $~name || $[0]
  }

  # any property (set)
  set __property__: { $(2, name: {String} ; value: {})
    $~name || $[0]
    $~value || $[1]
  }
)
```


Argument Parsing
----------------
`$` is a convenience object to be used in place of `$$~arguments`
- `$~named    # named argument`
- `$['named'] # also valid`
- `$[0]       # unnamed argument`
- `$$         # object itself`

Examples:
```dimond
define hello {
  print 'Hello ' . $~place
}

# prints 'Hello world'
hello(place: 'world')

define hello2 {
  print 'Hello ' . $[0]
}

# prints 'Hello world'
hello2('world')
```


Newlines equate to semicolons
-----------------------------
Valid:

```dimond
if $var == 'foo' {
}
```

Invalid:

```dimond
if $var == 'foo'
{
}

# translates to:
# if $var == 'foo';
# {
# }
```


Last variable within a lambda is automatically returned
-------------------------------------------------------
Returns 'asdf':

```dimond
{
  'asdf'
}
```


Routes
------

```dimond
$/{ '/hello/:name'~replace(/:(\w+)/, '(<name>\w+)')) }
$route~get('/hello/:name'; {
  # Need the raw variable?  Use the XML $<, everything else is escaped.
  <>
    <!doctype html>
    <h1>Hello $~name!</h1>
  <>
})
```


Unless statement
-----------------
```dimond
unless $var {
  print 'asdf';
}
```


XML type and templating
-----------------------
```dimond
<>
  <ul>
    $foo~each({
      <><li>$~item</li><>
    })
  </ul>
<>
```

Language extensions
-------------------
```dimond
define name
define operator name
define unary operator name
define binary operator name
define ternary operator name1 name2
define literal open close
```

Some misc things
----------------
```dimond
if 2 in (1,2,3) {
  # foo
} else {
  # bar
}

each 1..5 {
}

for {$i=0; $i<1; $i++} {
}

for {$a; $b} in $hash {
}

while true {
}

each $array {
  print "$~key: $~value"
}
```
