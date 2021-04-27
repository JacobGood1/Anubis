Extension { #name : #ByteString }

{ #category : #'*Anubis' }
ByteString >> ifTrue: aBlock [
	^ aBlock value.
]

{ #category : #'*Anubis' }
ByteString >> toPharo [ 
	^self
]
