rendering
reRenderNodeNow: anEntry

	elementTree resetToNode: anEntry during: [:treeNode | | oldRenderResult newRenderResult |
		oldRenderResult := treeNode renderResult.
		newRenderResult := self renderNode: treeNode node forceReRender: true.
		self
			replaceOldMorphsInWorld: oldRenderResult
			by: newRenderResult
			isRoot: treeNode isOneOfTheRootNodes].
	
	anEntry allEntriesDo: [:entry | entry hooksDo: [:hook | (hook canTriggerRerender and: [hook isValueOutdatedBasedOnNodeTree: elementTree]) ifTrue: [self queueRenderNode: entry]]]