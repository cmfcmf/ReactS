tests - reconciliation
testCanReRender

	self openComponentBlock: [{self bubble: #Hello}].
	
	self assert: #Hello equals: root children first tag.
	react reRenderAll.
	self assert: #Hello equals: root children first tag