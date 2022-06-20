Returns a result of the first parser that succeeds, if none of the children succeeds, fails.

Example:
$a asPParser / $b asPParser parse: 'a'
$a asPParser / $b asPParser parse: 'b'
$a asPParser / $b asPParser parse: 'c'