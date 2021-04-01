printing
printOn: aStream

	super printOn: aStream.
	aStream nextPutAll: ' ', self id.
	"node printWithoutChildrenOn: aStream."
	"childrenNodes do: [:each | each printOn: aStream].
	childrenNodes ifNotEmpty: [aStream nextPutAll: '</END>']"