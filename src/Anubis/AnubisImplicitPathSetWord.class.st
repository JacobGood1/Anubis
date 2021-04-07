Class {
	#name : #AnubisImplicitPathSetWord,
	#superclass : #AnubisDataTypes,
	#category : #Anubis
}

{ #category : #'as yet unclassified' }
AnubisImplicitPathSetWord >> toPharo [ 
	^((token splitOn: '/') allButFirst inject: '' into: [:a :n | a, ' ', (AnubisHelperMethods replaceHyphens: n) ]) allButFirst 
]
