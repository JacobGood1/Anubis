Class {
	#name : #AnubisPath,
	#superclass : #AnubisDataTypes,
	#instVars : [
		'data'
	],
	#category : #Anubis
}

{ #category : #accessing }
AnubisPath class >> makeNode: value [
	| temp |
	"type := self new."
	temp := value last = $:
		        ifTrue: [ AnubisPathSetWord new ]
		        ifFalse: [ self new ].
	temp token: value.
	temp data:
		((value splitOn: '/') collect: [ :s | (AnubisReader parse: s) first ]).
	^ temp
]

{ #category : #accessing }
AnubisPath >> data [
	^data
]

{ #category : #accessing }
AnubisPath >> data: anOrderedCollection [
	data := anOrderedCollection 
]

{ #category : #'as yet unclassified' }
AnubisPath >> toPharo [
	^self data inject: '' into: [:a :n | a , ' ' , n toPharo ] 
	
]
