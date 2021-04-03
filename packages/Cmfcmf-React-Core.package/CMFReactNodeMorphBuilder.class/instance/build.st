as yet unclassified
build

	^ CMFReactNodeMorph new
		morphClass: morphClass;
		create: createBlock;
		onRender: onRenderBlock;
		childrenMorphsBlock: childrenMorphsBlock;
		key: key;
		children: children;
		yourself