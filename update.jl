using IJulia

function main(type)
   println("Updating .ipynb notebooks to html slides...")
   for d in readdir()
       slides = d * "/slides/"
       notebooks = d * "/notebooks/"
       if isdir(d) && isdir(slides) && isdir(notebooks)
          curr_dir = readdir(notebooks)
          for note in curr_dir
              if occursin("ipynb", note)
		 if type == "html"
	            try
		      println("Converting $note to html")
	              run(`jupyter nbconvert $(joinpath(notebooks * note)) --to slides`)
	              run(`mv $(joinpath(notebooks * note[1:end-6] * ".slides.html")) $slides`)
		    catch
		      println("Something went wrong with $note")
	            end
	    	 elseif type == "pdf"
	            try
		      println("Converting $note to pdf")
		      run(`jupyter nbconvert $(joinpath(notebooks * note)) --to pdf`)
		      run(`mv $(joinpath(notebooks * note[1:end-6] * ".pdf")) $slides`)
		    catch
		      println("Something went wrong with $note")
	            end
		    println("Converting $note to pdf")
		 else
		    error("Unknown type $(type)")
		 end
	      end
	  end
        end
    end
end
main(ARGS[1])
