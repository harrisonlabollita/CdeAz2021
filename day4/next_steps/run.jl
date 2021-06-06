include("scf.jl")

function main()
	for d in readdir()
	    if isdir(d) && isfile(joinpath(d, "system.jl"))
		include(joinpath(d, "system.jl"))
		lattice, atoms, magnetic_moments = build(system)
		run_dftk(lattice, atoms, magnetic_moments=magnetic_moments)
	    end
	end
end

main()
