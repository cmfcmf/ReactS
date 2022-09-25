enumerating
allEntriesDo: aBlock

	aBlock value: self.
	childrenTreeNodes do: [:entry | entry allEntriesDo: aBlock]