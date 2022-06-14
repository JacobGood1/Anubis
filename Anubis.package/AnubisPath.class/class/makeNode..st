instantiation
makeNode: anArray
	| path |
	path := AnubisUnarySymbolPath new.
	path token: anArray first token , (anArray allButFirst inject: '' into: [:acc :n | acc, '/', n token]).
	path data: anArray asOrderedCollection.
	^path.