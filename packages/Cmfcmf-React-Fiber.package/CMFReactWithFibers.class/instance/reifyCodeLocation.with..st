as yet unclassified
reifyCodeLocation: aNode with: aHostComponent

	GRReact enableCodeMapping ifFalse: [^ self].
	
	codeLocations at: aHostComponent put: (codeLocations at: aNode).
	codeLocations removeKey: aNode