tests - reconciliation
testChangeNodeType

	| change |
	change := false.
	self openComponentBlock: [{self bubble: (change ifTrue: [#B] ifFalse: [#A])}].
	
	self assert: {#A} equals: (root children collect: #tag as: Array).
	
	change := true.
	react reRenderAll.
	self assert: {#B} equals: (root children collect: #tag as: Array)