using IJulia

function main()
   println("Updating .ipynb notebooks to html slides...")
   for d in readdir()
       slides = d * "/slides/"
       notebooks = d * "/notebooks/"
       if isdir(d) && isdir(slides) && isdir(notebooks)
          curr_dir = readdir(notebooks)
          for note in curr_dir
              if occursin("ipynb", note)
	         println("Converting $note to html")
		 run(`jupyter nbconvert $(joinpath(notebooks * note)) --to slides`)
		 run(`mv $(joinpath(notebooks * note[1:end-6] * ".slides.html")) $slides`)
	      end
	  end
        end
    end
end

main()
