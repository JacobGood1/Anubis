instance creation
on: stream encoder: encoder
	^ (self basicNew initialize)
		stream: stream;
		encoder: encoder;
		yourself