as yet unclassified
render: props
	
	"<memoize>"
	
	| a b r |
	a := self useState: ''.
	b := self useState: ''.
	r := self useState: ''.
	 
	^ CMFReactComponentContainer asElementBuilder children: {
		CMFReactComponentContainer asElementBuilder props: {#direction -> #leftToRight}; children: {
			'a: '.
			CMFReactComponentTextInput asElementBuilder props: {#name -> 'a'. #value -> a get. #onChange -> [:value | a set: value]}; build.	
		}; build.
		CMFReactComponentContainer asElementBuilder props: {#direction -> #leftToRight}; children: {
			'b: '.
			CMFReactComponentTextInput asElementBuilder props: {#name -> 'b'. #value -> b get. #onChange -> [:value | b set: value]}; build.	
		}; build.
		CMFReactComponentContainer asElementBuilder props: {#direction -> #leftToRight}; children: {
			CMFReactComponentButton asElementBuilder props: {#name -> 'btn'. #label -> 'a + b =' . #onClick -> [r set: (a get asNumber + b get asNumber) asString]}; build.
			CMFReactComponentString asElementBuilder props: {#name -> 'result'. #contents -> r get}; build.
		}; build.
	}; build