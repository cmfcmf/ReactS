running
component

	^ [ | defaultValue changingValue |
		defaultValue := CMFReact useContext: CMFReactTestContext.
		changingValue := CMFReact useState: 0.

		CMFReactComponentWindow asElementBuilder
			children: {
				CMFReactComponentContainer asElementBuilder
					children: {
						CMFReactComponentString asElementBuilder props: {#name -> 'defaultValue'. #contents -> defaultValue}; build.
						
						CMFReactTestContext asProviderNodeWithValue: 'otherValue' children: {
							[| value |
								value := CMFReact useContext: CMFReactTestContext.
								
								CMFReactComponentString asElementBuilder props: {#name -> 'otherValue'. #contents -> value}; build.
							] asCMFReactNodeComponentBuilder build
						}.
						
						CMFReactComponentButton asElementBuilder props: {#name -> 'btn'. #label -> 'change'. #onClick -> [changingValue set: [:old | old + 1]]}; build.
						CMFReactTestContext asProviderNodeWithValue: changingValue get children: {
							[| value |
								value := CMFReact useContext: CMFReactTestContext.
								
								CMFReactComponentString asElementBuilder props: {#name -> 'changingValue'. #contents -> value}; build.
							] asCMFReactNodeComponentBuilder build
						}.
					};
					build.
			};
			build]