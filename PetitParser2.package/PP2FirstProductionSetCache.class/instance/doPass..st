optimizations
doPass: node
	| allNodes child |
	self visit: node.
	allNodes := node allNodes.
	
	[(child := allNodes detect: [ :e | (e hasProperty: #firstProductionSet) not ] 
							ifNone: [ nil ]) notNil ] whileTrue: [ 		
		self visit: child
	]