as yet unclassified
createNodeTreeAndReturnNextFor: aState

	| nextFiber |
	self node updateFiber: self for: aState.
	
	self child ifNotNil: [^ self child].
	
	nextFiber := self.
	[nextFiber] whileNotNil: [
		nextFiber sibling ifNotNil: [^ nextFiber sibling].
		nextFiber := nextFiber parent].
	
	"TODO move this to the respective component classes"
	(self alternate notNil and: [self node isHostComponent]) ifTrue: [(aState hostConfig prepareUpdateFrom: self alternate node to: self node for: self output) ifNotNil: [:hostUpdate | self addChange: (CMFChangeUpdate new hostUpdate: hostUpdate)]].
	
	^ nil