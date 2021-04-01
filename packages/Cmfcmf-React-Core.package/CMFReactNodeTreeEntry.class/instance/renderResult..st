accessing
renderResult: result

	self assert: (CMFReact isValidRenderResult: result).
	renderResult  := result