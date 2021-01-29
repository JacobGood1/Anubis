Class {
	#name : #AnubisReader,
	#superclass : #AnubisParser,
	#category : #Anubis
}

{ #category : #'as yet unclassified' }
AnubisReader class >> flattenToTokensOnly: aCollection into: anotherCollection [ 
	aCollection do: [:i | i isCollection ifTrue: [self flattenToTokensOnly: i into: anotherCollection] 
																  ifFalse: [i isNil ifFalse: [anotherCollection add: i ]]].
	^ anotherCollection. 
	"index > aCollect size ifTrue: [ ^nil ].
	aFunction value: (self at: index).
	self depthFirstTraversalInner: aFunction anIndex: index + 1 "
]

{ #category : #accessing }
AnubisReader >> float [
	^super float ==> [:s | AnubisFloat makeNode: s ]
]

{ #category : #accessing }
AnubisReader >> integer [ 
	 ^super integer ==> [ :i | AnubisInteger makeNode: i ]
]

{ #category : #accessing }
AnubisReader >> list [
	| tokenCheck ret|
	^super list ==> [:lst | 
		tokenCheck := lst first token.
		ret := nil.
		tokenCheck = 'if' ifTrue: [ ret := AnubisSpecialFormIf makeNode: lst ]. 
		tokenCheck = 'set' ifTrue: [ ret := AnubisSpecialFormSet makeNode: lst ].
		ret ifNil: [  
		  ret := AnubisList makeNode: (lst inject: OrderedCollection new 
		  	                          into: [:acc :n | 
				acc add: n.
				acc
			])	
		].
		ret 
	]
]

{ #category : #accessing }
AnubisReader >> parse: aString [
	^self class flattenToTokensOnly: (super parse: aString) 
	            into: OrderedCollection new
]

{ #category : #accessing }
AnubisReader >> ratio [
	^super ratio ==> [:s | AnubisRatio makeNode: s] 
]

{ #category : #accessing }
AnubisReader >> symbol [
	^super symbol ==> [:s | AnubisSymbol makeNode: s first asString , s last] 
]

{ #category : #accessing }
AnubisReader >> whitespace [ 
	^super whitespace ==> [:s | 
		s isEmpty
			ifTrue: [AnubisEmptySpace makeNode: s asString] 
			ifFalse: [AnubisWhiteSpace makeNode: (s inject: '' into: [:acc :next | acc , next asString])]] 
]
