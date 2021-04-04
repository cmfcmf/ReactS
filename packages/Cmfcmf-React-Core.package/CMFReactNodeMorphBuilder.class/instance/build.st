as yet unclassified
build

	^ CMFReactNodeMorph new
		morphClass: morphClass;
		create: createBlock;
		onRender: onRenderBlock;
		childrenMorphsBlock: childrenMorphsBlock;
		children: children;
		yourself