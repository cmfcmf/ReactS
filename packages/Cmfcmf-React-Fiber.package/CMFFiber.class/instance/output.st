accessing
output

	self flag: #fixme.
	"feels a bit hacky to have this check here but when we first visit the portal node the ref is not yet set"
	^ node class == CMFReactNodePortal
		ifTrue: [node container get]
		ifFalse: [output]