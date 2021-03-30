as yet unclassified
render: react

	| component |
	component := elementClass new.
	^ react renderNode: (
		CMFCurrentReact value: react during: [component render: props children: children])