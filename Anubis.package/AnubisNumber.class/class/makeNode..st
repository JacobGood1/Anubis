instantiation
makeNode: data
	| number |
	number := self new.
	number token: data asString.
	number data: data.
	^number.