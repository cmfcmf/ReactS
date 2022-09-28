running
component

	^ [
		| a b r |
		a := CMFReact useState: ''.
		b := CMFReact useState: ''.
		r := CMFReact useState: ''.
		 
		CMFReactComponentContainer asReactNodeBuilder children: {
			CMFReactComponentContainer asReactNodeBuilder props: {#direction -> #leftToRight}; children: {
				'a: '.
				CMFReactComponentTextInput asReactNodeBuilder props: {#name -> 'a'. #value -> a get. #onChange -> [:value | a set: value]}; build.	
			}; build.
			CMFReactComponentContainer asReactNodeBuilder props: {#direction -> #leftToRight}; children: {
				'b: '.
				CMFReactComponentTextInput asReactNodeBuilder props: {#name -> 'b'. #value -> b get. #onChange -> [:value | b set: value]}; build.	
			}; build.
			CMFReactComponentContainer asReactNodeBuilder props: {#direction -> #leftToRight}; children: {
				CMFReactComponentButton asReactNodeBuilder props: {#name -> 'btn'. #label -> 'a + b =' . #onClick -> [r set: (a get asNumber + b get asNumber) asString]}; build.
				CMFReactComponentStringWithName asReactNodeBuilder props: {#name -> 'result'. #contents -> r get}; build.
			}; build.
		}; build
	]