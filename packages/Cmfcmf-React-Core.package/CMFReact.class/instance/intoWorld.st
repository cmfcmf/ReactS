lifecycle
intoWorld

	hooks values concatenation do: #onComponentWasRendered.
	self flag: #todo. "Effect hooks also need to be re-run when a single element is re-rendered."