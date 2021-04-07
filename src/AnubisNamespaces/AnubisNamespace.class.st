Class {
	#name : #AnubisNamespace,
	#superclass : #Object,
	#classInstVars : [
		'ns'
	],
	#category : #AnubisNamespaces
}

{ #category : #accessing }
AnubisNamespace class >> ns [
	^ns
]

{ #category : #accessing }
AnubisNamespace class >> ns: anubisNamespace [
	ns := anubisNamespace.
	^ns.  
]
