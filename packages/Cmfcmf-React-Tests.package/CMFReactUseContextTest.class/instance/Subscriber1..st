running
Subscriber1: props 

	| value |
	value := CMFReact useContext: CMFReactTestContext.
	
	^ CMFReactComponentStringWithName  asReactNodeBuilder props: {#name -> 'otherValue'. #contents -> value}; build