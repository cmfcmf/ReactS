*Cmfcmf-React-Fiber
computeChildrenAndUpdate: aFiber for: aState

	aFiber output ifNil: [aFiber output: (aState hostConfig create: self)].
	^ (Array streamContents: [:stream | properties do: [:value | value isGodotNode ifTrue: [stream nextPut: value]]]), (self children ifNil: [#()])