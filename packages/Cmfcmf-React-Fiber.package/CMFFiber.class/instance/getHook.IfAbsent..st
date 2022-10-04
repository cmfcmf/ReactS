hooks
getHook: aCMFReactHookClass IfAbsent: aBlock

	| hook |
	(self alternate isNil or: [self alternate hasPreviousHooks not]) ifTrue: [^ self hooks add: ((aBlock value: nil) fiber: self)].
	
	hook := self alternate hooks
		at: self hooks size + 1
		ifAbsent: [(CMFReactHooksChanged new renderInfo: self) signal].
	hook class == aCMFReactHookClass ifFalse: [(CMFReactHooksChanged new renderInfo: self) signal].
	
	^ self hooks add: (hook fiber: self)