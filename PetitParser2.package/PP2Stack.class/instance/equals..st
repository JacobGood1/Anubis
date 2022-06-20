comparing
equals: anotherStack
	(anotherStack isKindOf: PP2Stack) ifFalse: [  
		^ false
	].

	^ anotherStack elements = elements 