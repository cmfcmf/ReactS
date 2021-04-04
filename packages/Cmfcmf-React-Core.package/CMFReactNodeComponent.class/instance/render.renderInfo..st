rendering
render: react renderInfo: renderInfo

	| method memoize |
	method := (elementClass whichClassIncludesSelector: selector) >> selector.
	memoize := method hasPragma: #memoize.
	
	"Transcript showln: method asString; showln: memoize; showln: oldTreeNode.
	selector ~~ #render: ifTrue: [self halt]."
	
	(memoize and: [renderInfo reusingOldNodes] and: [renderInfo forceReRender not]) ifTrue: [
		self flag: #todo. "Key!"
		(renderInfo oldNode props cmfPropsEqualTo: props) ifTrue: [^ renderInfo oldRenderResult]].
	
	^ react renderNode: (CMFCurrentReact value: react during: [
		elementClass new withArgs: {props} executeMethod: method]) forceReRender: false