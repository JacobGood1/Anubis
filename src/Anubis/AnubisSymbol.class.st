Class {
	#name : #AnubisSymbol,
	#superclass : #Object,
	#traits : 'NodeTransformer',
	#classTraits : 'NodeTransformer classTrait',
	#category : #Anubis
}

{ #category : #'as yet unclassified' }
AnubisSymbol >> toPharo [
	|str|
	str := '-' split: token.
	^str allButFirst inject: str first into: [ :acc :s | acc , s capitalized  ] 
]
