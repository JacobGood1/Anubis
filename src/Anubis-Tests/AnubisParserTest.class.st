"
An AnubisCompilerTest is a test class for testing the behavior of AnubisCompiler
"
Class {
	#name : #AnubisParserTest,
	#superclass : #PPCompositeParserTest,
	#category : #'Anubis-Tests'
}

{ #category : #test }
AnubisParserTest >> parserClass [ 
	^AnubisParser 
]

{ #category : #test }
AnubisParserTest >> testAtom [
	self parse: '1' rule: #atom.
	self parse: '1.0' rule: #atom.
	self parse: '1/2' rule: #atom.
	self parse: 'true' rule: #atom.
	self parse: 'false' rule: #atom.
	self parse: 'hello' rule: #atom.
	self parse: 'hello-world' rule: #atom.
	self parse: '"hello-world"' rule: #atom.
	self parse: '()' rule: #atom.
	self parse: '''(1 2 3 4)' rule: #atom.
]

{ #category : #test }
AnubisParserTest >> testAtoms [
	self parse: '1 1/2 3.5 () true false (1 2 3 ''(4 5 6))' rule: #atom.

	self assert: (self parse: '1' rule: #atoms) first equals: (self parse: '1' rule: #atom).
	self assert: (self parse: '1.0' rule: #atoms) first equals: (self parse: '1.0' rule: #atom).
]

{ #category : #test }
AnubisParserTest >> testBoolean [
	self parse: 'false' rule: #boolean.
	self parse: 'true' rule: #boolean.
]

{ #category : #test }
AnubisParserTest >> testCloseParen [
	self parse: ')' rule: #closeParen.
]

{ #category : #test }
AnubisParserTest >> testDigitExcludingZero [  
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
AnubisParserTest >> testDoubleQuote [
	self parse: '"' rule: #doubleQuote.
]

{ #category : #test }
AnubisParserTest >> testFloat [
	self parse: '1.0' rule: #float.
	self parse: '0.1' rule: #float.
	self fail: '.1' rule: #float.
	self fail: '1.' rule: #float.
	self fail: '0.' rule: #float.
	self fail: '.0' rule: #float.
]

{ #category : #test }
AnubisParserTest >> testHyphen [
	self parse: '-' rule: #hyphen. 
]

{ #category : #test }
AnubisParserTest >> testInteger [
	self parse: '1' rule: #integer.
	self parse: '1000' rule: #integer.
	self fail: '000111' rule: #integer.
]

{ #category : #test }
AnubisParserTest >> testList [
	self parse: '(+ 1 1 (- 0 99))' rule: #list
]

{ #category : #test }
AnubisParserTest >> testOpenParen [
	self parse: '(' rule: #openParen.
]

{ #category : #test }
AnubisParserTest >> testQuotedList [
	self parse: '''()' rule: #quotedList
]

{ #category : #test }
AnubisParserTest >> testRatio [
	self parse: '1/2' rule: #ratio
]

{ #category : #test }
AnubisParserTest >> testStart [

	self parse: '()' rule: #start 
]

{ #category : #test }
AnubisParserTest >> testString [
	self parse: '"adsafd gsfgsr T%^&^%*&^*"' rule: #string.
	self parse: '""' rule: #string.
	self fail: '"' rule: #string.
]

{ #category : #test }
AnubisParserTest >> testSymbol [
	self parse: 'a123' rule: #symbol.
	self parse: '--a123---fdsf' rule: #symbol.
]

{ #category : #test }
AnubisParserTest >> testWhitespace [
	self parse: '     ' rule: #whitespace. 
	self parse: '     
	                        ' rule: #whitespace. 
	self fail: '' rule: #whitespace. 
]
