Class {
	#name : #AnubisHelperMethodsTest,
	#superclass : #TestCase,
	#category : #'Anubis-Tests'
}

{ #category : #tests }
AnubisHelperMethodsTest >> testReplaceHyphens [
	self assert: (AnubisHelperMethods replaceHyphens: 'hi') equals: 'hi'.
	self assert: (AnubisHelperMethods replaceHyphens: 'hi-there') equals: 'hiThere'. 
	self assert: (AnubisHelperMethods replaceHyphens: 'hi-there-bob') equals: 'hiThereBob'.   
]
