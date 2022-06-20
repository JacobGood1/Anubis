parsing
parseOn: aPP2Context
	| retval |
		
	[ (retval := node child parseOn: aPP2Context) isPetit2Failure ] whileFalse.

