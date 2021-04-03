rendering
prepareForNextRender

	self flag: #todo. "What is needed here?"
	self assert: currentParentEntry == rootEntry.
	currentChildIndex := 1.