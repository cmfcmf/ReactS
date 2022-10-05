as yet unclassified
doIn: aFiber for: aState

	| sibling parent |
	" FIXME not nice to have this here "
	aFiber node class = CMFReactNodePortal ifTrue: [^ self].
	
	parent := aFiber parent nextHostParent output.
	sibling := aFiber getHostSibling.
	self assert: (aFiber node isHostComponent not or: [sibling isNil or: [sibling parent nextHostParent output = parent]]).
	self insertOrAppend: aFiber before: (sibling ifNotNil: #output) parent: parent for: aState