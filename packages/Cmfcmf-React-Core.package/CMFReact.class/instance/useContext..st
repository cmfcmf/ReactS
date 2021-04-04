hooks
useContext: contextClass

	| hook |
	hook := self getHook: CMFReactHookUseContext IfAbsent: [:nodeId |
		CMFReactHookUseContext new
			contextClass: contextClass nodeId: nodeId;
			yourself].
	^ hook getValueBasedOnNodeTree: elementTree setLastValue: true