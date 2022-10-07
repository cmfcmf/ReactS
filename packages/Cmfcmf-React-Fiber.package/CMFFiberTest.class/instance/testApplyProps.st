tests - reconciliation
testApplyProps

	self openComponentBlock: [{(self bubble: #Hello) props: {#a -> 12}}].
	
	self assert: #Hello equals: root children first tag.
	self assert: 12 equals: (root children first props at: #a)