rendering
render: react lastRenderResult: lastRenderResult

	^ react renderNode: (CMFCurrentReact value: react during: [ | component |
		component := elementClass new.
		component render: props])