Extension { #name : #BlockClosure }

{ #category : #'*Anubis' }
BlockClosure >> withExit [
	^AnubisBlockWithExit new on: self
]
