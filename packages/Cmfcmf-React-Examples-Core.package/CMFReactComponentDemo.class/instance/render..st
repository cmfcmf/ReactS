as yet unclassified
render: props

	^ CMFReactComponentWindow asElementBuilder props: {#label -> 'Demo Window'. #defaultExtent -> (225@400)}; children: {
		CMFReactComponentContainer asElementBuilder children: {
			'Counter 123 Example'.
			CMFReactComponentClickCounter asElementBuilder build.
			'Timer'.
			CMFReactComponentTimer asElementBuilder build.
			'Simple Calculator'.
			CMFReactComponentCalculator asElementBuilder build.
			{
				'Hallo Welt!' asText allBold.
				{
					{'das ist cool :)' asText allBold} 
				}.
			}.
		}; build
	}; build