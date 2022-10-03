utils
openComponentBlock: aBlock

	root := CMFBubble new tag: #root.
	react := CMFReact2 new hostConfig: CMFHostConfigBubble new.
	react renderRoot: aBlock asComponent in: root