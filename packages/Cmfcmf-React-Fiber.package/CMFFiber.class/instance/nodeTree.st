as yet unclassified
nodeTree

	^ self node -> (Array streamContents: [:s | self childrenDo: [:c | s nextPut: c nodeTree]])