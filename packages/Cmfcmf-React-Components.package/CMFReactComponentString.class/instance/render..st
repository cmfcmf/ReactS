as yet unclassified
render: props

	^ StringMorph asReactNodeBuilder
		init: [:m |
			m
				contents: (props at: #contents) asString;
				name: (props at: #name ifAbsent: [nil])];
		build