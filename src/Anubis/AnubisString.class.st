Class {
	#name : #AnubisString,
	#superclass : #AnubisDataTypes,
	#category : #Anubis
}

{ #category : #'as yet unclassified' }
AnubisString >> toPharo [ 
	^token copyReplaceAll: '"' with: ''''.
]
