tests - reconciliation
testChangePropsOfParent

	| change |
	change := false.
	self openComponentBlock: [
		{
			(self bubble: #Hello)
				props: (change ifTrue: [{#a -> 13. #b -> 14}] ifFalse: [{#a -> 12}]);
				children: {self bubble: #Label}}].
	
	self assert: {#Hello} equals: (root children collect: #tag as: Array).
	self assert: 12 equals: (root children first props at: #a).
	
	change := true.
	react reRenderAll.
	root children first identityHash.
	self assert: 13 equals: (root children first props at: #a).
	self assert: 14 equals: (root children first props at: #b)