Class {
	#name : #REPL,
	#superclass : #Object,
	#category : #Anubis
}

{ #category : #'as yet unclassified' }
REPL class >> repl [
	| readEvalPrintLoop rt |
	readEvalPrintLoop := REPL new.
	rt := SpRichTextPresenter new.
	rt textStyler: SpNullTextStyler new. 
	rt whenSubmitDo: [ :t | readEvalPrintLoop rep: t ].
	rt openWithSpec.
	^rt.
	
]

{ #category : #'meta-object-protocol' }
REPL >> eval: aString [
	^aString.  
]

{ #category : #'meta-object-protocol' }
REPL >> print: aString [
	Transcript show: aString.
	Transcript cr.  
]

{ #category : #'meta-object-protocol' }
REPL >> read: aString [
	^aString. 
]

{ #category : #'meta-object-protocol' }
REPL >> rep: aString [
	self print: (self eval: (self read: aString)). 
]
