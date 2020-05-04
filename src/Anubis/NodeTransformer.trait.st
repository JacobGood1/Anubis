Trait {
	#name : #NodeTransformer,
	#instVars : [
		'token'
	],
	#category : #Anubis
}

{ #category : #'as yet unclassified' }
NodeTransformer classSide >> makeNode: value [
	| temp |
	temp := self new.
	temp token: value.
	^temp.  
	
]

{ #category : #'as yet unclassified' }
NodeTransformer >> toAnubis [
	Transcript show: token
]

{ #category : #'as yet unclassified' }
NodeTransformer >> toPharo [
	self explicitRequirement. 
]

{ #category : #accessing }
NodeTransformer >> token [
	^token.
]

{ #category : #accessing }
NodeTransformer >> token: value [
	token := value.
]
