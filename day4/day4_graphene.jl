# load dependencies
println("Loading dependencies")
using DFTK
using Plots
println("Finished loading dependencies")

# a simple solution
function run(lattice, atoms; Ecut=20, kgrid=[20, 20, 1], tol=1e-10, temperature=0.01)
    @info "Building DFT model"
    model = model_LDA(lattice, atoms, temperature=temperature)
    @info "Constructing plane-wave basis set"
    basis = PlaneWaveBasis(model, Ecut; kgrid=kgrid)
    @info "Solving Kohn-Sham equations self-consistently"
  
    println()
    println("no. of electrons    = $(model.n_electrons)")
    println("k grid              = $(kgrid)")
    println("temperature         = $(temperature)")
    println("Ecut                = $(Ecut)")
    @time scfres = self_consistent_field(basis; tol=tol)
    println()
    return scfres
end;


# graphene
println("Making graphene")
# lattice parameters
a = 4.6111 # bohr 
c = 18.870 # bohr

# lattice for graphene
lattice = [[a -0.5*a 0]; [0 0.5*sqrt(3)*a 0]; [0 0 c]];

# two carbon positions
positions = [[1/3., 2/3., 0], [2/3., 1/3., 0]];

# carbon
C = ElementPsp(:C, psp=load_psp(:C, functional="lda"));

# atoms
atoms = [C => positions];
println("Finished making graphene")

scfres = run(lattice, atoms);

ρ = heatmap(scfres.ρ.real[:, :, 1, 1], c=:sunset);
bands = plot_bandstructure(scfres, kline_density=10)
plot!(bands, xlabel = " ", ylabel="ε - εF", ylims=(-10, 10));

dos = plot_dos(scfres)
plot!(dos, xlabel="ε", ylabel="ρ(ε)", ylim=(0, 60));

summary = plot(ρ, bands, dos, layout = (1, 3), size=(800, 400), title=["ρ" "ε(k)" "ρ(ε)"])
savefig(summary, "graphene_summary.pdf") 