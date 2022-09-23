initialize-release
from: aCMFReactNodeTreeEntry

	oldNode := aCMFReactNodeTreeEntry ifNotNil: #node.
	oldRenderResult := aCMFReactNodeTreeEntry ifNotNil: #renderResult.
	oldNumHooks := aCMFReactNodeTreeEntry ifNotNil: #numberOfHooks.
	treeEntry := aCMFReactNodeTreeEntry