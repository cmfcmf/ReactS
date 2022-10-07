tests - errors
testErrorWithoutBoundary

	| shouldError |
	shouldError := false.
	
	self openComponentBlock: [
		{
			self bubble: #Top.
			[shouldError ifTrue: [self error: 'unique error string'] ifFalse: [self bubble: #Nested]] asComponent}].
	
	self shouldnt: [root findTag: #Top] raise: Error.
	
	shouldError := true.
	self should: [react reRenderAll] raise: Error.
	self shouldnt: [root findTag: #Nested] raise: Error.
	
	shouldError := false.
	react reRenderAll.
	self shouldnt: [root findTag: #Top] raise: Error.
	self shouldnt: [root findTag: #Nested] raise: Error