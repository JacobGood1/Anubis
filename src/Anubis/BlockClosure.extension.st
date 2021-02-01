Extension { #name : #BlockClosure }

{ #category : #'*Anubis' }
BlockClosure >> withExit [
	^AnubisBlock new exitBlock: self.
	

]
