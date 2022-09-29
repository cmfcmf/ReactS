accessing
type

	^ {
		#component.
		elementClass.
		selector.
		blockClosure ifNotNil: [blockClosure startpc hash bitXor: blockClosure homeMethod selector hash]}