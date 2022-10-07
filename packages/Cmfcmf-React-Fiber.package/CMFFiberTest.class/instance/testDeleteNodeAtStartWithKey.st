tests - reconciliation
testDeleteNodeAtStartWithKey

	| delete second |
	delete := false.
	self openComponentBlock: [{delete ifTrue: [nil] ifFalse: [self bubble: #World]. (self bubble: #Hello) key: #hello}].
	second := root children second.
	self assert: {#World. #Hello} equals: (root children collect: #tag as: Array).
	
	delete := true.
	react reRenderAll.
	self assert: {#Hello} equals: (root children collect: #tag as: Array).
	self assert: second identical: root children first