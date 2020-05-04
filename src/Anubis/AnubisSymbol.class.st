Class {
	#name : #AnubisSymbol,
	#superclass : #Object,
	#traits : 'NodeTransformer',
	#classTraits : 'NodeTransformer classTrait',
	#instVars : [
		'str'
	],
	#category : #Anubis
}

{ #category : #'as yet unclassified' }
AnubisSymbol >> toPharo [
	str := '-' split: token.
	str allButFirst inject: str first into: [ :acc :s | acc , s capitalized  ] 
]
