Class {
	#name : #UnrealTracker,
	#superclass : #Object,
	#classInstVars : [
		'currentProject'
	],
	#category : #Anubis
}

{ #category : #'as yet unclassified' }
UnrealTracker class >> currentProject [
	^currentProject
]

{ #category : #'as yet unclassified' }
UnrealTracker class >> currentProject: aString [ 
	| temp |
	temp := (UnrealTracker projects select: [ :fr | fr basename = aString ]).
	
	temp isNotEmpty ifTrue: [ 
		currentProject := temp first.
		^ currentProject. 	
	] ifFalse: [ self error: 'The project specified does not exist'  ] 

]

{ #category : #'as yet unclassified' }
UnrealTracker class >> mainDir [
	^(FileLocator documents asPath , '/Unreal Projects/') asFileReference    
]

{ #category : #'as yet unclassified' }
UnrealTracker class >> projects [
	^ UnrealTracker mainDir children select: [ :i | (i path basename findString: 'Intermediate') = 0]
]
