"""
Build system files for the various calculations
"""

function shift(positions, i, j)
	new_pos = positions
	(new_pos[2][1] + i) < 1 && (new_pos[2][1] += i)
	(new_pos[2][1] + i) < 1 || (new_pos[2][1] += i-1)
	(new_pos[2][2] + i) < 1 && (new_pos[2][2] += i)
	(new_pos[2][2] + i) < 1 || (new_pos[2][2] += i-1)
	return new_pos
end

function build(system_info::Dict)
	lattice = system_info[:lattice]
	@info "Building system....$(system_info[:name])"
	C = ElementPsp(:C, psp=load_psp(:C, functional="pbe"))
	atoms = [C => system_info[:positions]]
	magnetic_moments = system_info[:magnetic_moments]
	filepath = system_info[:name]
	@info "file for results $filepath"
	return lattice, atoms, magnetic_moments, filepath
end

function build_systems()
	a = 4.6111   # bohr
	c = 18.87    # bohr
	C = ElementPsp(:C, psp=load_psp(:C, functional="pbe"))
	lattice = [[a -0.5*a 0]; [0. 0.5*sqrt(3)*a 0]; [0 0 c]];
	positions = [[1/3., 2/3., 0], [2/3., 1/3., 0]];
	moments = [[C => [2, 2,]], [C => [-2, -2,]]]
	spins = ["up", "down"]
	displace = collect(LinRange(0, 1, 16))
	systems = []	
	for (s, mm) in enumerate(moments)
	    for i ∈ displace
		for j ∈ displace
			system = Dict()
			system[:lattice] = lattice
			system[:magnetic_moments] = mm
			system[:positions] = shift(positions, i, j)
			system[:name] = " $i $j $(spins[s])"
			push!(systems, system)
		end
       	    end
    	end
	systems
end;
