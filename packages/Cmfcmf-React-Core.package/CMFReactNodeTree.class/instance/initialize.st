initialize-release
initialize 

	super initialize.
	
	self flag: #todo. "I don't really want this root node"
	rootEntry := currentParentEntry := CMFReactNodeTreeEntry new
		node: CMFReactNodeFragment new;
		yourself.
	
	self prepareForNextRender 
	 
	