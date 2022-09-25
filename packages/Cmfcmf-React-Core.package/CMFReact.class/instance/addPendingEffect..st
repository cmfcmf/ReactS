rendering
addPendingEffect: aHook

	(pendingEffects ifNil: [pendingEffects := OrderedCollection new]) add: aHook