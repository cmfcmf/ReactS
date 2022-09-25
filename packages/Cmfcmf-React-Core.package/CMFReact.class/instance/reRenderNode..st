rendering
reRenderNode: anEntry

	batchedUpdates
		ifNotNil: [^ batchedUpdates add: anEntry]
		ifNil: [self updateFrameDo: [self reRenderNodeNow: anEntry]]