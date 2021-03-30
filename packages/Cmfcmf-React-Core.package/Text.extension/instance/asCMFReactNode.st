*Cmfcmf-React-Core
asCMFReactNode

	^ TextMorph asReactNodeBuilder init: [:m | m contentsAsIs: self; readOnly: true]; build