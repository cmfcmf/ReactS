running
component

	^ [ | a b c |
		a := CMFReact useState: 0.
		b := CMFReact useState: 0.
		c := CMFReact useState: 0.
		
		CMFReact
			useEffect: [
				self effectRun: #a.
				[self effectCleanup: #a]]
			dependencies: {a get}.
		CMFReact
			useEffect: [
				self effectRun: #b.
				[self effectCleanup: #b]]
			dependencies: {b get}.
		CMFReact
			useEffect: [
				self effectRun: #ab.
				[self effectCleanup: #ab]]
			dependencies: {a get. b get}.
		CMFReact
			useEffect: [
				self effectRun: #emptyArray.
				[self effectCleanup: #emptyArray]]
			dependencies: {}.
		CMFReact
			useEffect: [
				self effectRun: #noDependencies.
				[self effectCleanup: #noDependencies]]
			dependencies: nil.
		
		CMFReactComponentWindow asReactNodeBuilder
			children: {
					"The container is not necessary, but helpful to see that it is re-rendering"
					CMFReactComponentContainer asReactNodeBuilder
						children: {
							a get.
							CMFReactComponentButton asReactNodeBuilder
								props: {#name -> 'a'. #label -> 'a'. #onClick -> [a set: [:old | old + 1]]};
								build.
							b get.
							CMFReactComponentButton asReactNodeBuilder
								props: {#name -> 'b'. #label -> 'b'. #onClick -> [b set: [:old | old + 1]]};
								build.
							c get.
							CMFReactComponentButton asReactNodeBuilder
								props: {#name -> 'c'. #label -> 'c'. #onClick -> [c set: [:old | old + 1]]};
								build.
						};
						build.
			};
			build]