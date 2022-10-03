tests - memoization
testComponentMemoization

	| visited block |
	visited := 0.
	block := [
		visited := visited + 1.
		self bubble: #A].
	self openComponentBlock: [block asComponent memoize: true].
	self assert: 1 equals: visited.
	react reRenderAll.
	self assert: 1 equals: visited