rendering
render: react renderInfo: renderInfo userCodeResult: userCodeResult

	^ userCodeResult == #memoize
		ifTrue: [renderInfo oldRenderResult]
		ifFalse: [react renderNode: userCodeResult forceReRender: false]