"""
Install the packages needed for this repo
"""
using Pkg

function main()
	dependencies = [
		"DFTK",
		"Plots",
		"IJulia"
]
	println("Installing the following dependencies...")
	for dep in dependencies
		println("\t $(dep)")
	end
	Pkg.add(dependencies)
end

main()
