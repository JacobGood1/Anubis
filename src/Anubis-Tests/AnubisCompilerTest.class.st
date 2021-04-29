Class {
	#name : #AnubisCompilerTest,
	#superclass : #TestCase,
	#category : #'Anubis-Tests'
}

{ #category : #tests }
AnubisCompilerTest >> testIfStatement [
	self assert: (AnubisCompiler compile: '(if nil 3 true "hello there" nil 6 false nil nil "dsafnmdklsfn")')
	     equals: 'hello there'.
	self assert: (AnubisCompiler compile: '(if nil 1)')
	     equals: nil.
	self assert: (AnubisCompiler compile: '(if false 500 true 600)')
	     equals: 600.
]
