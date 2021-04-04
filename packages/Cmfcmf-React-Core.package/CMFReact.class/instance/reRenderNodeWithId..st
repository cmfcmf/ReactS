rendering
reRenderNodeWithId: id

	Transcript 
		showln: '';
		showln: 'Re-render node ', id, ' due to useState -> set'.
	"self halt."
	elementTree resetToNodeWithId: id during: [:treeNode | | oldRenderResult newRenderResult |
		oldRenderResult := treeNode renderResult.
		newRenderResult := self renderNode: treeNode node forceReRender: true.
		self replaceOldMorphsInWorld: oldRenderResult by: newRenderResult].
	
	hooks keysAndValuesDo: [:nodeId :hooks | 
		(nodeId beginsWith: id) ifTrue: [hooks do: #onComponentWasRendered]].