The default repeating parser with standard PEG semantics (i.e. possessive, blind, eager).

Examples:
$a asPParser star parse: 'aaaa'
"always fails, because star is greedy"
($a asPParser star, $a asPParser) parse: 'aaa' 


Use #starLazy if you want a non-greedy parse:
($a asPParser starLazy, ($a asPParser, #endOfInput asPParser)) parse: 'aaa'

Note that #starLazy consumes as little as possible, contrary to your expectations:
($a asPParser starLazy, $a asPParser) parse: 'aaa'
