as yet unclassified
Item: props

	<memoize>
	| item renderCount test |
	item := props at: #item.
	renderCount := CMFReact useRef: 0.
	renderCount set: renderCount get + 1.
	
	test := CMFReact useContext: CMFReactTestContext.
	test markAsRendered: item.
	
	self assert: (props includesKey: #key) not description: 'The key prop should not be passed to child components'.
		
	^ CMFReactComponentContainer asElementBuilder 
		children: {
			'item'. item.
			CMFReactComponentString asElementBuilder props: {#name -> 'renderCount'. #contents -> renderCount get}; build};
		build