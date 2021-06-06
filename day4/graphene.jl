### A Pluto.jl notebook ###
# v0.14.7

using Markdown
using InteractiveUtils

# ╔═╡ f164c696-c681-11eb-398b-77f2e1fd3e27
begin
	using DFTK
	using Plots
	using JLD2
end

# ╔═╡ 4c7da191-db3d-4b99-88ab-d2beb0e25a08
function run(lattice, atoms; Ecut=20, kgrid=[20, 20, 1], tol=1e-10,
			 temperature=0.001, save=true)
	model = model_LDA(lattice, atoms, temperature=temperature)
	basis = PlaneWaveBasis(model, Ecut; kgrid=kgrid)
	scfres = self_consistent_field(basis; tol=tol)
	if save; save_scfres("results.jld2", scfres) end
	return basis, scfres
end

# ╔═╡ 3d6f600d-94d4-46bb-8d93-e1efcdd21d84
begin
	a = 4.6111 # bohr
	c = 18.87  # bohr
	lattice = [[a -0.5*a 0]; [0. 0.5*sqrt(3)*a 0]; [0 0 c]];
	positions = [[1/3., 2/3., 0], [2/3., 1/3., 0]];
end

# ╔═╡ fe314786-a919-4a6a-b16d-db31d798ab7f
begin
	C = ElementPsp(:C, psp=load_psp(:C, functional="lda"))
	atoms = [C => positions];
end

# ╔═╡ 55a4d33a-e32a-40b4-93dd-9f9c99e300c1
basis, scfres = run(lattice, atoms)

# ╔═╡ Cell order:
# ╠═f164c696-c681-11eb-398b-77f2e1fd3e27
# ╠═4c7da191-db3d-4b99-88ab-d2beb0e25a08
# ╠═3d6f600d-94d4-46bb-8d93-e1efcdd21d84
# ╠═fe314786-a919-4a6a-b16d-db31d798ab7f
# ╠═55a4d33a-e32a-40b4-93dd-9f9c99e300c1
