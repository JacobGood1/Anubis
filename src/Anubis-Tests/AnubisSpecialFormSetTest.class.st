"
An AnubisSpecialFormSetTest is a test class for testing the behavior of AnubisSpecialFormSet
"
Class {
	#name : #AnubisSpecialFormSetTest,
	#superclass : #TestCase,
	#category : #'Anubis-Tests'
}

{ #category : #test }
AnubisSpecialFormSetTest >> testExpansionFormat [
  "you are here change this message and also get this to accept only the args just like list does! create a set up and tear down... also ADD TESTS AND DOCS TO EVERYTHING SCRUB!!"
	AnubisReader parse: '(set x 1)'
]
