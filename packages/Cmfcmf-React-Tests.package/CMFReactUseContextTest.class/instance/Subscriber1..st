running
Subscriber1: props 

	| value |
	value := CMFReact useContext: CMFReactTestContext.
	
	^ CMFReactComponentString asElementBuilder props: {#name -> 'otherValue'. #contents -> value}; build