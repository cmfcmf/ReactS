running
component

	^ [ | a b complexValue |
		a := CMFReact useState: 0.
		b := CMFReact useState: 0.
		
		complexValue := CMFReact useMemo: [
			complexValueCalculations := complexValueCalculations + 1.
			a get] dependencies: {a get}.
		
		CMFReactComponentWindow asReactNodeBuilder
			children: {
					"The container is not necessary, but helpful to see that it is re-rendering"
					CMFReactComponentContainer asReactNodeBuilder
						children: {
							CMFReactComponentStringWithName asReactNodeBuilder props: {#name -> 'complexValue'. #contents -> complexValue}; build.
							a get.
							CMFReactComponentButton asReactNodeBuilder
								props: {#name -> 'a'. #label -> 'a'. #onClick -> [a set: [:old | old + 1]]};
								build.
							b get.
							CMFReactComponentButton asReactNodeBuilder
								props: {#name -> 'b'. #label -> 'b'. #onClick -> [b set: [:old | old + 1]]};
								build.
						};
						build.
			};
			build]