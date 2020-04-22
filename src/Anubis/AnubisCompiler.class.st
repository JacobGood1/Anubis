Class {
	#name : #AnubisCompiler,
	#superclass : #PPCompositeParser,
	#instVars : [
		'openParen',
		'closeParen',
		'integer',
		'float',
		'digitExcludingZero',
		'doubleQuote',
		'string',
		'whitespace',
		'symbol',
		'hyphen',
		'list',
		'atom',
		'atoms'
	],
	#category : #Anubis
}

{ #category : #'as yet unclassified' }
AnubisCompiler class >> composeRules: anArray [
	| firstRule |
	firstRule := anArray first.
	^anArray allButFirst inject: firstRule  into: [:acc :i | acc, (#space asParser plus ==> [:s| ]), i ]
]

{ #category : #'as yet unclassified' }
AnubisCompiler class >> ultimateSourceCodeAt: aString ifAbsent: aBlockClosure [ 
	self flag: #TODO "figure out how to grab the source code of an object". 
	"Transcript show: aString."
	^''
]

{ #category : #parsing }
AnubisCompiler >> atom [ 
	^(
	float /
	integer /
	symbol /
	list 
	)
]

{ #category : #parsing }
AnubisCompiler >> atoms [ 
	^atom , ((whitespace , atom) star).
]

{ #category : #parsing }
AnubisCompiler >> closeParen [
	"parses a closed parenthesis"
	^ ')' asParser.
]

{ #category : #parsing }
AnubisCompiler >> digitExcludingZero [
	^ ('1' asParser / 
		'2' asParser / 
		'3' asParser /  
	   '4' asParser / 
		'5' asParser /
		'6' asParser /
		'7' asParser /
		'8' asParser /
		'9' asParser)
]

{ #category : #parsing }
AnubisCompiler >> doubleQuote [
	^'"' asParser.
]

{ #category : #parsing }
AnubisCompiler >> float [
	^ (integer , '.' asParser , integer) 
]

{ #category : #parsing }
AnubisCompiler >> hyphen [
	^ '-' asParser.
]

{ #category : #parsing }
AnubisCompiler >> integer [
	"parses an integer with no leading zeros: 1 123 456, not: 01 05 etc."
	^ ((digitExcludingZero , #digit asParser plus) / (#digit asParser)) .
]

{ #category : #parsing }
AnubisCompiler >> list [
	^ (openParen , closeParen) / (openParen , symbol , whitespace , atoms optional, closeParen). 
]

{ #category : #parsing }
AnubisCompiler >> openParen [
	"parses an open parenthesis"
	^ '(' asParser.
]

{ #category : #accessing }
AnubisCompiler >> start [
	"Answer the production to start this parser with."
	
	^ openParen , closeParen.
]

{ #category : #parsing }
AnubisCompiler >> string [
	^ doubleQuote , (#any asParser starLazy: doubleQuote) , doubleQuote.  
]

{ #category : #parsing }
AnubisCompiler >> symbol [
	self flag: #TODO "add more variants to symbol".
	^ #lowercase asParser, (#lowercase asParser / integer / hyphen ) star.
]

{ #category : #parsing }
AnubisCompiler >> whitespace [
	^ #space asParser plus. 
]
