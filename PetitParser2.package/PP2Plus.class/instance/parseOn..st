parsing
parseOn: aPP2Context
	| elements retval |
	
	(retval := child parseOn: aPP2Context) isPetit2Failure
		ifTrue: [ ^ retval ].
	elements := OrderedCollection with: retval.

	[ (retval := child parseOn: aPP2Context) isPetit2Failure
		ifTrue: [ ^ elements ].
		elements addLast: retval 
	] repeat.

	^ elements