as yet unclassified
render: props children: children react: react

	react_ := react.
	"Transcript showln: 'Rendering ', self printString."
	^ [self render: props children: children] ensure: [react_ := nil]