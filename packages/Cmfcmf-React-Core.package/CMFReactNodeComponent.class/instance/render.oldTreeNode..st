rendering
render: react oldTreeNode: oldTreeNode

	| method memoize |
	method := elementClass >> selector.
	memoize := method hasPragma: #memoize.
	
	"Transcript showln: method asString; showln: memoize; showln: oldTreeNode.
	selector ~~ #render: ifTrue: [self halt]."
	
	(memoize and: [oldTreeNode notNil]) ifTrue: [
		self halt.
		self flag: #todo. "Key!"
		(oldTreeNode node props cmfPropsEqualTo: props) ifTrue: [^ oldTreeNode renderResult]].
	
	^ react renderNode: (CMFCurrentReact value: react during: [
		elementClass new withArgs: {props} executeMethod: method])