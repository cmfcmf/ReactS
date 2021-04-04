running
Subscriber2: props 

	| value |
	value := CMFReact useContext: CMFReactTestContext.
	
	^ CMFReactComponentString asElementBuilder props: {#name -> 'changingValue'. #contents -> value}; build