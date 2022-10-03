as yet unclassified
useContext: contextClass

	| hook |
	hook := currentFiber getHook: CMFReactHookUseContext IfAbsent: [:node |
		CMFReactHookUseContext new
			contextClass: contextClass node: node;
			yourself].
	^ hook getValueBasedOnFiber: currentFiber setLastValue: true