rendering
reRenderNodeWithId: id

	batchedUpdates ifNotNil: [^ batchedUpdates add: id].
	
	elementTree resetToNodeWithId: id during: [:treeNode | | oldRenderResult newRenderResult |
		oldRenderResult := treeNode renderResult.
		newRenderResult := self renderNode: treeNode node forceReRender: true.
		self
			replaceOldMorphsInWorld: oldRenderResult
			by: newRenderResult
			isRoot: treeNode isOneOfTheRootNodes].
	
	hooks keysAndValuesDo: [:nodeId :nodeHooks | (nodeId beginsWith: id) ifTrue: [nodeHooks do: #onComponentWasRendered]].
	hooks keysAndValuesDo: [:nodeId :nodeHooks |
		(nodeId beginsWith: id) ifTrue: [
			nodeHooks select: [:each | each canTriggerRerender] thenDo: [:each |
				(each isValueOutdatedBasedOnNodeTree: elementTree) ifTrue: [
					self reRenderNodeWithId: each nodeId.
					^ self]]]]