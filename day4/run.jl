include("scf.jl")

function main()
	for d in readdir()
	    if isdir(d) && isfile(joinpath(d, "system.jl"))
		include(joinpath(d, "system.jl"))
		lattice, atoms = build(system)
		run_dftk(lattice, atoms)
	    end
	end
end

main()
