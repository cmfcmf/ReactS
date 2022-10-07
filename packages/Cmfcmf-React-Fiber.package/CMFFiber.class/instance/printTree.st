as yet unclassified
printTree

	^ String streamContents: [:s | self printTreeOn: s indent: 0]