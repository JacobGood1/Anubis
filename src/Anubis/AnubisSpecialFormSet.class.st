Class {
	#name : #AnubisSpecialFormSet,
	#superclass : #AnubisAtom,
	#category : #Anubis
}

{ #category : #'as yet unclassified' }
AnubisSpecialFormSet >> expansionFormat: args [
	| retString counter |
	token size % 2 ~= 0
		ifTrue: 
			[ 
				Error signal: 'Forms were not even: (set ' , 
				(' ' join: (token collect: [:t | t toAnubis ])) , 
				')'
			].
		 retString := ''.
		 counter := 1.
		[counter < args size ] whileTrue: [ 
			retString := retString , args at: counter, ' := ', args at: counter + 1.
			counter := counter + 2.
			counter < args size ifTrue: [ retString := retString , Character cr asString ].
		].
	^ retString. 
]
