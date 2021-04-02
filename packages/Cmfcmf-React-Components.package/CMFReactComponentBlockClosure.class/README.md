A CMFReactComponentBlockClosure is used to use blocks as components. You should construct myself by sending #asCMFReactNodeComponentBuilder to a BlockClosure.

Example:

CMFReact render: ([:props | | state |
	state := CMFReact useState: 0.

	CMFReactComponentWindow asElementBuilder children: {
		CMFReactComponentContainer asElementBuilder children: {
			CMFReactComponentButton asElementBuilder
				props: {#label -> 'increment'. #onClick -> [state set: [:old | old + 1]]}; 
				build.
			state get.
			props at: #foo.
		}; build.
	}; build	
] asCMFReactNodeComponentBuilder props: {#foo -> 'bar'}; build)