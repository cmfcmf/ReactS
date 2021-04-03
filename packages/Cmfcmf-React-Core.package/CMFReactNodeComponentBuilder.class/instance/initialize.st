initialize-release
initialize 

	super initialize.
	
	elementClass := nil.
	selector := #render:.
	key := nil.
	children := nil.
	props := Dictionary new.
	overwrittenProps := Dictionary new