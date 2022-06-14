instantiation
makeNode: data
	| symbol |
	symbol := self new.
	symbol token: data asString.
	symbol data: data.
	^symbol.