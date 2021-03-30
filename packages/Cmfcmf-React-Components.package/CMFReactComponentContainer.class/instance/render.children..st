as yet unclassified
render: props children: children

	^ CMFReactNodeMorphBuilder new
		create: [BorderedMorph new
			color: Color transparent;
			borderWidth: 2;
			cellInset: 2;
			layoutPolicy: TableLayout new;
			layoutFrame: (LayoutFrame fractions: (0@0 extent: 1@1));
			hResizing: #shrinkWrap;
			vResizing: #shrinkWrap;
			yourself];
		init: [:m | m 
			borderColor: Color random; "change border color with every render as a re-render indication"
			listDirection: (props at: #direction ifAbsent: [#topToBottom])]; 
		children: children;
		build