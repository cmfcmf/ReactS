printing
printOn: aStream

	super printOn: aStream
	"node printWithoutChildrenOn: aStream."
	"childrenNodes do: [:each | each printOn: aStream].
	childrenNodes ifNotEmpty: [aStream nextPutAll: '</END>']"