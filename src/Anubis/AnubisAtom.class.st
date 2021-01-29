Class {
	#name : #AnubisAtom,
	#superclass : #Object,
	#traits : 'NodeTransformer',
	#classTraits : 'NodeTransformer classTrait',
	#category : #Anubis
}

{ #category : #'as yet unclassified' }
AnubisAtom class >> makeNode: value [
	| temp |
	temp := self new.
	temp token: value.
	temp specialForm: false.
	^temp.  
	
]

{ #category : #'as yet unclassified' }
AnubisAtom class >> makeNodeAsSpecialForm: value [
	| temp |
	temp := self new.
	temp token: value.
	temp specialForm: true.
	^temp.  
	
]
