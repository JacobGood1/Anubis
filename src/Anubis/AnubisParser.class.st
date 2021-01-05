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
		'atoms',
		'form'
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
	float /
	integer /
	symbol /
	string /
	list
	
]

{ #category : #parsing }
AnubisParser >> atoms [ 
	^
	(atom , whitespace optional ==> [:a | a at: 1]) star 
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
	^ (integer , '.' asParser , integer) flatten
]

{ #category : #parsing }
AnubisParser >> form [
	list star.
	 
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
	^ (openParen, 
	   ((
	     whitespace optional, 
	     atoms optional, 
	     whitespace optional
	   ) ==> [:nodes | nodes second]), 
	  closeParen)
	==> [:nodes |nodes second]
	 
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
	^ #space asParser plus flatten. 
]
