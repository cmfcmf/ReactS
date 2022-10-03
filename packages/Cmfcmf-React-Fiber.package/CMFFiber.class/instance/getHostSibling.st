as yet unclassified
getHostSibling

	| found parent |
	parent := self parent nextHostParent.
	found := false.
	parent allFibersDo: [:fiber |
		(found and: [fiber ~= parent and: [fiber node isHostComponent and: [fiber changes isNil or: [fiber changes noneSatisfy: [:change | change class == CMFChangePlacement]]]]]) ifTrue: [^ fiber].
		fiber = self ifTrue: [found := true]].
	^ nil