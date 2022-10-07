as yet unclassified
allBubblesDo: aBlock

	self children do: [:child | child allBubblesDo: aBlock].
	aBlock value: self