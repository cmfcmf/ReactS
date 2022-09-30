rendering
runRenderCode: node renderInfo: renderInfo

	| userCodeResult numHooks |
	self assert: (CMFReact isValidNode: node).
	hookIndex := 1.
	
	[
		userCodeResult := node executeUserCode: self renderInfo: renderInfo.
		self assert: (CMFReact isValidNode: node).
		self assert: hookIndex notNil.
		numHooks := hookIndex - 1.
		hookIndex := nil]
			on: CMFReactHooksChanged
			do: [:error |
				"when hooks error they don't have enough info to inform us what a re-render with new hooks should look like. so, we catch the error half-way, enrich it, and signal it again."
				userCodeResult := CMFReactHooksChanged new
					node: node;
					renderInfo: renderInfo;
					signal].
	
	^ {userCodeResult. numHooks}