as yet unclassified
reRenderFiberNow: aFiber

	parentFiber := aFiber parent.
	workInProgressChild := nextFiber := aFiber forReRender.
	self workLoop