Trait {
	#name : #NodeTransformer,
	#instVars : [
		'token',
		'specialForm'
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

{ #category : #testing }
NodeTransformer >> isSpecialForm [
	^specialForm. 
]

{ #category : #accessing }
NodeTransformer >> specialForm [
	^specialForm.
]

{ #category : #accessing }
NodeTransformer >> specialForm: aBoolean [
	specialForm := aBoolean. 
]

{ #category : #'as yet unclassified' }
NodeTransformer >> toAnubis [
	^ token. 
]

{ #category : #'as yet unclassified' }
NodeTransformer >> toPharo [
	^ token. 
]

{ #category : #accessing }
NodeTransformer >> token [
	^token.
]

{ #category : #accessing }
NodeTransformer >> token: value [
	token := value.
]
