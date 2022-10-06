as yet unclassified
reRenderFiberNow: aFiber

	| resultFiber |
	attachNewFiber := aFiber parent
		ifNil: ["root fiber"
		[:fiber | currentRoot := fiber]]
		ifNotNil: [
			aFiber parent child = aFiber
				ifTrue: [ | parent sibling |
					"we are the first child"
					parent := aFiber parent.
					sibling := aFiber sibling.
					[:fiber |
						parent child: fiber.
						fiber sibling: sibling]]
				ifFalse: [ | previous next |
					"we are a later child"
					previous := aFiber parent child.
					next := aFiber sibling.
					[previous sibling = aFiber] whileFalse: [previous := previous sibling].
					[:fiber |
						previous sibling: fiber.
						fiber sibling: next]]].
	workInProgress := nextFiber := aFiber forReRender.
	resultFiber := self workLoop.
	
	resultFiber allFibersDo: [:fiber | fiber hooksDo: [:hook | (hook canTriggerRerender and: [hook valueOutdated]) ifTrue: [self queueRenderFrom: hook]]]