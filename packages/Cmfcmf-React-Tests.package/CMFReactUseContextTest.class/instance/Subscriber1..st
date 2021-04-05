running
Subscriber1: props 

	| value |
	value := CMFReact useContext: CMFReactTestContext.
	
	^ CMFReactComponentString asReactNodeBuilder props: {#name -> 'otherValue'. #contents -> value}; build