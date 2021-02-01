"
An AnubisNamespaceTest is a test class for testing the behavior of AnubisNamespace
"
Class {
	#name : #AnubisNamespaceTest,
	#superclass : #TestCase,
	#instVars : [
		'nsName'
	],
	#category : #'Anubis-Tests'
}

{ #category : #running }
AnubisNamespaceTest >> setUp [
	super setUp.
	nsName := 'ns-anubis-test-namespace'.
	"Put here a common initialization logic for tests"
]

{ #category : #tests }
AnubisNamespaceTest >> testCreateNamespace [
	AnubisNamespace createNameSpace: nsName.
	self
		assert: (AnubisNamespace findNameSpace: nsName) notNil
		equals: true.
	self
		assert: (AnubisNamespace createNameSpace: nsName)
		equals: 'switched to namespace: NS_AnubisTestNamespace'.
	AnubisNamespace deleteNameSpace: nsName
]

{ #category : #tests }
AnubisNamespaceTest >> testFindNameSpace [
	AnubisNamespace createNameSpace: nsName.
	self 
		assert: (AnubisNamespace findNameSpace: nsName) 
		equals: 'NS_AnubisTestNamespace' asClass. 
	self 
		assert: (AnubisNamespace findNameSpace: 'ns-!!1111!- IDONTTHINKTHISISREAL-specaldorfz')
		equals: nil.
	AnubisNamespace deleteNameSpace: nsName.
]

{ #category : #tests }
AnubisNamespaceTest >> testFormatNameSpace [
	self assert: (AnubisNamespace formatNameSpace: nsName) equals: 'NS_AnubisTestNamespace'.
	self assert: (AnubisNamespace formatNameSpace: 'ns-hi') equals: 'NS_Hi'.  
]

{ #category : #tests }
AnubisNamespaceTest >> testdeleteNameSpace [
	self
	 assert: ([(AnubisNamespace deleteNameSpace: nsName)] on: Error do: [ 'error works' ])
	 equals: 'error works'.
	AnubisNamespace createNameSpace: nsName.
	
	self
	 assert: (AnubisNamespace deleteNameSpace: nsName)
	 equals: 'NS_AnubisTestNamespace has been removed!'.
	
]
