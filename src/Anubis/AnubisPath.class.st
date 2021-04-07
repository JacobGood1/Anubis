Class {
	#name : #AnubisPath,
	#superclass : #AnubisDataTypes,
	#instVars : [
		'type'
	],
	#category : #Anubis
}

{ #category : #'as yet unclassified' }
AnubisPath class >> makeNode: value [
	| type |
	type := self new.
	value first = $/ ifTrue: [ 
		value last = $: 
			ifTrue: [ type := AnubisImplicitPathSetWord new. ] 
			ifFalse: [  ]
	].
	^(self new token: value ; type: (type token: value))
]

{ #category : #'as yet unclassified' }
AnubisPath >> toPharo [
	| words allButLast |
	type class = self class ifTrue: [
		words := (token splitOn: '/'). 
   		allButLast := words allButLast inject: '' into: [:p :n | p , n , ' ' ].
   		^allButLast , words last. 
	]
	ifFalse: [ 
		^type toPharo
	] 
]

{ #category : #accessing }
AnubisPath >> type [
	^type.
]

{ #category : #accessing }
AnubisPath >> type: t [
	type := t.
]
