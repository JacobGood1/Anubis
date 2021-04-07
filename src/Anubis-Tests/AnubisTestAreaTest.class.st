"
An AnubisTestAreaTest is a test class for testing the behavior of AnubisTestArea
"
Class {
	#name : #AnubisTestAreaTest,
	#superclass : #TestCase,
	#category : #'Anubis-Tests'
}

{ #category : #test }
AnubisTestAreaTest >> testWhatIsThis [

	self flag: #toImplement.
	self assert: false
]
