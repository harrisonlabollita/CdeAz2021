### A Pluto.jl notebook ###
# v0.14.7

using Markdown
using InteractiveUtils

# ╔═╡ 7970020a-dd54-4fb3-986a-f139f4ba69d4
begin
	# load dependencies
	using DFTK
	using LinearAlgebra
	using Plots
end

# ╔═╡ a185d52e-c58b-11eb-30ef-d3ec2e480f00
md"# Geometry Optimization

When we perform an electronic structure calculation the most important input is the crystal structure. The results are entirely dependent upon the structure that you have used, i.e., what are the atomic positions, the lattice parameters, angles, etc. That is why the first step of any calculation is to optimize the crystal structure.

In this notebook, we will optimize the in-plane lattice parameter for graphene structure. While most commercial DFT codes have built in optimization routines, we are going to manually optimize our structure. We only have a single parameter to optimize so this is doable by hand (and a little bit of code!).

**How are we going to optimize the a lattice parameter?**

In essence, we are going to perform an experiment albeit a computational one. We will change the lattice parameter in small increments and calculate the free energy (output from the DFT code) for each lattice parameter. With this data, we can plot the energy versus displacement. The minimum of this curve will tell us the optimal lattice parameter. The minimum of this curve is the optimal lattice parameter, because nature is always trying to minimize it's total energy, or in other words, nature is lazy!"

# ╔═╡ 55b514dd-591f-4ddb-924d-fc4e77c63007
md"## Crystal Structure of Graphene
In the image below, we have the crystal structure of graphene. The blue spheres denote carbon atoms that are arranged in a 2d hexagonal lattice, where every carbon atoms has three nearest neighbors. The black border denotes the unit cell of the crystal.

![graphene_img](../structure/graphene_img.png)"

# ╔═╡ 1c98ae2a-0866-43af-8929-0a1bdcf9d4d6
# Compute the energy
# For now we haven't covered the details of how this function is working. This will be
# done tomorrow. We will simple use this for now. All we need to know is that it is a 
# function that takes as input the the lattice parameter a and outputs the energy.
function compute_scf(a; c = 10,  
                        positions = [[1/3., 2/3., 0], [2/3., 1/3., 0]],
                        Ecut=15, kgrid=[20, 20, 2],
                        tol=1e-8,
                        convert2bohr = x -> x/0.53)
    a = convert2bohr(a)
    c = convert2bohr(c)
    C = ElementPsp(:C, psp=load_psp("hgh/lda/c-q4.hgh"))
    atoms = [C => [pos for pos in positions]]
    lattice = [[a -0.5*a 0]; [0 0.5*sqrt(3)*a 0]; [0 0 c]]
    model = model_LDA(lattice, atoms, temperature = 0.01)
    basis = PlaneWaveBasis(model, Ecut; kgrid=kgrid)
    scfres = self_consistent_field(basis; tol=tol, callback=info->nothing)
    total_E = scfres.energies.total;
    return total_E
end;

# ╔═╡ 3ba8913e-72eb-452f-a8b9-175b69933217
# Write a function that computes the energy for a list of lattice parameters.
# Optional: Add a print statement so that once the energy is computed it will print the
#           lattice parameter used and the energy at this data.
# Note! Make sure that you store the energies in an array.

function calcEnergies(trial)
    energies = []
    for (i, a) in enumerate(trial)
        E = compute_scf(a)
        append!(energies, E)
        println("$i  $(round(a, sigdigits=4))  $E")
    end
    return energies
end;

# ╔═╡ b9eb4d99-5e3b-4cb3-8f64-dc4d9f9e8822
begin
	trial_a = convert(Array, LinRange(2., 3., 10))
	energies = calcEnergies(trial_a);
end

# ╔═╡ Cell order:
# ╟─a185d52e-c58b-11eb-30ef-d3ec2e480f00
# ╠═7970020a-dd54-4fb3-986a-f139f4ba69d4
# ╟─55b514dd-591f-4ddb-924d-fc4e77c63007
# ╠═1c98ae2a-0866-43af-8929-0a1bdcf9d4d6
# ╠═3ba8913e-72eb-452f-a8b9-175b69933217
# ╠═b9eb4d99-5e3b-4cb3-8f64-dc4d9f9e8822
