as yet unclassified
doIn: aFiber for: aState

	| sibling parent |
	parent := aFiber parent nextHostParent output.
	sibling := aFiber getHostSibling ifNotNil: #output.
	self insertOrAppend: aFiber before: sibling parent: parent for: aState