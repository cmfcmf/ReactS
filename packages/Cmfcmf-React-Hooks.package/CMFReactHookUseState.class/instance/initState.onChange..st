private
initState: anObject onChange: aBlock

	| initialState |
	initialState := anObject isBlock 
		ifTrue: [
			"do not allow nested hooks"
			CMFCurrentReact value: nil during: [anObject value]]
		ifFalse: [anObject].
	^ self initState: initialState reducer: [:state :updater |
		updater isBlock 
			ifTrue: [
				"do not allow nested hooks"
				CMFCurrentReact value: nil during: [updater value: state]] 
			ifFalse: [updater]] onChange: aBlock