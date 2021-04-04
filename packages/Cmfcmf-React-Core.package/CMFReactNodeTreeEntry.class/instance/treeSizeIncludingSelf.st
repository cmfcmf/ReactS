accessing
treeSizeIncludingSelf

	^ 1
		+ (childrenTreeNodes detectSum: #treeSizeIncludingSelf)
		+ (keyedChildrenTreeNodes values detectSum: #treeSizeIncludingSelf)