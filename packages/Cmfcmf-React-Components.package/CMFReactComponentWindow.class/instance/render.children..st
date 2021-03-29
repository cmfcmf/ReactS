as yet unclassified
render: props children: children
	
	^ CMFReactNodeMorph factory: [ 
		"self assert: children size = 1." self flag: #todo. "Why is this assert triggered?"
		(SystemWindow labelled: (props at: #label ifAbsent: ['My Window']))
			"addMorph: children first fullFrame: (LayoutFrame fractions: (0@0 corner: 1@1));"
			yourself] children: children.
	"
		<systemwindow label={props.label}>
			{children}
		</systemwindow>
	"