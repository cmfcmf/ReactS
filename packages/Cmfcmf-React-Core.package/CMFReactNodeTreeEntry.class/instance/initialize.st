initialize-release
initialize 

	super initialize.
	childrenTreeNodes := OrderedCollection new.
	keyedChildrenTreeNodes := Dictionary new.
	parent := nil.
	index := -1