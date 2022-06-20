parsing
parseOn: aPP2Context
	| elements retval |
	elements := OrderedCollection new.
	
	[ (retval := child parseOn: aPP2Context) isPetit2Failure
		ifTrue: [ ^ elements ].
		elements addLast: retval 
	] repeat.
	
	^ elements