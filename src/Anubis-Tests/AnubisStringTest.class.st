"
An AnubisStringTest is a test class for testing the behavior of AnubisString
"
Class {
	#name : #AnubisStringTest,
	#superclass : #TestCase,
	#category : #'Anubis-Tests'
}

{ #category : #test }
AnubisStringTest >> testToPharo [
	self assert: (AnubisString new token: '"hello"') toPharo equals: '''hello'''.
	
]
