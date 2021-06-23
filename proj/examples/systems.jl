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
	   a = convert2bohr(2.856)
	   lattice = a * [[1 0 0]; [0 1 0]; [0 0 1]]
	   positions = [[0.0, 0.0, 0.0], [0.5, 0.5, 0.0], [0.5, 0.0, 0.5], [0.0, 0.5, 0.5]]
	   Al = ElementPsp(:Al, psp=load_psp(:Al, functional = "pbe"))
	   atoms = [Al => positions]

	elseif system == "NaCl"
	   prefix = "NaCl"
	   a = convert2bohr(5.69169)

	   lattice = [[a 0 0]; [0 a 0]; [0 0 a]]

	   Na_positions = [[0, 0, 0],
			   [0, 0.5, 0.5],
			   [0.5, 0.0, 0.5],
			   [0.5, 0.5, 0.0]];

	   Cl_positions = [[0.5, 0.0, 0.0],
                 	   [0.5, 0.5, 0.5],
                           [0.0, 0.0, 0.5],
                           [0.0, 0.5, 0.0]];
	   Na = ElementPsp(:Na, psp=load_psp(:Na, functional="pbe"))
	   Cl = ElementPsp(:Cl, psp=load_psp(:Cl, functional="pbe"))
   	   atoms = [Na => Na_positions, Cl => Cl_positions];
	else
	   error("Unknown system $system")
	end
	return lattice, atoms, prefix
end
