as yet unclassified
queueRenderFrom: aHook
	"are we currently collecting updates for a frame? queue. otherwise, start a new render frame immediately."

	batchedUpdates
		ifNotNil: [queuedUpdates add: aHook]
		ifNil: [self updateFrameDo: [batchedUpdates add: aHook]]