as yet unclassified
render: react

	| morph |
	morph := factoryBlock value.
	morph addAllMorphs: (react renderNodes: children).
	^ morph