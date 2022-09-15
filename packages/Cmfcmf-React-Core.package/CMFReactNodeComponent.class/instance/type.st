accessing
type

	self flag: #todo. "I think using blockClosure hash here is not quite correct, since we technically do not care about the contents of the BlockClosure."
	^ {#component. elementClass. selector. blockClosure ifNotNil: #hash}