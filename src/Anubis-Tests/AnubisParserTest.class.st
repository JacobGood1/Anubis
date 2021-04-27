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
	self parse: 'hello:' rule: #atom.
	self parse: 'hello/there' rule: #atom.
	self parse: 'hello/there/bob' rule: #atom.
]

{ #category : #test }
AnubisParserTest >> testBoolean [
	self parse: 'false' rule: #boolean.
	self parse: 'true' rule: #boolean.
]

{ #category : #test }
AnubisParserTest >> testClazz [
	self parse: '!hi' rule: #clazz.
	self parse: '!hi-there-mang' rule: #clazz.
	
]

{ #category : #test }
AnubisParserTest >> testCloseParen [
	self parse: ')' rule: #closeParen.
]

{ #category : #test }
AnubisParserTest >> testColon [
	self parse: ':' rule: #colon
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
AnubisParserTest >> testForwardSlash [
	self parse: '/' rule: #forwardSlash. 
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
	self parse: '(+ 1 1 (- 0 99))' rule: #list.
	self parse: '(hello/there)' rule: #list.
	self parse: '(hello/there: 1 2)' rule: #list.
]

{ #category : #test }
AnubisParserTest >> testOpenParen [
	self parse: '(' rule: #openParen.
]

{ #category : #test }
AnubisParserTest >> testPath [
	self fail: 'hello' rule: #path.
	self parse: 'hello/there/mang' rule: #path.
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
AnubisParserTest >> testSetWord [
	self parse: 'hello:' rule: #setWord
]

{ #category : #test }
AnubisParserTest >> testSetWordPath [

	self parse: 'hello/there:' rule: #setWordPath
]

{ #category : #test }
AnubisParserTest >> testSingleQuote [
	self parse: '''' rule: #singleQuote
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
