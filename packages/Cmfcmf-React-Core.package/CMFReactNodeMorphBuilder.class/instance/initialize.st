initialize-release
initialize

	super initialize.
	
	morphClass := Morph.
	createBlock := nil.
	onRenderBlock := [:m |].
	childrenMorphsBlock := nil.
	children := nil "not {}, because nil means that we do not touch the submorphs at all"