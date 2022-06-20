private
strategy
	^ (self findContextSuchThat: [ :ctxt | (ctxt receiver isKindOf: PP2AbstractStrategy)])
		ifNil: [ PP2NilStrategy new ]
		ifNotNil: [ :aContext | aContext receiver ].	
