as yet unclassified
render: props children: children
	
	^ CMFReactComponentWindow asElementBuilder props: {#label -> 'Demo Window'}; children: {
		CMFReactComponentContainer asElementBuilder children: {
			'Counter Example'.
			CMFReactComponentClickCounter asElementBuilder build.
			'Timer'.
			CMFReactComponentTimer asElementBuilder build.
			'Simple Calculator'.
			CMFReactComponentCalculator asElementBuilder build.
			{
				'Hallo :)' asText allBold.
				{
					{'toll das alles!!!' asText allBold} 
				}.
			}.
		}; build
	}; build