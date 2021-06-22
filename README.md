# Clubes de Ciencia Summer School 2021

![clubes_arizona](img/clubes.png)

# An electron's point of view: How the quantum world influences materials.

## Instructor's Info

**Instructor 1**:

Harry LaBollita (<hlabolli@asu.edu>)

Department of Physics, Arizona State University

**Instructor 2**:

Chase Hanson (<cjhanso2@asu.edu>)

Department of Physics, Arizona State University


**Instructor 3**:

Antia S. Botana (<Antia.Botana@asu.edu>)

Department of Physics, Arizona State University


## Course Overview

How de we know that copper is a good conductor and plastic is a good insulator? How do scientists know how to manipulate the mechanical, electrical, and magnetic properties of a material? In this club, we will explore the quantum world of electrons and discover how the unique properties of their world give rise to technologically useful phenomena such as superconductivity. We will learn the basic concepts of quantum theory and how they apply to materials, while also identifying they key "knobs" that can be turned to control their properties. We will introduce the computational techniques that are used by scientists all over the world to understand, engineer, and design new materials with specific properties for technological applications. With this new knowledge, we will perform our own calculations for real materials and identify the key features in the results that give scientists insight into a material's properties. Our calculations will be performed using an open-source program written Julia. Please note that no prior programming experience is required, learning the basic syntax of Julia is part of the club! This course intends to pique the interest of students in this fields of condensed matter, material science, and computational physics.

## Resources/Materials

A laptop or desktop computer will be necessary for this course. To get a head start on the necessary things that we will need to install for the week, please [visit this installation guide](https://docs.google.com/document/u/0/d/1PnDlPSik45LADJd520Gzy4abgojxmO9gGSguv9IuT74/edit)

## Club Schedule 

| **Day** 			|	**Subject** 		| **Activities** |
|:-------------:|:-----------------------------|:--------------|
| Day 1                         | Introductions, Condensed Matter, and Getting Started | Introduce instructors and the course, physics demos, and getting started.|
| Day 2                         | Establish main ideas that we need to reference to. Build graphene structure. | Learn the basic concepts that are needed throughout the week. Build and optimize graphene crystal structure using Julia.|
| Day 3                         | Basics of Band theory, complete DFT calculations for metal and insulators. | Using concepts from yesterday, learn some things about band theory. Perform DFT calculations of our own.|
| Day 4                         | Project Day! | Complete graphene project, discuss potential next steps. Start club presentation.|
| Day 5                         | STEM as a future, presentations | Learn about possible future careers in STEM and how to get there. Finish and present our club presentation!|

## Description of Activities

### [Day 1](day1/)
*Objectives*: Introduce instructors and students, present course plan and goals, physics demos,    getting started/installation guide. 

*Details*:

 - Morning:
      - Introduce ourselves and our backgrounds, what we are currently doing, and how we became involved in the science we      are doing today. ( ~15 minutes)
      - Introduce condensed matter physics and physics demos. (~ 1 hour 15 minutes)
 - Afternoon:
      - Assuming students do not have everything installed, we will go through the installation guide and troubleshoot along the way. Students will complete the “Hello World” notebook. (~ 1 hour)
      - Once everyone is up and running, we will give a description about the project that we would like to focus on for the remainder of the week. (~ 30 minutes)

### [Day 2](day2/)
*Objectives*: Establish main ideas that we would like to reference to for the remainder of the week.

*Details*:

 - Morning:
      - An interactive presentation illustrating the concepts that we will need for the rest of the week. Topics include: atoms and crystal structure, electronic interactions, Schrodinger equation, and why the problem is so hard. (~ 1 hour 30 minutes)
 - Afternoon:
      - Learn how to build the crystal structure that we will need for the week. Basis vectors, atomic positions. (~ 30 minutes)
      - Write a short program that can optimize the positions of the atoms for us. (~ 1 hour)

### [Day 3](day3/)
*Objectives*: Learn the basics of band theory and what certain features tell us about how a material will behave electronically, go over standard inputs for DFT calculations, complete a couple of DFT calculations using the DFTK.jl software library.

*Details*:

 - Morning:
      - Review/complete yesterday’s workshop. (~ 15 minutes)
      - Discuss basics of band theory. Metal versus insulator. Identify key features in density of states and band structures that scientists look for when classifying the behavior of a material ( ~ 45 minutes)
      - Standard inputs for DFT calculation (crystal structure, grid point mesh, etc.) (~ 30 minutes)
 - Afternoon:
      - Using DFTK.jl, perform canonical calculations for a metallic and insulating material. Crystal structures will be provided. This will be our first time using the code. (~ 1 hour 30 minutes)

### [Day 4](day4/)
*Objectives*: graphene project!

*Details*:

 - Morning:
      - Using our optimized graphene structure, we will compute the density of states and band structure. We will analyze the results by plotting and summarizing specific data. (~ 1 hour 30 minutes)
 - Afternoon:
      - Mention possible next steps. Bilayer structure with twisting, etc. (~ 30 minutes)
      - Start the club’s final presentation. (~ 1 hour)
      
### [Day 5](day5/)
*Objectives*: Finish presentation, discuss next and future steps in the sciences, give our club presentation.

*Details*:

 - Morning:
      - Finish club presentation (~ 30 minutes)
      - Advertise the SCENE program for interested students, how to become involved in research at a university. REU programs, national labs, etc, what graduate school in physics is like, career opportunities in the sciences. (~ 1 hour)
 - Afternoon:
      - Present what we accomplished in our club! (~ 1 hour 30 minutes)

## Project Description 
During this week, we will study the electronic structure of [graphene](https://en.wikipedia.org/wiki/Graphene). Graphene is a single layer of carbon atoms arranged in a honeycomb lattice. The 2010 Nobel Prize in Physics was awarded to Andre Geim and Kostya Novoselov for their groundbreaking experiments in the realization of single layer graphene ([interestingly enough Scotch tape was involved](https://www.google.com/search?client=safari&rls=en&q=graphen+nobel+prize&ie=UTF-8&oe=UTF-8)).

Graphene is a remarkably simple material with rich physics that is still being explored today. In our workshop, we will start by building the crystal structure of graphene. With the crystal structure, we will optimize the lattice constant by writing a simple optimization program. We will then analyze the electronic structure of graphene, reproducing many key results. Students will complete their own electronic structure calculation for graphene using DFTK.jl. They will then extract meaningful data from this calculation, e.g. band structures and density of states. We will then discuss the meaning of these results and potential next steps that the student can build upon from our initial analysis.
