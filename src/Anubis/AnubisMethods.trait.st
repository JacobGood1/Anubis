Trait {
	#name : #AnubisMethods,
	#category : #Anubis
}

{ #category : #'as yet unclassified' }
AnubisMethods >> depthFirstTraversal: aFunction [
	self depthFirstTraversalInner: aFunction anIndex: 1  
]

{ #category : #'as yet unclassified' }
AnubisMethods >> depthFirstTraversalInner: aFunction anIndex: index [
	index > self size ifTrue: [ ^nil ].
	aFunction value: (self at: index).
	self depthFirstTraversalInner: aFunction anIndex: index + 1 
]
