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
AnubisReaderTest >> testFloat [
	self parse: '1.2' rule: #float.
	self parse: '45615611.21251561' rule: #float.
	self fail: '1' rule: #float.
	self fail: '1.' rule: #float.
	self fail: '.1' rule: #float.
]

{ #category : #test }
AnubisReaderTest >> testSymbol [
	| anubsym |
	anubsym := (self parse: 'hello' rule: #symbol).
	self assert: anubsym class equals: AnubisSymbol.
	self assert: anubsym token equals: 'hello'  
]
