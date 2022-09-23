hooks
useContext: contextClass

	| hook |
	hook := self getHook: CMFReactHookUseContext IfAbsent: [:node |
		CMFReactHookUseContext new
			contextClass: contextClass node: node;
			yourself].
	^ hook getValueBasedOnNodeTree: elementTree setLastValue: true