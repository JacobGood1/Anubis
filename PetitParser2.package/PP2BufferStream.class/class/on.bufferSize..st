instance creation
on: stream bufferSize: bufferSize
	^ (self basicNew)
		initializeForSize: bufferSize;
		stream: stream;
		yourself