accessing
treeSizeIncludingSelf

	^ 1 + (childrenTreeNodes detectSum: #treeSizeIncludingSelf)