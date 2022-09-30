running
Subscriber2: props 

	| value |
	value := CMFReact useContext: CMFReactTestContext.
	
	^ CMFReactComponentStringWithName asReactNodeBuilder props: {#name -> 'changingValue'. #contents -> value}; build