as yet unclassified
ConditionalChild: props

	| test |
	test := CMFReact useContext: CMFReactTestContext.
	CMFReact useEffect: [[test markCalledCleanup]].
	
	^ nil