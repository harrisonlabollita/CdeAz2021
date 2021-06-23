using DFTK
using JLD2
using Plots

function plot()
	for d in readdir()
		if occursin("jld2", d)
			println("Loading $(d)...")
			loaded = load_scfres(d)
			bands  = plot_bandstructure(loaded, kline_density=10)
			dos    = plot_dos(loaded)
			ρ      = heatmap(loaded.ρ.real[:, :, 1, 1])
			println("Saving figures...")
			savefig(bands, joinpath(d[1:end-5] * ".bands.pdf"))
			savefig(dos, joinpath(d[1:end-5] * ".dos.pdf"))
			savefig(ρ, joinpath(d[1:end-5] * ".charge.pdf"))
		end
	end
end

plot()
