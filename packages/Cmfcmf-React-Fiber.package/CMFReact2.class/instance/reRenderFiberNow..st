as yet unclassified
reRenderFiberNow: aFiber

	attachNewFiber := aFiber parent
		ifNil: [
			"root fiber"
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
	self workLoop