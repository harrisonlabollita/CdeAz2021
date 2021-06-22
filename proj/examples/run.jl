include("systems.jl")
include("dft.jl")


for mat in ["Na", "NaCl", "Al"]
	lattice, atoms, prefix = materials(mat)
	run_DFTK(lattice, atoms, save=prefix)
end
