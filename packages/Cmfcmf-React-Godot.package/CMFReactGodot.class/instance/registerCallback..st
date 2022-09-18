as yet unclassified
registerCallback: aClosure

	| id |
	id := self class nextGodotId.
	callbacks at: id put: aClosure.
	^ id