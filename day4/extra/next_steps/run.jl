include("build.jl")
include("scf.jl")

function main()
	systems = build_systems()
	for sys in systems
	    lattice, atoms, magnetic_moments, name = build(sys)
	    run_dftk(lattice, atoms, magnetic_moments=magnetic_moments, filepath=name)
	end
end

main()
