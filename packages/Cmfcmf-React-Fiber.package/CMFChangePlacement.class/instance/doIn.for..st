as yet unclassified
doIn: aFiber for: aState

	| sibling parent |
	" FIXME not nice to have this here "
	aFiber node class = CMFReactNodePortal ifTrue: [^ self].
	
	parent := aFiber parent nextHostParent output.
	sibling := aFiber getHostSibling ifNotNil: #output.
	self insertOrAppend: aFiber before: sibling parent: parent for: aState