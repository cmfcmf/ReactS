running
render

	| component result |
	component := self component.
	component := (true caseOf: {
		[component isBlock] -> [component asReactNodeBuilder build].
		[component isSymbol] -> [(component asReactNodeBuilder: self) build]} otherwise: [component asReactNodeBuilder build]).
	
	self makeTestInstanceAccessibleViaContext ifTrue: [
		component := CMFReactTestContext asProviderNodeWithValue: self children: {component}].
	
	result := CMFReact render: component.
	^ result isArray 
		ifTrue: [self assert: result size == 1. result first]
		ifFalse: [result]