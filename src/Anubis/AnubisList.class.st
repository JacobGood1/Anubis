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
AnubisList class >> determineSpecialForm: anubisList [
	| firstValue |
	firstValue := anubisList data first. 
	(anubisList specialForms includes: firstValue token) 
		ifTrue: [ ^(firstValue token asSymbol , ':') ] 
		ifFalse: [ firstValue class = AnubisPath ifTrue: [ ^#pathFunCall: ] ] 
]

{ #category : #'as yet unclassified' }
AnubisList class >> isSpecialForm: anubisList [
	"this checks the first value of an anubis list to check to see if it is a special form"
	| isSpecial |
	isSpecial := false.
	(anubisList specialForms includes: anubisList data first token) 
		ifTrue: [  
			isSpecial := true.
		] 
		ifFalse: [ 
			Transcript show: [ anubisList data first class ].
			anubisList data first class = AnubisPath ifTrue: [ isSpecial := true ]	
		]. 
	^isSpecial 
]

{ #category : #'as yet unclassified' }
AnubisList class >> makeNode: values [
	| anubisList firstValue |
	anubisList := self new.
	anubisList data: OrderedCollection new.
	firstValue := values first.
	
	values collect: [:d | d ] into: anubisList data.
	(self isSpecialForm: anubisList) 
	   ifTrue: [ 
			anubisList isSpecialForm: true.
			anubisList specialFormDispatchSymbol: (self determineSpecialForm: anubisList)  
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
	specialForms add: #path.
	specialForms add: #funcall.
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
	^('(' ,(isSpecialForm 
		ifTrue: [
			AnubisSpecialFormDispatcher perform: specialFormDispatchSymbol withArguments: {self} 
		]
		ifFalse: [
		   (data inject: '' into: [ :a :n | a, n toPharo])  
	   ]) , ')').
	
]
