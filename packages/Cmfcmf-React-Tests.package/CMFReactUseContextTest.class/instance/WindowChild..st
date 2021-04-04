running
WindowChild: props

	 | defaultValue changingValue |
	defaultValue := CMFReact useContext: CMFReactTestContext.
	changingValue := CMFReact useState: 0.
		
	^ CMFReactComponentContainer asElementBuilder
		children: {
			CMFReactComponentString asElementBuilder props: {#name -> 'defaultValue'. #contents -> defaultValue}; build.
	
			CMFReactTestContext asProviderNodeWithValue: 'otherValue' children: {
				(#Subscriber1 asElementBuilder: self) build.
				(#Subscriber1Memo asElementBuilder: self) build
			}.
			
			CMFReactComponentButton asElementBuilder props: {#name -> 'btn'. #label -> 'change'. #onClick -> [changingValue set: [:old | old + 1]]}; build.
			CMFReactTestContext asProviderNodeWithValue: changingValue get children: {
				(#Subscriber2 asElementBuilder: self) build.
				(#Subscriber2Memo asElementBuilder: self) build
			}.
		};
		build