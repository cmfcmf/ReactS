as yet unclassified
render: props

	| container scrollable |
	scrollable := props at: #scrollable ifAbsent: [false].
	
	container := BorderedMorph asReactNodeBuilder
		create: [:c |
			c new
				color: Color transparent;
				borderWidth: 2;
				cellInset: 2;
				layoutPolicy: TableLayout new;
				hResizing: #spaceFill;
				vResizing: #shrinkWrap;
				yourself];
		onRender: [:m |
			m
				"change border color with every render as a re-render indication"
				borderColor: Color random;
				listDirection: (props at: #direction ifAbsent: [#topToBottom]);
				name: (props at: #name ifAbsent: [nil]).
			scrollable ifFalse: [m layoutFrame: (props at: #layoutFrame ifAbsent: [LayoutFrame fractions: (0 @ 0 extent: 1 @ 1)])]];
		children: (props at: #children);
		build.
	
	scrollable ifFalse: [^ container].
	
	^ ScrollPane asReactNodeBuilder
		create: [:c | | m |
			m := c new.
			m color: Color transparent.
			m scroller
				layoutPolicy: TableLayout new;
				hResizing: #spaceFill;
				vResizing: #shrinkWrap.
			m];
		onRender: [:m |
			m layoutFrame: (props at: #layoutFrame ifAbsent: [LayoutFrame fractions: (0 @ 0 extent: 1 @ 1)])];
		children: {container};
		childrenMorphs: [:m :childMorphs | m scroller removeAllMorphs; addAllMorphs: childMorphs];
		build