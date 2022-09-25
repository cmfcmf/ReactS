rendering
prepareForNextRender

	self assert: currentParentEntry == rootEntry.
	currentChildPointer := CMFReactChildPointer initial