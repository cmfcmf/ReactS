rendering
renderNodes: aCollection
	
	^ (aCollection collect: [:each | (self renderNode: each) asOrderedCollection]) concatenation 