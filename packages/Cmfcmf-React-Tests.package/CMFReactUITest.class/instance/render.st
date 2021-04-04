running
render

	| component |
	component := self component.
	^ CMFReact render: (true caseOf: {
		[component isBlock] -> [component asCMFReactNodeComponentBuilder build].
		[component isSymbol] -> [(component asElementBuilder: self) build]} otherwise: [component asElementBuilder build])