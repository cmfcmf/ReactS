as yet unclassified
render: react

	| component |
	component := elementClass new.
	^ react renderNode: (component render: props children: children react: react)