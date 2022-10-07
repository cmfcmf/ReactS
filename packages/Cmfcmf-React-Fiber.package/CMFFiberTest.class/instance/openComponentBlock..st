utils
openComponentBlock: aBlock

	root := CMFBubble new tag: #root.
	react := CMFReactWithFibers new hostConfig: CMFHostConfigBubble new.
	react renderRoot: aBlock asComponent in: root.
	react reRenderAll