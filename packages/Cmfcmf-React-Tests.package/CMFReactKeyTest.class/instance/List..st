as yet unclassified
List: props

	| items |
	items := CMFReact useState: {#a. #b. #c}.
	
	^ CMFReactComponentContainer asElementBuilder children: {
		items get collect: [:each | (#Item asElementBuilder: self) props: {#key -> each. #item -> each}; build].
		CMFReactComponentButton asElementBuilder props: {
			#name -> 'btn'. 
			#label -> 'remove first item'.
			#onClick -> [items set: [:old | old copyWithout: (old first)]]}; build
	}; build