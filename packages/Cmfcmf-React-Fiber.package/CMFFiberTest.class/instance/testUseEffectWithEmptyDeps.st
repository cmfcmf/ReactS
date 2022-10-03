tests - useEffect
testUseEffectWithEmptyDeps

	| runs |
	runs := OrderedCollection new.
	self openComponentBlock: [
		CMFReact
			useEffect: [
				runs add: #effect.
				[runs add: #cleanup]]
			dependencies: {}].
	self assert: #(#effect) equals: runs asArray.
	react reRenderAll.
	self assert: #(#effect) equals: runs asArray