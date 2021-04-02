as yet unclassified
component

	^ [ | a b |
		a := CMFReact useState: 0.
		b := CMFReact useState: 0.
		
		callback := CMFReact useCallback: [self fail] dependencies: {a get}.
		
		CMFReactComponentWindow asElementBuilder
			children: {
					"The container is not necessary, but helpful to see that it is re-rendering"
					CMFReactComponentContainer asElementBuilder
						children: {
							a get.
							CMFReactComponentButton asElementBuilder
								props: {#name -> 'a'. #label -> 'a'. #onClick -> [a set: [:old | old + 1]]};
								build.
							b get.
							CMFReactComponentButton asElementBuilder
								props: {#name -> 'b'. #label -> 'b'. #onClick -> [b set: [:old | old + 1]]};
								build.
						};
						build.
			};
			build]