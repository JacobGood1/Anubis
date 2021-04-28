Class {
	#name : #AnubisBlockWithExit,
	#superclass : #Object,
	#instVars : [
		'exit',
		'block',
		'retValue'
	],
	#category : #Anubis
}

{ #category : #'instance creation' }
AnubisBlockWithExit >> exit [
	exit value
]

{ #category : #'instance creation' }
AnubisBlockWithExit >> exit: aValue [
	retValue := aValue.
	exit value
]

{ #category : #'instance creation' }
AnubisBlockWithExit >> on: aBlock [
	block := aBlock
]

{ #category : #'instance creation' }
AnubisBlockWithExit >> value [ 
	exit := [ ^retValue ].
	^block value.

]
