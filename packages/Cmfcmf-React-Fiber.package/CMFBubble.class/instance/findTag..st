as yet unclassified
findTag: aSymbol

	self allBubblesDo: [:bubble | bubble tag = aSymbol ifTrue: [^ bubble]]