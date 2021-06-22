using DFTK

function materials(system)

	convert2bohr= x -> x /0.53

	if system == "Na"
	   prefix = "Na"
	   a = convert2bohr(3.75)
	   lattice = [[a 0 0]; [0 a 0]; [0 0 a]]
	   positions = [[0.0, 0.0, 0.0], [0.5, 0.5, 0.0], [0.5, 0.0, 0.5], [0.0, 0.5, 0.5]]
	   Na = ElementPsp(:Na, psp=load_psp(:Na, functional = "pbe"))
	   atoms = [Na => positions]

	elseif system == "Al"
	   prefix = "Al"
	   a = convert2bohr(3.75)
	   lattice = [[a 0 0]; [0 a 0]; [0 0 a]]
	   positions = [[0.0, 0.0, 0.0], [0.5, 0.5, 0.0], [0.5, 0.0, 0.5], [0.0, 0.5, 0.5]]
	   Na = ElementPsp(:Na, psp=load_psp(:Na, functional = "pbe"))
	   atoms = [Na => positions]

	elseif system == "NaCl"
	   prefix = "NaCl"
	   a = convert2bohr(3.75)
	   lattice = [[a 0 0]; [0 a 0]; [0 0 a]]
	   positions = [[0.0, 0.0, 0.0], [0.5, 0.5, 0.0], [0.5, 0.0, 0.5], [0.0, 0.5, 0.5]]
	   Na = ElementPsp(:Na, psp=load_psp(:Na, functional = "pbe"))
	   atoms = [Na => positions]
	else
	   error("Unknown system $system")
	end
	return lattice, atoms, prefix
end
