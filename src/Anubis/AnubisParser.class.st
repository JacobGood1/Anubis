Class {
	#name : #AnubisParser,
	#superclass : #PPCompositeParser,
	#instVars : [
		'openParen',
		'closeParen',
		'integer',
		'float',
		'ratio',
		'digitExcludingZero',
		'doubleQuote',
		'string',
		'whitespace',
		'symbol',
		'hyphen',
		'list',
		'atom',
		'boolean',
		'quotedList',
		'singleQuote',
		'path',
		'forwardSlash',
		'colon',
		'setWord',
		'setWordPath'
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
	^
	(ratio /
	float /
	boolean /
	integer /
	setWord /
	path /
	symbol /
	string /
	quotedList / 
	list)
	
]

{ #category : #parsing }
AnubisParser >> boolean [
	^('true' asParser / 'false' asParser)
	
]

{ #category : #parsing }
AnubisParser >> closeParen [
	"parses a closed parenthesis"
	^ ')' asParser.
]

{ #category : #parsing }
AnubisParser >> colon [
	^ $: asParser
	
	
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
	^ (integer , '.' asParser , integer) flatten
]

{ #category : #parsing }
AnubisParser >> forwardSlash [
	^($/ asParser). 
	
]

{ #category : #parsing }
AnubisParser >> hyphen [
	^ $- asParser.
]

{ #category : #parsing }
AnubisParser >> integer [
	"parses an integer with no leading zeros: 1 123 456, not: 01 05 etc."
	^ ((digitExcludingZero , #digit asParser plus) / (#digit asParser)) flatten .
]

{ #category : #parsing }
AnubisParser >> list [
	^ ((openParen, 
	    (setWordPath / atom / whitespace) star, 
	  closeParen)
	==> [:nodes |nodes second]).
	 
]

{ #category : #parsing }
AnubisParser >> openParen [
	"parses an open parenthesis"
	^ '(' asParser.
]

{ #category : #parsing }
AnubisParser >> path [
	^(symbol , forwardSlash , symbol , ((forwardSlash , symbol) star)) 
	
]

{ #category : #parsing }
AnubisParser >> quotedList [
	^(singleQuote , list)
	
]

{ #category : #parsing }
AnubisParser >> ratio [ 
	^(integer, $/ asParser, integer)
	
]

{ #category : #parsing }
AnubisParser >> setWord [
	^ (symbol , colon).
	
	
]

{ #category : #parsing }
AnubisParser >> setWordPath [
	^ (symbol , forwardSlash , setWord).
	
	
]

{ #category : #parsing }
AnubisParser >> singleQuote [
	^($' asParser).
	
]

{ #category : #accessing }
AnubisParser >> start [
	"Answer the production to start this parser with."
	
	^ atom / list.
]

{ #category : #parsing }
AnubisParser >> string [
	^ (doubleQuote , (#any asParser starLazy: doubleQuote) , doubleQuote) flatten.  
]

{ #category : #parsing }
AnubisParser >> symbol [
	self flag: #TODO "add more variants to symbol".
	^
	"change this later to say allowable front character! VVVV"
	('+-|!@#$%^*' asCharacterSet inject: $& asParser into: [:a :b | a / b asParser]) / 
	(#lowercase asParser / hyphen ) , 
	((#lowercase asParser / integer / hyphen) star) 
	flatten.
]

{ #category : #parsing }
AnubisParser >> whitespace [
	^ #space asParser plus. 
]
