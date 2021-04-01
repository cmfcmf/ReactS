initialize-release
initialize 

	super initialize.
	currentIndex := 1.
	rootEntry := currentLevel := CMFReactNodeTreeEntry new
		node: CMFReactNodeFragment new;
		yourself.
	self flag: #todo. "I don't really want this root node"