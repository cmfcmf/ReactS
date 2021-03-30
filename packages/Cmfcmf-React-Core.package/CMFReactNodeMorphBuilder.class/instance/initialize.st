as yet unclassified
initialize

	super initialize.
	
	createBlock := nil.
	initBlock := [:m |].
	childrenMorphsBlock := nil.
	key := nil.
	children := nil "not {}, because nil means that we do not touch the submorphs at all"