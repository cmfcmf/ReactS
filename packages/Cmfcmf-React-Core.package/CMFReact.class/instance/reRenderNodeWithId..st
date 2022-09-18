rendering
reRenderNodeWithId: id

	self updateFrameDo: [
		elementTree resetToNodeWithId: id during: [:treeNode | | oldRenderResult newRenderResult |
			oldRenderResult := treeNode renderResult.
			newRenderResult := self renderNode: treeNode node forceReRender: true.
			self replaceOldMorphsInWorld: oldRenderResult by: newRenderResult isRoot: treeNode isOneOfTheRootNodes].
	
		hooks keysAndValuesDo: [:nodeId :nodeHooks | (nodeId beginsWith: id) ifTrue: [nodeHooks do: #onComponentWasRendered]].
		hooks keysAndValuesDo: [:nodeId :nodeHooks | (nodeId beginsWith: id) ifTrue: [
			nodeHooks select: [:each | each isKindOf: CMFReactHookUseContext] thenDo: [:each |
				(each isValueOutdatedBasedOnNodeTree: elementTree) ifTrue: [
					self reRenderNodeWithId: each nodeId.
					^ self]]]]]