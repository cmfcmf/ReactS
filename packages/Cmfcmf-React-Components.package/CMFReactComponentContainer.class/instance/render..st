as yet unclassified
render: props

	| container scrollable |
	scrollable := props at: #scrollable ifAbsent: [false].
	
	container := CMFReactNodeMorphBuilder new
		create: [
			BorderedMorph new
				color: Color transparent;
				borderWidth: 2;
				cellInset: 2;
				layoutPolicy: TableLayout new;
				layoutFrame: (LayoutFrame fractions: (0 @ 0 extent: 1 @ 1));
				hResizing: #spaceFill;
				vResizing: #shrinkWrap;
				yourself];
		init: [:m |
			m
				borderColor: Color random;
				listDirection: (props at: #direction ifAbsent: ["change border color with every render as a re-render indication"
				#topToBottom]);
				name: (props at: #name ifAbsent: [nil])];
		children: (props at: #children);
		build.
	
	scrollable ifFalse: [^ container].
	
	^ CMFReactNodeMorphBuilder new
		create: [ | m |
			m := ScrollPane new.
			m scroller
				layoutPolicy: TableLayout new;
				layoutFrame: (LayoutFrame fractions: (0 @ 0 extent: 1 @ 1));
				hResizing: #spaceFill;
				vResizing: #shrinkWrap.
			m];
		children: {container};
		childrenMorphs: [:m :childMorphs |
			m scroller
				removeAllMorphs;
				addAllMorphs: childMorphs];
		build