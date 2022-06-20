initialization
initializeForSize: size
	"nothing to do"
	bufferSize := size.
	buffer := String new: bufferSize.
	position := 0.