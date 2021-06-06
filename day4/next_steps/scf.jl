using DFTK
using LinearAlgebra
using JLD2

function build(system_info::Dict)
	lattice = system_info[:lattice]
	@info "Building system....$(system_info[:name])"
	atoms = [ElementPsp(el, psp=load_psp(el, functional="pbe")) => pos 
		for (el, pos) in zip(system_info[:symbols], system_info[:positions])]
	magnetic_moments = system_info[:magnetic_moments]
	return lattice, atoms, magnetic_moments
end;


function run_dftk(lattice, atoms; Ecut=20, magnetic_moments=nothing, kgrid=nothing, tol=1e-11,
		  kspacing=0.3, smearing=Smearing.None(), mixing=DFTK.SimpleMixing(), 
		  temperature=0, filepath = "results", save=true)

		  @info "Building DFT model and plane-wave basis..."

		  isnothing(magnetic_moments) && (model = model_DFT(lattice, atoms, 
		  		    [:gga_x_pbe, :gga_c_pbe], smearing=smearing,
				    temperature=temperature))
		  isnothing(magnetic_moments) || (model = model_DFT(lattice, atoms, 
		  				 magnetic_moments=magnetic_moments,
		  		    		 [:gga_x_pbe, :gga_c_pbe], smearing=smearing,
				    		 temperature=temperature))

		  isnothing(kgrid) && (kgrid = kgrid_size_from_minimal_spacing(lattice,
		  kspacing))

		  basis = PlaneWaveBasis(model, Ecut, kgrid=kgrid, kshift=[0, 0, 0])

		  println()
		  println("temp.       : 	$(basis.model.temperature)")
		  println("smearing    :	$(basis.model.smearing)")
		  println("Ecut        :	$Ecut")
		  isnothing(magnetic_moments) || (println("mag. mom.   :        $(magnetic_moments)"))
		  println("fft_size    :        $(basis.fft_size)")
		  println("irrep. k    :        $(length(basis.kpoints))")
		  println("n_electrons :  	$(basis.model.n_electrons)")
		  println("mixing      :        $mixing")
		  println()
		  
		  isnothing(magnetic_moments) && (ρ0 = guess_density(basis))
		  isnothing(magnetic_moments) || (ρ0 = guess_density(basis, magnetic_moments))

		  @info "Starting scf cycle..."
		  scfres = self_consistent_field(basis, ρ=ρ0, tol=tol, mixing=mixing)
		  println(scfres.energies)

		  if save
		  	if isdir(dirname(filepath))
			  	save_scfres(joinpath(filepath, "scfres.jld2"), scfres)
			else
				mkdir(filepath)
			  	save_scfres(joinpath(filepath, "scfres.jld2"), scfres)
			end
	 	  end
		  scfres
end;
