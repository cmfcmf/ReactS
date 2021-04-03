running
effectCleanup: id

	effectCleanups at: id put: (effectCleanups at: id ifAbsent: [0]) + 1