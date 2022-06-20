accessing
list
	^ openParen, whitespace optional, ((form , (whitespace, form) star) / whitespace / '' asPParser), whitespace optional, closeParen