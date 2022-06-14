instantiation
makeNode: anArray
	| list |
	list := self new.
	list token: '(' , (anArray inject: '' into: [ :acc :n | acc, ' ' , n token ]) , ')'.
	list data: anArray asOrderedCollection .
	^list.