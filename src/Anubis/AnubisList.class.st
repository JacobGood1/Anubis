Class {
	#name : #AnubisList,
	#superclass : #AnubisDataTypes,
	#instVars : [
		'data'
	],
	#category : #Anubis
}

{ #category : #'as yet unclassified' }
AnubisList class >> makeNode: values [
	| anubisList |
	anubisList := self new.
	anubisList data: OrderedCollection new.
	values collect: [:d | d ] into: anubisList data.
	anubisList token: (
		(values inject: '(' 
		        into: [ :a :v | a, (v class = Array ifTrue: [ v first asString ] 
			                                        ifFalse: [v token ])]) , ')').
	^anubisList. 
]

{ #category : #initialization }
AnubisList >> data [
	^data.
	
]

{ #category : #accessing }
AnubisList >> data: aCollection [ 
	data := aCollection
]
