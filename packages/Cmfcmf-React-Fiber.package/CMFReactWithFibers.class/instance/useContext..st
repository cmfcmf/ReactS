as yet unclassified
useContext: contextClass

	| hook |
	hook := currentFiber getHook: CMFReactHookUseContext ifAbsent: [:node |
		CMFReactHookUseContext new
			contextClass: contextClass node: node;
			yourself].
	^ hook getValueAndRemember: true