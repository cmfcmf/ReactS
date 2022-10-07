tests - reconciliation
testDeleteNodeAtEndWithKey

	| delete |
	delete := false.
	self openComponentBlock: [{(self bubble: #Hello) key: #hello. delete ifTrue: [nil] ifFalse: [self bubble: #World]}].
	
	self assert: {#Hello. #World} equals: (root children collect: #tag as: Array).
	
	delete := true.
	react reRenderAll.
	self assert: {#Hello} equals: (root children collect: #tag as: Array)