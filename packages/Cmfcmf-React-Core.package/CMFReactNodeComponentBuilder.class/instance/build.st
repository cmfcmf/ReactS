building
build

	| propsWithChildren |
	propsWithChildren := props copy.
	propsWithChildren addAll: overwrittenProps.
	children ifNotNil: [propsWithChildren at: #children put: children asArray].
	
	^ CMFReactNodeClassComponentElement new 
		elementClass: elementClass;
		key: key;
		props: propsWithChildren;
		yourself