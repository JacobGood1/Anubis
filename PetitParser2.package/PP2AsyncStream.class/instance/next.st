minimal interface
next
	| delay |
	"
		Poor man implementation of polling...
	"
	delay := Delay forMilliseconds: 50.
	
	[ queue isEmpty] whileTrue: [ delay wait  ].
	^  queue removeFirst