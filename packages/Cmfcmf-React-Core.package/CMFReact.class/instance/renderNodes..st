rendering
renderNodes: aCollection
	
	^ (aCollection collect: [:each | (self renderNode: each forceReRender: false) asOrderedCollection]) concatenation 