Class {
	#name : #AnubisList,
	#superclass : #AnubisDataTypes,
	#instVars : [
		'data',
		'isSpecialForm',
		'specialForms'
	],
	#category : #Anubis
}

{ #category : #'as yet unclassified' }
AnubisList class >> makeNode: values [
	| anubisList |
	anubisList := self new.
	anubisList data: OrderedCollection new.
	values collect: [:d | d ] into: anubisList data.
	(anubisList specialForms includes: values first token asSymbol) ifTrue: [ anubisList isSpecialForm: true ].
	anubisList token: (
		(values inject: '(' 
		        into: [ :a :v | a, v token]) , ')').
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

{ #category : #accessing }
AnubisList >> initialize [ 
	specialForms := Set new.
	specialForms add: #if.
	isSpecialForm := false.
	
]

{ #category : #accessing }
AnubisList >> isSpecialForm [
	^ isSpecialForm
]

{ #category : #accessing }
AnubisList >> isSpecialForm: aBoolean [ 
	isSpecialForm := aBoolean
]

{ #category : #accessing }
AnubisList >> specialForms [
	^ specialForms
]
