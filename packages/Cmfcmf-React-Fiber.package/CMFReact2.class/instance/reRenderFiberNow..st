as yet unclassified
reRenderFiberNow: aFiber

	workInProgressParent := aFiber parent.
	workInProgress := nextFiber := aFiber forReRender.
	self workLoop