caching
cacheIfNeeded: result debugResult: debugResult
	(strategy includesCache) ifFalse: [  
		^ self
	].

  "
    For interoperability with VW/Gemstone, see https://github.com/kursjan/petitparser2/issues/35:
    Ignore nil results: this will not show debug results for cached nils.
  "
  result isNil ifTrue: [ ^ self ].

	"
		If the underlying strategy is cache, try to provide debug result even for cached results by
		remembering debug result for each result.
	"
	((resultCache includesKey: result) and: [ (debugResult allResults size = 1 )]) ifTrue:[
		debugResult children: (Array with: (PP2DebugResultLink on: (resultCache at: result)))
	] ifFalse: [
		resultCache at: result put: debugResult.
	]