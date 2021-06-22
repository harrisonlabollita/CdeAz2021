### A Pluto.jl notebook ###
# v0.14.7

using Markdown
using InteractiveUtils

# ╔═╡ 77106cef-bb83-4381-8eb9-b8bb40b471d5
begin
	# using tells Julia that we would like to load this package
	using DFTK
	using Plots
end

# ╔═╡ 3ec3fe2e-c593-11eb-1db2-a9ec4ae7e34e
md"# Getting Started with Jupyter Notebooks

Hi! Welcome to Jupyter notebooks. These documents allow you to write notes, add images, display figures and plots, and **write source code** all within a single document. We will almost exclusively work within these notebooks for the week. So it is important to become familiar with the essential features of these documents.

You are probably viewing this file within your web browser and there is another tab title Home, which contains a list of files and folders that you can select to open. You will want to keep both of these open so that you can navigate your files and create new ones of your own.

Let's get started with some of the basics that we will need for the course. Before we get started let's make sure that everything is working okay. Execute the line of Julia code below by either putting your cursor in the cell and typing Shift+Enter or clicking on the run command above.

**Resources**

- [Julia By Example](https://juliabyexample.helpmanual.io)"

# ╔═╡ 67ebe235-d6ba-4848-bec8-ca4284bf7617
# Simple test to make sure everything is working...
begin 
	yourName   = readline()
	println("Hi $yourName ! Welcome to Julia (v $VERSION).")
end

# ╔═╡ 2a98715e-ccfc-48ef-b5da-f72bf5435ff8
md"**Did it work?**

If you see a statement that looks like this
```text
    Hi Your Name ! Welcome to Julia (v X.X.X)
```
then you are successfully up and running! If not, then please ask for some assistance because something might not be working like it should be."

# ╔═╡ 47078d3f-e3bd-40ab-9c20-78610001d915
md"## Importing Packages
We installed a couple of packages that we would like to use throughout the week. A package is a collection of code written in the native language, in this case Julia, that we can load into our notebooks and use their intended functionallity. Here we would like to load DFTK.jl (density functional toolkit), which we will use to perform some calculations later on this week.

Importing packages is really in Julia. Try executing the commands below. These are pretty heavy packages meaning it might take a few seconds to load them into our notebook."

# ╔═╡ 3ec67918-4ae1-4d43-a5c3-8f52eb22b8be
md"## 📈 Simple Functions

Functions are useful when you would like to write some code to do one thing generically on various different types of input. We will use functions to make our code cleaner to read as well as automate some of our tasks. In the next couple of blocks we introduce the syntax of the Julia functions through example. The basic architecture of Julia function looks like this 
    
```julia
        
        function NameOfYourFunction(argument1, argument2, ...)
                 # code to perform some kind of action with the arguments given
    
    
    
                 return #return the output from the operations you just performed
        end
```"

# ╔═╡ d2f9ed32-9853-4253-906a-957572cff530
md"Now that we know what a skeleton of a function looks like, let's try to write our own. Consider that you are working on your math homework. Your homework has asked you to solve for the roots of many quadratic equations, which have the form

0 = ax^2 + b x + c
which we know has a closed form solution

x = \frac{ - b \pm \sqrt{b^{2} - 4ac}}{2a}

Rather, than crunching the numbers by hand let's write a function that can do this for us and output the answer."

# ╔═╡ 174ff573-0a0d-480d-bf04-af0971a3f0c3
function solve_quadratic(a, b, c)
    # solve_quadratic - finds the roots of the quadratic equation: ax^2 + bx + c = 0
    # Input: a - coefficient for x^2 term,
    #        b - coefficient for x term,
    #        c - coefficient for constant term
    # Output: x1, x2 - the two roots from the quadratic equation.
    okay = false
    try
        sqrt(b*b - 4*a*c)
        okay = true
    catch
        println("Something went wrong with the sqrt. Possibly complex number encountered.")
    end
    if okay
        x_minus = (-b - sqrt(b*b - 4*a*c))/(2*a)
        x_plus = (-b + sqrt(b*b - 4*a*c))/(2*a)
        println("Roots of 0 = $a x^2 + $b x+ $c are: $x_minus, $x_plus")
        return x_plus, x_minus
    end 
end;

# ╔═╡ 3ff01ebf-d2ad-4baf-9027-e51f49ad5553
solve_quadratic(2, 3, 1)

# ╔═╡ 80c73dd7-3bbe-4231-932c-172b9d40bddc
md"## 💻 Exercise

Write a function that will tell you all you need to know about a circle given it's radius. The function should print out the circle's radius, diameter, area, and circumference as well as return all of these.

```julia
        function circleProp(r)
                # circleProp - determines the properties of a circle
                # Input: r - the radius of the circle
                
                # calculate diameter
                
                # calculate area
                
                # calculate circumference
                return r, d, area, circumference
         end
```

Since you need to use the number $\pi$ in your solution, it is useful to know an interesting property of the Julia language. It has this number stored inside of itself and it can be accessed by either calling `pi` or typing \ + pi tab. This will render the Greek letter pi. Try it out!"

# ╔═╡ 661e1ac1-01b6-45b5-9265-d33cd62d3d14
begin
	# Example of Greek letter' in Julia
	println(π)
	println(pi)
end

# ╔═╡ Cell order:
# ╟─3ec3fe2e-c593-11eb-1db2-a9ec4ae7e34e
# ╠═67ebe235-d6ba-4848-bec8-ca4284bf7617
# ╟─2a98715e-ccfc-48ef-b5da-f72bf5435ff8
# ╟─47078d3f-e3bd-40ab-9c20-78610001d915
# ╠═77106cef-bb83-4381-8eb9-b8bb40b471d5
# ╟─3ec67918-4ae1-4d43-a5c3-8f52eb22b8be
# ╠═d2f9ed32-9853-4253-906a-957572cff530
# ╠═174ff573-0a0d-480d-bf04-af0971a3f0c3
# ╠═3ff01ebf-d2ad-4baf-9027-e51f49ad5553
# ╟─80c73dd7-3bbe-4231-932c-172b9d40bddc
# ╠═661e1ac1-01b6-45b5-9265-d33cd62d3d14
