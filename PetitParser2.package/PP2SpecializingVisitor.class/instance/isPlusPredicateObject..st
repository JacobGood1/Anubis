testing
isPlusPredicateObject: node 
	^ (node min = 1) and: [ 
	  (node max = Float infinity) and: [ 
	  node child isKindOf: PP2PredicateObjectNode 
	]]