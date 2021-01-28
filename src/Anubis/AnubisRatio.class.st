Class {
	#name : #AnubisRatio,
	#superclass : #AnubisAtom,
	#instVars : [
		'fraction'
	],
	#category : #Anubis
}

{ #category : #'as yet unclassified' }
AnubisRatio class >> makeNode: aString [
	| ar |
	ar := AnubisRatio new.
	ar fraction: aString.
	ar token: aString.
	^ ar. 
]

{ #category : #'as yet unclassified' }
AnubisRatio >> fraction: aStringArray [
	fraction := Fraction readFrom: ('' join: aStringArray).
]
