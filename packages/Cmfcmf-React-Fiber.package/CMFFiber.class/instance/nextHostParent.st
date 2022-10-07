as yet unclassified
nextHostParent

	self node isHostComponent ifTrue: [^ self].
	self node class = CMFReactNodePortal ifTrue: [^ self].
	^ self parent nextHostParent