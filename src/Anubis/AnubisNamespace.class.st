"
This class handles lisp namespaces.

A namespace contains functions and gensyms.
"
Class {
	#name : #AnubisNamespace,
	#superclass : #Object,
	#classInstVars : [
		'anubisNamespace',
		'namespace'
	],
	#category : #Anubis
}

{ #category : #accessing }
AnubisNamespace class >> createNameSpace: nsName [
	| objName namespaceAlreadyExists |
	
	namespaceAlreadyExists := false.
	objName := self formatNameSpace: nsName.
	
	(self findNameSpace: nsName) ifNotNil: [namespaceAlreadyExists := true].
	
	namespaceAlreadyExists ifTrue: [ namespace := ('{1}' format: { objName }) asClass. 
			^'switched to namespace: ' , namespace asString
		].
	
	Object evaluate: ('
	Object subclass: #{1}
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: ''{1}''' format: { objName }).

	namespace := ('{1}' format: { objName }) asClass.
	^ namespace
]

{ #category : #accessing }
AnubisNamespace class >> deleteNameSpace: nsName [
	| objName |
	"this is not a real note: TODO please fix the error message formatting, it 
	looks like pharo"
	objName := self formatNameSpace: nsName).
	[(RPackageOrganizer default packageNamed: objName)] 
    on: KeyNotFound 
    do: [ Error signal: ('The namespace: {1}, does not exist!' format: {objName}) ].
	(RPackageOrganizer default packageNamed: objName) removeFromSystem.
	^ '{1} has been removed!' format: {objName} 
]

{ #category : #accessing }
AnubisNamespace class >> findNameSpace: nsName [
	"if namespace exists return it, if not return nil"
	| objName |
	objName := (self formatNameSpace: nsName).
	[RPackageOrganizer default packageNamed: objName]	 
		on: KeyNotFound 
		do: [ ^nil ].
	^ objName asClass.
]

{ #category : #accessing }
AnubisNamespace class >> formatNameSpace: nsName [
	| temp |
	temp := '-' split: nsName.
	temp first ~= 'ns' ifTrue: [ 
		Error signal: 'namespace names must be prefixed with ns' ].
	^'NS_' , (temp allButFirst reduce: [ :prev :next | 
		           prev capitalized , next capitalized ]) capitalized.
]
