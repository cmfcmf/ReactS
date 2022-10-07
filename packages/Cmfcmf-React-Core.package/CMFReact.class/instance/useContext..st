hooks
useContext: contextClass

	| hook |
	hook := self getHook: CMFReactHookUseContext ifAbsent: [:node |
		CMFReactHookUseContext new
			contextClass: contextClass node: node;
			yourself].
	^ hook getValueBasedOnNodeTree: elementTree setLastValue: true