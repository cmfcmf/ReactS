tests - useState
testUseStatePersists

	self openComponentBlock: [ | count |
		count := CMFReact useState: 0.
		nil].
	react reRenderAll.
	react reRenderAll.
	react reRenderAll