building
build

	| propsWithChildren |
	propsWithChildren := props.
	children ifNotNil: [propsWithChildren at: #children put: children asArray].
	
	^ CMFReactNodeClassComponentElement new 
		elementClass: elementClass;
		key: key;
		props: propsWithChildren;
		yourself