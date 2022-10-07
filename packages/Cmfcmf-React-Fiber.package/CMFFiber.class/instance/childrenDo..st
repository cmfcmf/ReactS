as yet unclassified
childrenDo: aBlock

	| current |
	current := self child.
	[current] whileNotNil: [
		aBlock value: current.
		current := current sibling]