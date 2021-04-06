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
	^(anubisListRef data first toPharo,
	' ',
	'valueWithArguments: #{', 
	(pathDroppedWhitespaceCleared inject: '' into: [:a :n | a, n toPharo , '. '])  
	,'}').
	
]
