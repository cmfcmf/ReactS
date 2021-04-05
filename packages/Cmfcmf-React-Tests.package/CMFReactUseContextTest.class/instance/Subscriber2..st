running
Subscriber2: props 

	| value |
	value := CMFReact useContext: CMFReactTestContext.
	
	^ CMFReactComponentString asReactNodeBuilder props: {#name -> 'changingValue'. #contents -> value}; build