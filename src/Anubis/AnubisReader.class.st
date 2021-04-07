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
AnubisReader >> list [
	^super list ==> [ :nodes | AnubisList makeNode: nodes ]
]

{ #category : #accessing }
AnubisReader >> path [
	^super path flatten ==> [:s | AnubisPath makeNode: s ]
]

{ #category : #accessing }
AnubisReader >> ratio [
	^super ratio flatten ==> [:s | AnubisRatio makeNode: s ]
]

{ #category : #accessing }
AnubisReader >> setWord [
	^super setWord flatten ==> [:s | AnubisSetWord makeNode: s ]
]

{ #category : #accessing }
AnubisReader >> setWordPath [
	^super setWordPath flatten ==> [:s | AnubisPath makeNode: s ]
]

{ #category : #accessing }
AnubisReader >> start [
	^(whitespace / atom / list) star
]

{ #category : #accessing }
AnubisReader >> string [
	^super string flatten ==> [:s | AnubisString makeNode: s ]
]

{ #category : #accessing }
AnubisReader >> symbol [
	^super symbol flatten ==> [:s | AnubisSymbol makeNode: s ]
]

{ #category : #accessing }
AnubisReader >> whitespace [
	^super whitespace ==> [:s | AnubisWhitespace makeNode: (s inject: '' into: [:a :n | a , n asString]) ]
]
