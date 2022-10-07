as yet unclassified
getHostSibling

	| found parent |
	parent := self parent nextHostParent.
	found := false.
	parent allFibersDo: [:fiber |
		(found and: [fiber ~= parent and: [fiber isValidInsertSibling and: [fiber parent nextHostParent = parent]]]) ifTrue: [^ fiber].
		fiber = self ifTrue: [found := true]].
	^ nil