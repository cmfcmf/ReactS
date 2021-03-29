as yet unclassified
render: props children: children

	^ CMFReactNodeMorph factory: [BorderedMorph new
		color: Color transparent;
		borderColor: Color random;
		borderWidth: 2;
		cellInset: 2;
		listDirection: (props at: #direction ifAbsent: [#topToBottom]);
		layoutPolicy: TableLayout new;
		layoutFrame: (LayoutFrame fractions: (0@0 extent: 1@1));
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap;
		yourself] children: children