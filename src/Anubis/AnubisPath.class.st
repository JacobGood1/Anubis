Class {
	#name : #AnubisPath,
	#superclass : #AnubisDataTypes,
	#category : #Anubis
}

{ #category : #'as yet unclassified' }
AnubisPath >> toPharo [
	| words allButLast |
	words := (token splitOn: '/'). 
   allButLast := words allButLast inject: '' into: [:p :n | p , n , ' ' ].
   ^allButLast , words last.
]
