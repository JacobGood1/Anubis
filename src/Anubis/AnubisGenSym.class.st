Class {
	#name : #AnubisGenSym,
	#superclass : #Object,
	#instVars : [
		'classWithGenSyms',
		'counter'
	],
	#classInstVars : [
		'generatedSymbols'
	],
	#category : #Anubis
}

{ #category : #accessing }
AnubisGenSym class >> generatedSymbols [
	^generatedSymbols 
]

{ #category : #accessing }
AnubisGenSym class >> generatedSymbols: aMap [
	generatedSymbols := aMap new 
]
