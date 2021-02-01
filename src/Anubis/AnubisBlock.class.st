"
An Anubis Block allows the ability to exit from the block with a break like ability found in other languages. Additionally, the break ability returns a value and can break from outer blocks.

Run this code to see what an AnubisBlock does.
y := 1.
loop := [
	[ y < 10 ] whileTrue: [ 
		y = 5 ifTrue: [ loop2 := [[y < 10] whileTrue: [y := y + 1. y = 9 ifTrue: [loop exit: 'inner']]] withExit. 
			loop2 value.
			y = 9 ifTrue: [loop exit: 'outer']]. 
	  y := y + 1. 
	] 
  ] withExit.
loop value
"
Class {
	#name : #AnubisBlock,
	#superclass : #Object,
	#instVars : [
		'block',
		'exit'
	],
	#category : #Anubis
}

{ #category : #'as yet unclassified' }
AnubisBlock >> exit: aValue [
	exit value: aValue.
]

{ #category : #'as yet unclassified' }
AnubisBlock >> exitBlock: aBlock [
	block := aBlock
]

{ #category : #'as yet unclassified' }
AnubisBlock >> value [ 
	exit := [:value| ^value].
	Transcript cr.
	^block value.
]
