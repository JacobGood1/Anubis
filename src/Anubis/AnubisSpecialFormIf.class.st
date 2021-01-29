Class {
	#name : #AnubisSpecialFormIf,
	#superclass : #AnubisAtom,
	#category : #Anubis
}

{ #category : #'as yet unclassified' }
AnubisSpecialFormIf class >> makeNode: aList [
	^self makeNodeAsSpecialForm: 
	  (OrderedCollection new 
	  		addAll: aList allButFirst; 
	  		yourself).
]

{ #category : #'as yet unclassified' }
AnubisSpecialFormIf >> expansionFormat: args [
	| counter finalStrSource cond ret|
	self flag: #TODO "generating of var that deals with conditions needs to use a proper gensym".
	counter := 1.
	cond := '__AnubisSpecialFormIf__var__cond'.
	ret := nil.
	finalStrSource := '[|' , cond, '|', Character cr asString.
	[counter < args size] whileTrue: [
		 ret := (args at: counter + 1) toPharo.
		 finalStrSource :=  
		   finalStrSource ,
		   cond, ':=', (args at: counter) toPharo, '.', Character cr asString,
		   cond, 
		   ' ~= false ifTrue: [ ', 
			 cond, 
			 ' ~= nil ifTrue: [^',
			 ret,
			 ']].',
	      Character cr asString. 
		counter := counter + 2.
	].
  ^finalStrSource , '] value.' 
	 
]

{ #category : #'as yet unclassified' }
AnubisSpecialFormIf >> toPharo [ 
	"this will change an if statement from lisp into an if statement in pharo, everything 
	in Anubis is true except for false and nil"
	token size % 2 ~= 0 
		ifTrue: 
			[ 
				Error signal: 'Forms were not even: (if ' , (' ' join: (token collect: [:t | t toAnubis ])) , ')' 
			].
	 ^self expansionFormat: token.	 
]
