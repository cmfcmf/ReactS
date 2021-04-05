as yet unclassified
List: props

	| items |
	items := CMFReact useState: {#a. #b. #c}.
	
	^ CMFReactComponentContainer asReactNodeBuilder children: {
		items get collect: [:each | (#Item asReactNodeBuilder: self) props: {#key -> each. #item -> each}; build].
		CMFReactComponentButton asReactNodeBuilder props: {
			#name -> 'btn'. 
			#label -> 'remove first item'.
			#onClick -> [items set: [:old | old copyWithout: (old first)]]}; build
	}; build