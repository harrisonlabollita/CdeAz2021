using DFTK
using JLD2
using LinearAlgebra
using Dates

function run_DFTK(lattice, atoms; tol=1e-10, kgrid=nothing, 
		  kspacing=0.1, Ecut = 15, temperature = 0.01, 
		  save="scfres")
	
	isnothing(kgrid) && (kgrid = kgrid_size_from_minimal_spacing(lattice, kspacing))
	model = model_DFT(lattice, atoms, [:gga_x_pbe, :gga_c_pbe], temperature=temperature)

	basis = PlaneWaveBasis(model, Ecut, kgrid=kgrid)
	println()
	println("starting calculation for $(save) at $(Dates.now())")
	println()
	println("no. of electrons: $(model.n_electrons)")
	println("Ecut            : $(Ecut)")
	println("kgrid           : $(kgrid)")
	println("irre. k         : $(length(basis.kpoints))")
	println("temperature     : $(model.temperature)")
	println()

	scfres = self_consistent_field(basis, tol=tol)
	println(scfres.energies)
	println("saving results to file $(save)...")
	save_scfres(save * ".jld2", scfres)
end
