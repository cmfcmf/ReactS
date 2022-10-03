as yet unclassified
findTag: aSymbol

	self allBubblesDo: [:bubble | bubble tag = aSymbol ifTrue: [^ bubble]].
	^ self error: 'no bubble with tag ', aSymbol