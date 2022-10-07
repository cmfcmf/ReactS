rendering
executeUserCode: react renderInfo: renderInfo

	| propsWithoutKey |
	"Transcript showln: method asString; showln: memoize; showln: oldTreeNode.
	selector ~~ #render: ifTrue: [self halt]."
	
	(self memoize and: [renderInfo reusingOldNodes] and: [renderInfo forceReRender not]) ifTrue: [
		self flag: #todo.
		"Key!"
		"self halt."
		(renderInfo oldNode props cmfPropsEqualTo: props) ifTrue: [^ #memoize]].
	
	propsWithoutKey := (props includesKey: #key)
		ifTrue: [
			props copy
				removeKey: #key;
				yourself]
		ifFalse: [props].
	
	^ CMFCurrentReact
		value: react
		during: [elementClass basicNew withArgs: {propsWithoutKey} executeMethod: self method]