Class {
	#name : #AnubisSymbol,
	#superclass : #AnubisAtom,
	#category : #Anubis
}

{ #category : #'as yet unclassified' }
AnubisSymbol >> toAnubis [
	^self token. 
]

{ #category : #'as yet unclassified' }
AnubisSymbol >> toPharo [
 "Changes the lisp style of a symbol to the pharo style"
 "(AnubisReader new parse: 'hello-there') first toPharo >>> 'helloThere'"
	|str|
	str := '-' split: token.
	^str allButFirst inject: str first into: [ :acc :s | acc , s capitalized  ] 
]
