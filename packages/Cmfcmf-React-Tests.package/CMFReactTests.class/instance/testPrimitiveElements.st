testing
testPrimitiveElements

	| result |
	
	result := CMFReact render: 'test'.
	self assert: result isMorph.
	self assert: 'test' equals: result contents.
	
	result := CMFReact render: 'test' asText.
	self assert: result isMorph.
	self assert: 'test' asText equals: result contents.
	
	result := CMFReact render: 42.
	self assert: result isMorph.
	self assert: '42' equals: result contents.
	
	result := CMFReact render: nil.
	self assert: {} equals: result.
	
	result := CMFReact render: {1 . {2 . {3 . 4 . {{5}}}}}.
	self assert: {1 . 2 . 3 . 4 . 5} equals: (result collect: [:each | each contents asNumber]).