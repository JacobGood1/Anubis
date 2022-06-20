Creates PP2 node from a block. The block has to follow the rules of parser combinators:
- return result or PP2Failure
- no side effects
- return PP2Context to its original position in case of failure

Example:
[ :context | 
	context peek = $a 
	  ifTrue: [ 'CORRECT!' ] 
	  ifFalse: [ PP2Failure message: 'Not good' context: context ] ] asPParser 
parse: 'a'