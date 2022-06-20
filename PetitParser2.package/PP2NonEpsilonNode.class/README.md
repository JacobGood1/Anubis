Matches only if the underlying parser consumes at least one character.

Example:
$a asPParser optional nonEpsilon parse: 'a'
$a asPParser optional nonEpsilon parse: 'b'