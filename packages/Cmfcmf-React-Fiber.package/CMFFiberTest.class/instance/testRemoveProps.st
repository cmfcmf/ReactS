tests - reconciliation
testRemoveProps

	| change |
	change := false.
	self openComponentBlock: [(self bubble: #A) props: (change ifTrue: [{}] ifFalse: [{#a -> 2}])].
	
	self assert: 2 equals: ((root findTag: #A) props at: #a).
	
	change := true.
	react reRenderAll.
	self assert: nil equals: ((root findTag: #A) props at: #a)