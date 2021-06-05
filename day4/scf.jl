using DFTK
using Printf
using LinearAlgebra


function build(system_info::Dict)
	lattice = system_info[:lattice]
	@info "Building system....$(system_info[:name])"
	atoms = [ElementPsp(el, psp=load_psp(el, functional="pbe")) => pos for (el, pos) in zip(system_info[:symbols], system_info[:positions])]
	return lattice, atoms
end;


function run_dftk(lattice, atoms; Ecut=20, kgrid=nothing, tol=1e-11,
		  kspacing=0.3, smearing=Smearing.None(), 
		  mixing=DFTK.SimpleMixing(), temperature=0)

		  determine_bands = nelec -> nelec // 2 + sqrt(nelec // 2)

		  @info "Building DFT model and plane-wave basis..."

		  model = model_DFT(lattice, atoms, 
		  		    [:gga_x_pbe, :gga_c_pbe], smearing=smearing,
				    temperature=temperature)

		  isnothing(kgrid) && (kgrid = kgrid_size_from_minimal_spacing(lattice,
		  kspacing))

		  basis = PlaneWaveBasis(model, Ecut, kgrid=kgrid, kshift=[0, 0, 0])

		  n_bands = ceil(Int, determine_bands(model.n_electrons))
		  
		  println()
		  println("temp.       : 	$(basis.model.temperature)")
		  println("smearing    :	$(basis.model.smearing)")
		  println("Ecut        :	$Ecut")
		  println("fft_size    :        $(basis.fft_size)")
		  println("irrep. k    :        $(length(basis.kpoints))")
		  println("n_bands     : 	$(n_bands)")
		  println("n_electrons :  	$(basis.model.n_electrons)")
		  println("mixing      :        $mixing")
		  println()
		  @info "Creating the initial ρ"
		  ρ0 = guess_density(basis)
		  @info "Starting scf cycle..."
		  scfres = self_consistent_field(basis, n_bands = n_bands, ρ=ρ0, tol=tol, mixing=mixing)
		  scfres
end;
