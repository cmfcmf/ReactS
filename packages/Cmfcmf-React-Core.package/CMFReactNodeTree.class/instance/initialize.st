as yet unclassified
initialize 

	super initialize.
	currentIndex := 1.
	currentLevel := CMFReactNodeTreeEntry new
		node: CMFReactNodeFragment new;
		yourself.
	self flag: #todo. "I don't really want this root node"