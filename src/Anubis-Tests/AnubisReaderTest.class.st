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

	self parse: 'hello' rule: #symbol 
]
