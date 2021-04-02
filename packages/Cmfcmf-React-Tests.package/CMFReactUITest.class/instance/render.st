running
render

	| component |
	component := self component.
	^ CMFReact render: (component isBlock 
		ifTrue: [component asCMFReactNodeComponentBuilder build] 
		ifFalse: [component asElementBuilder build])