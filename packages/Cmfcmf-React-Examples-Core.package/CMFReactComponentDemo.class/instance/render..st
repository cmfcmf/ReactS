as yet unclassified
render: props

	^ CMFReactComponentWindow asReactNodeBuilder props: {#label -> 'Demo Window'. #defaultExtent -> (225@400)}; children: {
		CMFReactComponentContainer asReactNodeBuilder children: {
			'Counter 123 Example'.
			CMFReactComponentClickCounter asReactNodeBuilder build.
			'Timer'.
			CMFReactComponentTimer asReactNodeBuilder build.
			'Simple Calculator'.
			CMFReactComponentCalculator asReactNodeBuilder build.
			{
				'Hallo Welt!' asText allBold.
				{
					{'das ist cool :)' asText allBold} 
				}.
			}.
		}; build
	}; build