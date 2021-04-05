running
WindowChild: props

	 | defaultValue changingValue |
	defaultValue := CMFReact useContext: CMFReactTestContext.
	changingValue := CMFReact useState: 0.
		
	^ CMFReactComponentContainer asReactNodeBuilder
		children: {
			CMFReactComponentString asReactNodeBuilder props: {#name -> 'defaultValue'. #contents -> defaultValue}; build.
	
			CMFReactTestContext asProviderNodeWithValue: 'otherValue' children: {
				(#Subscriber1 asReactNodeBuilder: self) build.
				(#Subscriber1Memo asReactNodeBuilder: self) build
			}.
			
			CMFReactComponentButton asReactNodeBuilder props: {#name -> 'btn'. #label -> 'change'. #onClick -> [changingValue set: [:old | old + 1]]}; build.
			CMFReactTestContext asProviderNodeWithValue: changingValue get children: {
				(#Subscriber2 asReactNodeBuilder: self) build.
				(#Subscriber2Memo asReactNodeBuilder: self) build
			}.
		};
		build