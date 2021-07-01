Next step ideas
---------------

Now that we have the tools to do electronic structure calculations what can we do with these tools. Here I outline a couple of ideas that would be excellent projects and potentially publishable.

High-throughput calculations
============================

In this project, we would establish a dataset of materials that we would like to filter based on the specific properties of the electronic structure. This would require writing scripts to do the calculations and analyze the results without ever having to look at them with your own eyes. The results would then be the materials left over from our filtering that we would then look into more closely. Possibly explore magnetism, etc.


Machine learning pseudopotentials
=================================

Because DFTK.jl is a modular code, we could unplug the potential piece from the code and write our own pseudopotentials that can be derived from a machine learning algorithm.

Twisted bilayer graphene
========================
Let's stack to graphene layers on top of each other and systematically analyze the electronic structure with twisting and layer separation.
