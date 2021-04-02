as yet unclassified
component

	^ [
		CMFReactComponentWindow asElementBuilder
			children: {
				[ | counter |
					counter := CMFReact useState: 0.
					
					CMFReact
						useEffect: [ | process |
							process := [
								[
									(Delay forMilliseconds: 100) wait.
									counter set: [:old | old + 1]] repeat] forkNamed: 'cmfcmf'.
							[process terminate]]
						dependencies: {}.
					
					"The container is not necessary, but helpful to see that it is re-rendering"
					CMFReactComponentContainer asElementBuilder
						children: {
							CMFReactComponentString asElementBuilder
								props: {#contents -> counter get asString. #name -> 'counter'};
								build};
						build] asCMFReactNodeComponentBuilder build};
			build]