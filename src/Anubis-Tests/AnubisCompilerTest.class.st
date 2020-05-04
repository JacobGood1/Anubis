"
An AnubisCompilerTest is a test class for testing the behavior of AnubisCompiler
"
Class {
	#name : #AnubisCompilerTest,
	#superclass : #PPCompositeParserTest,
	#category : #'Anubis-Tests'
}

{ #category : #accessing }
AnubisCompilerTest >> parserClass [
	^AnubisCompiler 
]

{ #category : #test }
AnubisCompilerTest >> testCloseParen [
	self parse: ')' rule: #closeParen.
]

{ #category : #test }
AnubisCompilerTest >> testDigitExcludingZero [  
	self fail: '0' rule: #digitExcludingZero.
	self parse: '1' rule: #digitExcludingZero.
	self parse: '2' rule: #digitExcludingZero.
	self parse: '3' rule: #digitExcludingZero.
	self parse: '4' rule: #digitExcludingZero.
	self parse: '5' rule: #digitExcludingZero.
	self parse: '6' rule: #digitExcludingZero.
	self parse: '7' rule: #digitExcludingZero.
	self parse: '8' rule: #digitExcludingZero.
	self parse: '9' rule: #digitExcludingZero.
]

{ #category : #test }
AnubisCompilerTest >> testDoubleQuote [
	self parse: '"' rule: #doubleQuote.
]

{ #category : #test }
AnubisCompilerTest >> testFloat [
	self parse: '1.0' rule: #float.
	self parse: '0.1' rule: #float.
	self fail: '.1' rule: #float.
	self fail: '1.' rule: #float.
	self fail: '0.' rule: #float.
	self fail: '.0' rule: #float.
]

{ #category : #test }
AnubisCompilerTest >> testHyphen [
	self parse: '-' rule: #hyphen. 
]

{ #category : #test }
AnubisCompilerTest >> testInteger [
	self parse: '1' rule: #integer.
	self parse: '1000' rule: #integer.
	self fail: '000111' rule: #integer.
]

{ #category : #test }
AnubisCompilerTest >> testOpenParen [
	self parse: '(' rule: #openParen.
]

{ #category : #test }
AnubisCompilerTest >> testString [
	self parse: '"adsafd gsfgsr T%^&^%*&^*"' rule: #string.
	self parse: '""' rule: #string.
	self fail: '"' rule: #string.
]

{ #category : #test }
AnubisCompilerTest >> testSymbol [
	self parse: 'a123' rule: #symbol.
	self parse: '--a123---fdsf' rule: #symbol.
]

{ #category : #test }
AnubisCompilerTest >> testWhitespace [
	self parse: '     ' rule: #whitespace. 
	self parse: '     
	                        ' rule: #whitespace. 
	self fail: '' rule: #whitespace. 
]
