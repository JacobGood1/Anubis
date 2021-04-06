Class {
	#name : #AnubisCompiler,
	#superclass : #Object,
	#category : #Anubis
}

{ #category : #compiling }
AnubisCompiler class >> compile: aString [
	^(AnubisReader parse: aString onError: [ :msg :pos | self error: msg ]) first toPharo . 
]

{ #category : #compiling }
AnubisCompiler class >> depthFirstPass: node [
	node do: [:e | 
		(e class = AnubisList) 
		ifTrue: [
			self depthFirstPass: e data.
			e isSpecialForm ifTrue: [  
				Transcript show: e specialFormDispatchSymbol asString; cr.
			]. 
		] 
	   ifFalse: [
			Transcript show: e; cr
		]
	].
	
]
