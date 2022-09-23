rendering
batchUpdatesDuring: aBlock

	batchedUpdates := Set new.
	aBlock value.
	self updateFrameDo: [ | updates |
		updates := batchedUpdates.
		batchedUpdates := nil.
		updates do: [:id | self reRenderNodeWithId: id]]