building
build

	| propsWithChildren |
	propsWithChildren := props copy.
	propsWithChildren addAll: overwrittenProps.
	children ifNotNil: [propsWithChildren at: #children put: children asArray].
	
	^ CMFReactNodeClassComponentElement new 
		elementClass: elementClass;
		selector: selector;
		key: key;
		props: propsWithChildren;
		yourself