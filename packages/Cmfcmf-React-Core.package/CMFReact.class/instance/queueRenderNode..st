rendering
queueRenderNode: anEntry
	"are we currently collecting updates for a frame? queue. otherwise, start a new render frame immediately."

	batchedUpdates
		ifNotNil: [queuedUpdates add: anEntry]
		ifNil: [self updateFrameDo: [batchedUpdates add: anEntry]]