tests - errors
testErrorBoundaryWithPartialResults

	| shouldError |
	shouldError := true.
	
	self openComponentBlock: [
		{
			self bubble: #Top.
			CMFErrorBoundary
				children: {
					[
						{
							self bubble: #Other.
							[shouldError ifTrue: [self error: 'unique error string'] ifFalse: [self bubble: #Nested]] asComponent}] asComponent}
				fallback: [:error | (self bubble: 'Error') props: {#text -> error messageText}]}].
	
	self shouldnt: [root findTag: #Top] raise: Error.
	self should: [root findTag: #Other] raise: Error.
	self assert: 'unique error string' equals: ((root findTag: #Error) props at: #text).
	
	shouldError := false.
	react reRenderAll.
	self shouldnt: [root findTag: #Top] raise: Error.
	self shouldnt: [root findTag: #Nested] raise: Error.
	self shouldnt: [root findTag: #Other] raise: Error.
	self should: [root findTag: #Error] raise: Error.
	
	react reRenderAll.
	self shouldnt: [root findTag: #Top] raise: Error