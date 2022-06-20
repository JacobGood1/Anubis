testing
isStarPredicateObject: node 
	^ (node min = 0) and: [ 
	  (node max = Float infinity) and: [ 
	  node child isKindOf: PP2PredicateObjectNode 
	]]