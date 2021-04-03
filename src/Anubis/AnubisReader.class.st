Class {
	#name : #AnubisReader,
	#superclass : #AnubisParser,
	#category : #Anubis
}

{ #category : #accessing }
AnubisReader >> float [
	^super float flatten ==> [:s | AnubisFloat makeNode: s ]
]

{ #category : #accessing }
AnubisReader >> integer [
	^super integer flatten ==> [:s | AnubisInteger makeNode: s ]
]

{ #category : #accessing }
AnubisReader >> ratio [
	^super ratio flatten ==> [:s | AnubisRatio makeNode: s ]
]

{ #category : #accessing }
AnubisReader >> start [
	^symbol
]

{ #category : #accessing }
AnubisReader >> symbol [
	^super symbol flatten ==> [:s | AnubisSymbol makeNode: s ]
]
