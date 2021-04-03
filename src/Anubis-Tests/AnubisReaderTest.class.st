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
AnubisReaderTest >> testInteger [
	| anubsym |
	anubsym := (self parse: '1' rule: #integer).
	self assert: anubsym class equals: AnubisInteger.
	self assert: anubsym token equals: '1'  
]

{ #category : #test }
AnubisReaderTest >> testRatio [
	| anubsym |
	anubsym := (self parse: '1/2' rule: #ratio).
	self assert: anubsym class equals: AnubisRatio.
	self assert: anubsym token equals: '1/2'  
]

{ #category : #test }
AnubisReaderTest >> testSymbol [
	| anubsym |
	anubsym := (self parse: 'hello' rule: #symbol).
	self assert: anubsym class equals: AnubisSymbol.
	self assert: anubsym token equals: 'hello'  
]
