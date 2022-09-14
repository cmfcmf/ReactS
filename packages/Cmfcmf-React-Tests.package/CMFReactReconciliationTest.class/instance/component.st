running
component 

	^ [| state |
		state := CMFReact useState: 0.
	
		CMFReactComponentWindow asReactNodeBuilder children: {
			CMFReactComponentContainer asReactNodeBuilder children: {
				CMFReactComponentButton asReactNodeBuilder props: {#name -> 'next'. #label -> 'next'. #onClick -> [state set: [:old | old + 1]]}; build.
				state get.
				state get even ifTrue: [{
					(#UsesUseState asReactNodeBuilder: self) build.
					(#UsesUseEffect asReactNodeBuilder: self) build.
				}] ifFalse: [{
					(#UsesUseEffect asReactNodeBuilder: self) build.
					(#UsesUseState asReactNodeBuilder: self) build.
				}].
			}; build.
		}; build	
	]