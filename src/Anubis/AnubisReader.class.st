Class {
	#name : #AnubisReader,
	#superclass : #AnubisParser,
	#category : #Anubis
}

{ #category : #accessing }
AnubisReader >> start [
	^symbol
]

{ #category : #accessing }
AnubisReader >> symbol [
	^super symbol flatten ==> [:s | AnubisSymbol makeNode: s ]
]
