accessing
type

	^ blockClosure ifNil: [{#component. elementClass. selector}] ifNotNil: [
		{
			#component.
			blockClosure homeMethod methodClass.
			blockClosure homeMethod selector.
			blockClosure method identityHash}]