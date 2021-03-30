as yet unclassified
render: props children: children
	
	| extent |
	
	extent := self useState: [CMFReactBaseSystemWindow new defaultBounds extent].
	
	^ CMFReactBaseSystemWindow asReactNodeBuilder
		init: [:m | m
			label: (props at: #label ifAbsent: ['My Window']);
			extent: extent get;
			onChangeExtent: [:newExtent | extent set: newExtent]];
		childrenMorphs: [:m :childMorphs | m updateChildren: childMorphs];
		children: children;
		build