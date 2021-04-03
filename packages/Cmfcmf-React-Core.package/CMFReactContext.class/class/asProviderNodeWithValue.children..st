as yet unclassified
asProviderNodeWithValue: value children: children

	^ CMFReactNodeContextProvider new
		elementClass: self;
		props: (Dictionary newFrom: {#value -> value. #children -> children});
		yourself