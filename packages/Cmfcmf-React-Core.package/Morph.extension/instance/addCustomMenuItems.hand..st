*Cmfcmf-React-Core
addCustomMenuItems: aCustomMenu hand: aHandMorph
	"Add morph-specific items to the given menu which was invoked by the given hand.  This method provides is invoked both from the halo-menu and from the control-menu regimes."

	self cmfGetCorrespondingReactRoot ifNotNil: [:react |
		aCustomMenu addLine.
		aCustomMenu add: 'REACT REACT REACT' action: [react explore].
		aCustomMenu add: 'explore tree ("React Devtools")' action: [react elementTree explore].
		aCustomMenu add: 'REACT REACT REACT' action: [react explore].
		"aCustomMenu add: 'force re-render' action: [react render]."
		aCustomMenu addLine]