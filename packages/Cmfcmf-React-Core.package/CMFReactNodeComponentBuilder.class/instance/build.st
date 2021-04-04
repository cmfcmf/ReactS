building
build

	| propsWithChildren |
	propsWithChildren := props copy.
	propsWithChildren addAll: overwrittenProps.
	children ifNotNil: [propsWithChildren at: #children put: children asArray].
	
	^ CMFReactNodeComponent new 
		elementClass: elementClass;
		selector: selector;
		props: propsWithChildren;
		yourself