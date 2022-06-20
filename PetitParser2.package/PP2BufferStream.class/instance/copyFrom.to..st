context interface
copyFrom: start to: stop
	"start - end should be in range <0, size)"
	| bufferStart bufferStop |	
	(stop - start >= bufferSize ) ifTrue: [ 
		"range bigger than buffer"
		PP2OutOfBoundsException signalFor: start.
	].

	(position - start >= bufferSize) ifTrue: [ 
		"buffer not big enough"
		PP2OutOfBoundsException signalFor: start.
	].

	self upToPosition: stop.
	
	(position < stop) ifTrue: [ 
		PP2OutOfBoundsException signalFor: stop.
	].


	bufferStart := ((start - 1) \\ bufferSize) + 1.
	bufferStop := ((stop -1) \\ bufferSize) + 1.
	
	(bufferStart <= bufferStop) ifTrue: [ 
		^ buffer copyFrom: bufferStart to: bufferStop
	] ifFalse: [
		| retval |
		retval := String new: stop - start + 1. 
		0 to: stop - start do: [ :index |
			retval at: (index + 1) put: (buffer at: ((start - 1 + index) \\ bufferSize) + 1)
		].
		^ retval
	]