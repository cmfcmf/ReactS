tests - useEffect
testUseEffectWithoutDeps

	| runs |
	runs := OrderedCollection new.
	self openComponentBlock: [
		CMFReact useEffect: [
			runs add: #effect.
			[runs add: #cleanup]]].
	self assert: #(#effect) equals: runs asArray.
	react reRenderAll.
	self assert: #(#effect #cleanup #effect) equals: runs asArray.
	react reRenderAll.
	self assert: #(#effect #cleanup #effect #cleanup #effect) equals: runs asArray