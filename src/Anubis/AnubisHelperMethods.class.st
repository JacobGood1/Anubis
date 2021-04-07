Class {
	#name : #AnubisHelperMethods,
	#superclass : #Object,
	#category : #Anubis
}

{ #category : #'as yet unclassified' }
AnubisHelperMethods class >> replaceHyphens: aString [
	| words |
	words := (aString splitOn: '-'). 
	^(words first , (words allButFirst inject: '' into: [ :a :n | a , n capitalized ]))
]
