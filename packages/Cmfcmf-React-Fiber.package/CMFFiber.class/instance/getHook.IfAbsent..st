hooks
getHook: aCMFReactHookClass IfAbsent: aBlock

	| hook |
	self alternate ifNil: [^ self hooks add: (aBlock value: self)].
	
	hook := self alternate hooks
		at: self hooks size + 1
		ifAbsent: [CMFReactHooksChanged new signal].
	hook class == aCMFReactHookClass ifFalse: [CMFReactHooksChanged new signal].
	
	^ self hooks add: hook