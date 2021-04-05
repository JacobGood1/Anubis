Class {
	#name : #AnubisList,
	#superclass : #AnubisDataTypes,
	#instVars : [
		'data',
		'isSpecialForm',
		'specialForms',
		'specialFormDispatchSymbol'
	],
	#category : #Anubis
}

{ #category : #'as yet unclassified' }
AnubisList class >> makeNode: values [
	| anubisList |
	anubisList := self new.
	anubisList data: OrderedCollection new.
	values collect: [:d | d ] into: anubisList data.
	(anubisList specialForms includes: values first token asSymbol) ifTrue: [ 
		anubisList isSpecialForm: true.
		anubisList specialFormDispatchSymbol: (values first token asSymbol) , ':'.  
	].
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
AnubisList >> specialFormDispatchSymbol [
	^specialFormDispatchSymbol 
]

{ #category : #accessing }
AnubisList >> specialFormDispatchSymbol: aSymbol [ 
	specialFormDispatchSymbol := aSymbol
]

{ #category : #accessing }
AnubisList >> specialForms [
	^ specialForms
]

{ #category : #accessing }
AnubisList >> toPharo [ 
"to pharo will handle all the translation and depth procedures needed, you do not need to handle tree searching yourself"
"handle special forms if special form make a call to the special form dispatcher!!"
	^(isSpecialForm 
		ifTrue: [
			AnubisSpecialFormDispatcher perform: specialFormDispatchSymbol withArguments: {self} 
		]
		ifFalse: [
			('(' , (data inject: '' into: [ :a :n | a, n toPharo]) , ')')  
	   ]).
	
]
