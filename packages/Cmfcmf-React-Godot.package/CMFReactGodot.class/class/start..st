as yet unclassified
start: aComponentClass

	| react |
	react := self new.
	react startListener.
	react initAndRender: aComponentClass asReactNodeBuilder build.
	^ react