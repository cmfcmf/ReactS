as yet unclassified
render: props
	
	| extent |	
	extent := self useState: [props at: #defaultExtent ifAbsent: [CMFReactBaseSystemWindow new defaultBounds extent]].
	
	^ CMFReactBaseSystemWindow asReactNodeBuilder
		init: [:m | m
			label: (props at: #label ifAbsent: ['My Window']);
			extent: extent get;
			onChangeExtent: [:newExtent | extent set: newExtent];
			name: (props at: #name ifAbsent: [nil])];
		childrenMorphs: [:m :childMorphs | m updateChildren: childMorphs];
		children: (props at: #children);
		build