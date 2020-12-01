Class {
	#name : #AnubisParser,
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
AnubisParser class >> composeRules: anArray [
	| firstRule |
	firstRule := anArray first.
	^anArray allButFirst inject: firstRule  into: [:acc :i | acc, (#space asParser plus ==> [:s| ]), i ]
]

{ #category : #'as yet unclassified' }
AnubisParser class >> ultimateSourceCodeAt: aString ifAbsent: aBlockClosure [ 
	self flag: #TODO "figure out how to grab the source code of an object". 
	"Transcript show: aString."
	^''
]

{ #category : #parsing }
AnubisParser >> atom [ 
	^(
	float /
	integer /
	symbol /
	list 
	)
]

{ #category : #parsing }
AnubisParser >> atoms [ 
	^atom , ((whitespace , atom) star).
]

{ #category : #parsing }
AnubisParser >> closeParen [
	"parses a closed parenthesis"
	^ ')' asParser.
]

{ #category : #parsing }
AnubisParser >> digitExcludingZero [
	^ ($1 asParser / 
		$2 asParser / 
		$3 asParser /  
	   $4 asParser / 
		$5 asParser /
		$6 asParser /
		$7 asParser /
		$8 asParser /
		$9 asParser)
]

{ #category : #parsing }
AnubisParser >> doubleQuote [
	^$" asParser.
]

{ #category : #parsing }
AnubisParser >> float [
	^ (integer , '.' asParser , integer) 
]

{ #category : #parsing }
AnubisParser >> hyphen [
	^ $- asParser.
]

{ #category : #parsing }
AnubisParser >> integer [
	"parses an integer with no leading zeros: 1 123 456, not: 01 05 etc."
	^ ((digitExcludingZero , #digit asParser plus) / (#digit asParser)) .
]

{ #category : #parsing }
AnubisParser >> list [
	^ (openParen , whitespace flatten, closeParen) / (openParen , (symbol , whitespace, atoms optional), closeParen). 
]

{ #category : #parsing }
AnubisParser >> openParen [
	"parses an open parenthesis"
	^ '(' asParser.
]

{ #category : #accessing }
AnubisParser >> start [
	"Answer the production to start this parser with."
	
	^ openParen , closeParen.
]

{ #category : #parsing }
AnubisParser >> string [
	^ doubleQuote , (#any asParser starLazy: doubleQuote) , doubleQuote.  
]

{ #category : #parsing }
AnubisParser >> symbol [
	self flag: #TODO "add more variants to symbol".
	^ (#lowercase asParser / hyphen ), (#lowercase asParser / integer / hyphen ) star.
]

{ #category : #parsing }
AnubisParser >> whitespace [
	^ #space asParser plus. 
]
