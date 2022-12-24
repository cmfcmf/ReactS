as yet unclassified
codeLocationForNode: aNode

	| path |
	path := aNode getPath.
	^ self codeLocations associations
		detect: [:location | '/root/GRRoot', (hostConfig fullPathFor: location key) = path]
		ifFound: [:location | location value]
		ifNone: [nil]