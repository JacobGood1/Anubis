Class {
	#name : #AnubisCompiler,
	#superclass : #Object,
	#category : #Anubis
}

{ #category : #compiling }
AnubisCompiler class >> compile: aString [
	^self depthFirstPass: (AnubisReader parse: aString). 
]

{ #category : #compiling }
AnubisCompiler class >> depthFirstPass: node [
	node reverseDo: [:e | 
		(e class = AnubisList) 
		ifTrue: [
			self depthFirstPass: e data.
			Transcript show: e
		] 
	   ifFalse: [
			Transcript show: e; cr
		]
	].
	
]
