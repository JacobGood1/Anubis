"
I will convert special forms to the proper acceptable pharo syntax

specialForms:
	if -> (if 1 1) -> (1 ~= nil and: 1 ~= false) ifTrue: [ 1] ifFalse: [nil]
"
Class {
	#name : #AnubisSpecialFormDispatcher,
	#superclass : #Object,
	#category : #Anubis
}

{ #category : #accessing }
AnubisSpecialFormDispatcher class >> funcall: anubisListRef [
  "possibly remove this"
	| funcallDroppedWhitespaceCleared |
	funcallDroppedWhitespaceCleared := anubisListRef data allButFirst allButFirst allButFirst  reject: [:e | e class = AnubisWhitespace]. 
	^(anubisListRef data third toPharo,
	' ',
	'valueWithArguments: #{', 
	(funcallDroppedWhitespaceCleared inject: '' into: [:a :n | a, n toPharo , '. '])  
	,'}').
	
]

{ #category : #accessing }
AnubisSpecialFormDispatcher class >> if: anubisListRef [
	| ifDroppedWhitespaceCleared closingBrackets |
	ifDroppedWhitespaceCleared := anubisListRef data allButFirst reject: [:e | e class = AnubisWhitespace]. 
	ifDroppedWhitespaceCleared  
		size % 2 = 0 
			ifFalse: [ Error signal: 'even number of forms required for if statement: ' , anubisListRef token ].
	closingBrackets := ''.
	^(((1 to: ifDroppedWhitespaceCleared size by: 2) 
		inject: '' 
		into: [ :a :i | 
			closingBrackets := closingBrackets , ']'.
			a , ('({1} ~= nil and: {1} ~= false) ifTrue: [{2}] ifFalse: [{3}' 
				format: {(ifDroppedWhitespaceCleared at: i) toPharo. 
				         (ifDroppedWhitespaceCleared at: i + 1) toPharo.
				         Character cr}).
		]) , 'nil' , closingBrackets)
	
]

{ #category : #accessing }
AnubisSpecialFormDispatcher class >> pathFunCall: anubisListRef [
	| pathDroppedWhitespaceCleared |
	pathDroppedWhitespaceCleared := anubisListRef data allButFirst reject: [:e | e class = AnubisWhitespace]. 
	^(self weaveArgsWithData: anubisListRef).
	
]

{ #category : #accessing }
AnubisSpecialFormDispatcher class >> removeWhiteSpace: anubisListRef [
	^anubisListRef data reject: [:e | e class = AnubisWhitespace]
]

{ #category : #accessing }
AnubisSpecialFormDispatcher class >> weaveArgsWithData: anubisList [
	| counter whiteSpaceRemoved |
	counter := 0.
	whiteSpaceRemoved := self removeWhiteSpace: anubisList. 
   ^
   (whiteSpaceRemoved first toPharo,
   ': nil ',
   (whiteSpaceRemoved allButFirst  
                       inject: '' 
                       into: [ 
		:a :t | 
		a , ' arg{1}: {2} ' format: {counter:= counter + 1. t toPharo} 
	])) 
	
]
