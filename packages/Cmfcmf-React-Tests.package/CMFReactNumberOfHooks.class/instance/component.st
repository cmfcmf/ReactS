running
component 

	^ [| state |
		state := CMFReact useState: 0.
		
		"Simulate an additional hook appearing"
		state get > 0 ifTrue: [CMFReact useState: 0].
	
		CMFReactComponentWindow asReactNodeBuilder children: {
			CMFReactComponentContainer asReactNodeBuilder children: {
				CMFReactComponentButton asReactNodeBuilder props: {#name -> 'next'. #label -> 'next'. #onClick -> [state set: [:old | old + 1]]}; build.
				state get.
			}; build.
		}; build	
	]