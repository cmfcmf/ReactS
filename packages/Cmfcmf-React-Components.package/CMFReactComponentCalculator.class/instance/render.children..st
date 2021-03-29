as yet unclassified
render: props children: children
	
	| a b r |
	a := self useState: ''.
	b := self useState: ''.
	r := self useState: ''.
	 
	^ CMFReactComponentContainer asElementBuilder children: {
		CMFReactComponentContainer asElementBuilder props: {#direction -> #leftToRight}; children: {
			'a: '.
			CMFReactComponentTextInput asElementBuilder props: {#value -> a get. #onChange -> [:value | a set: value]}; build.	
		}; build.
		CMFReactComponentContainer asElementBuilder props: {#direction -> #leftToRight}; children: {
			'b: '.
			CMFReactComponentTextInput asElementBuilder props: {#value -> b get. #onChange -> [:value | b set: value]}; build.	
		}; build.
		CMFReactComponentContainer asElementBuilder props: {#direction -> #leftToRight}; children: {
			CMFReactComponentButton asElementBuilder props: {#label -> 'a + b =' . #onClick -> [r set: (a get asNumber + b get asNumber) asString]}; build.
			r get
		}; build.
	}; build