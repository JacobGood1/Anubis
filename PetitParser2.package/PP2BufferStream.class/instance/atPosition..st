context interface
atPosition: readPosition
	(readPosition == position) ifTrue: [ 
		^ self last.
	].

	(readPosition > position) ifTrue: [ 
		self upToPosition: readPosition.
		(readPosition > position) ifTrue: [ PP2OutOfBoundsException signalFor: readPosition ].
		^ self last
	].

	"backtrack case"
	(position - readPosition >= bufferSize) ifTrue: [ 
		PP2OutOfBoundsException signalFor: readPosition.
	].
	^ buffer at: ((readPosition - 1) \\ bufferSize) + 1.

