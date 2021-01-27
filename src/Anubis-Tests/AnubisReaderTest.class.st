"
An AnubisReaderTest is a test class for testing the behavior of AnubisReader
"
Class {
	#name : #AnubisReaderTest,
	#superclass : #PPCompositeParserTest,
	#category : #'Anubis-Tests'
}

{ #category : #accessing }
AnubisReaderTest >> parserClass [ 
	^AnubisReader
]

{ #category : #test }
AnubisReaderTest >> testSymbol [
	| anubsym |
	anubsym := (self parse: 'hello' rule: #symbol).
	self assert: anubsym class equals: AnubisSymbol.
	self assert: anubsym token equals: 'hello'  
]
