accessing
isOneOfTheRootNodes

	"This node is one of the root nodes if its grandparent is nil -> This is because we use a single synthetic root node at the top."
	^ parent parent isNil