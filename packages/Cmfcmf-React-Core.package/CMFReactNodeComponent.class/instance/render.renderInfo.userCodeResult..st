rendering
render: react renderInfo: renderInfo userCodeResult: userCodeResult

	^ userCodeResult == #memoize
		ifTrue: [
			react elementTree advanceChildPointer.
			renderInfo oldRenderResult]
		ifFalse: [react renderNode: userCodeResult forceReRender: false]